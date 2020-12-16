from pytube import YouTube

YouTube('https://www.youtube.com/watch?v=3TU81R9D1ao').streams.get_highest_resolution().download()
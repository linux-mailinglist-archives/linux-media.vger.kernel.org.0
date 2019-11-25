Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF98109087
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 15:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfKYO6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 09:58:00 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40735 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728071AbfKYO6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 09:58:00 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZFoHiMB18LwWdZFoLiVtnF; Mon, 25 Nov 2019 15:57:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574693877; bh=XvRNZgCH8hLwR5jEJKgcTlq2v4reBgb20lYgwZ7hL8g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MkBFdeRT2X/t5vPR1K36MLwMUXKWGfoVTPk82r1XUA1we2lyoDWiYXk6DHAB5/3AY
         p46kGs8DOanKX8IKw+QTMZF5lvR8pptxYcQv6X4KCeNke+Yhg364BpSpuLKAWN+mJI
         0inOqWMKebPP/VruZTPR+nP2/sag9Qy6nBtEzh39VkzbojkdPvXCg6/genSWg71Bw9
         +qlzWNDKTjijr88YWCXo7jtcQEQYJfVLpFAUkMS7t2Dhf6VfR5BipcHWaCB1FsuR7k
         kN1oh0G6k18vgf0+tHObJb8a31m9YJEZsITFIY8LPw5bvBvBjxugDYJdnqjIl5CWDL
         H5HwgwCt3MFyg==
Subject: Re: [PATCH v4 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, y2038@lists.linaro.org
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-7-arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl>
Date:   Mon, 25 Nov 2019 15:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111203835.2260382-7-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMVKvVzoBK6Io7Yd+Khw+0VJ/0/PXGE3VJhSeeK4tMoyWC+iRwaALGZ7o+XXVxhyC3KsoJGkx8Oh6ZyNOztlJcTkr+eZgiPAx2yicU6Nnk4/Ujw91wC3
 Fl1ebQJIM0ukRUkC6BJQqVVLvk9HM6HI1Vv/KM87OOGEWN9ki3bHLH+kSrvRXFxQCEZdVncwyKJMbD8t225/2vDBOXMbBymHJ7I/LGknimXIZWtfSrmGORqh
 CR227myisxPTFA5ZPGQd2HOEW6qHIRdKwMZFFDb4Vj7uPc++xJs7iExo+M/uc75AOgb5wuODfpSyV/N8bncCXA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> The v4l2_buffer structure contains a 'struct timeval' member that is
> defined by the user space C library, creating an ABI incompatibility
> when that gets updated to a 64-bit time_t.
> 
> As in v4l2_event, handle this with a special case in video_put_user()
> and video_get_user() to replace the memcpy there.
> 
> Since the structure also contains a pointer, there are now two
> native versions (on 32-bit systems) as well as two compat versions
> (on 64-bit systems), which unfortunately complicates the compat
> handler quite a bit.
> 
> Duplicating the existing handlers for the new types is a safe
> conversion for now, but unfortunately this may turn into a
> maintenance burden later. A larger-scale rework of the
> compat code might be a better alternative, but is out of scope
> of the y2038 work.
> 
> Sparc64 needs a special case because of their special suseconds_t
> definition.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 57 ++++++++++++++++++++++++++--
>  include/uapi/linux/videodev2.h       | 45 ++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 1de939d11628..4ae1bcaec3fa 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -474,10 +474,10 @@ static void v4l_print_buffer(const void *arg, bool write_only)
>  	const struct v4l2_plane *plane;
>  	int i;
>  
> -	pr_cont("%02ld:%02d:%02d.%08ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
> -			p->timestamp.tv_sec / 3600,
> -			(int)(p->timestamp.tv_sec / 60) % 60,
> -			(int)(p->timestamp.tv_sec % 60),
> +	pr_cont("%02d:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
> +			(int)p->timestamp.tv_sec / 3600,
> +			((int)p->timestamp.tv_sec / 60) % 60,
> +			((int)p->timestamp.tv_sec % 60),
>  			(long)p->timestamp.tv_usec,
>  			p->index,
>  			prt_names(p->type, v4l2_type_names), p->request_fd,
> @@ -3014,6 +3014,14 @@ static unsigned int video_translate_cmd(unsigned int cmd)
>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  	case VIDIOC_DQEVENT_TIME32:
>  		return VIDIOC_DQEVENT;
> +	case VIDIOC_QUERYBUF_TIME32:
> +		return VIDIOC_QUERYBUF;
> +	case VIDIOC_QBUF_TIME32:
> +		return VIDIOC_QBUF;
> +	case VIDIOC_DQBUF_TIME32:
> +		return VIDIOC_DQBUF;
> +	case VIDIOC_PREPARE_BUF_TIME32:
> +		return VIDIOC_PREPARE_BUF;
>  #endif
>  	}
>  
> @@ -3032,6 +3040,30 @@ static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
>  	}
>  
>  	switch (cmd) {
> +#ifdef COMPAT_32BIT_TIME
> +	case VIDIOC_QUERYBUF_TIME32:
> +	case VIDIOC_QBUF_TIME32:
> +	case VIDIOC_DQBUF_TIME32:
> +	case VIDIOC_PREPARE_BUF_TIME32: {
> +		struct v4l2_buffer_time32 vb32;
> +		struct v4l2_buffer *vb = parg;
> +
> +		if (copy_from_user(&vb32, arg, sizeof(vb32)))
> +			return -EFAULT;
> +
> +		memcpy(vb, &vb32, offsetof(struct v4l2_buffer, timestamp));
> +		vb->timestamp.tv_sec = vb32.timestamp.tv_sec;
> +		vb->timestamp.tv_usec = vb32.timestamp.tv_usec;
> +	        memcpy(&vb->timecode, &vb32.timecode,
> +		       sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));

I have similar concerns as with dqevent about whether this memcpy is the right approach.
Unless you can prove with a utility like pahole that this memcpy is safe.

> +
> +		if (cmd == VIDIOC_QUERYBUF_TIME32)
> +			memset(&vb->length, 0, sizeof(*vb) -
> +			       offsetof(struct v4l2_buffer, length));
> +
> +		break;
> +	}
> +#endif
>  	default:
>  		/*
>  		 * In some cases, only a few fields are used as input,
> @@ -3080,6 +3112,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  			return -EFAULT;
>  		break;
>  	}
> +	case VIDIOC_QUERYBUF_TIME32:
> +	case VIDIOC_QBUF_TIME32:
> +	case VIDIOC_DQBUF_TIME32:
> +	case VIDIOC_PREPARE_BUF_TIME32: {
> +		struct v4l2_buffer_time32 vb32;
> +		struct v4l2_buffer *vb = parg;
> +
> +		memcpy(&vb32, vb, offsetof(struct v4l2_buffer, timestamp));
> +		vb32.timestamp.tv_sec = vb->timestamp.tv_sec;
> +		vb32.timestamp.tv_usec = vb->timestamp.tv_usec;
> +	        memcpy(&vb32.timecode, &vb->timecode,
> +		       sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));

Ditto.

> +
> +		if (copy_to_user(arg, &vb32, sizeof(vb32)))
> +			return -EFAULT;
> +		break;
> +	}
>  #endif
>  	default:
>  		/*  Copy results into user buffer  */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1d2553d4ed5b..f05c54d63f96 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -990,7 +990,47 @@ struct v4l2_buffer {
>  	__u32			bytesused;
>  	__u32			flags;
>  	__u32			field;
> +#ifdef __KERNEL__
> +	/* match glibc timeval64 format */
> +	struct {
> +		long long	tv_sec;
> +# if defined(__sparc__) && defined(__arch64__)
> +		int		tv_usec;
> +		int		__pad;
> +# else
> +		long long	tv_usec;
> +# endif
> +	} timestamp;

Ewww!

Are there more places where this is needed? If so, then I very much prefer
that a __kernel_timeval struct is defined somewhere, with appropriate
comments.

> +#else
>  	struct timeval		timestamp;
> +#endif
> +	struct v4l2_timecode	timecode;
> +	__u32			sequence;
> +
> +	/* memory location */
> +	__u32			memory;
> +	union {
> +		__u32           offset;
> +		unsigned long   userptr;
> +		struct v4l2_plane *planes;
> +		__s32		fd;
> +	} m;
> +	__u32			length;
> +	__u32			reserved2;
> +	union {
> +		__s32		request_fd;
> +		__u32		reserved;
> +	};
> +};
> +
> +#ifdef __KERNEL__
> +struct v4l2_buffer_time32 {
> +	__u32			index;
> +	__u32			type;
> +	__u32			bytesused;
> +	__u32			flags;
> +	__u32			field;
> +	struct old_timeval32	timestamp;
>  	struct v4l2_timecode	timecode;
>  	__u32			sequence;
>  
> @@ -1009,6 +1049,7 @@ struct v4l2_buffer {
>  		__u32		reserved;
>  	};
>  };
> +#endif

Can this be moved to v4l2-ioctls.h?

>  
>  #ifndef __KERNEL__
>  /**
> @@ -2446,12 +2487,15 @@ struct v4l2_create_buffers {
>  #define VIDIOC_S_FMT		_IOWR('V',  5, struct v4l2_format)
>  #define VIDIOC_REQBUFS		_IOWR('V',  8, struct v4l2_requestbuffers)
>  #define VIDIOC_QUERYBUF		_IOWR('V',  9, struct v4l2_buffer)
> +#define VIDIOC_QUERYBUF_TIME32	_IOWR('V',  9, struct v4l2_buffer_time32)

And all these should be moved there as well.

>  #define VIDIOC_G_FBUF		 _IOR('V', 10, struct v4l2_framebuffer)
>  #define VIDIOC_S_FBUF		 _IOW('V', 11, struct v4l2_framebuffer)
>  #define VIDIOC_OVERLAY		 _IOW('V', 14, int)
>  #define VIDIOC_QBUF		_IOWR('V', 15, struct v4l2_buffer)
> +#define VIDIOC_QBUF_TIME32	_IOWR('V', 15, struct v4l2_buffer_time32)
>  #define VIDIOC_EXPBUF		_IOWR('V', 16, struct v4l2_exportbuffer)
>  #define VIDIOC_DQBUF		_IOWR('V', 17, struct v4l2_buffer)
> +#define VIDIOC_DQBUF_TIME32	_IOWR('V', 17, struct v4l2_buffer_time32)
>  #define VIDIOC_STREAMON		 _IOW('V', 18, int)
>  #define VIDIOC_STREAMOFF	 _IOW('V', 19, int)
>  #define VIDIOC_G_PARM		_IOWR('V', 21, struct v4l2_streamparm)
> @@ -2520,6 +2564,7 @@ struct v4l2_create_buffers {
>  #define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
>  #define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffers)
>  #define VIDIOC_PREPARE_BUF	_IOWR('V', 93, struct v4l2_buffer)
> +#define VIDIOC_PREPARE_BUF_TIME32 _IOWR('V', 93, struct v4l2_buffer_time32)
>  #define VIDIOC_G_SELECTION	_IOWR('V', 94, struct v4l2_selection)
>  #define VIDIOC_S_SELECTION	_IOWR('V', 95, struct v4l2_selection)
>  #define VIDIOC_DECODER_CMD	_IOWR('V', 96, struct v4l2_decoder_cmd)
> 

Regards,

	Hans

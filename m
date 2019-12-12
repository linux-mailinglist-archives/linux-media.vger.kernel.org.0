Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2BB11D13D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 16:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbfLLPoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 10:44:00 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44777 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729152AbfLLPoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 10:44:00 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud8.xs4all.net with ESMTPA
        id fQd9isXxzTsDefQdBifhxF; Thu, 12 Dec 2019 16:43:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576165437; bh=OSw/M6TgePD4YLhaBwHNn0JZhYVMH5krGERy7feLERA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qT7ZojmqOoGwN8zcCo0LD/gar/rmzIbZnjiVfEFUkB0Wn4ZhanJRg94zHXZXVP9R1
         5Mwfbig9MLzFsVSA2VEfowa52iYmky0tmtjs6obOAeYTfUQ8mNAaQ35vhPIQSxLWDa
         f5U92+mE8afGbElyHJ6Ao9zFXvBRdgMx00yeGGmziiY7inljFn9SW8oZUzbhdNpakc
         vggv4S+dvZ2admJySiEzTS1wyrQBQ4UBjZZUEOmmUN/pOcXp6cmk9WLE9blpH8bn33
         wV/Oe2Jz+CXHfTYKdUA6qvWqIE4+gQgrpL5jEih+7lBYXTIkTYeTktFz2Kehz54B+R
         ZBRL2u3EAIuIA==
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20191126161824.337724-1-arnd@arndb.de>
 <20191126161824.337724-7-arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
Date:   Thu, 12 Dec 2019 16:43:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126161824.337724-7-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ2AzgJqv16z9DboK2QW5rAGF2dLbVeERIgFzMaxKOdvDsuGMHW4p322anA93nQxK4HsaSlOv6/dqVz8xiZR2MVjJpCB11aVgzqq6gWlh7Noq2s6HekY
 16APQcvSHyS4iwe0XpnjzVQvG5wHC8zQ1GWCYBT71fE3zxgh9RfB2sSfaYcof96YI0kk1diqgefqHNLOkMnx/vbf4VBqbQ/x/E8As6ll1OeXA9FcDy2u/2Uz
 jdZq9lEjghmoauSknt2y592ADOb59gbM104HK4Vp/4RK0i+S9CAhyFA+DutSPgDbJBiOUv2+rv7ZDP0qs6M1cgLlowYa0FwMPzMum0YdpIEwH9lqPJ4VJUtx
 PDcFmjTJFMBXc/FogF93uvw20IoH6G1NUETJpAC9Z+wJ/dY8p94=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 5:18 PM, Arnd Bergmann wrote:
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
>  drivers/media/v4l2-core/v4l2-ioctl.c | 73 ++++++++++++++++++++++++++--
>  include/media/v4l2-ioctl.h           | 30 ++++++++++++
>  include/uapi/linux/videodev2.h       | 23 +++++++++
>  3 files changed, 122 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96aafb659783..4d611a847462 100644
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
> @@ -3029,6 +3029,14 @@ static unsigned int video_translate_cmd(unsigned int cmd)
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
> @@ -3047,6 +3055,39 @@ static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
>  	}
>  
>  	switch (cmd) {
> +#ifdef COMPAT_32BIT_TIME

COMPAT_32BIT_TIME -> CONFIG_COMPAT_32BIT_TIME

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
> +		*vb = (struct v4l2_buffer) {
> +			.index		= vb32.index,
> +			.type		= vb32.type,
> +			.bytesused	= vb32.bytesused,
> +			.flags		= vb32.flags,
> +			.field		= vb32.field,
> +			.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> +			.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> +			.timecode	= vb32.timecode,

You forgot to copy sequence.

> +			.memory		= vb32.memory,
> +			.m.userptr	= vb32.m.usercopy,

usercopy -> userptr

> +			.length		= vb32.length,
> +			.request_fd	= vb32.request_fd,
> +		};
> +
> +		if (cmd == VIDIOC_QUERYBUF_TIME32)
> +			memset(&vb->length, 0, sizeof(*vb) -
> +			       offsetof(struct v4l2_buffer, length));

It's from the field AFTER vb->length that this needs to be zeroed. It's best to
use the CLEAR_AFTER_FIELD macro here.

> +
> +		break;
> +	}
> +#endif
>  	default:
>  		/*
>  		 * In some cases, only a few fields are used as input,
> @@ -3100,6 +3141,30 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  			return -EFAULT;
>  		break;
>  	}
> +	case VIDIOC_QUERYBUF_TIME32:
> +	case VIDIOC_QBUF_TIME32:
> +	case VIDIOC_DQBUF_TIME32:
> +	case VIDIOC_PREPARE_BUF_TIME32: {
> +		struct v4l2_buffer *vb = parg;
> +		struct v4l2_buffer_time32 vb32 = {
> +			.index		= vb->index,
> +			.type		= vb->type,
> +			.bytesused	= vb->bytesused,
> +			.flags		= vb->flags,
> +			.field		= vb->field,
> +			.timestamp.tv_sec	= vb->timestamp.tv_sec,
> +			.timestamp.tv_usec	= vb->timestamp.tv_usec,
> +			.timecode	= vb->timecode,

You forgot to copy sequence.

> +			.memory		= vb->memory,
> +			.m.userptr	= vb->m.userptr,
> +			.length		= vb->length,
> +			.request_fd	= vb->request_fd,
> +		};
> +
> +		if (copy_to_user(arg, &vb32, sizeof(vb32)))
> +			return -EFAULT;
> +		break;
> +	}
>  #endif
>  	default:
>  		/*  Copy results into user buffer  */
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 05c1ec93a911..86878fba332b 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -749,4 +749,34 @@ struct v4l2_event_time32 {
>  
>  #define	VIDIOC_DQEVENT_TIME32	 _IOR('V', 89, struct v4l2_event_time32)
>  
> +struct v4l2_buffer_time32 {
> +	__u32			index;
> +	__u32			type;
> +	__u32			bytesused;
> +	__u32			flags;
> +	__u32			field;
> +	struct old_timeval32	timestamp;
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
> +#define VIDIOC_QUERYBUF_TIME32	_IOWR('V',  9, struct v4l2_buffer_time32)
> +#define VIDIOC_QBUF_TIME32	_IOWR('V', 15, struct v4l2_buffer_time32)
> +#define VIDIOC_DQBUF_TIME32	_IOWR('V', 17, struct v4l2_buffer_time32)
> +#define VIDIOC_PREPARE_BUF_TIME32 _IOWR('V', 93, struct v4l2_buffer_time32)
> +
>  #endif /* _V4L2_IOCTL_H */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index caf156d45842..5f9357dcb060 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -912,6 +912,25 @@ struct v4l2_jpegcompression {
>  /*
>   *	M E M O R Y - M A P P I N G   B U F F E R S
>   */
> +
> +#ifdef __KERNEL__
> +/*
> + * This corresponds to the user space version of timeval
> + * for 64-bit time_t. sparc64 is different from everyone
> + * else, using the microseconds in the wrong half of the
> + * second 64-bit word.
> + */
> +struct __kernel_v4l2_timeval {
> +	long long	tv_sec;
> +#if defined(__sparc__) && defined(__arch64__)
> +	int		tv_usec;
> +	int		__pad;
> +#else
> +	long long	tv_usec;
> +#endif
> +};
> +#endif
> +
>  struct v4l2_requestbuffers {
>  	__u32			count;
>  	__u32			type;		/* enum v4l2_buf_type */
> @@ -997,7 +1016,11 @@ struct v4l2_buffer {
>  	__u32			bytesused;
>  	__u32			flags;
>  	__u32			field;
> +#ifdef __KERNEL__
> +	struct __kernel_v4l2_timeval timestamp;
> +#else
>  	struct timeval		timestamp;
> +#endif
>  	struct v4l2_timecode	timecode;
>  	__u32			sequence;
>  
> 

With these changes this patch series passed both the 64 and 32 bit compliance
tests (in fact, all the issues mentioned above were found with these compliance
tests).

I am unable to test with musl since v4l2-ctl and v4l2-compliance are C++ programs,
and there doesn't appear to be an easy way to compile a C++ program with musl.

If you happen to have a test environment where you can compile C++ with musl,
then let me know and I can give instructions on how to run the compliance tests.

If you can't test that, then I can merge this regardless, and hope for the best
once the Y2038 fixes end up in glibc. But ideally I'd like to have this tested.

Regards,

	Hans

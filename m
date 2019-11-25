Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F473109157
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 16:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbfKYPwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 10:52:22 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59071 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728243AbfKYPwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 10:52:22 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZGetiMftiLwWdZGexiWAZ2; Mon, 25 Nov 2019 16:52:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574697139; bh=VcvMGCCf6KAUj/PLkTV4oRPJfrL42aSjyUZDhVlSV2s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=E7jzkUUf7sPUIgq/DAh0yCKGTcp/Y6ASzcXcVLNBao3y2FqtZ2RvX2A+Sfo4cgBM2
         PHu5rG7QR/T6atEPoE/lBhyoAkSTm4IpQ2Ssbh3Rsx6eMAxMeGHGOBWwfN3aGhYt0n
         /RDYkQ8CsgeTrY+cT41Go8sW6+b5Rlyul2UIlGnXZ0fef/KVGN6kD6pE943f/c5aTO
         X49iwabEU4UhdK8NQH2+Sf9YDByCDMEQVtHkudwJ2FqsyGxSRcnSME8idlyy8eU5VG
         0wXjObY40iZUgWfYbPAg5wr18VDxWn9wUcbQsqcB+eBKYdWBniXc1p9wHZ6LLnKE16
         Ui42fIMMZdvtQ==
Subject: Re: [PATCH v4 2/8] media: v4l2: abstract timeval handling in
 v4l2_buffer
To:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, y2038@lists.linaro.org
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-3-arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00fea162-508a-b6e1-84ba-1472a94f6945@xs4all.nl>
Date:   Mon, 25 Nov 2019 16:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111203835.2260382-3-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDnIgFqVCzi279/FlChXnYDL7t8LvLXVc3QZD1lTEhj0hd0RWypsml9GJX24a8vndLlm/wAHw0iZ2AmetIF3rqzC3LAEiUD/Q7pYg527XyXtTLR+3dRI
 mcdgsLo3X1OFoKjHdbEzSWHooc3jiR04fr6cnDW/vnbkcVJtbgVWk6vaWF/S8u8/QRuvtu/0885EUzSLPykn2qbEH05O+4lWqsMRdSX1uk5lQuQSiPPy2hRZ
 zm0E6AP98IH8bxDGsUb5epqABIs8F1vwjxtNbQ8meYLCovzVDJAD5ls17xoIvDeD2j/50t+qoISUYSlKaAJXXA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> As a preparation for adding 64-bit time_t support in the uapi,
> change the drivers to no longer care about the format of the
> timestamp field in struct v4l2_buffer.
> 
> The v4l2_timeval_to_ns() function is no longer needed in the
> kernel after this, but there may be userspace code relying on
> it because it is part of the uapi header.

There is indeed userspace code that relies on this.

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
>  drivers/media/pci/meye/meye.c                   |  4 ++--
>  drivers/media/usb/cpia2/cpia2_v4l.c             |  4 ++--
>  drivers/media/usb/stkwebcam/stk-webcam.c        |  2 +-
>  drivers/media/usb/usbvision/usbvision-video.c   |  4 ++--
>  drivers/media/v4l2-core/videobuf-core.c         |  4 ++--
>  include/linux/videodev2.h                       | 17 ++++++++++++++++-
>  include/trace/events/v4l2.h                     |  2 +-
>  include/uapi/linux/videodev2.h                  |  2 ++
>  9 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 5a9ba3846f0a..9ec710878db6 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -143,7 +143,7 @@ static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
>  		 * and the timecode field and flag if needed.
>  		 */
>  		if (q->copy_timestamp)
> -			vb->timestamp = v4l2_timeval_to_ns(&b->timestamp);
> +			vb->timestamp = v4l2_buffer_get_timestamp(b);
>  		vbuf->flags |= b->flags & V4L2_BUF_FLAG_TIMECODE;
>  		if (b->flags & V4L2_BUF_FLAG_TIMECODE)
>  			vbuf->timecode = b->timecode;
> @@ -476,7 +476,7 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
>  
>  	b->flags = vbuf->flags;
>  	b->field = vbuf->field;
> -	b->timestamp = ns_to_timeval(vb->timestamp);
> +	v4l2_buffer_set_timestamp(b, vb->timestamp);
>  	b->timecode = vbuf->timecode;
>  	b->sequence = vbuf->sequence;
>  	b->reserved2 = 0;
> diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
> index 0e61c81356ef..3a4c29bc0ba5 100644
> --- a/drivers/media/pci/meye/meye.c
> +++ b/drivers/media/pci/meye/meye.c
> @@ -1266,7 +1266,7 @@ static int vidioc_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  		buf->flags |= V4L2_BUF_FLAG_DONE;
>  
>  	buf->field = V4L2_FIELD_NONE;
> -	buf->timestamp = ns_to_timeval(meye.grab_buffer[index].ts);
> +	v4l2_buffer_set_timestamp(buf, meye.grab_buffer[index].ts);
>  	buf->sequence = meye.grab_buffer[index].sequence;
>  	buf->memory = V4L2_MEMORY_MMAP;
>  	buf->m.offset = index * gbufsize;
> @@ -1332,7 +1332,7 @@ static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  	buf->bytesused = meye.grab_buffer[reqnr].size;
>  	buf->flags = V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	buf->field = V4L2_FIELD_NONE;
> -	buf->timestamp = ns_to_timeval(meye.grab_buffer[reqnr].ts);
> +	v4l2_buffer_set_timestamp(buf, meye.grab_buffer[reqnr].ts);
>  	buf->sequence = meye.grab_buffer[reqnr].sequence;
>  	buf->memory = V4L2_MEMORY_MMAP;
>  	buf->m.offset = reqnr * gbufsize;
> diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
> index 626264a56517..9d3d05125d7b 100644
> --- a/drivers/media/usb/cpia2/cpia2_v4l.c
> +++ b/drivers/media/usb/cpia2/cpia2_v4l.c
> @@ -800,7 +800,7 @@ static int cpia2_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  		break;
>  	case FRAME_READY:
>  		buf->bytesused = cam->buffers[buf->index].length;
> -		buf->timestamp = ns_to_timeval(cam->buffers[buf->index].ts);
> +		v4l2_buffer_set_timestamp(buf, cam->buffers[buf->index].ts);
>  		buf->sequence = cam->buffers[buf->index].seq;
>  		buf->flags = V4L2_BUF_FLAG_DONE;
>  		break;
> @@ -907,7 +907,7 @@ static int cpia2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  	buf->flags = V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_DONE
>  		| V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	buf->field = V4L2_FIELD_NONE;
> -	buf->timestamp = ns_to_timeval(cam->buffers[buf->index].ts);
> +	v4l2_buffer_set_timestamp(buf, cam->buffers[buf->index].ts);
>  	buf->sequence = cam->buffers[buf->index].seq;
>  	buf->m.offset = cam->buffers[buf->index].data - cam->frame_buffer;
>  	buf->length = cam->frame_size;
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> index 21f90a887485..b22501f76b78 100644
> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> @@ -1125,7 +1125,7 @@ static int stk_vidioc_dqbuf(struct file *filp,
>  	sbuf->v4lbuf.flags &= ~V4L2_BUF_FLAG_QUEUED;
>  	sbuf->v4lbuf.flags |= V4L2_BUF_FLAG_DONE;
>  	sbuf->v4lbuf.sequence = ++dev->sequence;
> -	sbuf->v4lbuf.timestamp = ns_to_timeval(ktime_get_ns());
> +	v4l2_buffer_set_timestamp(&sbuf->v4lbuf, ktime_get_ns());
>  
>  	*buf = sbuf->v4lbuf;
>  	return 0;
> diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
> index cdc66adda755..15a423c5deb7 100644
> --- a/drivers/media/usb/usbvision/usbvision-video.c
> +++ b/drivers/media/usb/usbvision/usbvision-video.c
> @@ -687,7 +687,7 @@ static int vidioc_querybuf(struct file *file,
>  	vb->length = usbvision->curwidth *
>  		usbvision->curheight *
>  		usbvision->palette.bytes_per_pixel;
> -	vb->timestamp = ns_to_timeval(usbvision->frame[vb->index].ts);
> +	v4l2_buffer_set_timestamp(vb, usbvision->frame[vb->index].ts);
>  	vb->sequence = usbvision->frame[vb->index].sequence;
>  	return 0;
>  }
> @@ -756,7 +756,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *vb)
>  		V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	vb->index = f->index;
>  	vb->sequence = f->sequence;
> -	vb->timestamp = ns_to_timeval(f->ts);
> +	v4l2_buffer_set_timestamp(vb, f->ts);
>  	vb->field = V4L2_FIELD_NONE;
>  	vb->bytesused = f->scanlength;
>  
> diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
> index 939fc11cf080..ab650371c151 100644
> --- a/drivers/media/v4l2-core/videobuf-core.c
> +++ b/drivers/media/v4l2-core/videobuf-core.c
> @@ -364,7 +364,7 @@ static void videobuf_status(struct videobuf_queue *q, struct v4l2_buffer *b,
>  	}
>  
>  	b->field     = vb->field;
> -	b->timestamp = ns_to_timeval(vb->ts);
> +	v4l2_buffer_set_timestamp(b, vb->ts);
>  	b->bytesused = vb->size;
>  	b->sequence  = vb->field_count >> 1;
>  }
> @@ -578,7 +578,7 @@ int videobuf_qbuf(struct videobuf_queue *q, struct v4l2_buffer *b)
>  		    || q->type == V4L2_BUF_TYPE_SDR_OUTPUT) {
>  			buf->size = b->bytesused;
>  			buf->field = b->field;
> -			buf->ts = v4l2_timeval_to_ns(&b->timestamp);
> +			buf->ts = v4l2_buffer_get_timestamp(b);
>  		}
>  		break;
>  	case V4L2_MEMORY_USERPTR:
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index 16c0ed6c50a7..4086036e37d5 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -56,7 +56,22 @@
>  #ifndef __LINUX_VIDEODEV2_H
>  #define __LINUX_VIDEODEV2_H
>  
> -#include <linux/time.h>     /* need struct timeval */
> +#include <linux/time.h>
>  #include <uapi/linux/videodev2.h>
>  
> +static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
> +{
> +	return buf->timestamp.tv_sec * NSEC_PER_SEC +
> +	       (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;

Why the (u32) cast?

> +}
> +
> +static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
> +					     u64 timestamp)
> +{
> +	struct timespec64 ts = ns_to_timespec64(timestamp);
> +
> +	buf->timestamp.tv_sec  = ts.tv_sec;
> +	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
> +}
> +

This does not belong in the public header. This is kernel specific,
so media/v4l2-common.h would be a good place.

Regards,

	Hans

>  #endif /* __LINUX_VIDEODEV2_H */
> diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
> index 83860de120e3..248bc09bfc99 100644
> --- a/include/trace/events/v4l2.h
> +++ b/include/trace/events/v4l2.h
> @@ -130,7 +130,7 @@ DECLARE_EVENT_CLASS(v4l2_event_class,
>  		__entry->bytesused = buf->bytesused;
>  		__entry->flags = buf->flags;
>  		__entry->field = buf->field;
> -		__entry->timestamp = timeval_to_ns(&buf->timestamp);
> +		__entry->timestamp = v4l2_buffer_get_timestamp(buf);
>  		__entry->timecode_type = buf->timecode.type;
>  		__entry->timecode_flags = buf->timecode.flags;
>  		__entry->timecode_frames = buf->timecode.frames;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..74d3d522f3db 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1010,6 +1010,7 @@ struct v4l2_buffer {
>  	};
>  };
>  
> +#ifndef __KERNEL__
>  /**
>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>   * @ts:		pointer to the timeval variable to be converted
> @@ -1021,6 +1022,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  {
>  	return (__u64)tv->tv_sec * 1000000000ULL + tv->tv_usec * 1000;
>  }
> +#endif
>  
>  /*  Flags for 'flags' field */
>  /* Buffer is mapped (flag) */
> 


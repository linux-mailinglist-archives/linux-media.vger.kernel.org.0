Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED351026F0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 15:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfKSOgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 09:36:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47115 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727535AbfKSOgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 09:36:14 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X4bziENlscs92X4c0i010y; Tue, 19 Nov 2019 15:36:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574174172; bh=b1TRSi5R1Ws/bY8s6wtFEKJSHhN9gAOmlOEIUa6uIAI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WGrhOrxR54sxvtjxTsJ/KMEnZFV89QnBwrorOA2slgRStWsg+K28vw5mUeBg0iys2
         D/7AnSSliskPg14VSz9104sTu8YjznoHcunv2jtwyqLBr4jSkHds+CjDVJn6zztVkJ
         p9DrJ78uQO8SaMVcGYgYY85vHfVaflnQU9lGYlR0rapaG6RgQ8gTMbKa3WFKeBr1S+
         g7/qy6BDeN8IyXgqNOlTmuUO3biuh0+5xgfRpdOqHAo+YA9gRfGxPB/uTStJAiF+gr
         uU+DnSKsB0lGkSfpAhHTbgFlnJH2gVyOyRLlAkvnl9JckLZv1hDL3W4rIONkk0ziOG
         37m1LQGNMv1+g==
Subject: Re: [PATCH 4/5] videodev2.h: add V4L2_BUF_FLAG_TOO_SMALL flag
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
 <20191119113457.57833-5-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a0635d66-6415-15be-97c3-ea7b91beba10@xs4all.nl>
Date:   Tue, 19 Nov 2019 15:36:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119113457.57833-5-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKMeX6DCCMyp+nBhAOLzcQfF/FV30zkce9bFwTOnUdwxsa1gu5+QUXjpUEPeTh8A81XnRQBUoI0fiovUzyypl6ZCCzJcD9r7lL3schdaCUS0fSg1NQys
 AXTtTTYcZivrhCsxtE+FNvXEroY/yUEJiZxaMMzuWW+G7yWvX6UHuCfngWijHwVHZmVTI+eset4Oc8ijYCYUk6c7YJ5hMNqIDzjQl4e/XaXTyn5KIgO3oWjX
 MuSoXAOBPn2gpZ7i6zMZG1a5cGkoakPQC2YrWWyhi1FjZPc5kLOFVRFNyOqNylS//tcb/FNR8/WAzEE/mTT1tA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/19/19 12:34 PM, Hans Verkuil wrote:
> Stateful encoders need to know if V4L2_BUF_FLAG_ERROR was because
> the capture buffer was too small or because there was another
> error. Set this flag (always in combination with FLAG_ERROR) to
> indicate that the buffer was too small.
> 
> A corresponding VB2_BUF_STATE_ERROR_TOO_SMALL vb2 state was added.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/buffer.rst         |  9 +++++++++
>  drivers/media/common/videobuf2/videobuf2-core.c | 12 +++++++++---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++++
>  include/media/videobuf2-core.h                  |  4 ++++
>  include/uapi/linux/videodev2.h                  |  2 ++
>  5 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..64a97677ec20 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -540,6 +540,15 @@ Buffer Flags
>  	streaming may continue as normal and the buffer may be reused
>  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
>  	called.
> +    * .. _`V4L2-BUF-FLAG-TOO-SMALL`:
> +
> +      - ``V4L2_BUF_FLAG_TOO_SMALL``
> +      - 0x00080000
> +      - When this flag is set, the buffer has been dequeued successfully,
> +	but no data was written since the buffer was too small. If this
> +	flag is set, then ``V4L2_BUF_FLAG_ERROR`` was also set. This can
> +	only happen for capture buffers. Drivers set this flag when
> +	the ``VIDIOC_DQBUF`` ioctl is called.
>      * .. _`V4L2-BUF-FLAG-IN-REQUEST`:
>  
>        - ``V4L2_BUF_FLAG_IN_REQUEST``
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..187a4589a7bb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -929,6 +929,7 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
>  
>  	if (WARN_ON(state != VB2_BUF_STATE_DONE &&
>  		    state != VB2_BUF_STATE_ERROR &&
> +		    state != VB2_BUF_STATE_ERROR_TOO_SMALL &&
>  		    state != VB2_BUF_STATE_QUEUED))
>  		state = VB2_BUF_STATE_ERROR;
>  
> @@ -1816,6 +1817,9 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>  	case VB2_BUF_STATE_ERROR:
>  		dprintk(3, "returning done buffer with errors\n");
>  		break;
> +	case VB2_BUF_STATE_ERROR_TOO_SMALL:
> +		dprintk(3, "returning done buffer that's too small\n");
> +		break;
>  	default:
>  		dprintk(1, "invalid buffer state\n");
>  		return -EINVAL;
> @@ -2383,8 +2387,9 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
>  					done_entry);
>  	spin_unlock_irqrestore(&q->done_lock, flags);
>  
> -	if (vb && (vb->state == VB2_BUF_STATE_DONE
> -			|| vb->state == VB2_BUF_STATE_ERROR)) {
> +	if (vb && (vb->state == VB2_BUF_STATE_DONE ||
> +		   vb->state == VB2_BUF_STATE_ERROR ||
> +		   vb->state == VB2_BUF_STATE_ERROR_TOO_SMALL)) {
>  		return (q->is_output) ?
>  				EPOLLOUT | EPOLLWRNORM :
>  				EPOLLIN | EPOLLRDNORM;
> @@ -2812,7 +2817,8 @@ static int vb2_thread(void *data)
>  			break;
>  		try_to_freeze();
>  
> -		if (vb->state != VB2_BUF_STATE_ERROR)
> +		if (vb->state != VB2_BUF_STATE_ERROR &&
> +		    vb->state != VB2_BUF_STATE_ERROR_TOO_SMALL)
>  			if (threadio->fnc(vb, threadio->priv))
>  				break;
>  		call_void_qop(q, wait_finish, q);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index e652f4318284..6ac19734e4a2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -44,6 +44,7 @@ module_param(debug, int, 0644);
>  /* Flags that are set by us */
>  #define V4L2_BUFFER_MASK_FLAGS	(V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_QUEUED | \
>  				 V4L2_BUF_FLAG_DONE | V4L2_BUF_FLAG_ERROR | \
> +				 V4L2_BUF_FLAG_ERROR_TOO_SMALL | \

Oops, should have been V4L2_BUF_FLAG_TOO_SMALL. Sorry about that.

Regards,

	Hans

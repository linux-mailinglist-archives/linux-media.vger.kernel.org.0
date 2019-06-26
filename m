Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D879B567DE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZLoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:44:30 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55357 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfFZLo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:44:29 -0400
Received: from [IPv6:2001:420:44c1:2579:95e:6256:39de:52a6] ([IPv6:2001:420:44c1:2579:95e:6256:39de:52a6])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g6LfhWztlSfvXg6LjhKTME; Wed, 26 Jun 2019 13:44:27 +0200
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: reorder checks in
 v4l2_m2m_poll()
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, pawel@osciak.com, mchehab@kernel.org
References: <20190625141113.30301-1-m.tretter@pengutronix.de>
 <20190625141113.30301-3-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9a5acbab-587b-76aa-68eb-7989652f247a@xs4all.nl>
Date:   Wed, 26 Jun 2019 13:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190625141113.30301-3-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPtYrTVuZmKWMdtTaHw3Kp3rkUhwuO6iWB6MOmUMITbzkhK1tC169I1G3PX2oD4xFFx3ZRpHxxrYTnIWVgkOa90gk8DAkw5tzNdwp/gP/YeH+IU4NxI/
 U+L74UOU6xh/7E6g11HBHL96TxWsHuB2BvHyiupjwp6k27pSKYyk9SGSMiMt/Y1khrXAelGjGn5caae4lUArfw7YZ3Xb0IXXKypxu7wo18Q+YIPA1hJW1CPz
 285eL1myP0l4yxNhpLrB8jFH/WsYtUyNoO32zCHpwkfqHf9lxBZWkCUscv5ekZXsbp2A7CoaQ9QKY78VOd/lvOYftaf6/yzBYkFCXK8rDRYo7xhx/gnmufTL
 yPX204UCC5952AMB6ODgaAe0HgYaNiXZjHeUa1UuTbNyuLZq3QwZB8wlBwG3/e5PMlEE+sIw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/25/19 4:11 PM, Michael Tretter wrote:
> When reaching the end of stream, V4L2 m2m clients may expect the
> V4L2_EOS_EVENT. Although the V4L2_EOS_EVENT is deprecated behavior,
> drivers must signal that event before dequeuing the buffer that has the
> V4L2_BUF_FLAG_LAST flag set.
> 
> If a driver queues the V4L2_EOS_EVENT event and returns the buffer after
> the check for events but before the check for buffers, vb2_m2m_poll()
> will signal that the buffer with V4L2_BUF_FLAG_LAST can be read but not
> that the V4L2_EOS_EVENT is available.
> 
> Split the check for buffers into a separate function and check for
> available buffers before checking for events. This ensures that if
> vb2_m2m_poll() signals POLLIN | POLLRDNORM for the V4L2_BUF_FLAG_LAST
> buffer, it signals POLLPRI for the V4L2_EOS_EVENT, too.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 47 +++++++++++++++-----------
>  1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 4f5176702937..f18fdce31d6f 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -603,11 +603,10 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_streamoff);
>  
> -__poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> -			   struct poll_table_struct *wait)
> +static __poll_t __v4l2_m2m_poll(struct file *file,
> +				struct v4l2_m2m_ctx *m2m_ctx,
> +				struct poll_table_struct *wait)

I agree with the patch, except for this function name.

How about: v4l2_m2m_poll_for_data() or something along those lines?

Regards,

	Hans

>  {
> -	struct video_device *vfd = video_devdata(file);
> -	__poll_t req_events = poll_requested_events(wait);
>  	struct vb2_queue *src_q, *dst_q;
>  	struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
>  	__poll_t rc = 0;
> @@ -619,16 +618,6 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  	poll_wait(file, &src_q->done_wq, wait);
>  	poll_wait(file, &dst_q->done_wq, wait);
>  
> -	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
> -		struct v4l2_fh *fh = file->private_data;
> -
> -		poll_wait(file, &fh->wait, wait);
> -		if (v4l2_event_pending(fh))
> -			rc = EPOLLPRI;
> -		if (!(req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM)))
> -			return rc;
> -	}
> -
>  	/*
>  	 * There has to be at least one buffer queued on each queued_list, which
>  	 * means either in driver already or waiting for driver to claim it
> @@ -637,10 +626,8 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  	if ((!src_q->streaming || src_q->error ||
>  	     list_empty(&src_q->queued_list)) &&
>  	    (!dst_q->streaming || dst_q->error ||
> -	     list_empty(&dst_q->queued_list))) {
> -		rc |= EPOLLERR;
> -		goto end;
> -	}
> +	     list_empty(&dst_q->queued_list)))
> +		return EPOLLERR;
>  
>  	spin_lock_irqsave(&dst_q->done_lock, flags);
>  	if (list_empty(&dst_q->done_list)) {
> @@ -650,7 +637,7 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		 */
>  		if (dst_q->last_buffer_dequeued) {
>  			spin_unlock_irqrestore(&dst_q->done_lock, flags);
> -			return rc | EPOLLIN | EPOLLRDNORM;
> +			return EPOLLIN | EPOLLRDNORM;
>  		}
>  	}
>  	spin_unlock_irqrestore(&dst_q->done_lock, flags);
> @@ -673,7 +660,27 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		rc |= EPOLLIN | EPOLLRDNORM;
>  	spin_unlock_irqrestore(&dst_q->done_lock, flags);
>  
> -end:
> +	return rc;
> +}
> +
> +__poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> +			   struct poll_table_struct *wait)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +	__poll_t req_events = poll_requested_events(wait);
> +	__poll_t rc = 0;
> +
> +	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
> +		rc = __v4l2_m2m_poll(file, m2m_ctx, wait);
> +
> +	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
> +		struct v4l2_fh *fh = file->private_data;
> +
> +		poll_wait(file, &fh->wait, wait);
> +		if (v4l2_event_pending(fh))
> +			rc |= EPOLLPRI;
> +	}
> +
>  	return rc;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_poll);
> 


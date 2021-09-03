Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B2C4003F6
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 19:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350099AbhICRMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 13:12:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54908 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244231AbhICRMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 13:12:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D210BBE;
        Fri,  3 Sep 2021 19:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630689109;
        bh=BlbNWgwKIjArsznLunXFhZp2/0HnLFqRO9t41gWdKdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RPY6uHWNZ7TFcwQoCeqtbie3XiHjriFc8y/CBCOwaH7w06J0TQCZ9Hxs8fbuMYn4B
         LqOmzSozWpuzxFVsBzAJROtO49tQyaWTSRHSLsC6YawKw7gdSBm3g9zca4IfuFNVoe
         C5ddOZZxjzomp647GkwYCI96ADAy0eoQyUtdCU0g=
Date:   Fri, 3 Sep 2021 20:11:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH for v5.14] videobuf2-core: dequeue if start_streaming
 fails
Message-ID: <YTJXREETLfvFzEsP@pendragon.ideasonboard.com>
References: <542319b4-387b-6e29-db72-998de02ae4b4@xs4all.nl>
 <YQK6kMhFBmxDN/Jc@pendragon.ideasonboard.com>
 <b8d5e3a1-2ab7-eefd-3265-10621a28101c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8d5e3a1-2ab7-eefd-3265-10621a28101c@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 30, 2021 at 10:39:59AM +0200, Hans Verkuil wrote:
> On 29/07/2021 16:26, Laurent Pinchart wrote:
> > On Thu, Jul 29, 2021 at 10:35:33AM +0200, Hans Verkuil wrote:
> >> If a vb2_queue sets q->min_buffers_needed then if the number of
> >> queued buffers reaches that number vb2_core_qbuf() will call
> >> the start_streaming() callback. If that returns an error, then that
> >> was just returned, but that left the buffer still queued. But userspace
> > 
> > The three "that" in the sentence are confusing. Do you mean "If that
> > function returns an error, the error code is just returned, but the
> > buffer is left still queued." ?
> > 
> >> expects that if VIDIOC_QBUF fails, the buffer wasn't queued.
> >>
> >> So if start_streaming() fails, then remove the buffer from the queue,
> >> thus avoiding this unwanted side-effect.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> Fixes: b3379c6201bb ("[media] vb2: only call start_streaming if sufficient buffers are queued")
> > 
> > Possibly with the commit message updated,
> 
> This is the new commit message (not going to repost the patch, I'll just
> update the PR):

Did you forget to include it in a pull request by any chance ? I don't
see this in v5.14. Any chance it could go in v5.15 as a fix ?

> If a vb2_queue sets q->min_buffers_needed then when the number of
> queued buffers reaches q->min_buffers_needed, vb2_core_qbuf() will call
> the start_streaming() callback. If start_streaming() returns an error,
> then that error was just returned by vb2_core_qbuf(), but the buffer
> was still queued. However, userspace expects that if VIDIOC_QBUF fails,
> the buffer is returned dequeued.
> 
> So if start_streaming() fails, then remove the buffer from the queue,
> thus avoiding this unwanted side-effect.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >> ---
> >>  drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> >> index 02281d13505f..508ac295eb06 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -1573,6 +1573,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> >>  		  struct media_request *req)
> >>  {
> >>  	struct vb2_buffer *vb;
> >> +	enum vb2_buffer_state orig_state;
> >>  	int ret;
> >>
> >>  	if (q->error) {
> >> @@ -1673,6 +1674,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> >>  	 * Add to the queued buffers list, a buffer will stay on it until
> >>  	 * dequeued in dqbuf.
> >>  	 */
> >> +	orig_state = vb->state;
> >>  	list_add_tail(&vb->queued_entry, &q->queued_list);
> >>  	q->queued_count++;
> >>  	q->waiting_for_buffers = false;
> >> @@ -1703,8 +1705,17 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> >>  	if (q->streaming && !q->start_streaming_called &&
> >>  	    q->queued_count >= q->min_buffers_needed) {
> >>  		ret = vb2_start_streaming(q);
> >> -		if (ret)
> >> +		if (ret) {
> >> +			/*
> >> +			 * Since vb2_core_qbuf will return with an error,
> >> +			 * we should return it to state DEQUEUED since
> >> +			 * the error indicates that the buffer wasn't queued.
> >> +			 */
> >> +			list_del(&vb->queued_entry);
> >> +			q->queued_count--;
> >> +			vb->state = orig_state;
> >>  			return ret;
> >> +		}
> >>  	}
> >>
> >>  	dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);

-- 
Regards,

Laurent Pinchart

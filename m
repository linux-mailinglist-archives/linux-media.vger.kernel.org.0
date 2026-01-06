Return-Path: <linux-media+bounces-50040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079CCF8F68
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20A5C3044873
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372C332E69F;
	Tue,  6 Jan 2026 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PUQ8X7lG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1D3BB4A;
	Tue,  6 Jan 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711602; cv=none; b=L6Ay1jARkiGf50PNAgthDoxRAyzYoJWULpdZ/CYbvKWfdOsNOM2Ueso80YRxeKFjHeTPhM8mCi40vaZMs9FT7nilnBfPEPETaBHfQV+gWaP8g6oOXjoC2BxjtHXGKV75DAMg6iPMfvtb9ykyb8JDYpVH1emNxrgal2h3L3HHwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711602; c=relaxed/simple;
	bh=9uRGs8Rj34TqiS19c06jNdSajZrlzddrjzmb96+e0JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVRML2iScnCs7JR8Jh+TV4KMruaDlLoAcNCC8XmJIn5RxJMKdkj9O68OG4uf6iipK5/tevVebqo0jZs+4zjKmVmRmbcg0V0mAnI7Wio2YBEccw+IU9UyxNlFUNZU2osoh9acvUiv8GoGtyz+wrII7zC1qRH/vOkihib61Gr80ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PUQ8X7lG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8011D55A;
	Tue,  6 Jan 2026 15:59:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767711576;
	bh=9uRGs8Rj34TqiS19c06jNdSajZrlzddrjzmb96+e0JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUQ8X7lG0gNoY86Voxakt7gOXjGNMXFwfGMrZxNo0vLnb5gBHrL0k8J1JZ1dRwcEm
	 NsC4QKVT90NBj2Evy7EUDLeNVLK+jquBCRRRNau61TjP6PpZd5q/Ge72eQvuQUnsjg
	 FSqIhMKpHgTJK/6WAqMoCwi/b6YcBWcnL95OWtFM=
Date: Tue, 6 Jan 2026 16:59:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
Message-ID: <20260106145939.GC26157@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
 <20260106003302.GJ10026@pendragon.ideasonboard.com>
 <176770897731.12184.12302111059048415045@localhost>
 <7c514e1165f49c2e043b7f4ab5fcbd1003c517ae.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c514e1165f49c2e043b7f4ab5fcbd1003c517ae.camel@ndufresne.ca>

(CC'ing Hans)

On Tue, Jan 06, 2026 at 09:35:19AM -0500, Nicolas Dufresne wrote:
> Le mardi 06 janvier 2026 à 15:16 +0100, Stefan Klug a écrit :
> > Hi Nicolas, hi Laurent,
> > 
> > Thank you for the review.
> > 
> > Quoting Laurent Pinchart (2026-01-06 01:33:02)
> > > On Mon, Jan 05, 2026 at 01:46:46PM -0500, Nicolas Dufresne wrote:
> > > > Le lundi 05 janvier 2026 à 12:35 +0100, Stefan Klug a écrit :
> > > > > The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> > > > > flexible dewarping using a freely configurable vertex map. Aside from
> > > > > lens dewarping the vertex map can be used to implement things like
> > > > > arbitrary zoom, pan and rotation. The current driver supports setting
> > > > > that vertex map before calling VIDIOC_STREAMON.
> > > > > 
> > > > > To control above mentioned features during streaming it is necessary to
> > > > > update the vertex map dynamically. To do that in a race free manner V4L2
> > > > > requests support is required. This patch adds V4L2 requests support to
> > > > > prepare for dynamic vertex map updates.
> > > > > 
> > > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Changes in v1:
> > > > > - Moved v4l2_ctrl_request_complete into dw100_device_run
> > > > > ---
> > > > >  drivers/media/platform/nxp/dw100/dw100.c | 41
> > > > > ++++++++++++++++++++++++++++----
> > > > >  1 file changed, 36 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> > > > > b/drivers/media/platform/nxp/dw100/dw100.c
> > > > > index
> > > > > 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..7f14b82c15a071605c124dbb868f80
> > > > > 03856c4fc0 100644
> > > > > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > > > > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > > > > @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *vq,
> > > > >     return 0;
> > > > >  }
> > > > >  
> > > > > +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> > > > > +{
> > > > > +   struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > > > +
> > > > > +   vbuf->field = V4L2_FIELD_NONE;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > 
> > > Stefan, how is this related to requests support ?
> > 
> > vb2_queue_or_prepare_buf() errors out if this is not implemented and the
> > buffer uses requests. This was the implementation I saw on most drivers.
> > And as I don't expect anyone to try to use the dewarper with interleaved
> > data I didn't bother to add a warning.
> 
> I'm stumbled on this one too, but I completely forgot what this callback was
> about and assume something like this. I suspect it might be some left over from
> when we required all request to hold all the controls, we should find a way to
> make that optional, and sort out this field thing, but I'd say its not a problem
> for this serie.

Definitely not a problem for this series :-) Please see my other reply
about using .buf_prepare(), let's avoid splitting the discussion.

> > > > > +
> > > > >  static int dw100_buf_prepare(struct vb2_buffer *vb)
> > > > >  {
> > > > >     unsigned int i;
> > > > > @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *vb)
> > > > >     v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > > >  }
> > > > >  
> > > > > +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> > > > > +{
> > > > > +   struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > > > > +
> > > > > +   v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> > > 
> > > Unless I'm missing something, this will call
> > > v4l2_ctrl_request_complete() twice, once on each of the source and
> > > destination buffers, for the same request and control handler. Is that
> > > desired ?
> > 
> > The docs say "a buffer that was never queued to the driver but is
> > associated with a queued request was canceled..." So to my understanding
> > the only purpose of this function is to mark all controls in the request
> > as being handled, so that the request can be finished.
> > 
> > All the implementations I found in the kernel are exactly the same and
> > are to my understanding only necessary to map from a vb2_buffer to a
> > v4l2_ctrl_handler (which is then passed to v4l2_ctrl_request_complete())
> 
> vb2 does not have access to the control handler, so it cannot call
> v4l2_ctrl_request_complete() when the request is never passed to the driver.
> This is only called if the request is being discarded in the background. There
> is certainly room for improvement here.

A media_request_object_ops operation could be a better candidate to
complete controls. This will likely require rethinking how cancellation
is implemented, as it still couldn't go through vb2 (otherwise the new
operation would still be called once for each queue, which isn't right).

> > > > > +}
> > > > > +
> > > > >  static void dw100_return_all_buffers(struct vb2_queue *q,
> > > > >                                  enum vb2_buffer_state state)
> > > > >  {
> > > > > @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_queue
> > > > > *q)
> > > > >  }
> > > > >  
> > > > >  static const struct vb2_ops dw100_qops = {
> > > > > -   .queue_setup     = dw100_queue_setup,
> > > > > -   .buf_prepare     = dw100_buf_prepare,
> > > > > -   .buf_queue       = dw100_buf_queue,
> > > > > -   .start_streaming = dw100_start_streaming,
> > > > > -   .stop_streaming  = dw100_stop_streaming,
> > > > > +   .queue_setup          = dw100_queue_setup,
> > > > > +   .buf_out_validate     = dw100_buf_out_validate,
> > > > > +   .buf_prepare          = dw100_buf_prepare,
> > > > > +   .buf_queue            = dw100_buf_queue,
> > > > > +   .start_streaming      = dw100_start_streaming,
> > > > > +   .stop_streaming       = dw100_stop_streaming,
> > > > > +   .buf_request_complete = dw100_buf_request_complete,
> > > > >  };
> > > > >  
> > > > >  static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> > > > > @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struct
> > > > > vb2_queue *src_vq,
> > > > >     src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > > >     src_vq->lock = &ctx->vq_mutex;
> > > > >     src_vq->dev = ctx->dw_dev->v4l2_dev.dev;
> > > > > +   src_vq->supports_requests = true;
> > > > >  
> > > > >     ret = vb2_queue_init(src_vq);
> > > > >     if (ret)
> > > > > @@ -1460,6 +1479,12 @@ static void dw100_device_run(void *priv)
> > > > >     src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > > >     dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > > >  
> > > > > +   v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > > > +                           &ctx->hdl);
> > > > > +
> > > > > +   v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > > > +                              &ctx->hdl);
> > > > 
> > > > The request should always be signalled last, so nothing wrong with
> > > > applying the
> > > > controls as soon as possible in this case. Complete is a bit of a miss-
> > > > leading
> > > > name, this function actually changes the global controls value (apply) and
> > > > removes its participation in request completion. Since the OUTPUT buffer
> > > > for
> > > > that request is still queued, the request is not signalled yet.
> > > 
> > > I'm very confused here. As far as I can tell,
> > > v4l2_ctrl_request_complete() doesn't apply controls (i.e. cause
> > > .s_ctrl() to be called), it copies the value of controls back to the
> > > request to report them to the application. Am I missing something ?
> > > 
> > > As there's nothing to report back to the application (no volatile
> > > control whose value will come from the hardware), calling
> > > v4l2_ctrl_request_complete() here seems fine to me. Is that what you
> > > were trying to explain ?
> > 
> > I think that was meant, yes (see next comment)
> > 
> > > 
> > > > But you have to flip over the order to buffer signalling in
> > > > dw100_job_finish()
> > > > though. My recommendation is to use the helper
> > > > v4l2_m2m_buf_done_and_job_finish(). Something like this (not tested):
> > > > 
> > > >    diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> > > > b/drivers/media/platform/nxp/dw100/dw100.c
> > > >    index 4aaf9c3fff53..c5f9ee238345 100644
> > > >    --- a/drivers/media/platform/nxp/dw100/dw100.c
> > > >    +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > > >    @@ -1058,7 +1058,6 @@ static const struct v4l2_ioctl_ops
> > > > dw100_ioctl_ops = {
> > > >     static void dw100_job_finish(struct dw100_device *dw_dev, bool
> > > > with_error)
> > > >     {
> > > >            struct dw100_ctx *curr_ctx;
> > > >    -       struct vb2_v4l2_buffer *src_vb, *dst_vb;
> > > >            enum vb2_buffer_state buf_state;
> > > >     
> > > >            curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
> > > >    @@ -1069,16 +1068,12 @@ static void dw100_job_finish(struct
> > > > dw100_device *dw_dev, bool with_error)
> > > >                    return;
> > > >            }
> > > >     
> > > >    -       src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> > > >    -       dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> > > >    -
> > > >            if (likely(!with_error))
> > > >                    buf_state = VB2_BUF_STATE_DONE;
> > > >            else
> > > >                    buf_state = VB2_BUF_STATE_ERROR;
> > > >     
> > > >    -       v4l2_m2m_buf_done(src_vb, buf_state);
> > > >    -       v4l2_m2m_buf_done(dst_vb, buf_state);
> > > >    +       v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, buf_state);
> > > >     
> > > >            dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s
> > > > error(s)\n",
> > > >                    with_error ? "" : "out");
> > > >    
> > > > You might be tempted to keep the logical order, and move the
> > > > v4l2_ctrl_request_complete() call into dw100_job_finish(), unfortunately
> > > > this
> > > > does not work, since nothing mandate that any control was included in this
> > > > request, and that will lead to calling v4l2_ctrl_request_complete() on an
> > > > already completed request. Since its a single function HW, I don't see why
> > > > you'd
> > > > want this, but it would require the manual request completion.
> > 
> > Nicolas, if I go you right you mean that one might be tempted to do
> > 
> > v4l2_ctrl_request_setup()
> > v4l2_m2m_buf_done(src)
> > v4l2_m2m_buf_done(dst)
> > v4l2_ctrl_request_complete()
> > 
> > which feels natural from the names of the functions, but the
> > v4l2_m2m_buf_done(src) might complete the request if it has no
> > associated controls and therefore the later v4l2_ctrl_request_complete()
> > would fail...
> > 
> > I see that the usage of v4l2_m2m_buf_done_and_job_finish() is more
> > compact and will use that in v2. For the sake of understanding: The only
> > functional issue with my code is that v4l2_m2m_buf_done(src_buf) is
> > called before v4l2_m2m_buf_done(dest_buf), right?
> 
> Correct, swapping these two would work too, but as you said, I proposed
> v4l2_m2m_buf_done_and_job_finish() simply because it is more compact and fits
> your use case. The extra code in the helper is for capture buffer holding, which
> at least for now does not apply to you.
> 
> > > > > +
> > > > >     dw100_start(ctx, src_buf, dst_buf);
> > > > 
> > > > nit: I really don't see why this is a separate function ...
> > 
> > I wondered that also, but didn't want to mess too much with existing
> > code. Maybe as a fixup on top?
> 
> Feel free to do so.
> 
> > > > >  }
> > > > >  
> > > > > @@ -1467,6 +1492,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops =
> > > > > {
> > > > >     .device_run     = dw100_device_run,
> > > > >  };
> > > > >  
> > > > > +static const struct media_device_ops dw100_m2m_media_ops = {
> > > > > +   .req_validate = vb2_request_validate,
> > > > > +   .req_queue = v4l2_m2m_request_queue,
> > > > > +};
> > > > > +
> > > > >  static struct video_device *dw100_init_video_device(struct dw100_device
> > > > > *dw_dev)
> > > > >  {
> > > > >     struct video_device *vfd = &dw_dev->vfd;
> > > > > @@ -1578,6 +1608,7 @@ static int dw100_probe(struct platform_device
> > > > > *pdev)
> > > > >     dw_dev->mdev.dev = &pdev->dev;
> > > > >     strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
> > > > >     media_device_init(&dw_dev->mdev);
> > > > > +   dw_dev->mdev.ops = &dw100_m2m_media_ops;
> > > > >     dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
> > > > >  
> > > > >     ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);

-- 
Regards,

Laurent Pinchart


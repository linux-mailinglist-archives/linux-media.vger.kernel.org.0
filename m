Return-Path: <linux-media+bounces-53316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PziIWOlnmmrWgQAu9opvQ
	(envelope-from <linux-media+bounces-53316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:31:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08F19379E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B69BD3112A0C
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 07:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69ED2BE642;
	Wed, 25 Feb 2026 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DbfaU8qw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C648296BD5;
	Wed, 25 Feb 2026 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004223; cv=none; b=W2mfQelXOnZWsbbg1t9PLzOKCw7pvM5/0q5pb4WPcqluU+JLRoJGE6Jro4HX+bX70YDN2QYljGOon+9wnQeIqhYO0sIVhoCa3JSOlWXtjbzkE3yqtYXbnVPLBoTckoy3e2m3IpyvZ+kVSzaJCCis1pD7Z7E44B2JrffTsh9b8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004223; c=relaxed/simple;
	bh=46saJDg62/XixnE1xpTaQvU8i1/NZjYQRfba62tHpo4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=czQO3xM3CRVAMhVPw4CiVBpOYPblAlahPT2Fm2RSzBwDbdqZjvySWTgZIgQVGAuUPSUPeFUkAHtdVQ83QwQoe478mMIP+AJIrAiMoLm8GwIYBpjyCeX13ypmnjSo2luC/jY+6zGQODVNyafb4h9goIBvLvN/zXMEVW6pduGu62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DbfaU8qw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:cd05:b041:1dc3:f62c])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35A0A379;
	Wed, 25 Feb 2026 08:22:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772004161;
	bh=46saJDg62/XixnE1xpTaQvU8i1/NZjYQRfba62tHpo4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DbfaU8qwyzE6pRhGBCG5YEE0HalCwcbJYEacs9Rsotw//YV1ldKoYcy2qIyNGqOV9
	 BcbeFiPUclfoYb631crwtQudO/j1RzZxVi87eOoGZO5TxnF4zCDmTc/rmMFOmLtPQM
	 KDzuFPucoItCBx8fg4wicWcS7unwEzECAg/Xp458=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260210175035.GB2502896@killaraus.ideasonboard.com>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com> <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-1-2eb5685eaf09@ideasonboard.com> <20260210175035.GB2502896@killaraus.ideasonboard.com>
Subject: Re: [PATCH v3 1/4] media: dw100: Implement V4L2 requests support
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 25 Feb 2026 08:23:35 +0100
Message-ID: <177200421586.2000438.13945396794652854559@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53316-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D08F19379E
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the review.

Quoting Laurent Pinchart (2026-02-10 18:50:35)
> Hi Stefan,
>=20
> Thank you for the patch.
>=20
> On Thu, Jan 29, 2026 at 12:43:10PM +0100, Stefan Klug wrote:
> > The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> > flexible dewarping using a freely configurable vertex map. Aside from
> > lens dewarping the vertex map can be used to implement things like
> > arbitrary zoom, pan and rotation. The current driver supports setting
> > that vertex map before calling VIDIOC_STREAMON.
> >=20
> > To control above mentioned features during streaming it is necessary to
> > update the vertex map dynamically. To do that in a race free manner V4L2
> > requests support is required. This patch adds V4L2 requests support to
>=20
> Once this gets merged it won't be a patch any more :-) As commit
> messages are written in an imperative mood style,
>=20
> s/This patch adds/Add/
>=20
> > prepare for dynamic vertex map updates.
> >=20
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> >=20
> > ---
> >=20
> > Changes in v2:
> > - Use v4l2_m2m_buf_done_and_job_finish() to mark the buffers as done in
> >   the correct order.
> >=20
> > Changes in v1:
> > - Moved v4l2_ctrl_request_complete into dw100_device_run
> > ---
> >  drivers/media/platform/nxp/dw100/dw100.c | 49 ++++++++++++++++++++++++=
+-------
> >  1 file changed, 38 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/p=
latform/nxp/dw100/dw100.c
> > index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..1cb895da9912371a2b23ca6=
2412c572d9cb75c00 100644
> > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *vq,
> >       return 0;
> >  }
> > =20
> > +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +
> > +     vbuf->field =3D V4L2_FIELD_NONE;
> > +
> > +     return 0;
> > +}
> > +
> >  static int dw100_buf_prepare(struct vb2_buffer *vb)
> >  {
> >       unsigned int i;
> > @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *vb)
> >       v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> >  }
> > =20
> > +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> > +{
> > +     struct dw100_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +     v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> > +}
> > +
> >  static void dw100_return_all_buffers(struct vb2_queue *q,
> >                                    enum vb2_buffer_state state)
> >  {
> > @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_queue=
 *q)
> >  }
> > =20
> >  static const struct vb2_ops dw100_qops =3D {
> > -     .queue_setup     =3D dw100_queue_setup,
> > -     .buf_prepare     =3D dw100_buf_prepare,
> > -     .buf_queue       =3D dw100_buf_queue,
> > -     .start_streaming =3D dw100_start_streaming,
> > -     .stop_streaming  =3D dw100_stop_streaming,
> > +     .queue_setup          =3D dw100_queue_setup,
> > +     .buf_out_validate     =3D dw100_buf_out_validate,
> > +     .buf_prepare          =3D dw100_buf_prepare,
> > +     .buf_queue            =3D dw100_buf_queue,
> > +     .start_streaming      =3D dw100_start_streaming,
> > +     .stop_streaming       =3D dw100_stop_streaming,
> > +     .buf_request_complete =3D dw100_buf_request_complete,
> >  };
> > =20
> >  static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> > @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struct =
vb2_queue *src_vq,
> >       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >       src_vq->lock =3D &ctx->vq_mutex;
> >       src_vq->dev =3D ctx->dw_dev->v4l2_dev.dev;
> > +     src_vq->supports_requests =3D true;
> > =20
> >       ret =3D vb2_queue_init(src_vq);
> >       if (ret)
> > @@ -1058,7 +1077,6 @@ static const struct v4l2_ioctl_ops dw100_ioctl_op=
s =3D {
> >  static void dw100_job_finish(struct dw100_device *dw_dev, bool with_er=
ror)
> >  {
> >       struct dw100_ctx *curr_ctx;
> > -     struct vb2_v4l2_buffer *src_vb, *dst_vb;
> >       enum vb2_buffer_state buf_state;
> > =20
> >       curr_ctx =3D v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
> > @@ -1069,16 +1087,13 @@ static void dw100_job_finish(struct dw100_devic=
e *dw_dev, bool with_error)
> >               return;
> >       }
> > =20
> > -     src_vb =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> > -     dst_vb =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> > -
> >       if (likely(!with_error))
> >               buf_state =3D VB2_BUF_STATE_DONE;
> >       else
> >               buf_state =3D VB2_BUF_STATE_ERROR;
> > =20
> > -     v4l2_m2m_buf_done(src_vb, buf_state);
> > -     v4l2_m2m_buf_done(dst_vb, buf_state);
> > +     v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2=
m_ctx,
> > +                                      buf_state);
> > =20
> >       dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(s=
)\n",
> >               with_error ? "" : "out");
> > @@ -1460,6 +1475,12 @@ static void dw100_device_run(void *priv)
> >       src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> >       dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > =20
>=20
> I'd add a comment here, as the complete() call before start() can be
> confusing.
>=20
>         /*
>          * Apply controls from the request to the device and copy back th=
e value
>          * of volatile controls to the request. We can do the latter befo=
re
>          * starting the dewarper as no controls are updated as a result o=
f the
>          * hardware operation.
>          /
>=20
> It could be me not being familiar enough with the API, but I think
> discussions during review of v2 showed that this confused other people
> too.

I was just applying the comment to the code when I realized that I had
difficulties parsing it. Main cause is that it is just above the call to
v4l2_ctrl_request_setup() which is imho not the questionable call. Would
you be fine with a shorter comment above v4l2_ctrl_request_complete()
only?

	/*
         * As the hardware does not update any volatile controls, we can
         * complete control handling before starting the dewarper.
         */
	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
				   &ctx->hdl);

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,
Stefan

>=20
> > +     v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > +                             &ctx->hdl);
> > +
> > +     v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > +                                &ctx->hdl);
> > +
> >       dw100_start(ctx, src_buf, dst_buf);
> >  }
> > =20
> > @@ -1467,6 +1488,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops =
=3D {
> >       .device_run     =3D dw100_device_run,
> >  };
> > =20
> > +static const struct media_device_ops dw100_m2m_media_ops =3D {
> > +     .req_validate =3D vb2_request_validate,
> > +     .req_queue =3D v4l2_m2m_request_queue,
> > +};
> > +
> >  static struct video_device *dw100_init_video_device(struct dw100_devic=
e *dw_dev)
> >  {
> >       struct video_device *vfd =3D &dw_dev->vfd;
> > @@ -1578,6 +1604,7 @@ static int dw100_probe(struct platform_device *pd=
ev)
> >       dw_dev->mdev.dev =3D &pdev->dev;
> >       strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
> >       media_device_init(&dw_dev->mdev);
> > +     dw_dev->mdev.ops =3D &dw100_m2m_media_ops;
> >       dw_dev->v4l2_dev.mdev =3D &dw_dev->mdev;
> > =20
> >       ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart


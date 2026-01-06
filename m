Return-Path: <linux-media+bounces-50031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F9CF8BD8
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC26E3026B1A
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27FC30C61C;
	Tue,  6 Jan 2026 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qfEzuMjc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15F30FC04;
	Tue,  6 Jan 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708985; cv=none; b=PIExCupsysjvxT0XenhDI3RBE3LRhbglIfhATDwtf2Ejf45KUU3cVVNmoWSLmZjrGub9+wgAd+cAUU95nr6wYSEUJtcHGI8X7nxReS+FYCtrvpvRIjMyZ/6zBZEl6JXrg9x5y7QFEEgzoMENyiAda6eH+UDD8Js9zKiWG/eRxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708985; c=relaxed/simple;
	bh=sJbnzlDXUmueBEBx9F6TNMTOTGh+hai1Cs4wfvB9j64=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=R/65JUjmTrYqENiu/HbOSkJlzboeP+nzc/elwvz0jkRkee0iLicb1qUOyPq6DUWMylZR9u71KlUwLxRrVajBPQ1ZZz4BK44TkwtNMryxfXWU2kpn9vh7QVw8MuuSq27Wei22Dh8aZKS/JUtVDlPLdx7PnACF9SAqMiCKBfFKoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qfEzuMjc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:8c3f:64f1:feb8:928b])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 802A7129;
	Tue,  6 Jan 2026 15:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767708958;
	bh=sJbnzlDXUmueBEBx9F6TNMTOTGh+hai1Cs4wfvB9j64=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qfEzuMjc63BPyMMPFDYpThjKx0Qa0EU4vuZ+V6xIUxVpfMoJRym8sjHrbeeZkJhIe
	 CvzqWRTa7cdthsZ9K3DdblHJbnuBu8POBc/d5OtuQMwrSJT5fVDLQO3/koTFKKW87s
	 SFLYWBcGekRi16XHt16q3Nu1Lec3tRTFHQ4whqOw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260106003302.GJ10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com> <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com> <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca> <20260106003302.GJ10026@pendragon.ideasonboard.com>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne <nicolas@ndufresne.ca>
Date: Tue, 06 Jan 2026 15:16:17 +0100
Message-ID: <176770897731.12184.12302111059048415045@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Nicolas, hi Laurent,

Thank you for the review.

Quoting Laurent Pinchart (2026-01-06 01:33:02)
> On Mon, Jan 05, 2026 at 01:46:46PM -0500, Nicolas Dufresne wrote:
> > Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=
=C2=A0:
> > > The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> > > flexible dewarping using a freely configurable vertex map. Aside from
> > > lens dewarping the vertex map can be used to implement things like
> > > arbitrary zoom, pan and rotation. The current driver supports setting
> > > that vertex map before calling VIDIOC_STREAMON.
> > >=20
> > > To control above mentioned features during streaming it is necessary =
to
> > > update the vertex map dynamically. To do that in a race free manner V=
4L2
> > > requests support is required. This patch adds V4L2 requests support to
> > > prepare for dynamic vertex map updates.
> > >=20
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > >=20
> > > ---
> > >=20
> > > Changes in v1:
> > > - Moved v4l2_ctrl_request_complete into dw100_device_run
> > > ---
> > > =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 41 +++++++++++++++++=
+++++++++++----
> > > =C2=A01 file changed, 36 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media=
/platform/nxp/dw100/dw100.c
> > > index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..7f14b82c15a071605c124=
dbb868f8003856c4fc0 100644
> > > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > > @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *v=
q,
> > > =C2=A0   return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> > > +{
> > > +   struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > > +
> > > +   vbuf->field =3D V4L2_FIELD_NONE;
> > > +
> > > +   return 0;
> > > +}
>=20
> Stefan, how is this related to requests support ?

vb2_queue_or_prepare_buf() errors out if this is not implemented and the
buffer uses requests. This was the implementation I saw on most drivers.
And as I don't expect anyone to try to use the dewarper with interleaved
data I didn't bother to add a warning.

>=20
> > > +
> > > =C2=A0static int dw100_buf_prepare(struct vb2_buffer *vb)
> > > =C2=A0{
> > > =C2=A0   unsigned int i;
> > > @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *v=
b)
> > > =C2=A0   v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > =C2=A0}
> > > =C2=A0
> > > +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> > > +{
> > > +   struct dw100_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +
> > > +   v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
>=20
> Unless I'm missing something, this will call
> v4l2_ctrl_request_complete() twice, once on each of the source and
> destination buffers, for the same request and control handler. Is that
> desired ?

The docs say "a buffer that was never queued to the driver but is
associated with a queued request was canceled..." So to my understanding
the only purpose of this function is to mark all controls in the request
as being handled, so that the request can be finished.

All the implementations I found in the kernel are exactly the same and
are to my understanding only necessary to map from a vb2_buffer to a
v4l2_ctrl_handler (which is then passed to v4l2_ctrl_request_complete())

>=20
> > > +}
> > > +
> > > =C2=A0static void dw100_return_all_buffers(struct vb2_queue *q,
> > > =C2=A0                           =C2=A0=C2=A0=C2=A0=C2=A0 enum vb2_bu=
ffer_state state)
> > > =C2=A0{
> > > @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_que=
ue *q)
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static const struct vb2_ops dw100_qops =3D {
> > > -   .queue_setup     =3D dw100_queue_setup,
> > > -   .buf_prepare     =3D dw100_buf_prepare,
> > > -   .buf_queue       =3D dw100_buf_queue,
> > > -   .start_streaming =3D dw100_start_streaming,
> > > -   .stop_streaming=C2=A0 =3D dw100_stop_streaming,
> > > +   .queue_setup    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_queue_se=
tup,
> > > +   .buf_out_validate=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_out_valid=
ate,
> > > +   .buf_prepare    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_prep=
are,
> > > +   .buf_queue      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_queu=
e,
> > > +   .start_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_start_st=
reaming,
> > > +   .stop_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_sto=
p_streaming,
> > > +   .buf_request_complete =3D dw100_buf_request_complete,
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0static int dw100_m2m_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
> > > @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struc=
t vb2_queue *src_vq,
> > > =C2=A0   src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > =C2=A0   src_vq->lock =3D &ctx->vq_mutex;
> > > =C2=A0   src_vq->dev =3D ctx->dw_dev->v4l2_dev.dev;
> > > +   src_vq->supports_requests =3D true;
> > > =C2=A0
> > > =C2=A0   ret =3D vb2_queue_init(src_vq);
> > > =C2=A0   if (ret)
> > > @@ -1460,6 +1479,12 @@ static void dw100_device_run(void *priv)
> > > =C2=A0   src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > =C2=A0   dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > =C2=A0
> > > +   v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > +                           &ctx->hdl);
> > > +
> > > +   v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > +                           =C2=A0=C2=A0 &ctx->hdl);
> >=20
> > The request should always be signalled last, so nothing wrong with appl=
ying the
> > controls as soon as possible in this case. Complete is a bit of a miss-=
leading
> > name, this function actually changes the global controls value (apply) =
and
> > removes its participation in request completion. Since the OUTPUT buffe=
r for
> > that request is still queued, the request is not signalled yet.
>=20
> I'm very confused here. As far as I can tell,
> v4l2_ctrl_request_complete() doesn't apply controls (i.e. cause
> .s_ctrl() to be called), it copies the value of controls back to the
> request to report them to the application. Am I missing something ?
>=20
> As there's nothing to report back to the application (no volatile
> control whose value will come from the hardware), calling
> v4l2_ctrl_request_complete() here seems fine to me. Is that what you
> were trying to explain ?

I think that was meant, yes (see next comment)

>=20
> > But you have to flip over the order to buffer signalling in dw100_job_f=
inish()
> > though. My recommendation is to use the helper
> > v4l2_m2m_buf_done_and_job_finish(). Something like this (not tested):
> >=20
> >    diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/medi=
a/platform/nxp/dw100/dw100.c
> >    index 4aaf9c3fff53..c5f9ee238345 100644
> >    --- a/drivers/media/platform/nxp/dw100/dw100.c
> >    +++ b/drivers/media/platform/nxp/dw100/dw100.c
> >    @@ -1058,7 +1058,6 @@ static const struct v4l2_ioctl_ops dw100_ioctl=
_ops =3D {
> >     static void dw100_job_finish(struct dw100_device *dw_dev, bool with=
_error)
> >     {
> >            struct dw100_ctx *curr_ctx;
> >    -       struct vb2_v4l2_buffer *src_vb, *dst_vb;
> >            enum vb2_buffer_state buf_state;
> >    =20
> >            curr_ctx =3D v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
> >    @@ -1069,16 +1068,12 @@ static void dw100_job_finish(struct dw100_de=
vice *dw_dev, bool with_error)
> >                    return;
> >            }
> >    =20
> >    -       src_vb =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> >    -       dst_vb =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> >    -
> >            if (likely(!with_error))
> >                    buf_state =3D VB2_BUF_STATE_DONE;
> >            else
> >                    buf_state =3D VB2_BUF_STATE_ERROR;
> >    =20
> >    -       v4l2_m2m_buf_done(src_vb, buf_state);
> >    -       v4l2_m2m_buf_done(dst_vb, buf_state);
> >    +       v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, buf_state);
> >    =20
> >            dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s er=
ror(s)\n",
> >                    with_error ? "" : "out");
> >   =20
> > You might be tempted to keep the logical order, and move the
> > v4l2_ctrl_request_complete() call into dw100_job_finish(), unfortunatel=
y this
> > does not work, since nothing mandate that any control was included in t=
his
> > request, and that will lead to calling v4l2_ctrl_request_complete() on =
an
> > already completed request. Since its a single function HW, I don't see =
why you'd
> > want this, but it would require the manual request completion.
> >=20

Nicolas, if I go you right you mean that one might be tempted to do

v4l2_ctrl_request_setup()
v4l2_m2m_buf_done(src)
v4l2_m2m_buf_done(dst)
v4l2_ctrl_request_complete()

which feels natural from the names of the functions, but the
v4l2_m2m_buf_done(src) might complete the request if it has no
associated controls and therefore the later v4l2_ctrl_request_complete()
would fail...

I see that the usage of v4l2_m2m_buf_done_and_job_finish() is more
compact and will use that in v2. For the sake of understanding: The only
functional issue with my code is that v4l2_m2m_buf_done(src_buf) is
called before v4l2_m2m_buf_done(dest_buf), right?

> > > +
> > > =C2=A0   dw100_start(ctx, src_buf, dst_buf);
> >=20
> > nit: I really don't see why this is a separate function ...

I wondered that also, but didn't want to mess too much with existing
code. Maybe as a fixup on top?

Best regards,
Stefan

> >=20
> > > =C2=A0}
> > > =C2=A0
> > > @@ -1467,6 +1492,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops=
 =3D {
> > > =C2=A0   .device_run     =3D dw100_device_run,
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct media_device_ops dw100_m2m_media_ops =3D {
> > > +   .req_validate =3D vb2_request_validate,
> > > +   .req_queue =3D v4l2_m2m_request_queue,
> > > +};
> > > +
> > > =C2=A0static struct video_device *dw100_init_video_device(struct dw10=
0_device *dw_dev)
> > > =C2=A0{
> > > =C2=A0   struct video_device *vfd =3D &dw_dev->vfd;
> > > @@ -1578,6 +1608,7 @@ static int dw100_probe(struct platform_device *=
pdev)
> > > =C2=A0   dw_dev->mdev.dev =3D &pdev->dev;
> > > =C2=A0   strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.mod=
el));
> > > =C2=A0   media_device_init(&dw_dev->mdev);
> > > +   dw_dev->mdev.ops =3D &dw100_m2m_media_ops;
> > > =C2=A0   dw_dev->v4l2_dev.mdev =3D &dw_dev->mdev;
> > > =C2=A0
> > > =C2=A0   ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart


Return-Path: <linux-media+bounces-42604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCAB58FA6
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9213B16DB
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 07:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41572641FB;
	Tue, 16 Sep 2025 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a8A885MH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC914658D;
	Tue, 16 Sep 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008965; cv=none; b=KK2OEtHILgOw6oOC7/FLeAzuAqoxH5XskUeImk++qnE0AktgR6As2lUhFtTvRLjgxvKAr6UcbOaJNBGs1zM6Wye3wREjegSkHxDLOKQOsUF4daIxjqX2jSCXxcpE+GlnlfROSW69+M8emQkPOfEZ+DIYfKK90+cg96ZO4P6o9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008965; c=relaxed/simple;
	bh=0K2ndIPUcsxZYFawVHte97ZxYQVyku5PVXGa06xvoiE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YIdjggy86iaZFkLSQ2BdQmUzYqDGHUxnua/rt1kC/EXUpooc7nLMXFUo1lyZhccDX5p4aVdOYdlo+E109PXlAvSq5FxyTe7IarHjFzFa/n2/p/UhHI+FjxlkXKdk5wAHq2bw1iWPpZhPlcUL7ZQzw7QdiXhKlR9BfUaHAeZ5GmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a8A885MH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:fcf9:6932:9f30:ab03])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA1A2EC1;
	Tue, 16 Sep 2025 09:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758008876;
	bh=0K2ndIPUcsxZYFawVHte97ZxYQVyku5PVXGa06xvoiE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=a8A885MHl+p6S2+cVzoXH8JS+qsIpjE37+wwQdEtWw9MgrsfoU6JWWfhKvQ07DL7W
	 iL+kAeb5HNTK8WQPJXTFRWJD8mQ+mZb6Ig/sCvHWSXb2NLhik22bpbpTFDHbxr0FZY
	 /pjr39ew63H4+AmvyuvMSSYl96v1VbR01k4xxyXs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <rthpkuipbpbp2lv2ddmruwb7fmpkmtlsnx3q6kk7gaskzpdaar@5bk3r44f2mpo>
References: <20250908094200.48002-1-stefan.klug@ideasonboard.com> <rthpkuipbpbp2lv2ddmruwb7fmpkmtlsnx3q6kk7gaskzpdaar@5bk3r44f2mpo>
Subject: Re: [PATCH] media: rkisp1: Improve frame sequence correctness on stats and params buffers
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 16 Sep 2025 09:49:12 +0200
Message-ID: <175800895207.653594.14948138348210533073@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Jacopo,

Thank you for the review.

Quoting Jacopo Mondi (2025-09-15 18:55:44)
> Hi Stefan
>=20
> On Mon, Sep 08, 2025 at 11:41:48AM +0200, Stefan Klug wrote:
> > On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> > handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> > and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> > commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> > debugfs var for irq delay") a warning was added for that. There are two
> > cases where this condition can occur:
> >
> > 1. The v-sync and the frame-end belong to the same frame. This means,
> >    the irq was heavily delayed and the warning is likely appropriate.
> >
> > 2. The v-sync belongs to the next frame. This can happen if the vertical
> >    blanking between two frames is very short.
> >
> > The current code always handles case 1 although case 2 is in my
> > experience the more common case and happens in regular usage. This leads
>=20
> I would rather argue that 8524fa22fd2f is possibily wrong, and case 1)
> would imply the interrupt has been delayed for the whole frame
> duration (+ blanking), which seems unlikely to me ?

I am not completely sure about that. I didn't hunt for that condition.
Note that RKISP1_CIF_ISP_FRAME comes before the blanking. So I could
imagine that this might occur for very small sensor crop rectangles at
high datarates.

>=20
> True we handle stats collection and parameters programming in irq
> context, which is less than ideal and could take time (I wonder if we
> should use a threaded irq, but that's a different problem)
>=20
> If that's the case and we only should care about 2) would simply
> handling RKISP1_CIF_ISP_FRAME before RKISP1_CIF_ISP_V_START be enough ?

That was my first try. But it felt not right to run a whole
rkisp1_isp_isr() with frame_sequence being set to -1. And as I believe
that there is at least a slight chance that 1) might occur, I'd prefer
frame_sequence to be 0 in that case.

>=20
> > to incorrect sequence numbers on stats and params buffers which in turn
> > breaks the regulation in user space. Fix that by adding a frame_active
> > flag to distinguish between these cases and handle the start of frame
> > either at the beginning or at the end of the rkisp1_isp_isr().
> >
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c | 17 +++++++++++++----
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829b..adf23416de9a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -222,6 +222,7 @@ struct rkisp1_isp {
> >       struct media_pad pads[RKISP1_ISP_PAD_MAX];
> >       const struct rkisp1_mbus_info *sink_fmt;
> >       __u32 frame_sequence;
> > +     bool frame_active;
> >  };
> >
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 8c29a1c9309a..1469075b2d45 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *=
sd, int enable)
> >       }
> >
> >       isp->frame_sequence =3D -1;
> > +     isp->frame_active =3D false;
> >
> >       sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> >
> > @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device=
 *rkisp1)
> >   * Interrupt handlers
> >   */
> >
> > -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> > +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
> >  {
> >       struct v4l2_event event =3D {
> >               .type =3D V4L2_EVENT_FRAME_SYNC,
> >       };
> >
> > +     isp->frame_sequence++;
> > +     isp->frame_active =3D true;
> > +
> >       event.u.frame_sync.frame_sequence =3D isp->frame_sequence;
> >       v4l2_event_queue(isp->sd.devnode, &event);
> >  }
> > @@ -1112,14 +1116,15 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >       rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> >
> >       /* Vertical sync signal, starting generating new frame */
> > -     if (status & RKISP1_CIF_ISP_V_START) {
> > -             rkisp1->isp.frame_sequence++;
> > -             rkisp1_isp_queue_event_sof(&rkisp1->isp);
> > +     if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
> > +             status &=3D ~RKISP1_CIF_ISP_V_START;
> > +             rkisp1_isp_sof(&rkisp1->isp);
> >               if (status & RKISP1_CIF_ISP_FRAME) {
> >                       WARN_ONCE(1, "irq delay is too long, buffers migh=
t not be in sync\n");
> >                       rkisp1->debug.irq_delay++;
> >               }
> >       }
> > +
> >       if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
> >               /* Clear pic_size_error */
> >               isp_err =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> > @@ -1138,6 +1143,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >       if (status & RKISP1_CIF_ISP_FRAME) {
> >               u32 isp_ris;
> >
> > +             rkisp1->isp.frame_active =3D false;
> >               rkisp1->debug.complete_frames++;
> >
> >               /* New frame from the sensor received */
> > @@ -1152,5 +1158,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >               rkisp1_params_isr(rkisp1);
> >       }
> >
> > +     if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)
>=20
> I think you can drop the  && !rkisp1->isp.frame_active because if you
> get here and 'status & RKISP1_CIF_ISP_V_START' it means that:
>=20
> 1) frame_active was false and you have entered the above
>=20
>         if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
>=20
>    and now the RKISP1_CIF_ISP_V_START bit in 'status' has been cleared
>    so you don't need to handle VSYNC here
>=20
> 2) frame_active was true and you delayed handling V_START till here.
>    If also ISP_FRAME was set, frame_start has been set to false here
>    above. If ISP_FRAME was not set then it has been delivered by a
>    previous interrupt and then frame_start is false.
>=20
> So I guess it's enough to check if at this point RKISP1_CIF_ISP_V_START
> is still set in 'status' ?

I think you are right. I can't come up with a sane condition where
frame_active=3D=3Dtrue and RKISP1_CIF_ISP_V_START is set and we *don't* want
to increase the frame count. I'll drop that condition.

>=20
> However, as said, it's seems unlikely to that your above 1) can
> happen. Have you ever hit a WARN() again with this patch applied ?

I don't remember seeing it again. But as noted above, I didn't try to
provoke it and took the "better safe than sorry" route. Could you go
with that?

Best regards,
Stefan

>=20
> > +             rkisp1_isp_sof(&rkisp1->isp);
> > +
> >       return IRQ_HANDLED;
> >  }
> > --
> > 2.48.1
> >
> >


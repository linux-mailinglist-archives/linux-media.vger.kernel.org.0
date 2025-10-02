Return-Path: <linux-media+bounces-43597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D7BB3836
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 11:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C0CD7A4F69
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 09:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE273054C7;
	Thu,  2 Oct 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U4bzYZ9Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D62F49E5;
	Thu,  2 Oct 2025 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398556; cv=none; b=S1YIsqyZ9dKi6UTuA5sVNvAuO0iYqSiSsQl4Ke+oK1Ce4110w3i9yEha16g1DeZJKUAVezQ+tSw8RzGPuofDGqVrTGN1pCAInxgKNlIvNz6L/ilhryM/o03wSXt7ghvlhW5hTuqwsiVv7ThZ13ddeYo6Q8ShtOQ/NUTQ/8UNbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398556; c=relaxed/simple;
	bh=urh5kp0x/YFcknpUceSmZyOaEH/EFuWGuuYrA2S4jRE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kfJvAJiD6FMKpZzuv633JZ7g7lMw2AfeOTTN1rhvRdh9vwQkCGt960g5q3l1vNmY6MgY1J8GhBbebXJxRFf1K/4T+hhxbJppsWeNvmB+czd+n8mo9BkOoC3FPfmRmfBLkK25S2Qj8/FA2vIW+UfGKelvHs3BYeE7d2hbc1EbeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U4bzYZ9Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44743E01;
	Thu,  2 Oct 2025 11:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759398462;
	bh=urh5kp0x/YFcknpUceSmZyOaEH/EFuWGuuYrA2S4jRE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U4bzYZ9Z3SbXpQSvLGCYyVZC/pVpZ3RO8MFcDVbRiyo9kDclCPY3lCsdv92tvnpsJ
	 TVXYOQSh5WV8uUE942jQYK+RlYUw8gYOExfpKiMhZ+2Cd56vmEJV6ybrwI8IKx1xVN
	 jmYZROsgFWgZY7K9gSfhX3Zis5oKNhbgcPAndBao=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918223655.GA10985@pendragon.ideasonboard.com>
References: <20250918145504.111428-2-stefan.klug@ideasonboard.com> <175820896821.1246375.16035780810428204673@ping.linuxembedded.co.uk> <20250918223655.GA10985@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2] media: rkisp1: Improve frame sequence correctness on stats and params buffers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 02 Oct 2025 10:49:08 +0100
Message-ID: <175939854884.1246375.7790101626684068201@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2025-09-18 23:36:55)
> On Thu, Sep 18, 2025 at 04:22:48PM +0100, Kieran Bingham wrote:
> > Quoting Stefan Klug (2025-09-18 15:54:33)
> > > On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> > > handler is sometimes called with RKISP1_CIF_ISP_V_START (start of fra=
me)
> > > and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> > > commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> > > debugfs var for irq delay") a warning was added for that. There are t=
wo
> > > cases where this condition can occur:
> > >=20
> > > 1. The v-sync and the frame-end belong to the same frame. This means,
> > >    the irq was heavily delayed and the warning is likely appropriate.
> > >=20
> > > 2. The v-sync belongs to the next frame. This can happen if the verti=
cal
> > >    blanking between two frames is very short.
> > >=20
> > > The current code always handles case 1 although case 2 is in my
> > > experience the more common case and happens in regular usage. This le=
ads
> > > to incorrect sequence numbers on stats and params buffers which in tu=
rn
> > > breaks the regulation in user space. Fix that by adding a frame_active
> > > flag to distinguish between these cases and handle the start of frame
> > > either at the beginning or at the end of the rkisp1_isp_isr().
> > >=20
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > >=20
> > > ---
> > >=20
> > > Hi all,
> > >=20
> > > Here is an updated version of the patch with some fixes from the revi=
ew.
> > >=20
> > > Changes in v2:
> > > - Removed test for !frame_active in second v_start handler
> > > - Improved comments
> > >=20
> > > Best regards,
> > > Stefan
> > >=20
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
> > >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++--=
--
> > >  2 files changed, 23 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b=
/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index ca952fd0829b..adf23416de9a 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -222,6 +222,7 @@ struct rkisp1_isp {
> > >         struct media_pad pads[RKISP1_ISP_PAD_MAX];
> > >         const struct rkisp1_mbus_info *sink_fmt;
> > >         __u32 frame_sequence;
> > > +       bool frame_active;
> > >  };
> > > =20
> > >  /*
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > index 8c29a1c9309a..2e49764d6262 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev=
 *sd, int enable)
> > >         }
> > > =20
> > >         isp->frame_sequence =3D -1;
> > > +       isp->frame_active =3D false;
> > > =20
> > >         sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > > =20
> > > @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_devi=
ce *rkisp1)
> > >   * Interrupt handlers
> > >   */
> > > =20
> > > -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> > > +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
> > >  {
> > >         struct v4l2_event event =3D {
> > >                 .type =3D V4L2_EVENT_FRAME_SYNC,
> > >         };
> > > =20
> > > +       isp->frame_sequence++;
> > > +       isp->frame_active =3D true;
> > > +
> > >         event.u.frame_sync.frame_sequence =3D isp->frame_sequence;
> > >         v4l2_event_queue(isp->sd.devnode, &event);
> > >  }
> > > @@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> > > =20
> > >         rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> > > =20
> > > -       /* Vertical sync signal, starting generating new frame */
> > > -       if (status & RKISP1_CIF_ISP_V_START) {
> > > -               rkisp1->isp.frame_sequence++;
> > > -               rkisp1_isp_queue_event_sof(&rkisp1->isp);
> > > +       /*
> > > +        * Vertical sync signal, starting new frame. Defer handling o=
f vsync
> > > +        * after RKISP1_CIF_ISP_FRAME if the previous frame was not c=
ompleted
> > > +        * yet.
> > > +        */
> > > +       if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_act=
ive) {
> > > +               status &=3D ~RKISP1_CIF_ISP_V_START;
> > > +               rkisp1_isp_sof(&rkisp1->isp);
> > >                 if (status & RKISP1_CIF_ISP_FRAME) {
> > >                         WARN_ONCE(1, "irq delay is too long, buffers =
might not be in sync\n");
> >=20
> > Now I've read below - I see how in here we've had both a frame start and
> > a frame end without processing an IRQ at all.
> >=20
> > I'm trying to figure out if the ISR should always just process frame end
> > events before frame starts ... but then i think we wouldn't catch this
> > case so I suspect this is fine keeping it how things are now.
> >=20
> >=20
> > >                         rkisp1->debug.irq_delay++;
> > >                 }
> > >         }
> > > +
> > >         if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
> > >                 /* Clear pic_size_error */
> > >                 isp_err =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> > > @@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> > >         if (status & RKISP1_CIF_ISP_FRAME) {
> > >                 u32 isp_ris;
> > > =20
> > > +               rkisp1->isp.frame_active =3D false;
> > >                 rkisp1->debug.complete_frames++;
> > > =20
> > >                 /* New frame from the sensor received */
> > > @@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> > >                 rkisp1_params_isr(rkisp1);
> > >         }
> > > =20
> > > +       /*
> > > +        * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
> > > +        * RKISP1_CIF_ISP_FRAME occurrend in the same irq.
> >=20
> > s/occurend/occured/
> >=20
> > > +        */
> > > +       if (status & RKISP1_CIF_ISP_V_START)
> > > +               rkisp1_isp_sof(&rkisp1->isp);
> >=20
> > Aha I see - so this makes sure we /complete/ the frame before we start
> > another one.
> >=20
> > That definitely sounds like a very good thing.
>=20
> Yes, this seems to be a good improvement.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> There may still be room for improvement, we could measure the time
> between IRQs to estimate the number of lost interrupts. That won't be
> easy to develop, and may be best handled in userspace. If we investigate
> that, it should probably be implemented with generic helpers.
>=20
> > I'd be curuious to add a counter for how often we process a frame start
> > and frame end in the same ISR too. That likely still means we've got
> > some undesirable delays?
>=20
> There's a counter already, and it's already exported through debugfs :-)

Ok - so I have nothing to stop me also saying this then ;-)

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> > > +
> > >         return IRQ_HANDLED;
> > >  }
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart


Return-Path: <linux-media+bounces-43697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FCBB581D
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 23:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BD783A6A19
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 21:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEC6283C9C;
	Thu,  2 Oct 2025 21:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qCGBi/4N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489547081C;
	Thu,  2 Oct 2025 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441467; cv=none; b=iU0w5F1QxxBJ4hCMMK3vl+nWCDvF+4BoBGvEs1X+7K0cZw+2Z64D1M6x2JOvHiWU1l8ZiWdpFyp7op8oA3EoeAOEABBTYsB2bD4byJ6Pv1xkyHDO3jmREK7UM3boxgEZ6KhLfgReYCreUM9FM760SgaZ8mktrQobFDyM3nsXzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441467; c=relaxed/simple;
	bh=vdCdPdFwsJMMeXs4fFvCyFSm56dK+WwqeX0uDW72egY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pogLz8F+xZiiQgPjBn11P0zIaczc+ym7muokVriks5HFEKNhMdVSdrT0rL6zkEm1dVimB2RU6iXE/i9uD1KZamYwu4w8Cen+Cllq8Xdk549YZyeo1whVjj0CY2Hv22sRugrlWjVT5bPS60k3SoGT3vxEvtlRGOMxdT+CNlbnUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qCGBi/4N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACBCF06;
	Thu,  2 Oct 2025 23:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759441372;
	bh=vdCdPdFwsJMMeXs4fFvCyFSm56dK+WwqeX0uDW72egY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qCGBi/4NLGhL50yZ8HswAtm5fhy64XVceEcH4gsVFTSHUKvmADZfZ3Dve0fwSCUhq
	 hoWMRD0zCeOlw+Fhl9lg6CoeM0QW/cMGYDCIXJtsNrCxb0srjXwz+9lU0H1Oxn8CZa
	 EOHKzcHZJdLieWgc/DjpTLGf0/usnithmHeTiuL0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250922182003.3712101-2-stefan.klug@ideasonboard.com>
References: <20250922182003.3712101-2-stefan.klug@ideasonboard.com>
Subject: Re: [PATCH v3] media: rkisp1: Improve frame sequence correctness on stats and params buffers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, linux-media@vger.kernel.org
Date: Thu, 02 Oct 2025 22:44:19 +0100
Message-ID: <175944145933.3917877.5417697383444150190@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Stefan Klug (2025-09-22 19:19:57)
> On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> debugfs var for irq delay") a warning was added for that. There are two
> cases where this condition can occur:
>=20
> 1. The v-sync and the frame-end belong to the same frame. This means,
>    the irq was heavily delayed and the warning is likely appropriate.
>=20
> 2. The v-sync belongs to the next frame. This can happen if the vertical
>    blanking between two frames is very short.
>=20
> The current code always handles case 1 although case 2 is in my
> experience the more common case and happens in regular usage. This leads
> to incorrect sequence numbers on stats and params buffers which in turn
> breaks the regulation in user space. Fix that by adding a frame_active
> flag to distinguish between these cases and handle the start of frame
> either at the beginning or at the end of the rkisp1_isp_isr().
>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Ooops I replied to a previous version. Isn't email review fun.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> ---
>=20
> Hi all,
>=20
> Here is an updated version of the patch with a fix for a typo that was
> spotted in the last review.
>=20
> Changes in v3:
> - Fixed typo in comment
> - Collected r-by tag
>=20
> Changes in v2:
> - Removed test for !frame_active in second v_start handler
> - Improved comments
>=20
> Best regards,
> Stefan
>=20
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..adf23416de9a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -222,6 +222,7 @@ struct rkisp1_isp {
>         struct media_pad pads[RKISP1_ISP_PAD_MAX];
>         const struct rkisp1_mbus_info *sink_fmt;
>         __u32 frame_sequence;
> +       bool frame_active;
>  };
> =20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 8c29a1c9309a..660c1fd7efcc 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd=
, int enable)
>         }
> =20
>         isp->frame_sequence =3D -1;
> +       isp->frame_active =3D false;
> =20
>         sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> =20
> @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *=
rkisp1)
>   * Interrupt handlers
>   */
> =20
> -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
>  {
>         struct v4l2_event event =3D {
>                 .type =3D V4L2_EVENT_FRAME_SYNC,
>         };
> =20
> +       isp->frame_sequence++;
> +       isp->frame_active =3D true;
> +
>         event.u.frame_sync.frame_sequence =3D isp->frame_sequence;
>         v4l2_event_queue(isp->sd.devnode, &event);
>  }
> @@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> =20
>         rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> =20
> -       /* Vertical sync signal, starting generating new frame */
> -       if (status & RKISP1_CIF_ISP_V_START) {
> -               rkisp1->isp.frame_sequence++;
> -               rkisp1_isp_queue_event_sof(&rkisp1->isp);
> +       /*
> +        * Vertical sync signal, starting new frame. Defer handling of vs=
ync
> +        * after RKISP1_CIF_ISP_FRAME if the previous frame was not compl=
eted
> +        * yet.
> +        */
> +       if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
> +               status &=3D ~RKISP1_CIF_ISP_V_START;
> +               rkisp1_isp_sof(&rkisp1->isp);
>                 if (status & RKISP1_CIF_ISP_FRAME) {
>                         WARN_ONCE(1, "irq delay is too long, buffers migh=
t not be in sync\n");
>                         rkisp1->debug.irq_delay++;
>                 }
>         }
> +
>         if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
>                 /* Clear pic_size_error */
>                 isp_err =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> @@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>         if (status & RKISP1_CIF_ISP_FRAME) {
>                 u32 isp_ris;
> =20
> +               rkisp1->isp.frame_active =3D false;
>                 rkisp1->debug.complete_frames++;
> =20
>                 /* New frame from the sensor received */
> @@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>                 rkisp1_params_isr(rkisp1);
>         }
> =20
> +       /*
> +        * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
> +        * RKISP1_CIF_ISP_FRAME occurred in the same irq.
> +        */
> +       if (status & RKISP1_CIF_ISP_V_START)
> +               rkisp1_isp_sof(&rkisp1->isp);
> +
>         return IRQ_HANDLED;
>  }
> --=20
> 2.48.1
>


Return-Path: <linux-media+bounces-49897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47CCF346C
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7512C3042FF0
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DC7330D2F;
	Mon,  5 Jan 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EzzMb8HO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2432B99C;
	Mon,  5 Jan 2026 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612582; cv=none; b=jWJciMILvn363pEXyTSyXUxjIb5vfJP/3Olivbp3jpQJ7Y1NDuq4vCvk2wruTaQi3HdcVROXvUuv2j8O4w7Zbxq+F2Rhl8n/37qpny+vMep9RSlI0YLnosQ0wFa2/G4PovfluaMM0q3kmZiOf3GrVHvOrWGPne5MrYgjW36vKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612582; c=relaxed/simple;
	bh=iISwdZtvnnraV/VMYYVj79jvGkuZPTBqF1C6SfCyOhY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZE1X8SvyziuAxJDUyXfGFxI4Ic+bRLOLNK2IKwGU0BT7Kv1VT0o3DmjJVsd1oWeUPn0rwzI2+hcchZdOwhRWEuWmJJ31R+FvnOibizrrmezxcqrb4OBWZynjIzEfUxGiJpNbDaoqYQv2LwLVfuvRKwh5bAiepAz6YprQLTwIP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EzzMb8HO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15C42664;
	Mon,  5 Jan 2026 12:29:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612550;
	bh=iISwdZtvnnraV/VMYYVj79jvGkuZPTBqF1C6SfCyOhY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EzzMb8HOeneWwzjW6sYtITaQ8Sg50f2HmArAmxA9vGADkwgV6rGLYbY4Aps7IK0Ys
	 qdJMpeVTgDso/wLf6WaCRV6v3Uylym63LK83uGB9IhtwGTE6E+6Vvc5YbsbEn0WI1L
	 L90b+d9rvoArIvwQYmg3m+NbAijw4cYgT/Na4k7k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176465775606.135635.13034018447792643478@localhost>
References: <20251202015025.601549-1-rui.wang@ideasonboard.com> <20251202015025.601549-2-rui.wang@ideasonboard.com> <176465775606.135635.13034018447792643478@localhost>
Subject: Re: [PATCH v1 1/1] media: rkisp1: Fix filter mode register configuration
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, Rui Wang <rui.wang@ideasonboard.com>
To: Rui Wang <rui.wang@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>, dafna@fastmail.com, heiko@sntech.de, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, mchehab@kernel.org
Date: Mon, 05 Jan 2026 11:29:27 +0000
Message-ID: <176761256763.3192372.8001486757502337420@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Stefan Klug (2025-12-02 06:42:36)
> Hi Rui,
>=20
> Thank you for the patch.
>=20
> Quoting Rui Wang (2025-12-02 02:50:25)
> > The rkisp1_flt_config() function performs an initial direct write to
> > RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
> > bit, which clears the filter enable bit in the hardware.
>=20
> That sentence is a bit hard for me to understand. Maybe:
>=20
> "The rkisp1_flt_config() function overwrites RKISP1_CIF_ISP_FILT_MODE
> without preserving the RKISP1_CIF_ISP_FLT_ENA bit thereby unconditionally
> disabling the hardware block on reconfiguration.


Stefan's proposal sounds good here.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> But as I'm no native speaker you could maybe wait for feedback from a
> native speaker.
>=20
> Functionality wise the change is correct.
>=20
> Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> Best regards,
> Stefan
>=20
> >=20
> > The subsequent read/modify/write sequence then reads back the register
> > with the enable bit already cleared and cannot restore it, resulting in
> > the filter being inadvertently disabled.
> >=20
> > Remove the redundant direct write. The read/modify/write sequence alone
> > correctly preserves the existing enable bit state while updating the
> > DNR mode and filter configuration bits.
> >=20
> > Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index c9f88635224c..6442436a5e42 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params=
 *params,
> >         rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
> >                      arg->lum_weight);
> > =20
> > -       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
> > -                    (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
> > -                    RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
> > -                    RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
> > -                    RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
> > -
> >         /* avoid to override the old enable value */
> >         filt_mode =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_M=
ODE);
> >         filt_mode &=3D RKISP1_CIF_ISP_FLT_ENA;
> > --=20
> > 2.43.0
> >


Return-Path: <linux-media+bounces-48011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE89C9A5AF
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 07:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A6544E2C72
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 06:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997CC301473;
	Tue,  2 Dec 2025 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JBGWJfUv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7721D3CC;
	Tue,  2 Dec 2025 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657765; cv=none; b=L/XP6G/1RkpPC4XNZSR1rbPWb0RllRRBLgdREzu18n3ZAJtnYJx1jcNsWtu3Dq4+K7C5QUq3cjC0bUEC9CeiTNvGefVcTbM7hrYFqCpnUAxhuRpJTexlC8jJKEeQfGuvWkYKqwJaICn3QGhG64xi8q759ef2+W2BZA/vVCEJKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657765; c=relaxed/simple;
	bh=jLcjBx9AvHp2WbwJbosGQXZob7xTDXEgsrM1sIqbe6Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hyJBwttqHgUMj+o6F12fc3qOCGTALpsVqBrZxEiPOzY2H49b0UA/D9KOYX/ewSPyXZCjPw+B0HyFJWvVPHqMwqW1L5bQ3Tzdxf49hnbxMQ/04V6rZL4BFYQJIqF2WbvdoLZkKRG0c4vIeVRwihPwS8zaWwCLcDfTjsc+zvzmvME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JBGWJfUv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E59B8E77;
	Tue,  2 Dec 2025 07:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764657627;
	bh=jLcjBx9AvHp2WbwJbosGQXZob7xTDXEgsrM1sIqbe6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JBGWJfUvVCROXrhaNG0Ge1lXR/8RfqrkeQfq+4/j/eNmtZasxK6M0KIXziO7OvSPG
	 1b+yTFzMVRLmnz9p9ra4goqaKz64kpNupGtcYpBoyQ2JZqnc3tHLyIBwxMvCKdnFin
	 3VG5qFWTG21c40xQ1xCKbypJkivffaqurCfcI5ko=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251202015025.601549-2-rui.wang@ideasonboard.com>
References: <20251202015025.601549-1-rui.wang@ideasonboard.com> <20251202015025.601549-2-rui.wang@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] media: rkisp1: Fix filter mode register configuration
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, Rui Wang <rui.wang@ideasonboard.com>
To: Rui Wang <rui.wang@ideasonboard.com>, dafna@fastmail.com, heiko@sntech.de, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, mchehab@kernel.org
Date: Tue, 02 Dec 2025 07:42:36 +0100
Message-ID: <176465775606.135635.13034018447792643478@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Rui,

Thank you for the patch.

Quoting Rui Wang (2025-12-02 02:50:25)
> The rkisp1_flt_config() function performs an initial direct write to
> RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
> bit, which clears the filter enable bit in the hardware.

That sentence is a bit hard for me to understand. Maybe:

"The rkisp1_flt_config() function overwrites RKISP1_CIF_ISP_FILT_MODE
without preserving the RKISP1_CIF_ISP_FLT_ENA bit thereby unconditionally
disabling the hardware block on reconfiguration.

But as I'm no native speaker you could maybe wait for feedback from a
native speaker.

Functionality wise the change is correct.

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>

Best regards,
Stefan

>=20
> The subsequent read/modify/write sequence then reads back the register
> with the enable bit already cleared and cannot restore it, resulting in
> the filter being inadvertently disabled.
>=20
> Remove the redundant direct write. The read/modify/write sequence alone
> correctly preserves the existing enable bit state while updating the
> DNR mode and filter configuration bits.
>=20
> Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c9f88635224c..6442436a5e42 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params *=
params,
>         rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
>                      arg->lum_weight);
> =20
> -       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
> -                    (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
> -                    RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
> -                    RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
> -                    RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
> -
>         /* avoid to override the old enable value */
>         filt_mode =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MOD=
E);
>         filt_mode &=3D RKISP1_CIF_ISP_FLT_ENA;
> --=20
> 2.43.0
>


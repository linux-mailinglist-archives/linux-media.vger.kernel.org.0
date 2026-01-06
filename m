Return-Path: <linux-media+bounces-50027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574ECF854B
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 13:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF5AB3043131
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7283254BD;
	Tue,  6 Jan 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WbfyO5LV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFD2F60A7;
	Tue,  6 Jan 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702311; cv=none; b=ILCEIT5NcdwNhUnt0I2PbyLkn3jCT03zPpFtv189QDZnEj9eOoykfvXci6h6/qMH+CD0HTuMjmrAXbT7mNEbkCx9M5oD+giE7Dvqzmd0xD9EgM0PtvoZSaW4lZkxMKIbftSvSttnKUND2F+XITGLwEcqncy6DXps8yNYTJ5XuAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702311; c=relaxed/simple;
	bh=wBRsYLtKcDyFYvStHEhKrcma21Zlzgl0W/z54XToUP0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QGJFUTOVRIdq2pYL+CwH/V2PehUvIPlIX3xNJmyF9aUIwTitsauoM+D1HKu2Zs8mezaG0y4QatTw18OrWcQPoj+/Oe1GGuOZA4omHX7NfHIgTa4tOJ+d3E4vQF3Kxt0VQ2x4rmCPMNvHB4gbOPcoDyfcSWR7Oh7E6TJI9QLkN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WbfyO5LV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66F71581;
	Tue,  6 Jan 2026 13:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767702285;
	bh=wBRsYLtKcDyFYvStHEhKrcma21Zlzgl0W/z54XToUP0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WbfyO5LVDaAUBZF/4QiTewmuodA+E4eD2oQH4IbmJioV3EDqPF9Yi7Nduu6InKEdk
	 LBPer/1I9X4igMs25RQEmXYuKGHfmiAwRHYYYY7ds8mZ2P0t0LJq05k3omLm2Kz54v
	 xH9PTpmM3USsjyeLOKT9wlN/nkRb/PJozmNFED6s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260105171142.147792-2-rui.wang@ideasonboard.com>
References: <20260105171142.147792-1-rui.wang@ideasonboard.com> <20260105171142.147792-2-rui.wang@ideasonboard.com>
Subject: Re: [PATCH v4 1/1] media: rkisp1: Fix filter mode register configuration
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, Rui Wang <rui.wang@ideasonboard.com>
To: Rui Wang <rui.wang@ideasonboard.com>, dafna@fastmail.com, heiko@sntech.de, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, mchehab@kernel.org
Date: Tue, 06 Jan 2026 12:25:03 +0000
Message-ID: <176770230345.3486172.1119327800680289066@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Rui Wang (2026-01-05 17:11:42)
> The rkisp1_flt_config() function performs an initial direct write to
> RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
> bit, which clears the filter enable bit in the hardware.
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
> =20
> Changelog since v1:
>  1. Update version number from v1 to v4 to clarify the confusing
>=20
> Reviewed-by Stefan Klug and Kieran Bingham
>  from v1 are carried over (no function code changes).

To carry them over you need to include the tags.

From the previous version:

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
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


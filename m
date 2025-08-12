Return-Path: <linux-media+bounces-39626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89727B239C6
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 22:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 580AC7B849D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 20:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4107E2F0678;
	Tue, 12 Aug 2025 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="h/wkpEmz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60612F0667;
	Tue, 12 Aug 2025 20:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029434; cv=pass; b=AY7RNcM46QU1dcYbmTidXXtbQPfXa5xnvZJ0fZdacuU5lc+d2zzBJiZ/LxMdIBIFurFNNCpW+FaIWo2wFEGXJh+xA6MFEly6BWIW6w++TuxCPr/Q0f1RmghXR4XaWaPy/oXFYWHMWu6QddI8FWK1ccpOl+mt4LBwkSYHJkNcX6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029434; c=relaxed/simple;
	bh=OBJN8hEzkJUuPyydB2OtILSl6ilZGKeXmC8ai0/BsyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OS7wfuuOyD9A2QzJgnpfLSheEFQi1uNEBI7HLTKsqXiijXJTm/dHrrWQs1lXaQ8Uo94v0JB9zCVHwsiNVjiXeX//sWmdjaPDBjix+jQYZpe7ol1RgLrP81M0W3qRA69RK7tdjPoYAoSVdXGVcSGXjx4ZseGKR01lz/aARyqnv7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=h/wkpEmz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755029415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MyhnnS/y2ph5BqU/m2pJCp5zVK2dPRtUTHVf/RDIXVhEaqU07l94Hds6NKVgEBcrzlS2ITy/EH3JSc7tEz4WyNfVxUaFRb8nMpbUoXfmYQuxGOXUg8OgaWYVlrOxa4stYNpuKkpZjpjlL7aBZQKmChAp3EcUBfAH9DwUqVF6tHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755029415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vKMv3EjzyP5e1tIqE6+kbHOhv7w3DBH++PQKZ6L3hMo=; 
	b=BNis0RKCcDx6Kec0YV/WJ1VowIXmaJ1JFaZnYKQr/CNn+ATgOvLoIC75ixZXlR4Rev4ZNArQaaAjRkg5zgUi7zVScHveIxmkHgjZelDXaOyFSSE8EuGgXYMhq/nEtRxwfiEamK6i7O1AjQTOh8Enw/dEwSKt15lqXu959MkudNs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755029415;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vKMv3EjzyP5e1tIqE6+kbHOhv7w3DBH++PQKZ6L3hMo=;
	b=h/wkpEmzpQIxvba+VNZ/Ff9F/YD4ozHH0sTNiwxMyrAiPuG8fitB7zpbUzNPjbGa
	aBYnsdYAWs7g3ixsD1aWxyD6gfU2M8NlJfMcrlANEGOPH/MG+GWvzniAR61YovFegH2
	RhAV7ItqQbk83DkbKi1sOdqz25kkX/gc473lOGN0=
Received: by mx.zohomail.com with SMTPS id 1755029413898374.0260479942565;
	Tue, 12 Aug 2025 13:10:13 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
Date: Tue, 12 Aug 2025 16:10:12 -0400
Message-ID: <22971824.EfDdHjke4D@earth>
In-Reply-To: <20250810212454.3237486-2-jonas@kwiboo.se>
References:
 <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Jonas,

On Sunday, 10 August 2025 17:24:31 EDT Jonas Karlman wrote:
> The Rockchip VDEC supports the HEVC codec with the Main and Main10
> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
> 
> Add the backend for HEVC format to the decoder.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - Use new_value in transpose_and_flatten_matrices()
> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>  6 files changed, 2745 insertions(+), 1 deletion(-)
>  create mode 100644
> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c create mode
> 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c new file mode 100644
> index 000000000000..1994ea24f0be
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

[snip]

> +
> +static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx
> *ctx, +						       struct 
v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +
> +	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 == 0) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_8BIT;

Is 4:2:2 really supported ? It is not on rk3588 and likely neither on rk3576.
You also mention later that Only 4:0:0 and 4:2:0 are supported.

> +		else
> +			return RKVDEC_IMG_FMT_420_8BIT;
> +	} else if (sps->bit_depth_luma_minus8 == 2) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_10BIT;

Same here.

--
Detlev.





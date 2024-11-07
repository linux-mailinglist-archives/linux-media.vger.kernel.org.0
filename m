Return-Path: <linux-media+bounces-21048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680869C0301
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D6AC2843D7
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D34A1F12F9;
	Thu,  7 Nov 2024 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gHOmQb2g"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2841EF943;
	Thu,  7 Nov 2024 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976774; cv=none; b=pG/6cpIYsmprLTfYjzhFnIqv7re9W/krxWmuz0g/Wz3VpgEIrXQPue9cSnHkXQIwI7uXYIohJGBzLcw9sGk8ZFEyTwv1q4TuN7KP9/a9xoBiNr3g8P+C2PTIW9J+s0OQeKZgmOVxMsMju0YqFa+O+3UgbhAG9a7VW2xXqicRMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976774; c=relaxed/simple;
	bh=cnpp2TKMHv1gK8Yy2Zpt8olDnfx3n0TPEPZ9lucWymU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZ3mq4Au5VVAJ9t0F7FXVXlH9JoptET02xmsdl6B+39nqQWo0XD5wtZyT1+41VtB8+nxVLPnZxwrmDeVunrm9dohrozmJkQwCNsb+2dupmzKMiV/uv8YWuBrEMbjXLJGBUzluQXNd2NjgjrRMBDLuJF2xDWHqQ0gvT61TfWIAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gHOmQb2g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730976770;
	bh=cnpp2TKMHv1gK8Yy2Zpt8olDnfx3n0TPEPZ9lucWymU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gHOmQb2gzrh17lPVK0V41gcSYPwvUfOVnvZPfNkDhFRD2ruZlgjqo2mqNiyqdLELn
	 UedWM4hWzT0LGQetXp1QTN4MMTnp1XtrqcchepmWo4dI9M3hCMxfKwEDeCOIH9M/9z
	 Nqu7SM6F/E49HialrekHtJFcr3TKvWgz4r2wzMWkAaA8D4+XtlKuTZKanrV76dx3GZ
	 ZbXL/uyODk9XNtdOKS8cJJ5Z2JhiHbsHD2bY+fvl0oZuEOeurB/Tm4gzHAPgdv9NWG
	 dyp8z2XjxfcUwjtdReLPNTKFe/kqgflUIuXeF2M3x5O23BpjNAdeC5r579cU7pzfxD
	 iQoTKTUqohyDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F330217E35DC;
	Thu,  7 Nov 2024 11:52:49 +0100 (CET)
Message-ID: <90fe898c-0352-46da-aee3-898cdf2b5d26@collabora.com>
Date: Thu, 7 Nov 2024 11:52:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: mediatek: vcodec: support extended h264
 decode
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241107074603.31998-1-yunfei.dong@mediatek.com>
 <20241107074603.31998-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241107074603.31998-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/11/24 08:45, Yunfei Dong ha scritto:
> The address end of working buffer can't be calculated directly with buffer
> size in kernel for some special architecture. Adding new extend vsi_ex to
> calculate the address end in firmware.
> Adding capability to separate extend and non extend driver for different
> platform.
> At last, hardware can parse the syntax to get nal information in firmware
> for extend architecture, needn't to parse it again in kernel.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
>   .../decoder/vdec/vdec_h264_req_multi_if.c     | 487 +++++++++++++++++-
>   2 files changed, 472 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 886fa385e2e6..1e697bc810b0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -17,6 +17,7 @@
>   
>   #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>   #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
> +#define IS_VDEC_SUPPORT_EX(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EX)
>   
>   enum mtk_vcodec_dec_chip_name {
>   	MTK_VDEC_INVAL = 0,
> @@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
>   	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
>   	MTK_VCODEC_INNER_RACING = 0x20000,
>   	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
> +	MTK_VDEC_IS_SUPPORT_EX = 0x80000,
>   };
>   
>   /*
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> index 851a8490b828..d0aecd9621d9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c

..snip..

>   	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
> @@ -816,8 +1260,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   	if (!h_vdec)
>   		return -EINVAL;
>   
> -	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
> -		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
> +	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
> +		if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
> +			ret = vdec_h264_slice_single_decode_ex(h_vdec, bs, unused, res_chg);

I wonder if we can use function pointers here, as I feel like vcodec is becoming
a bit "full of branches here and there"...

The rough idea is:

/* there, or somewhere that's called only once in the driver lifetime anyway */
static int vdec_h264_slice_init(.....)
{
	........

	if (hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
		if (inst->ctx->dev->dec_capability & MTK_VDEC_IS_SUPPORT_EX)
			inst->decode = vdec_h264_slice_single_decode_ex;
		else
			inst->decode = vdec_h264_slice_single_decode;
	}  else {
		if (inst->ctx->dev->dec_capability & MTK_VDEC_IS_SUPPORT_EX)
			inst->decode = vdec_h264_slice_lat_decode_ex;
		else
			inst->decode = vdec_h264_slice_lat_decode;
	}

	......
}

static int vdec_h264_slice_decode(...)
{
	if (!inst)
		return -EINVAL;

	return inst->decode( .... )
}

...less branches during decoding *of each frame* :-)

Cheers,
Angelo


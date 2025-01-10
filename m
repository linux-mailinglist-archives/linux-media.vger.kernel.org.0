Return-Path: <linux-media+bounces-24602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D0A08CC6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFED188D820
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919AC1ACEA5;
	Fri, 10 Jan 2025 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PB8Mtsv1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF3207E07;
	Fri, 10 Jan 2025 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502417; cv=none; b=XZDD+5qwQ4w2HeUERZ6IrGJ1tM5X/a0UWY2AFWbxhcElTu8P3M+cNbw3r8HAvQoEFjamT3avxgSNZb9YavAQdCZCbWBn4DYgdNAlA1A0ZqIkBUCQQLn1jv75iMN2nD9ECluXf8zV9rrx7LOMhUdtNg5RBMcf785BbG7Qby83kjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502417; c=relaxed/simple;
	bh=WczDZYe1varGaXmi3HXHJGCKXxAI3lrXNNWGq/sc7hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNMXNSlTm9/J6M/TZAcSa3IfrCbXB3voJ25ILxwc6oTkPA140XZPsKMx2byFUAWw3Rn3kY1MLOX5142Sbl4vbm0m2Ii6JMQNvN//OCFgJFejp7eHz0prJhhorm83rq4YYrxby3HX+H+uiZqsRnpR9tVQvl2kfYUNBxOmih3ouMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PB8Mtsv1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736502413;
	bh=WczDZYe1varGaXmi3HXHJGCKXxAI3lrXNNWGq/sc7hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PB8Mtsv1ZKyUnjGyTuys6lyOslVtXIhzjyqZHqUPVGfBt5qAod3NMZbtQrxQ01GUc
	 +HUYrbU+RGOMG/f5Gs5hxxJsZTVoPTsvuJeirEa44Vg5F/QgugbdXzFSf2VCm/ll+h
	 s3CeHAWSFaat7ycFXSVDHqDzOJJjoHaDuwNaj4is8paeRMxSaitV4q80tUia62whX+
	 pBqKmI+N7hgyx/KyF5EsZN9G348NXqNYATvvKy9dZpVHeM9IF0JUiPkfUoyb++UJ+6
	 8ukb/JLb5Ay4a4SxsVk4ln09Gsbzad3qKkRi4uWPBobhFvbdToLVSbjY3jW2DGSX7x
	 5c3tPpIP+g21Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72D6417E0CD2;
	Fri, 10 Jan 2025 10:46:52 +0100 (CET)
Message-ID: <cc1dff25-2de2-40fe-bf3d-cc9e8f735eeb@collabora.com>
Date: Fri, 10 Jan 2025 10:46:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,03/12] media: mediatek: jpeg: add jpeg compatible
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
 <20250109133513.20151-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109133513.20151-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/01/25 14:35, kyrie.wu ha scritto:
> Add jpeg dec and enc compatible for mt8196
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 8 ++++++++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 3 +++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 3 +++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 9517ebed0701..c3ccc525d9fd 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1996,6 +1996,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
>   		.compatible = "mediatek,mt8188-jpgdec",
>   		.data = &mtk8188_jpegdec_drvdata,
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgenc",
> +		.data = &mtk8195_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgdec",
> +		.data = &mtk8195_jpegdec_drvdata,

You're adding this with MT8195 platform data, and then you're changing it to
MT8196 specific platform data.

Just put this commit at the end of the series, at this point.

Regards,
Angelo

> +	},
>   	{},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index ebded06ba92d..d868e46aaf37 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] = {
>   	{
>   		.compatible = "mediatek,mt8195-jpgdec-hw",
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgdec-hw",
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 87fe1f324f23..ca06d4f435cd 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] = {
>   	{
>   		.compatible = "mediatek,mt8195-jpgenc-hw",
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgenc-hw",
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);





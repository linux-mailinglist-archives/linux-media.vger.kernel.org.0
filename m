Return-Path: <linux-media+bounces-47490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D653C74057
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3546F4EEE83
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 12:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B844E2DE713;
	Thu, 20 Nov 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="siVt2/QW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C0337B8D;
	Thu, 20 Nov 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642439; cv=none; b=Ixm/peR1FUHCbU05izE+6rPlZI3K94WuvRacDwE6rcOtroHVDlLZhAIgJ7BmueTO8Wo8MQ/qWXX3N8AcUsA2IQNtOTFypWYjXJMkPcJtBtR43AuKraFH06peFWaS+KY23MGs7igA1L4nWjtIcZ3evatTdpMAs/MBrZHzxQEP2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642439; c=relaxed/simple;
	bh=ZSaOL1s6e8ZdQExY38r542UpENF7yyAB5lY0ioJupUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcYKB4m4mwnJZ9mQvwxDJVR48GIidpuU9Kxy1r/079ORm3+PE0uvx73QdU8j8OnmY1Rh0QAcbEY7lSYIJxH85NGMEVhCtvTBY0jMsb+CNELGU7V1qSn8H6dewEbtetU/i7Hjke7S6usodzs0WHU6HMuvFVownrlRKn495eb2ZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=siVt2/QW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38523B5;
	Thu, 20 Nov 2025 13:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763642308;
	bh=ZSaOL1s6e8ZdQExY38r542UpENF7yyAB5lY0ioJupUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=siVt2/QWt93JssxWxea5trt5ZAMzu3Lia/caKFDSaB++wCf3c7R29TE5rXHCd/7TB
	 IXwb1lrONtjKzMd50jWE8Uzqym23vAK0LfqFTR3TO8GX/MiXLQRHlcs0PQlv42iZOZ
	 HPCjK3ppJgtKwUnaL+LYKuYajHfaYbjBWzvBallA=
Message-ID: <ecae251f-3f2e-4f80-8423-09d0e8679416@ideasonboard.com>
Date: Thu, 20 Nov 2025 14:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/18] media: cadence: csi2rx: add get_frame_desc
 wrapper
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-11-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251112115459.2479225-11-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> source to find out info about virtual channel. This driver itself does
> not touch the routing or virtual channels in any way. So simply pass the
> descriptor through from the source.

Unfortunately I think that doesn't work.

E.g. we have a fpdllink deser and the cdns csi2rx.

Deser's routing table (pad/stream):

0/0 -> 4/15
0/1 -> 4/33

So we have two streams coming into the deser's pad 0, with stream IDs 0
and 1. They are routed by the user to output pad 4, with stream IDs 15
and 33.

cdns csi2rx routing table:

0/15 -> 1/0
0/33 -> 1/1

So cdns csi2rx routes the streams through, as stream IDs 0 and 1 on the
output side.

With this patch, if the j2 csi2rx asks frame desc from cdns csi2rx, it
gets a frame desc with two streams, stream IDs 15 and 33.

I made this series for the issue above, but it hasn't been merged:

https://lore.kernel.org/all/20250324-frame-desc-passthrough-v4-0-dbe2412297cc%40ideasonboard.com/

 Tomi

> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 34da81893308b..3688077fa8347 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  	return NULL;
>  }
>  
> +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
> +					     struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
> +	if (!remote_pad) {
> +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> +		return -ENODEV;
> +	}
> +
> +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static inline
>  struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  {
> @@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>  }
>  EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>  
> +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +
> +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code	= csi2rx_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= csi2rx_set_fmt,
>  	.enable_streams         = csi2rx_enable_streams,
>  	.disable_streams        = csi2rx_disable_streams,
> +	.get_frame_desc	= csi2rx_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {



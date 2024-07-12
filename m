Return-Path: <linux-media+bounces-14973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6D92FCDA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 16:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A631D1F23DA5
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 14:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A619171E66;
	Fri, 12 Jul 2024 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uJIrXEon"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6416F856;
	Fri, 12 Jul 2024 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795715; cv=none; b=XPlXV8/8kuC60AE7mFx7myViUgfAoCDIQdGXKUYqhLFQgu4+ZnD3YsoDRd0fPvyV2xrTF/TBCvKsATlQqBV9PIMbH6W0ebh0UrY1kOoS51ExW/XuInJ70zQIApsPmoppGMQUu9ARXVOd6nOcueJMOMDT62b/H401IC7fD4YT/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795715; c=relaxed/simple;
	bh=eWw2ywka2/Pc9MmMaHFRVvOvcIDfVZIapE0ULx/9rvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaHxPDUCJRw6LlzAGKhffQok2V+8QPFAAIgqamTBRbVqQ4uO7W9bkCdYQOldoPDZwdr07ztI53W9P3N+IIAYsao54KOBe2euBWqGBklTpWW+WVNwNsSNBiUxDB0XRXUoeCaGiWxaqfsimQeHV4IDDavSju6xNIuUxo6psMf6sO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uJIrXEon; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25CBC735;
	Fri, 12 Jul 2024 16:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720795677;
	bh=eWw2ywka2/Pc9MmMaHFRVvOvcIDfVZIapE0ULx/9rvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJIrXEonRPhlMXgr7tAvvO3rzpiHq9Q6OO1uIce7LzBnecZvFZ78LnL8l6JKw89Nk
	 +7Cx5WVvOQhYtvrGoKKWA6SI+bnHwv3Z6L9oS6vv7dyqU3TSzRz693vapTe0mAIVl2
	 YflqwCdiuhRnlRX5dJiYc4Bl0kAwYI+PbLbvS0hw=
Date: Fri, 12 Jul 2024 16:48:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Julien Massot <julien.massot@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 08/13] media: cadence: csi2rx: add get_frame_desc
 wrapper
Message-ID: <4bufylsl7jladoygnd5pjnvy2wcacl6x6o7hdy6eilh2phcjxv@275gpkmavpm3>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-8-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-8-6ae96c54c1c3@ti.com>

Hi Jai

On Thu, Jun 27, 2024 at 06:40:03PM GMT, Jai Luthra wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
>
> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> source to find out info about virtual channel. This driver itself does
> not touch the routing or virtual channels in any way. So simply pass the
> descriptor through from the source.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 751eadbe61ef..b6054d62c799 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -135,6 +135,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
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
> @@ -466,10 +481,19 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
>  	return csi2rx_set_fmt(subdev, state, &format);
>  }
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
> +	.get_frame_desc = csi2rx_get_frame_desc,

The previous entries are indented with a tab

With this fixed
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  };
>
>  static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
>
> --
> 2.43.0
>
>


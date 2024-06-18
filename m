Return-Path: <linux-media+bounces-13568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48A90D690
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7359A1C2404A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFC91CD26;
	Tue, 18 Jun 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YWMPPDtx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1271C6A7;
	Tue, 18 Jun 2024 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723240; cv=none; b=dmRVZCyndCM47Dv9ahfwOnvMt6NN/PjjUi9iOzXoYOMNQbqpwnMGIRVBmTDyAGlMs/XWlJfiunJAZGboiYHCLlPGDM6xT7r8pUWXlzQ7jKpY8VTiSryQ4tJj0vAz2SxAl7xj2dbpU1NOeHbVy9xGly/P+KoJmu+02DLBg3W+EaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723240; c=relaxed/simple;
	bh=ALVR7CP60nbshKiISlLwr9tFZUF1mbgoEKNsC+KBpuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8bk6WQ2S/I7sZoeS+ura6W3gx1sFaJxXT7zjWZU578JQd7Nis7VvlNcLMos3Hi7YLdAOooSx9dEtNAQY62Mce/OhzG/wlMHA4Nlw1rPQP3GXgZrbonnLqfpQVkVYWcfLXWbqET61hghFcUqULhgh+DQNlbwsrFvh3wsxcRdHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YWMPPDtx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F2A5908;
	Tue, 18 Jun 2024 17:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718723219;
	bh=ALVR7CP60nbshKiISlLwr9tFZUF1mbgoEKNsC+KBpuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWMPPDtxYWbf4CWHC0izDWEeYyzUx+6SKEWFternjzVk+8RsBfqmUTwsYqFprvqaD
	 fJSM/u60NHPX9PuZfyr6bAN8o/PM70hQtmmwr5MhWvm4vTamdu07/fzzzB6OCdSB/1
	 /UgvLQBcQ6hUXQPtcAr+lIlf/Bg30xWi+DqhTxnc=
Date: Tue, 18 Jun 2024 18:06:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240618150654.GA22767@pendragon.ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
 <20240617161135.130719-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617161135.130719-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Jun 17, 2024 at 06:11:30PM +0200, Jacopo Mondi wrote:
> The adv748x-csi2 driver configures the CSI-2 transmitter to
> automatically infer the image stream format from the connected
> frontend (HDMI or AFE).
> 
> Setting a new format on the subdevice hence does not actually control
> the CSI-2 output format, but it's only there for the purpose of
> pipeline validation.
> 
> However, there is currently no validation that the supplied media bus
> code is valid and supported by the device.
> 
> With the introduction of enum_mbus_codes a list of supported format is
> now available, use it to validate that the supplied format is correct
> and use the default UYVY8 one if that's not the case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 29b18b6c8b0e..0cdb397d9e0a 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -218,6 +218,22 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
> +{
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	for (unsigned int i = 0; i < num_fmts; i++) {
> +		if (codes[i] == code)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
> @@ -227,6 +243,13 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *mbusformat;
>  	int ret = 0;
>  
> +	/*
> +	 * Make sure the format is supported, if not default it to
> +	 * UYVY8 as it's supported by both TXes.
> +	 */
> +	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
> +		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
> +
>  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
>  						 sdformat->which);
>  	if (!mbusformat)

-- 
Regards,

Laurent Pinchart


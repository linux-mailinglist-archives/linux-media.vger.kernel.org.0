Return-Path: <linux-media+bounces-21705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 767319D4650
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5BD28345A
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 03:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62D1C8FB7;
	Thu, 21 Nov 2024 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H0cYmXkO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4323098E;
	Thu, 21 Nov 2024 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732160687; cv=none; b=J7Kgac+wEMC+3JqqnVf8RSu6VAWaqbnmaOX9MR6kOXbBry6ZXiiFWFuFdFuUkyEvPQMCCuuKrOHINlaQ3fgmGRgoFC4uLLyu0jBXi5Rd6enK5RshF7civ6tefMaCTS7z3z/n5v+vO5FteUBpWm/f1yxTAdiUM8VrjmDtfm7B0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732160687; c=relaxed/simple;
	bh=DvInKOgQZ+CNZOHVpuOs3IOMBVR95c0IO11QLxwYXxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx3uFkyFgi0fW+5OU8uER/lhMqp7ZsJ6+eJCxBklKdlzADca8/9ai5uXrrWu1+eI4qVztl7nVAAwXPY5gLo0okJFH8v95A1PDTcrvAqC0YRf+7RubNYsCTzHjkFs8Q/mxSGvvDj1Q5xHI9LCDKxyFF9kfIJXSAOO5U5Cdqx758s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H0cYmXkO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98EF8219;
	Thu, 21 Nov 2024 04:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732160664;
	bh=DvInKOgQZ+CNZOHVpuOs3IOMBVR95c0IO11QLxwYXxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0cYmXkOmOEQPnidwjMt/0/sXoHamGkPluUUZcnqxTvL1TkkKzox/uWTQ4US8sYjn
	 4ycUfzshjVKVVREZOrSn+oIpfEnDMkTQXLBpRVN0lNHkAnBHdKDWt6ZkHyxD9AVEZC
	 boaH0YD1kG2pYH7ISAV1eOv1oWpiiANn96HlLYpg=
Date: Thu, 21 Nov 2024 05:44:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] media: i2c: imx290: Register 0x3011 varies
 between imx327 and imx290
Message-ID: <20241121034434.GF12409@pendragon.ideasonboard.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-2-7e562cf191d8@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-media-imx290-imx462-v2-2-7e562cf191d8@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Wed, Nov 20, 2024 at 07:17:04PM +0000, Dave Stevenson wrote:
> Reviewing the datasheets, register 0x3011 is meant to be 0x02 on imx327
> and 0x00 on imx290.
> 
> Move it out of the common registers, and set it appropriately in the
> sensor specific sections. (Included for imx290 to be explicit, rather
> than relying on the default value).
> 
> Fixes: 2d41947ec2c0 ("media: i2c: imx290: Add support for imx327 variant")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index da654deb444a..7d794a509670 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -268,7 +268,6 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
>  	{ IMX290_WINWV, 1097 },
>  	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
>  			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> -	{ CCI_REG8(0x3011), 0x02 },
>  	{ CCI_REG8(0x3012), 0x64 },
>  	{ CCI_REG8(0x3013), 0x00 },
>  };
> @@ -276,6 +275,7 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
>  static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
>  	{ CCI_REG8(0x300f), 0x00 },
>  	{ CCI_REG8(0x3010), 0x21 },
> +	{ CCI_REG8(0x3011), 0x00 },
>  	{ CCI_REG8(0x3016), 0x09 },
>  	{ CCI_REG8(0x3070), 0x02 },
>  	{ CCI_REG8(0x3071), 0x11 },
> @@ -329,6 +329,7 @@ static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  };
>  
>  static const struct cci_reg_sequence imx290_global_init_settings_327[] = {
> +	{ CCI_REG8(0x3011), 0x02 },
>  	{ CCI_REG8(0x309e), 0x4A },
>  	{ CCI_REG8(0x309f), 0x4A },
>  	{ CCI_REG8(0x313b), 0x61 },

-- 
Regards,

Laurent Pinchart


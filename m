Return-Path: <linux-media+bounces-33235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342EAC1E7A
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6951B645AA
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B49289353;
	Fri, 23 May 2025 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uXt5eSu8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8920C47A;
	Fri, 23 May 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988257; cv=none; b=H8RzMR5zYo5qzSOmLzfbt7vxNQ50mgZ+EwmpO+n7xYB7VMDFlFSA9H74nY9SNO6Hto9udvvUaKrE4GuExRt4FgIJrNswbWLsRFJCG51B/j6qnyuG9sLwwWJfVcJDEH7LKMA4smemx7qpiMISeq1yHPrCS9NB5iI97tfM6UWrONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988257; c=relaxed/simple;
	bh=BFCItceWfyuAXXe806yu+VbLQ/lI0BL9H850ON0oNA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XS4Fii2oXmmxv7Gzxbj7p5UiRX69lcaaGwyMsqEvrhhKrdRot8NAGaGAcdlRPpjtq5bdD8cFT1L/WvbiAQPup1cX42VkAYdhLP9xIsGstOKyhFqhtNhZB106JPvuPTOdaYvJr4s9eibpo1kteAAl5PVPE19282Og5EyjtPpYvYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uXt5eSu8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 144384A4;
	Fri, 23 May 2025 10:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747988230;
	bh=BFCItceWfyuAXXe806yu+VbLQ/lI0BL9H850ON0oNA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXt5eSu8sVYfZL82LXbn4zyArt8iv+pp4jy+FOET4Yq/rZz0f6QDRCf70KFG7/fiw
	 so0KRl3BEWQ97BQaMpkQ/advHhkbceM8SoU6pzKgNgbfxFc4IlOsvq9wA1tXAVECzH
	 rOuhxR4vR5AWAlSc6Lxm4E7D82VWkJUc+fJ15UDg=
Date: Fri, 23 May 2025 10:17:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <20250523081725.GB12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:28PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Instead rely on the rate set on the clock (using assigned-clock-rates
> etc.)
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 19b494c08ece9894de67a4ee34c6f8e6e2708e41..264e897ec6e8e3d2fcd9d58db82090c7dd85d526 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -32,7 +32,6 @@
>  
>  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
>  
> -#define IMX214_DEFAULT_CLK_FREQ	24000000
>  #define IMX214_DEFAULT_LINK_FREQ	600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> @@ -1402,11 +1401,6 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
>  				     "failed to get xclk\n");
>  
> -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to set xclk frequency\n");
> -
>  	ret = imx214_get_regulators(dev, imx214);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
Regards,

Laurent Pinchart


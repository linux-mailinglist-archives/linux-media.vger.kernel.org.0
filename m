Return-Path: <linux-media+bounces-33233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5358AC1E48
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F8787AD3E1
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FA6288CAF;
	Fri, 23 May 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EOwv6jzD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA72882BE;
	Fri, 23 May 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987679; cv=none; b=Fx5VmPsuajnkqHQQWMbizIUnMdDzbRGQMEo0/Un2QnOIkpxk/o5uUgArhujmHCGwEdYIS6KhOzWLLREnqpdGqbGrpuy2mlQQHXoX3gMI3/8abbiug+aayuQQESjxges9hNve4TtA499Y0QeXYW8zeGuOmkQvGLFuS7xvgIkwkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987679; c=relaxed/simple;
	bh=I/rX/siILyzcMqHEzdmC4zV4w4CMLB3jlkKhgSTSTIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucz1pys5k4CVgYSICMVceGsEQgcSrHEOdpc/xqrLZ04tcqHUJhQiPvjSCRNIwpXq6uxnPpQISz3GGxxDig9yNlOn234eeIVJzjikToXg47roOFPh8B2VWBUBc6XNvNgGhnsx2pNJB4urj/QplOHUJSTKd9lJLjw6RCPRiAGUIRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EOwv6jzD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E29664A4;
	Fri, 23 May 2025 10:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747987653;
	bh=I/rX/siILyzcMqHEzdmC4zV4w4CMLB3jlkKhgSTSTIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOwv6jzDniXOI7R7TljMRUoekN9Lv/wtRzwufJk6Ggu9PcyDMnpK0dlVBsmht/kkm
	 TXLdq+q1XcVwiXalQN2mFK6TjBDLR8TSy1rS7FR17KCvvTtr0I2gf09E+ojSpDqBBd
	 5zmkAUEXbhHpaHpy5+17r04rk/XIUxp43SjnPxi8=
Date: Fri, 23 May 2025 10:07:48 +0200
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
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 1/5] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
Message-ID: <20250523080748.GZ12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-1-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-1-bfb4a2b53d14@apitzsch.eu>

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:24PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Reorder imx214_parse_fwnode call to reduce goto paths in upcoming
> patches.
> 
> No functional change intended.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index dd7bc45523d8b5fcb3ec95728a6d32c4fddede72..0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1261,10 +1261,6 @@ static int imx214_probe(struct i2c_client *client)
>  	struct imx214 *imx214;
>  	int ret;
>  
> -	ret = imx214_parse_fwnode(dev);
> -	if (ret)
> -		return ret;
> -
>  	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
>  	if (!imx214)
>  		return -ENOMEM;
> @@ -1295,6 +1291,10 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
>  				     "failed to initialize CCI\n");
>  
> +	ret = imx214_parse_fwnode(dev);
> +	if (ret)
> +		return ret;
> +
>  	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
>  	imx214->sd.internal_ops = &imx214_internal_ops;
>  

-- 
Regards,

Laurent Pinchart


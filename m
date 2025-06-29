Return-Path: <linux-media+bounces-36183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE14AECED2
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 18:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C172318950FD
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FDB236437;
	Sun, 29 Jun 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="McEQ+5tG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B9D22068D;
	Sun, 29 Jun 2025 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216259; cv=none; b=jPTgdlpS9qgVrEj9aSPe7N4T+QiBW3Fu2QlZuGdfFaNgtILrV4Bw0+9HvFlZrUXGAftsQmGWsGazT5+PRYoYMUap891kXxNwE4xPduHD66R6LntbyT60wJtgaqS39kRLXi459Lq3lo2bAdC7rmpu1crUn3YZUPCD5Awv6T3AfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216259; c=relaxed/simple;
	bh=I+m7xtfhA0bWz2NTBp6lDxrrtJNJmzFJVavRI/w18WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJBMwyQqN+i9o0J7McoOz0+nsMAoshbUD6eAOWaZmiDDIXWR6VdZuv6/NWTBR0G3l4a5NDKb+CGp5bdvCw07SIsEk30ouBHiXEqhmiNaPiDM91BeANRJqM5tRZVpexu2qXgZsky6P884LdTqcwwemkTSBjndl6BnBF7v6eLF/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=McEQ+5tG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 12124C67;
	Sun, 29 Jun 2025 18:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751216235;
	bh=I+m7xtfhA0bWz2NTBp6lDxrrtJNJmzFJVavRI/w18WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McEQ+5tGnCvWD80eOM6m3saeo4I1DcjbTZDIVuugQa6cpuD6pZB/NYD84on9ZMG8N
	 6OQwP3BBOb+Ui3jxagsUOzrg1sMZCQdpqIL39lZT6sDjqdy2oKnOqCHkZi07e0Lu13
	 NfmWJEuM+vlf9nhOzmZGQiD/Zskk7ckjjy42vQc0=
Date: Sun, 29 Jun 2025 19:57:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: i2c: imx214: Drop dev argument from
 imx214_parse_fwnode()
Message-ID: <20250629165712.GJ24912@pendragon.ideasonboard.com>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
 <20250629-imx214_fixes-v1-2-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629-imx214_fixes-v1-2-873eb94ad635@apitzsch.eu>

On Sun, Jun 29, 2025 at 04:49:21PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The device can be accessed from struct imx214.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 8e9b5c9c93b0888f3d6be857168711edaf050db3..d9193bafa3cbb8fec2679200c38d30077d1b11bd 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1324,10 +1324,11 @@ static int imx214_identify_module(struct imx214 *imx214)
>  	return 0;
>  }
>  
> -static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
> +static int imx214_parse_fwnode(struct imx214 *imx214)
>  {
>  	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
>  	struct fwnode_handle *endpoint;
> +	struct device *dev = imx214->dev;
>  	unsigned int i;
>  	int ret;
>  
> @@ -1415,7 +1416,7 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
>  				     "failed to initialize CCI\n");
>  
> -	ret = imx214_parse_fwnode(dev, imx214);
> +	ret = imx214_parse_fwnode(imx214);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart


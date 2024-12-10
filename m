Return-Path: <linux-media+bounces-23059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B49EB107
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58411188643D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8284E1A76BB;
	Tue, 10 Dec 2024 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3gg5xVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF761A38F9;
	Tue, 10 Dec 2024 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834428; cv=none; b=iNRQ2zygxNJw3O9Hl+IIAOuLwhk2F5YX761hVDtNHOI5yEXsvOGBTD9ZbCml7Ng1BBjPzEqN2G8Y615zoeBAkqzzChVSMgN3WUoyEyl1zOLuHYLqzmeHSfu9pIjgFoY8eeCTC/JEyo9HiVQk4XiMM5CF9opo6ew3KcOLBTPFEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834428; c=relaxed/simple;
	bh=RwPFdHZbfpIwb1UCtTRh2G/DJLDZeth4BXh3a9ShpCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aC+/79GZeEoe/hGiS8ezEYFRheycLyIKHc3lZyZmPQ1XBi0qRvlIG3abJJWq7uXTNlxrFJfSJ/Bv3T8q/yayFgUpDkI165Pb10GoAia3cU7vZeoyfAigyU0C8DNnwGJzi4dbuvVgsyztqySK1MQ5AQhP1y1/6Nrsy40YugXi3Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3gg5xVZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834428; x=1765370428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RwPFdHZbfpIwb1UCtTRh2G/DJLDZeth4BXh3a9ShpCo=;
  b=n3gg5xVZFKppQsc3reAbhlIo89FmmPj2v5JUTs8AKPDDNpOZEu8xdFiY
   85EwW0LORh/CtSI4E71ERPV/APPkcjlfHOXzYLUmFwhM/PWd60RA/3L2w
   H85l476C+3cpoFQ6yp4RkwyvGNfHwJT/X0zpLpc4K9mpv28KZOcEipxuq
   RUbeG9RqCTcaoiAKObTxJCC0pqBoOX/DBwY0WakPyaZi71hzfxekI88SO
   k3ctU05zhnXSfqjlMJKAMJMbCF9klnoPL4RDTJK3E6yMp1K7L94ggyHoV
   cCsQj7s6pPCc2o6NBxbqGnWEsmcIN/0GM2mLbgcoSK2h63Xv38yDsx6g7
   w==;
X-CSE-ConnectionGUID: HDo2QoLbRAyMPwxquSnueA==
X-CSE-MsgGUID: 8VPaUvhzSr+OwNaUEOQlaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44643887"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="44643887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:40:26 -0800
X-CSE-ConnectionGUID: pbQXO7PCQ7ypP3Nt08f/Dw==
X-CSE-MsgGUID: qts2NLljRr6+uKLXnHQBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="126300478"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:40:22 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12DB611F81D;
	Tue, 10 Dec 2024 14:40:20 +0200 (EET)
Date: Tue, 10 Dec 2024 12:40:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 10/12] media: i2c: imx214: Verify chip ID
Message-ID: <Z1g2tLicdrb6lfoK@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-10-ab60af7ee915@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241207-imx214-v3-10-ab60af7ee915@apitzsch.eu>

Hi André,

Thanks for the update.

On Sat, Dec 07, 2024 at 09:47:59PM +0100, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Check the chip ID and stop probing if it is no imx214 sensor.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index a35e4e60e55c2b9d9e3090c98e695f78d099cf44..3cd64bb91795d8490acad5926940c111fb95fae5 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -20,6 +20,10 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> +/* Chip ID */
> +#define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
> +#define IMX214_CHIP_ID			0x0214
> +
>  #define IMX214_REG_MODE_SELECT		CCI_REG8(0x0100)
>  #define IMX214_MODE_STANDBY		0x00
>  #define IMX214_MODE_STREAMING		0x01
> @@ -1092,6 +1096,27 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
>  				       imx214->supplies);
>  }
>  
> +/* Verify chip ID */
> +static int imx214_identify_module(struct imx214 *imx214)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx214->sd);
> +	int ret;
> +	u64 val;
> +
> +	ret = cci_read(imx214->regmap, IMX214_REG_CHIP_ID, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read chip id %x\n",
> +				     IMX214_CHIP_ID);
> +
> +	if (val != IMX214_CHIP_ID)
> +		return dev_err_probe(&client->dev, -EIO,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     IMX214_CHIP_ID, val);
> +
> +	return 0;
> +}
> +
>  static int imx214_parse_fwnode(struct device *dev)
>  {
>  	struct fwnode_handle *endpoint;
> @@ -1184,6 +1209,10 @@ static int imx214_probe(struct i2c_client *client)
>  	 */
>  	imx214_power_on(imx214->dev);
>  
> +	ret = imx214_identify_module(imx214);
> +	if (ret)
> +		goto error_power_off;

The error handling was wrong in the driver, the code under the
error_power_off label only disables the regulator (and runtime PM, which
hasn't been enabled) but it does not disable or unprepare the clock. Could
you fix these in a new patch, please?

> +
>  	pm_runtime_set_active(imx214->dev);
>  	pm_runtime_enable(imx214->dev);
>  	pm_runtime_idle(imx214->dev);
> 

-- 
Kind regards,

Sakari Ailus


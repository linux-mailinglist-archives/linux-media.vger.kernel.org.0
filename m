Return-Path: <linux-media+bounces-28836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91223A72D52
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EEEC16ADC6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB9320E6E4;
	Thu, 27 Mar 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXa4fS2M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB920E00F;
	Thu, 27 Mar 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070005; cv=none; b=II+RWmcHhwgfDrhIwRA8Q6ddQRH2v/MZg+SGRwUEJR5WRzfA775Ptjq8CJkn/O38YZZaUcbByVgqIUi04p/9Iz/a2y3HvGlih4Eg4JV7jgkSlExMP9S/R0zBejCxOcO1NI9gxVS5l+i88lQ+CgeZqCcqGBdiXbDsatVktNlmgug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070005; c=relaxed/simple;
	bh=WF3Fld+lGvupAXqi63L7DLt2+LWPf+rJb6n8QFnRLrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASku/cZGXDUW0iQ79/abLOtPmZys49VljAjhIw8CDZEET1oW84Gva5dGyWy3PDzZ5V/YGm5FvStT/I2UxJTtbZ8tbzsSE/t1LPSRDZk4SVdfQn0ExjIxJSi1Egehg8GnqmOplTJ5c5+Ucg/RPgrVbWcrXu2AQHRr9k8AAYuloZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXa4fS2M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743070004; x=1774606004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WF3Fld+lGvupAXqi63L7DLt2+LWPf+rJb6n8QFnRLrc=;
  b=ZXa4fS2M+Wa2UrklzNSSHgMVkLQYAr/ruZpPPhrw+OQR45uIE6voxDMk
   9Uqfw+vp5I6rXh64Qc9za4sAs727oLSeKJEAkYtvBvMS4BU1DD/vO16AO
   +BkuEt4wQ7JDO0R6Dlw6D2ZjadxYarlly97sw0aqC2K+GIHiDZlcL2VrG
   dtI8GcdBKES78gHIeP7uE3fMDWOkWVCacDPEOL5dwKPvBWPw9yISxVq8f
   YzHasVKUBokb3OSX4Zdmnul7UIuYvGaD69DALsif5UvW51b2EpUG4jQNS
   n32T5M0m+IrWLUX0ErQD2v7H/Hn8fe54tvR8/qx5MEkPdBeaPuQ/9QHA7
   A==;
X-CSE-ConnectionGUID: AqEIzt1ETya9qY5kh3vg+g==
X-CSE-MsgGUID: vLKKLZ84T42LkyTqco8Cuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61786916"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="61786916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:06:43 -0700
X-CSE-ConnectionGUID: F/y7YVltS62i2PrHscdY8A==
X-CSE-MsgGUID: 47YQatJ4R1uk9aZMo2zfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125609989"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:06:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 142A711F99F;
	Thu, 27 Mar 2025 12:06:37 +0200 (EET)
Date: Thu, 27 Mar 2025 10:06:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: kieran.bingham@ideasonboard.com, Shravan.Chippa@microchip.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Luis Garcia <git@luigi311.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] media: i2c: imx334: Enable runtime PM before
 sub-device registration
Message-ID: <Z-UjLSsATevtLT2k@kekkonen.localdomain>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-7-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310071751.151382-7-tarang.raval@siliconsignals.io>

Hi Tarang,

On Mon, Mar 10, 2025 at 12:47:48PM +0530, Tarang Raval wrote:
> Runtime PM is fully initialized before calling
> v4l2_async_register_subdev_sensor(). Moving the runtime PM initialization
> earlier prevents potential access to an uninitialized or powered-down device.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/imx334.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index ffa39bb317f7..8964d60324e2 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -1295,6 +1295,9 @@ static int imx334_probe(struct i2c_client *client)
>  		goto error_handler_free;
>  	}
>  
> +	pm_runtime_set_active(imx334->dev);
> +	pm_runtime_enable(imx334->dev);
> +
>  	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
>  	if (ret < 0) {
>  		dev_err(imx334->dev,
> @@ -1302,8 +1305,6 @@ static int imx334_probe(struct i2c_client *client)
>  		goto error_media_entity;
>  	}
>  
> -	pm_runtime_set_active(imx334->dev);
> -	pm_runtime_enable(imx334->dev);

Please also change error handling accordingly.

Btw. the remove function calls pm_runtime_suspended() that does nothing
(use pm_runtime_set_suspended() instead). Could you add a patch to fix it?

>  	pm_runtime_idle(imx334->dev);
>  
>  	return 0;

-- 
Regards,

Sakari Ailus


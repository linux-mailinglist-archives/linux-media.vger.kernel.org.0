Return-Path: <linux-media+bounces-11201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E78C0EF6
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423A31F2218D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A2013173B;
	Thu,  9 May 2024 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGn6h+fq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C350A6C
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715254937; cv=none; b=boyTMzBusSAqbO74lp9penjVQaJXB8KOkRp7C77BhQRrd2VOxgLYqE3VjGqubddAtiDExTQGq3fnSSObLYGS0nrjm1+5qRK0D6vIjaRTgo0SwzH4gCZYdrucigb6VFjSJ0S09TZVRzdTm+BTzNgi8/LalSu8hqSvvDe8VjHi2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715254937; c=relaxed/simple;
	bh=leKsAPRUhAywOJyH0VyofiZyq5ZBrd5/5MuxWusiwvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG+cF2RGlwnKYGNWvM9JWbkHNcTNJxSnJh3JE4VV6jJVaKTN+II0FARqVg9QGTvPeQWElSEE2jr0GrEkSzhYanLEkHaxg8+25iEd+xVk6hyosl+lpe/aIHmgb7C3lYSbFDesvRqNWtaTfhPkkYAKhtQ8/x7O0iWxfaPa9kWSDhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGn6h+fq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715254936; x=1746790936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=leKsAPRUhAywOJyH0VyofiZyq5ZBrd5/5MuxWusiwvA=;
  b=aGn6h+fqttmg3wSEgy6YmMR4/lv5mPh9l7Q65ljhmgiSLYjedJzPOW+W
   SdOsddkFsn5JlpLtVzdzHAcm2HsXMQkDFMB00t6pDY4LW3v07GTVMNO92
   U/spsg4HMZFuV6ubHV2vra00EtqMlxzMJDkZuvvK+CjEgNXjopvETn3Rb
   MqRCKflOI56JMWrOCLe/W0vN0ScCcT2UgTG3i0T9o/ye73iNuwFxIPBpS
   udNuDHPGXLrDXGSv7G2H+yBVBTdQTOXV4Ya8eA8MctJBnzyUN1Fee2dkS
   6oZ8gn9z44wwIgxbFxpKQEVsiwQKqyiqauQP7gd6qEnjvQAvmdMFw3gjK
   Q==;
X-CSE-ConnectionGUID: Bjy6a61NQTenenOx9w7YAA==
X-CSE-MsgGUID: w9NOee5TRpKeWe8X8lrsUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14978795"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="14978795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 04:42:16 -0700
X-CSE-ConnectionGUID: N/MCVD+uSLu1+gNJKH73aQ==
X-CSE-MsgGUID: WBt6i3MVR2CcDbeB12f1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29787343"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.213.18.33])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 04:42:13 -0700
Date: Thu, 9 May 2024 13:42:10 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov2740: Ensure proper reset sequence on probe()
Message-ID: <Zjy2ksnLCvKuWv4u@linux.intel.com>
References: <20240506132438.278920-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506132438.278920-1-hdegoede@redhat.com>

On Mon, May 06, 2024 at 03:24:38PM +0200, Hans de Goede wrote:
> Before this commit on probe() the driver would do:
> 
> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
> reset=0                // from resume()
> msleep(20)             // from resume()
> 
> So if reset was 0 before getting the GPIO the reset line would only be
> driven high for a very short time and sometimes there would be errors
> reading the id register afterwards.
> 
> Add a msleep(20) after getting the reset line to ensure the sensor is
> properly reset:
> 
> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
> msleep(20)             // from probe()
> reset=0                // from resume()
> msleep(20)             // from resume()
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

This fixes this issue:

[    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
[    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor

for me as well.

Thanks!
Stanislaw

> ---
>  drivers/media/i2c/ov2740.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 57906df7be4e..c48dbcde9877 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1333,9 +1333,16 @@ static int ov2740_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
>  
>  	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(ov2740->reset_gpio))
> +	if (IS_ERR(ov2740->reset_gpio)) {
>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>  				     "failed to get reset GPIO\n");
> +	} else if (ov2740->reset_gpio) {
> +		/*
> +		 * Ensure reset is asserted for at least 20 ms before
> +		 * ov2740_resume() deasserts it.
> +		 */
> +		msleep(20);
> +	}
>  
>  	ov2740->clk = devm_clk_get_optional(dev, "clk");
>  	if (IS_ERR(ov2740->clk))
> -- 
> 2.44.0
> 


Return-Path: <linux-media+bounces-44957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE05EBEDB84
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 22:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03E82406F6C
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 20:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA04D28850D;
	Sat, 18 Oct 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FToTKl7g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2942050;
	Sat, 18 Oct 2025 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760819423; cv=none; b=ZNeHzJjAit7dl9JLH3uX0PYu0mMg83pU3yqz8/b44eba0OjVb12aGUa9lUJuJ141kd9rg5XL7lKzt1wrcQzLTbZnasm1R+wMlgZXuvgLJQVFfj8fPu7Rnh90HEDM2zAXSckvYE2DWASHVEBB7ozarv0EPo9jQATPMjm3gMP0864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760819423; c=relaxed/simple;
	bh=oymSkMI4MQyfgGtzTlVx+2QbpBAMoVgBfbG6GjNGQ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHGFG1EL+Ond4zTiHHisf6Cdb0SFnoVeMhVTm3e6uRvxzLzSuwQI9LOiKtpdVVHLpNYTNbd/gxuhoD2LfB7RqUDmD1hAr5NsL8rDBcQYsJfNgxHPk9stiNF6leKd5pzSGHTEw/XkLEKSugwtN3hT9ogr40Qc50eGNTs+tgY2Bio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FToTKl7g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760819421; x=1792355421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oymSkMI4MQyfgGtzTlVx+2QbpBAMoVgBfbG6GjNGQ1c=;
  b=FToTKl7gkd+Wv1+UPtwVizPeSwz7JabwD3dIAPkhgk3jnYRINmSDTt87
   eV+VpW8TWz+VQOPGd44uMfazt+v0GqR/Vnw4dIuOeTNH3YIcWBgYX/fpA
   iazmzrHTvhjDZipmRaj/tsakaats3C1S/xR/NsYkJQvO+1+7u1V4Ead25
   DkFHyP0SMhOmXFxZSss4z07++JFt8011BFhHP53zBFTHCDFkbN/EBaBtn
   toVNL+0eIqzgCWtn5dFIXjNIZK+g6O8YVA9ZgKmYgDon5hAwsveHLDfd/
   FrSTOCPyHvRihkCG0iy7QCl27JFipcs9Yd7GnuO1cCFhdlPECsizBhG8n
   w==;
X-CSE-ConnectionGUID: 26vdJaWIRIme7WBrZMymjA==
X-CSE-MsgGUID: KzZY0nCESbSKnhCLpESQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66833131"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66833131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 13:30:21 -0700
X-CSE-ConnectionGUID: wFojyqHMSk2ID8aQrenOaw==
X-CSE-MsgGUID: SsgCYYyxSN2ifsNoFIQrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="187257235"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 13:30:15 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vADZ5-00000000yE0-19Kc;
	Sat, 18 Oct 2025 23:30:11 +0300
Date: Sat, 18 Oct 2025 23:30:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v4 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aPP40yh7--VGpd0O@ashevche-desk.local>
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 17, 2025 at 12:49:39PM +0200, Matthias Fend wrote:
> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
> 
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976. It is programmable through an I2C interface and
> connected via parallel bus.
> 
> The sensor has an internal ISP with a complete image processing pipeline
> including control loops. However, this driver uses the sensor in raw mode
> and the entire ISP is bypassed.

...

> +	hm1246->reset_gpio =
> +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(hm1246->reset_gpio))
> +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
> +				     "failed to get reset GPIO\n");

Rely on the reset-gpio driver instead of this.

-- 
With Best Regards,
Andy Shevchenko




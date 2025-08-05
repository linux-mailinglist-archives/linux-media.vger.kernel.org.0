Return-Path: <linux-media+bounces-38949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F29B1BCCC
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 00:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A486F3B41E2
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 22:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF5D267AF6;
	Tue,  5 Aug 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxOP0CTK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E0524F;
	Tue,  5 Aug 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434051; cv=none; b=m1pS31VCDUD7J2IIUInuo1AujJOJVZEguipAhaFTgMfyt1GseDvOPzDrVMrFi1J4w7btYwpaLH/S9WK+4F6XBsu+MMtBDBpwQT1DcE5T5wmMsASqSdTKAeVba2fShedv/iLQr5ClYOQr/2Nt8S8rnRYF7DY3bzHdUKWx03i6aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434051; c=relaxed/simple;
	bh=KYw4RNUeASdFXsPrATJzTl49vE5DAknXhp2CsRtxLOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBKSOI/2moqs7VuUvN8Ya+U/kwhMgw26A3+jYwaOXEN4S1GgA/7qEKVqfps0IcsiQb4CBCShChZFu88iF/qSHo6kX7+TUHwmdFTLFeBO1MB3+/CK6CjNa/pdcqr9t8b/2um7wE3VtD7CwzFPAyFVH9NH4reFFB+NuV0LIjJoQYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxOP0CTK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754434050; x=1785970050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KYw4RNUeASdFXsPrATJzTl49vE5DAknXhp2CsRtxLOg=;
  b=OxOP0CTKn8cMCN3qml7mrAYYxfIuqOc4vlmPwtBWDEttAZNCUS2/aXfi
   fjqY6XJeCBxKjlvMaRHR+PgwWWxp3nP+2H3z+idVts11BtIofD0kK/CPh
   v7LIti5d1wGk/BX4b58ThdCbUn3UlNcpOC899YOPzmnFeSnVJttZegkSv
   egHktFye+0LfcfpaUnp4zeKrBdI5DdHe8Z17mam9UFrbtvV4AtxlKWTyZ
   JhGJ8/RaZG3gQHSVBJQYNS6KNLpBA5+Zanj2dXENv7QDR3RASMOs8pPIw
   Jdt5ciopuyt7vL1aJuFYOM/OffiKFuGBez9kfpqWEtbRQNgYqj0ZKqoR/
   g==;
X-CSE-ConnectionGUID: 7cEgfDxgRemQun14yvP1uw==
X-CSE-MsgGUID: f/i+WTdgTXax9TovkpTzKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55780365"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="55780365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:47:29 -0700
X-CSE-ConnectionGUID: PCD5D5urR9CM2dpvKcS+Ig==
X-CSE-MsgGUID: pX+gkuTSSbW81hMyD72weg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169066712"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:47:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujQRD-00000003s6A-0sOQ;
	Wed, 06 Aug 2025 01:47:19 +0300
Date: Wed, 6 Aug 2025 01:47:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aJKJ9l_j2VJFEcHe@smile.fi.intel.com>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731061004.5447-3-hardevsinh.palaniya@siliconsignals.io>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 31, 2025 at 11:39:58AM +0530, Hardevsinh Palaniya wrote:
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

...

> +#define OV2735_REG_LONG_EXPOSURE		OV2735_PAGE_REG16(0x01, 0x03)
> +#define	OV2735_EXPOSURE_MIN			4
> +#define	OV2735_EXPOSURE_STEP			1
> +
> +#define OV2735_REG_ANALOG_GAIN                  OV2735_PAGE_REG8(0x01, 0x24)
> +#define	OV2735_ANALOG_GAIN_MIN			0x10
> +#define	OV2735_ANALOG_GAIN_MAX			0xff
> +#define	OV2735_ANALOG_GAIN_STEP			1
> +#define	OV2735_ANALOG_GAIN_DEFAULT		0x10

I dunno if the TAB after #define is something being required here, to me sounds
like a misplacement.

...

> +static int ov2735_page_access(struct ov2735 *ov2735, u32 reg, int *err)
> +{
> +	u8 page = reg >> CCI_REG_PRIVATE_SHIFT;
> +	int ret = 0;
> +
> +	if (err && *err)
> +		return *err;

> +	mutex_lock(&ov2735->page_lock);

Since you have cleanup.h, why not use guard() here?

> +	/* Perform page access before read/write */
> +	if (ov2735->current_page != page) {
> +		ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, err);
> +		if (ret)
> +			goto err_mutex_unlock;
> +		ov2735->current_page = page;
> +	}
> +
> +err_mutex_unlock:
> +	mutex_unlock(&ov2735->page_lock);
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko




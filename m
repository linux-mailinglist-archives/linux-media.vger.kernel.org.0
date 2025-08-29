Return-Path: <linux-media+bounces-41327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD00B3B8AF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 12:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 538AE1C25478
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AB03081B8;
	Fri, 29 Aug 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dek/wK62"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98C1FDE31;
	Fri, 29 Aug 2025 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463324; cv=none; b=nLdTE3+fsCc7xnRBUftL2OcSdOOPHhESN1Zlbd3sLl4UlM9b/OaJxm686oEX8zntBtyYzlP4RKWvGje8xiRL9eu3rPc3TDPdLhg/SkdeWAyq9loH4JYW2XJGvsBnqTTf9cRUtZZvNjfO2OivM4jZ8ALkScVf2vC0e38mLgyIOyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463324; c=relaxed/simple;
	bh=35TNFwWDooLMAxwKP+GU9JtApHDptbvNUiHBTvQ/9O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/RWDH84Bzgu75+amFyuznsS36ABrF4sCMRO5LHBEq9RknCXSXIyGkww+HWm5cWM6lssbhIeCv7Nbw2sv/KjkiD1JHuLRGrEPpdcXE75jZB0saNhOeJ0NWCKdZwFIRN0gBc28r03/fa++IO2WQCMuAiRD7uWhg+EsjHWMHtdZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dek/wK62; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756463323; x=1787999323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=35TNFwWDooLMAxwKP+GU9JtApHDptbvNUiHBTvQ/9O8=;
  b=dek/wK62H/jUecnUUDr/G0MIXQpwD2U5ydoz7TWhwH//4KAafVM4jPYa
   r+oqfYW4NOijfh5FJjR0MJxIzu3BnLyZ6kMILg+d8z0F6WG5LT08OyIFN
   BHdx8p0xJgGCS03b0Vdpk9cZAp1bL3E5bESfQIdT6KOfzHYhcDGz0Cg8E
   W77Q46L+H370GkgTW2QcSsa9ynWXlMVQimj2ttReuArmUrugIbmW2qLKC
   H3snmWXdDrOvHjYKE3APcoQF91TH9f2xMvryfETjm3fqUnYWBQ+F06+bD
   z95Brt29cfnaaFM0PxGV68V8ec78oCLl9g9MFl6Tnz9XiMtdKjSY+Tqo1
   g==;
X-CSE-ConnectionGUID: Xj+JCI8yRqO3mkmPGwXIBg==
X-CSE-MsgGUID: iP3Z7U1HSpCO+TYHI52shQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70185493"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="70185493"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:28:42 -0700
X-CSE-ConnectionGUID: 5Vy7ImHyQ6KY9BHswHlR3A==
X-CSE-MsgGUID: m1XrijetQbSUAr2nOR5fsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169603373"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:28:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 61F6B11F97F;
	Fri, 29 Aug 2025 13:28:35 +0300 (EEST)
Date: Fri, 29 Aug 2025 13:28:35 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: Silicon-Signals <siliconsignalsforgit@gmail.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Hans de Goede <hansg@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/2] media: i2c: Add ov2735 camera sensor driver
Message-ID: <aLGA0zbWz_th4tzC@kekkonen.localdomain>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>

Hi Hardev,

On Fri, Aug 29, 2025 at 02:39:49PM +0530, Hardevsinh Palaniya wrote:
> From: Silicon-Signals <siliconsignalsforgit@gmail.com>
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an           
> active array size of 1920 x 1080.                                         
>                                                                           
> The following features are supported:                                     
> - Manual exposure an gain control support.                                
> - vblank/hblank control support.                                          
> - Test pattern support control.                                           
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).                    
>                                                                           
> The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.
> 
> v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22
> 
> Compliance test for rkisp1 device /dev/video0:

Could you run this on the sensor sub-device, using -u option (currently
/seems to be dev/v4l-subdev3)?

-- 
Regards,

Sakari Ailus


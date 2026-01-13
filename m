Return-Path: <linux-media+bounces-50533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883CD17A27
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6C03300EE44
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0277341AB1;
	Tue, 13 Jan 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Up6ZaMm1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A127136C590;
	Tue, 13 Jan 2026 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296642; cv=none; b=RPtWcUPjvI0ulyrzCNsSjMan+S1xEuWPM3b9Ul7xWkX3/Vp2j8wRHHxbVOhiIB735TPhEXjvks/BkknJRMqqOP2R2z+IjUrvrycoAanfPrCdFsDXqHUMtsIruIegoP9NXF2YUBe4A27Aul6EOOBrq3tUFCHk8XGAhz0k1VRUYnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296642; c=relaxed/simple;
	bh=5ubcJKa03epeMU/Rz/HAE+xd6v1dXE+MKytXOHB4lzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVDsFo2/qx7UKCY42fKVfu8X3Ik/TtkdNTG7hU378kCWjEW1Q83S/Unz4nzEw88Gb8U0zS/+FMjs8SkuCtmLieS2u+ZB7pDyMSYiI+2UqrwikwdAOWGkp8kjcU71fkPh0S6BMrHeL6IeR2J13U7LL8Q9GP14svY1qsFPj8vXyb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Up6ZaMm1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768296641; x=1799832641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ubcJKa03epeMU/Rz/HAE+xd6v1dXE+MKytXOHB4lzY=;
  b=Up6ZaMm18eH2qlUg0FHgvY126FSIXC0ioB1e5kMgqBJVh5ZAHTwsMqad
   SCNpPo4fZ0ZA03ENGeuphG57NRf1fED45bfQKSF7qgMK2ubmjdsgVKUw/
   9reTLJN7e2d8BsV7DqReYDLHFnZECEpxKQjzGZpiVsz7IPpEB2zqr3CcU
   aagV3wv9JYWAxbIdHZ18jvPYiLSc62p2x+TANyqO2Me4mBOOo9Bc8V16I
   tHGYSilX85CrivKHzkK0dAi+jXeQH919P44vJ6oyq9gK02quUrmSrvZaB
   Xn2RveSL0g+OyYR7kTiJFG76QzWw1Y2SX7HNErcuFh5pRwODbS0b/rChU
   Q==;
X-CSE-ConnectionGUID: oRVlcP6zTPCXiQPLH++bpw==
X-CSE-MsgGUID: Omr78eGxQB2vHOrxiHQgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95052377"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95052377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:30:40 -0800
X-CSE-ConnectionGUID: WHA9BL8TRma+ka8v6pkKgA==
X-CSE-MsgGUID: X85ZyysRT8eGLEY/qntF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204738667"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:30:34 -0800
Date: Tue, 13 Jan 2026 11:30:32 +0200
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
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v8 0/2] media: add Himax HM1246 image sensor
Message-ID: <aWYQuJDinMlmxHgk@smile.fi.intel.com>
References: <20260113-hm1246-v8-0-ea93947b192e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-hm1246-v8-0-ea93947b192e@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 10:07:25AM +0100, Matthias Fend wrote:

> this series adds support for the Himax HM1246 image sensor.
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976.
> Currently, only the native RAW mode is supported. Other modes and the
> internal image signal processing pipeline are not currently supported.
> The data sheet is available on the manufacturer's website [1].
> Tested on i.MX8MP hardware. A Toshiba TC358746 bridge was used to convert
> the sensor's parallel video output into MIPI signals for the i.MX8MP.

Please, do not send a new version when we have been in the middle of the
discussion.

-- 
With Best Regards,
Andy Shevchenko




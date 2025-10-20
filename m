Return-Path: <linux-media+bounces-45011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AFBF0598
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 11:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 668044E9203
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80802F60AC;
	Mon, 20 Oct 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRn3tWuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011A29ACC5;
	Mon, 20 Oct 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954328; cv=none; b=I7H+u3aIA8gBrbX6TSThcwsRCtXs/ou0DNWak0eVtmwOG7hyr/Qeg2OUkpgFFp/XFHuEzJ54D2pTBQIPhuD+2i3HKfTcE6OV+97rOy+0eFAXmO8vxS7GpJjxrnwtP1QURJrK1FPQ5yaqoWwSn8/XSOwSzDbxiR/ZCfFa/5ldx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954328; c=relaxed/simple;
	bh=YPCDcMukUj5Zhkq2+koIfQLnxBTDUHeL0wGrJe+MDLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnMD60HkrUI4AGv00mRthGvj5iGOcn95dsMx4N4hfb0/CzKYo1nnQfEWLyMDnyNV7tS2JbSmhuQxdWPQmi5wTcHtxs+3rCt/4Dg+aaebmd1ID6/NvVMx8Pmtxibpi4uO3ZxDM7v48aglQUmy7TSiMCxOEBtWdjJvZO0KzVGoGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRn3tWuQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760954327; x=1792490327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPCDcMukUj5Zhkq2+koIfQLnxBTDUHeL0wGrJe+MDLA=;
  b=IRn3tWuQCaICRwVFeU9SmgGPDkg02Ie/ZNhHMPZTV51ix4f14BpuDPi6
   QWfNuKFqgCmtzN2tgzIFmc02p1zrlrrIueVhPQIh6N2u8YNl22vXmFjzW
   u2HyZ2IaJaeW6y/R/kUElEI2pXnZRuBNn5jqawyGewl6XeJPIE4pSZJwi
   u31nKpXqn/G5WVgcty64uRu3GQzXCQtZoFNyJv31thpUqoxqrT5SjNaBu
   3AWfDXsSWP+wjfAJ3sFgF3gDEHNShISWYjPN+ZIm5rbfYI/Wzdh8K4qxc
   Uv7TIeqbcKTjDcYxoA5XLIa2imu98rQavJzk6FySGY9irktxUWufDHgH3
   Q==;
X-CSE-ConnectionGUID: BU8JioG+Q3Gt0Gqa19qkDA==
X-CSE-MsgGUID: IE+w/FcERKeuhvRiVeN/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62972612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62972612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 02:58:46 -0700
X-CSE-ConnectionGUID: J/+gLIh7R4uzRPuFSzzyGQ==
X-CSE-MsgGUID: O4WOML3RSzWNePeT2lPWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="188582798"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 02:58:41 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAmez-00000001GkB-2yZl;
	Mon, 20 Oct 2025 12:58:37 +0300
Date: Mon, 20 Oct 2025 12:58:37 +0300
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
Message-ID: <aPYHzaBtClxT32r5@ashevche-desk.local>
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
 <aPP40yh7--VGpd0O@ashevche-desk.local>
 <c5406a18-0f2b-41c8-854c-e91e74225b61@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5406a18-0f2b-41c8-854c-e91e74225b61@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 20, 2025 at 09:21:10AM +0200, Matthias Fend wrote:
> Am 18.10.2025 um 22:30 schrieb Andy Shevchenko:
> > On Fri, Oct 17, 2025 at 12:49:39PM +0200, Matthias Fend wrote:

...

> > > +	hm1246->reset_gpio =
> > > +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(hm1246->reset_gpio))
> > > +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
> > > +				     "failed to get reset GPIO\n");
> > 
> > Rely on the reset-gpio driver instead of this.
> 
> Do you mean that I should use devm_reset_control_get_optional, for example,
> to handle the reset GPIO pin?
> Unless I've missed something, no I2C image sensor seems to use that.
> The recently added driver for the OV2735 also uses the standard GPIO
> framework for the reset pin.

The driver is kinda new (a year and half old), nevertheless I see
disadvantages, it's OF-centric and makes little sense for most of
the users (discrete components).

> For these reasons, I'm not quite sure if I've understood this correctly.

-- 
With Best Regards,
Andy Shevchenko




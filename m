Return-Path: <linux-media+bounces-35601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47569AE3BBD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14946170AD4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DABC239567;
	Mon, 23 Jun 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alt1eMxf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA51DA23;
	Mon, 23 Jun 2025 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673297; cv=none; b=lNc6W8lyouuB1gKYEZVCFrd+EKbnLYF0cDpRHcTThTYepHCeBdc7cg8dR85cfshDPUeDTdY37RUM6kOEr9VnalMn4a0DkiP/GpapBIDUaubrsivuQxQynft2mbIHvflH7K7R8W1iAo94+SNWP5S+JdmZTzl2/LtvzsroZhLH2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673297; c=relaxed/simple;
	bh=dix0Yhu3c8boRB+3OYeK+56zmV1v3N5vctgiK7sTU9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqPrlurj8c0bunqZM3zazBahB5kz2h2CHHLuI04fLRzJbzeUevEgTkkT0b7oWQ04ECouMVYZurocxDQ8USoXJZYc0tPCmwDbKWyKeaST3w1w+R8DNu6yaTEaeobAkmLCOBFaY2/273tA4/e2iGCXuGPhXkf/DZaIML+MqO5d3/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alt1eMxf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750673295; x=1782209295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dix0Yhu3c8boRB+3OYeK+56zmV1v3N5vctgiK7sTU9I=;
  b=alt1eMxfR2YNfH5FQ56VKCliDoU79taO9Lity1B5H2xxOyw/XlIXyGEo
   Ss7paGoKhbalhHDwxEmQeKKGFxbrzhI7hWisttGmQ0kiKFILHu53YdHiz
   QVkrKaCDasyWi71GkCgOjhrx5YjOvXuYgFRq+q+ZwKhQkNTCq2R5XH+zi
   Eeo+VpJsFQWdWAjqwsxVIW1BQ4EU6JO2Vei39/6UjFQraQsCZrBc39W0Z
   JY46Vo1lBVuG4pn3Hecu9+Aw9kYvEONj1CYKJCaGXuiwMNfDDBZ++atRn
   rS2d37B+106vjNpwLkILGSL6AYnAFA2ve3znfQbTxV/j5DVBAUMzvr7H7
   w==;
X-CSE-ConnectionGUID: 2Gf7c0wYTqyHCGSS0nPGrw==
X-CSE-MsgGUID: TWdwYcYMRU6yGlqQZV63Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740974"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52740974"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:08:14 -0700
X-CSE-ConnectionGUID: b1RtfYh9QqGx1/7cVXdpcA==
X-CSE-MsgGUID: lQO2/vW8TGuyVMaj/z1Yig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175160611"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:08:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 42C691201F7;
	Mon, 23 Jun 2025 13:08:07 +0300 (EEST)
Date: Mon, 23 Jun 2025 10:08:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev, ~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Message-ID: <aFknh7weIKoGKajQ@kekkonen.localdomain>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
 <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
 <13788127.uLZWGnKmhe@phil>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13788127.uLZWGnKmhe@phil>

Hi Heiko,

On Mon, Jun 23, 2025 at 12:05:22PM +0200, Heiko Stuebner wrote:
> Hi,
> 
> Am Montag, 23. Juni 2025, 08:47:44 Mitteleuropäische Sommerzeit schrieb Sakari Ailus:
> > Hi Olivier,
> > 
> > On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> > > This series adds support for the Pine64 PinePhone Pro's rear and front
> > > cameras in Device Tree.
> > > This is based on some of Ondrej Jirman's patches hosted in his tree at
> > > https://codeberg.org/megi/linux, but I have also fully reviewed and
> > > re-written the code from the RK3399 datasheet, the PinePhone Pro
> > > schematic, and the IMX258-0AQH5 software reference manual.
> > > 
> > > I have tested these changes on my PinePhone Pro and am able to take
> > > photos from both cameras using libcamera's cam.
> > > 
> > > This series has raised a question about the proper label name for the
> > > front/user camera and rear/world camera for phones.
> > > This series is using "ucam" and "wcam", which is used in a few other
> > > Rockship DTBs:
> > >  - arch/arm64/boot/dts/rockchip/px30-evb.dts
> > >  - rk3399-gru-scarlet.dtsi
> > > 
> > > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> > 
> > Thanks for the patches.
> > 
> > I've picked the first two in the set, presumably the rest will be merged
> > via another tree?
> 
> correct, and with the first two being applied, I can now also safely pick
> the other two :-)

Once in my tree, they'll next end up to the media committers' tree and
after some time you should be able to find them in linux-next. This process
will take some time. Just FYI.

-- 
Sakari Ailus


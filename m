Return-Path: <linux-media+bounces-35569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976FAE3623
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E93697A5F2B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC4B1E5B64;
	Mon, 23 Jun 2025 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwPXFBpd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94D78F51;
	Mon, 23 Jun 2025 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661274; cv=none; b=MIMlgNtIGg6YxgR1RZ9AnYyXSBWNVpMMq+3B3XS6PP1fFu9UdMFImTAEwGYHWJAvStn3ugC/YYeyIr3C3DcSRW77n+JKMN6YNNc3iJ+Fz8gb44bKH3p/DjXx2QE5lg+wUj5DcGiMmxzB9NGRrA6GXj/aKUVuUwBi1tvFtuK2tog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661274; c=relaxed/simple;
	bh=YS5QfchkXQuDpizebXwc+i/GQO/Ujou+O/e0qMENePo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS9PPdbRoZ0DeP0k4A5DMlOxwHdzCp/mJKUgfw8xURLLduoytzQpqFYgrKv3mtfZ4boHR8Ruv3PhXJRcEuIOHe7JRnksFV3d8TbibN9RzhFnqgMz+0XRLlGecdDrf5EKNfJOrE+WM3hMJ9g6pZfhyH1hvY0dgZo594u/HDvkM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwPXFBpd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750661273; x=1782197273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YS5QfchkXQuDpizebXwc+i/GQO/Ujou+O/e0qMENePo=;
  b=SwPXFBpdFwt+CSnBgkBnprVADEbNvKzDB8vyxuue6b2yjBAmNT4PKd0n
   w44dyr2LC6dqkrX+2ybT/ZKccu/A6N6QqkNHLskiGL7xtSF+xZul/Z7zR
   AOZLG376z8PtvuNw9NjYy82JkNelJYjp0bvbiwv8aVrIo6aA147jRCYVB
   bR/sBqgoGvCvZUJqpCMuEDMNcbQMC9npVFWzLzqOGeRU0FyDEpZKdbG+I
   qCK46NlYG78GO9x2z1gOc3WCohQfM35q1ySwZ7pIjMXT7XjjBPxZtys3W
   Q5smpqjuLlB01MFmne2+hBLBR14G8U+cOS0Iicf4GW3WnzFAVcxb/izZF
   g==;
X-CSE-ConnectionGUID: gbDNnaQtQEmlN66WmkcECg==
X-CSE-MsgGUID: 2uslWLd3RD6SB8WsMuZW1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52991727"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52991727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:47:52 -0700
X-CSE-ConnectionGUID: mNrnjtrWSK6xeohGlUJjsw==
X-CSE-MsgGUID: Pz/9sXzLRiW91MMh1pUT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="150924944"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:47:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9431E1201F7;
	Mon, 23 Jun 2025 09:47:44 +0300 (EEST)
Date: Mon, 23 Jun 2025 06:47:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
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
Message-ID: <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>

Hi Olivier,

On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> This series has raised a question about the proper label name for the
> front/user camera and rear/world camera for phones.
> This series is using "ucam" and "wcam", which is used in a few other
> Rockship DTBs:
>  - arch/arm64/boot/dts/rockchip/px30-evb.dts
>  - rk3399-gru-scarlet.dtsi
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

Thanks for the patches.

I've picked the first two in the set, presumably the rest will be merged
via another tree?

-- 
Regards,

Sakari Ailus


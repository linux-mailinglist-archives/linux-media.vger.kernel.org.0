Return-Path: <linux-media+bounces-12505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B88FAD35
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F84AB21880
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 08:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9901422AF;
	Tue,  4 Jun 2024 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDe9ZVCg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CD446CF;
	Tue,  4 Jun 2024 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488782; cv=none; b=KirgqMB6UMB6lWEjryMxNypDriMB2uR3WXGKfbP3Kb8rEktOdwZ41qqQusne8/uqi0e5s771fsusHcsZ7Jdadxd83DhzkHZFLEiYdsdiA2gpYxfxlyyJ3k6fnLD+5SUVCZtFxhX9XIk/GuZTW/xauMRK6rjFZA1o98O9T2sjSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488782; c=relaxed/simple;
	bh=IUW2B66zglTPFtJQ8pWUpEiPWX7KR3/WKlHiDVvPWBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6VdIMijAMk8XrQAVo8zT0qhU3HJvoK3kwBCmN0iy/qeHXgEaV3uusOj4FtOh+Yhh0buFxm8kzahMYc7hFeahSzq+QVRr2mFlJEmwkHPksfcmf62FDBcp9bd/NGJx4Pk2tWpwI1gDfBL4t1a84Qaw19nJMRYKxQ+EIWfaitn2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDe9ZVCg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717488780; x=1749024780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUW2B66zglTPFtJQ8pWUpEiPWX7KR3/WKlHiDVvPWBs=;
  b=hDe9ZVCglGsfrP5rAxHWGQMDtUvS52NWHjTrDp4MnhZW8qfDUthfrrNn
   FNqO+rIZWOnIfRQiEbNETUMYhd7sv5TDVL0mMUkFo520u+Teq5ay3PyVx
   DhFvNvum2rxCDb4+jEJ4zgOcUMyiycuzWXU2NyS3kS25w2rvOyU2e+vt2
   IDsKD4zGGUHx5M0uDVMgMtjcFVYGHlSfUGdqlZUGOXPvIkar3ueh8H3Ob
   NdM7jJhhf/0pNWkGAn8zj2jsXGDiOVOfRH2Wb6hN3bDoOFIhscS0lQWFo
   O+HV7LtFMuB9C8K4OmW/WUaHWm2sEYhg/JDvx3C7g1Dp2aG7m5OTnww37
   g==;
X-CSE-ConnectionGUID: M5ubC3fvRq+Uu6Y5AN4nQg==
X-CSE-MsgGUID: /IO2qM5qRdaik3rEgUGHtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13825743"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13825743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:12:59 -0700
X-CSE-ConnectionGUID: a/q7GY0wR4mKWYbZhvEtcg==
X-CSE-MsgGUID: 5Z830YFKT+GoDQ3tx2NI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="60325023"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:12:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BE57C11FA4A;
	Tue,  4 Jun 2024 11:12:50 +0300 (EEST)
Date: Tue, 4 Jun 2024 08:12:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, 10572168@qq.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 0/2] media: i2c: Add support for GC05A2 sensor
Message-ID: <Zl7MgsleDr66xMAi@kekkonen.localdomain>
References: <20240427052233.8915-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427052233.8915-1-zhi.mao@mediatek.com>

Hi Zhi,

On Sat, Apr 27, 2024 at 01:22:30PM +0800, Zhi Mao wrote:
> This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
> GC05A2 5-megapixel 10-bit RAW CMOS 1/5" sensor, with an MIPI CSI-2 image data
> interface and the I2C control bus.
> 
> The driver is implemented with V4L2 framework.
>  - Async registered as a V4L2 sub-device.
>  - As the first component of camera system including Seninf, ISP pipeline.
>  - A media entity that provides one source pad in common.
>  - Used in camera features on ChromeOS application.
> 
> Also this driver supports following features:
>  - manual exposure and analog gain control support
>  - vertical blanking control support
>  - test pattern support
>  - media controller support
>  - runtime PM support
>  - support resolution: 2592x1944@30fps, 1280x720@60fps

I was about to take the set but then I noticed the driver and the DT
bindings are missing a MAINTAINERS entry. Could you post a new patch adding
that. Same for the VCM driver, I think it was missing one, too.

-- 
Regards,

Sakari Ailus


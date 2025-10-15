Return-Path: <linux-media+bounces-44577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D04BDE51F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1F33E69A0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22B3322748;
	Wed, 15 Oct 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPzj8Z/e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56157315D4B;
	Wed, 15 Oct 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528814; cv=none; b=Nm6D3NQg7PoPn2XopJmwrFx3DiojUapKHKvSy3e6FwC56qsrWBhSsjNLrf+vzhVpbKjmoeA4ykV3RhOfsvqzw+SZYoLtNrdBAEKsu5QCtkA0i1Us/Wb3N2lGP+LO36BCKFnx6lLcrrYlqXbqGkdiTxgczAm/wF/LywOTjitUONk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528814; c=relaxed/simple;
	bh=0992u7vgICnO1NdsO/eTd/pHfpQZSJGYyWihgfFSCww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlL25S8eEdlP85D1D+HBQQa2YUg+bSNnRZ3zlF7272fMZTGWST79D/OKeoevTxxfUzbgRV38QaHCEAV+oRXV0/ORWSS70Va/DHbWbR10rQY8xf4FlniGLNNv0ElZGtla9kjKmDIsTKVxjdt8rbdOpLg6P+k7AuDWOQfvs3doXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPzj8Z/e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528813; x=1792064813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0992u7vgICnO1NdsO/eTd/pHfpQZSJGYyWihgfFSCww=;
  b=XPzj8Z/eT7o4GGeCHal6La38H/Xp62ANMlPoVduHEUhC8taARBMqGQkj
   V13C6pMCwJ1dN2A06ZK+yqSUe0Vq0C+twblTgyFbozYPOae7an36WeyCi
   l5nIr2hZB18QTAYFDOhxp5PlRU9MAFJSVPZbS/vhM3PjqR30zZvggDKOf
   CJZnzmiCeFnfiVS4cp8unID5aUkngo8zU23NzyNta46DwlNBwmmnUzIOd
   7Z7JV9DJwSNhFr8k+Z+zbP50OgK//VpIBcoyUxX9k+fVfB9FBhhOEoLBw
   y1BDfM78qfJG74NtHerhkXLqDuAbOQe5ig+NYRxLdOqBADGJii0GNW6gR
   g==;
X-CSE-ConnectionGUID: zy4fzpmdSaq0xYLlaNHnOw==
X-CSE-MsgGUID: pmoVtLMXSjSib6uQ1tR/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73804157"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="73804157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:46:52 -0700
X-CSE-ConnectionGUID: 0qrU/XBMSn6HNPStha/rVg==
X-CSE-MsgGUID: 3FOlRQVPSq+vzNyDn9U/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181706203"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:46:45 -0700
Date: Wed, 15 Oct 2025 13:46:37 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v12 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <idp5tujavppw6ng5sl4e6ffdtzogbnw4rdadytbt5iaxsdhfyg@rs7fq5fawluh>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>

Hi Michael,

On Tue, Oct 14, 2025 at 03:01:46PM +0200, Michael Riesch via B4 Relay wrote:

[..]

> Changes in v12:
> - added Radxa Camera 8M device tree overlay
> - rebased onto v6.18-rc1
> - fixed IOMMU pagefaults caused by wrong VLW (Mehdi)

Yes, I confirm it is fixed :)

Thank you for working on this!

> - fixed indentation of register defines in -regs.h (Sakari)
> - renamed CSI-2 receiver interrupts (Rob)
> - added MEDIA_BUS_TYPE_* as comments in DT bindings (Bryan)
> - added newline in rkcif-dev.c (Bryan)
> - Link to v11: https://lore.kernel.org/r/20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com

--
Kind Regards
Mehdi Djait


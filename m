Return-Path: <linux-media+bounces-24773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF6A12167
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14C2F168E12
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F6E1E9905;
	Wed, 15 Jan 2025 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDPwCkKb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89091248BD1;
	Wed, 15 Jan 2025 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938567; cv=none; b=qcZipOH3tNOAshZpS/kyjirLMGXBnn4aLA99j/lzeRNCIqhc81KFXmz16CZpSCoRXrtqTrOvtpcy12Ao18Q6c34oKHVtvWU3J+OPwlhH2T6Rn+JVfNZwcTv7dJjnc/ds0vftlEZIv8Dejdl8hVvr//vyNPZ/yKCzjLcg/8wllZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938567; c=relaxed/simple;
	bh=a21DYM9Y6e9dtyfgQrzamCDEH03wQiwkyZKuBps1SoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5d4vvTC1bSzOtA/xdSyGLETac3EmBc5gJAJ5DO1V1eLeSBs2awidi6uxvTKIHYdP5+JYbQpbuuCOOsWKrOrx7lrBvlfmTeZkX5KPW0UKeya6OVl5sCBchnpjn/OeiABHyxNpiYdU9wxWIVSzE09bhyOXrLiw54l94ccy9IfwTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDPwCkKb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736938566; x=1768474566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a21DYM9Y6e9dtyfgQrzamCDEH03wQiwkyZKuBps1SoA=;
  b=MDPwCkKbGDvFLgMgVoQgPOC4ydnaPwRtLx3eEfQiK03KBryS0bHHHwgU
   w74FT/wmazmlf4a0By19FWGHl2/Yj7z3y5d8mGy/CuQ2A58fDDRE2KWOF
   I4ESaBKwLBohe4qdS4B04r9336huKh47w6JFWxtSw1nsHw3sRYnALWRq1
   lwgDe4bSQFNEp1UDmcsVtq9qWez+k9IQZMBcdgbvYj8qm343JBieKF8LY
   cUf1mfsd/Ai5z4twJrzdphpNrnu6pXtsOomO0wSM9gFjihh584cyCw3MP
   2xwYDOCYboC3dBetq7YsiOBCPmutZ+Y1p+Kck3++gCWgm931cT4DQ2+aM
   Q==;
X-CSE-ConnectionGUID: 3hV7ylxDQfO6cN/jcSc9QA==
X-CSE-MsgGUID: QYAsEBqnSHKGtQVpYEmGRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48676868"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48676868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:56:02 -0800
X-CSE-ConnectionGUID: TmEfFQvuR1ePkAM3ceV8tw==
X-CSE-MsgGUID: dWdMibSbRlaXaN84cYZa8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="104936194"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.123])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:55:56 -0800
Date: Wed, 15 Jan 2025 11:55:43 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <vbhqvvdjfjv2plavyd4gd2aypy6epybatq22mhgkcenndjgjly@73vacmvvv2fj>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>

Hi Michael,

On Tue, Dec 17, 2024 at 04:55:12PM +0100, Michael Riesch wrote:
> Habidere,
> 
> TL;DR:
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which can be found (in the form of variants that differ significantly) in
> different Rockchip SoCs in general, and for the Rockchip RK3568 Video
> Capture (VICAP) variant in particular.
> 
> The patches are functional and have been tested successfully on a
> custom RK3568 board including the ITE Tech. IT6801 HDMI receiver as
> attached subdevice. The IT6801 driver still needs some loving care but
> shall be submitted as well at some point.
> 
> The long story (gather 'round children):
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. For example, the PX30 Video Input Processor (VIP)
> is able to receive video data via the Digital Video Port (DVP, a parallel
> data interface and transfer it into system memory using a double-buffering
> mechanism called ping-pong mode. The RK3568 Video Capture (VICAP) unit,
> on the other hand, features a DVP and a MIPI CSI-2 receiver that can
> receive video data independently (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the camera
> interface with one DVP, six MIPI CSI-2 receivers, scale/crop units, and
> different data path multiplexers (to system memory, to ISP, ...).

I wanted to CC Paul on this and add this really GOOD summary he provided
while reviewing v6 of the CIF driver: Feel free to add (or not) some of
the infos from it.

----------------------------------------------------------------------------------
So I have spent a bit of time trying to figure out the history of this unit
and in which platform in was used. The takeaway is that the earliest Rockchip
SoC that uses it is the RK3066 (2012) and the latest SoC is the RK3566/RK3568
(2020). Earlier SoCs (RK29) do mention VIP but seems quite clear that this is
a whole different unit and the recent RK3588 (2021) has a new VICAP_DVP unit
(mixed with VICAP_MIPI) which also seems significantly different.

Over the course of the existence of this unit, it is most often referred to
as CIF. Since this is also the name for the driver in the Rockchip tree,
I feel like it is best to use CIF as the mainline terminology instead of VIP.
Note that the unit is also called VICAP in RK3566/RK3568.

Here is the detail of my research on the concerned chips. The + at the beginning
of the line indicate support in Rockchip's 4.4 tree:

- RK3566/RK3568 (2020): CIF pins + VICAP terminology
+ RK1808 (2019): CIF pins + VIP registers + VIP_MIPI registers
+ PX30 (2017): VIP pins + VIP registers
+ RK3328 (2017): CIF pins + VIP terminology
- RK3326 (2017): CIF pins + VIP terminology
- RK3399 (2016): CIF pins
- RK3368 (2015): CIF pins
- PX2 (2014-11): CIF pins + CIF registers
+ RK3126/RK3128 (2014-10): CIF pins + registers
+ RK3288 (2014-05): CIF pins + VIP terminology
- RK3026 (2013): CIF pins + CIF registers
- RK3168/RK3188/PX3 (2012): CIF pins + CIF registers
- RK3066 (2012): CIF pins + CIF registers
----------------------------------------------------------------------------------

I also CC'd Sebastian Reichel, as he might be interested in this, he is tracking 
the upstream status of the RK3588: 
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md?ref_type=heads

--
Kind Regards
Mehdi Djait


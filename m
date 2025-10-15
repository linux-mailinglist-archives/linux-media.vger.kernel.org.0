Return-Path: <linux-media+bounces-44568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2CDBDE467
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A25DA34E414
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F7319870;
	Wed, 15 Oct 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEwDu/3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513E22040AB;
	Wed, 15 Oct 2025 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528120; cv=none; b=Zgi2YdkYaW2sUkNRcY2mjG2v89FNLbEgLnjgLey/y5wLghOPhSZItNl42yu204MbbX03VtX1aQKBRoQI+r4opwPRMJl9bQKEazqmr6JmPGC/VgRe9zkcgX2xqw11WEt32+S8Az37D4qGjG0J2SebGQCPOpY/n0/O1GUqPqV+W0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528120; c=relaxed/simple;
	bh=N8KTLk2i4j4WLjDJhe9R8PN5ffY5bayo6I0hvYve81g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9FzfmItS/YtcAm0VwOqDr2VsldJguDNu4RYYbUMKrj9pxlgb52thO2DzKxW68emvbr/PJ+EF7lD1Mrm/842pNcalnqZJduMXGbI3Rc5Q9dYLPlceZayOOSgf/Nac7zLVPlCWTZh3JQkKb9SZlEUW7RBh7Ix00GzNA24qIFlxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEwDu/3i; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528119; x=1792064119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N8KTLk2i4j4WLjDJhe9R8PN5ffY5bayo6I0hvYve81g=;
  b=EEwDu/3iWa+15ZCmJpC8GAzNC5HIjNZEHFTSXcnJGIDCD06L3zzXrqy0
   UFvpZrLSA2q4E437NRuKlgXHUEM0to37dcwqxVNpe4Ylq9Rse1F02v6XO
   2x20X+dbXXbvdkKsM1c9CYB8QdMm5lGwZ9fgzKFXSXTKwAW1cV5QkMEnH
   mGMCrVQEC8Ari2BfsTvd3a8+tkDvDMcmxR/fbfL1vjRG+RRaUWmxjKM/Z
   HQzNd6A/YkUFzlUpdLpnvCwfjXXdsW4bs6ud0CPVXFqVGjWFxZ057G1rX
   uq299p9ShLRQxh4sdmcZYxarXB9wfaX5iJSkcmiSt3u6HtVeRwlbC8cAo
   g==;
X-CSE-ConnectionGUID: 8DL1BD4GSVyl+YGttG8sMQ==
X-CSE-MsgGUID: gZFp6z3OSEqE3SMmxpsARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62851828"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62851828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:35:18 -0700
X-CSE-ConnectionGUID: t14M/OvQQLKxXxjF7/urHw==
X-CSE-MsgGUID: 99cgwGGKQsu1ghCz7GXPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181952562"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:35:11 -0700
Date: Wed, 15 Oct 2025 13:35:02 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v12 06/18] media: rockchip: add driver for the rockchip
 mipi csi-2 receiver
Message-ID: <j2elclqcuwdkz3lan265u4wucwyiyl5xgb5t7mzzunfn2mwjpm@f7ipn4y2uiag>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-6-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-6-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:52PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
> 
> Add a V4L2 subdevice driver for this unit.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait


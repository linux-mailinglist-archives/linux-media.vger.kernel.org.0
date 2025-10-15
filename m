Return-Path: <linux-media+bounces-44576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67EBDE50D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2181250333D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE871322A11;
	Wed, 15 Oct 2025 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2oEuqv3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B346A215789;
	Wed, 15 Oct 2025 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528640; cv=none; b=j57Iy3dXQU5mzLxyVGEJ99ZqhibMmm4PDDYyZuOVhosicMIPLNI54Ub8Wo0qDpeq/tuOhmLA/+Fg1KpWvhBOPM85Bwhtng/8WWYNoIBuqfofu+wVRz6e5yQWitbGTIE2/gQ4vwEitl1DoIDZB4OmysMKI2LQ9G1JYUx0eZG3Oao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528640; c=relaxed/simple;
	bh=miYSu1LPLdNXLFjYZeB5thUSy7spz6vtTLvEDGYlY9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYQ0eDXVNmQAbv/AtHeZSlhe5eBtYNwLv2A5U/nvQR8vo4alV4WuX5aBme5jojSUjTh5VRGygbQ8P0bSAcDv0lVKFE0FY+yQ2NRbUYb9ZfRC33Sc0s+sycv0eY0Wnvf4IiMsglE8s206i4jQbRT30ljwa0+j0tVtetOILR0xV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2oEuqv3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528638; x=1792064638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=miYSu1LPLdNXLFjYZeB5thUSy7spz6vtTLvEDGYlY9s=;
  b=E2oEuqv3z9VkkdZn2luxbdZYiazgtAuiPOZAjhFjNPAyaxDrMQwU0CTd
   enfnFV6XxWfhCii1oDQOonPK7EcfOundN78YO+xe+yUjwLLYdglBxu8ON
   vDS/2TiFQ3gQ42IW9JBeuM6J/FOZ2FcyNjL8/nnKXyZMI6skqxUB2/FGI
   xdSM2JosxXMI17EUNSlLzwaXVy9SBJkxjJSpeVsM29E8nEZdrXl7W7+IA
   5a7IrhSaAthb8zjQfw4md0hRQiaKLjQWx6tGk6QvS5Wc+k1M3W8dOcZ6n
   q89Hvy6wFBFSFdgKCm6orfO6CMx2jPRTs8LdhjK1ILKnWt6L58urdvxcA
   g==;
X-CSE-ConnectionGUID: p7mJ9BeoTpyDZyJxPieUBQ==
X-CSE-MsgGUID: UNLfHWLTRtKbNFUuVJi8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62629919"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62629919"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:43:58 -0700
X-CSE-ConnectionGUID: mQKUYlw3S8iaBcplvqNx3Q==
X-CSE-MsgGUID: INuGmheQT9i7r/qyZGBLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182937528"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:43:52 -0700
Date: Wed, 15 Oct 2025 13:43:45 +0200
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
Subject: Re: [PATCH v12 13/18] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
Message-ID: <cli7lpea53u3vp2jyeq2ysitv5mrspeq63im667hy5ijsxrpgs@2qdcrgsltcjd>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-13-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-13-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:59PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
> are featured in many Rockchip SoCs in different variations.
> Enable the drivers for them in the default configuration.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait


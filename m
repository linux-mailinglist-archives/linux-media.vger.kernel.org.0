Return-Path: <linux-media+bounces-44573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2DBDE4CB
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B703AFEC0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131A032253C;
	Wed, 15 Oct 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhSvgptJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83071A23A9;
	Wed, 15 Oct 2025 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528442; cv=none; b=pCRkTM0IG0nldKiQV3uliXLFrsKjTBw2rB99TUL9Za9RvPNRAQsP/ZIMJ6aV9Cfqz8rhd1ZrFFQF7mxiwkZiRqz6a0WsPoVurcrLcXHg+rito6bYeBThGNSIQOyA57KDiCPqq2n9yQ3UcY0kugABBkyoKdNB+GUNnD8NOedjb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528442; c=relaxed/simple;
	bh=wDHNh4uY8xD9ebnDG2xoy5T2v6V+iqaappaYjVR+kyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEPRmzt2NdE/+mdBsILyAnGlSTD6HayfUlLxzdbH1UXFFaTPYSPkQOpg5hiiFKxwReEQzUfohO+v0rg/m2j8oy8033z6X+EkBOFJBX1Z3eQEqr7I/2BHw4+ZuT3EM+WHIzgJYBXyTalL44HFPNRfrIWYrlKF8YT1mBXgWkI0xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhSvgptJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528441; x=1792064441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wDHNh4uY8xD9ebnDG2xoy5T2v6V+iqaappaYjVR+kyw=;
  b=lhSvgptJaX8FQNTOtwuSmtrYS/Bqq49ggH2RRj2Qy9fLsPbiUCQoyDeY
   l3oIhhTlxlDYbmyI33YQWfhYPwQqsJr62qth4++oLZvTU/BnWbZnlpEh2
   /aBkuJchzgh2uG/vVJi9j/rYZIHYmz+t3evBLi1wPaS7YFvkHqE1DLh14
   fq93yH9K+wvCDPmiXgBMwvES1+ygoKdMASwtb5T9Nm9ap6P3PZboaftvo
   Bofh4XPJeZnBY6WXzQTPgyN9tWkZ7yvbfkXAAQBFNougFK+0wO/nZR0/e
   xkV6lN8G4rZm/zZSr4NvQ7nLhEkaC/o80PRdX0vebzIls5e9Dz5KyHBDt
   g==;
X-CSE-ConnectionGUID: ZOtJVcTATdKP7ethG+TGMg==
X-CSE-MsgGUID: XkndfU5nS0Gw3n+co/EoeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66353838"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="66353838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:40:40 -0700
X-CSE-ConnectionGUID: 6d611QceSMCabPeGf4aKYQ==
X-CSE-MsgGUID: EgvxbpLISJarCc7NEnJ4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="212757525"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:40:34 -0700
Date: Wed, 15 Oct 2025 13:40:25 +0200
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
Subject: Re: [PATCH v12 09/18] media: rockchip: rkcif: add abstraction for
 dma blocks
Message-ID: <gzh4rpbkrp6vkc3mimhwhgfgxm74iw2bw6zhlzdtqenrbp6yhr@ekjpefq7wege>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-9-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-9-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:55PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add an abstraction for the DMA parts and the ping-pong scheme (a
> double-buffering mechanism) of the different CIF variants. Each
> stream is represented as V4L2 device whose corresponding media
> entity has one sink pad. This sink pad is connected to an instance
> of the INTERFACE/CROP abstraction.
> 
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait


Return-Path: <linux-media+bounces-44572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EDBDE4C3
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC0FA500EEF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5B4321F40;
	Wed, 15 Oct 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBUoKz1H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0185187554;
	Wed, 15 Oct 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528378; cv=none; b=qIMUpznCPLf3ziKr1E2wdLu9MXD06o4Dvhov/PiD8LtVmQWUHHgmWOBkjMxQHX17MHS0gyXaeM/CAtIq1pMt1p1NZY10t+rmp3w4fw3XLjU4bN7usLa+i0Zm5T1wbJd+Iu0TwGNX2UEa6MSw9KPHPRRbnDH6lKhic+I/EQ/A0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528378; c=relaxed/simple;
	bh=TXu0uh7CCLhF3toLYB57ykbCtHisNyv/kjrZeA9vK9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9jfD3jeM5ut6x6tgmWLAApW/lLjT4Q78gAMw7lSsJI+yPW/S85T58GacyuDjb1+dAr6xX6CR5CNk41Axkt5FQPIr2b+iV4ZD+l2iC5v4pPX1s50yMpPYdPiblidGHl89lST//YamA1af8TEye+bllbjQc/PPXOVw6OUceLDwOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBUoKz1H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528377; x=1792064377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TXu0uh7CCLhF3toLYB57ykbCtHisNyv/kjrZeA9vK9k=;
  b=lBUoKz1HzKewGPr4t5iAGeMLLc6l2HF7jyiW77lIAmxaTPN6p53hcYwX
   GF4pqTsMhJBmJo2qGCEp0npn9Y4DfYuIjjnbQBLWcFN7HdKMrpiEV+/rc
   JngCgIpAFqAVUZDreXocd0lBP1o4/LGQhBkgF1ARLQgHUI2FFYqkwGSej
   0lcN6bNicRmRNY2HZNVjI880T5N4fiS/sABEyxB5dXQdBFDiqZdh5m3nt
   s7jmR2Hjx5zl9oLjBZlYteAfVlxyRPbSXK+rGPVajqTRzx/GBFwfrotZA
   rl4pm1Vfgt++Tv03rR8oI7hmROiCRioVjsmH1J2vDrNsmiYL9bMc9wGB1
   Q==;
X-CSE-ConnectionGUID: vBoEkiOlQeWU7m7LiRmR2A==
X-CSE-MsgGUID: TF1/AFcFRrejybJAsN6DJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="85317984"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="85317984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:39:36 -0700
X-CSE-ConnectionGUID: WFNW40x6TH6qFAmoRoGiFA==
X-CSE-MsgGUID: NjIqZYg9TfO1WpOAutWVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181281878"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:39:30 -0700
Date: Wed, 15 Oct 2025 13:39:22 +0200
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
Subject: Re: [PATCH v12 12/18] media: rockchip: rkcif: add support for rk3568
 vicap mipi capture
Message-ID: <dzdactqc2rajva7qwfua32b6rj2a2hfehj5xwiiobuamoy4x6i@cptlfyp6czrh>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-12-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-12-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:58PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
> interface. Add support for the MIPI capture interface in general
> and for the RK3568 VICAP MIPI capture in particular.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait


Return-Path: <linux-media+bounces-44574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF1BDE4F8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7328C50456F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01ED32277F;
	Wed, 15 Oct 2025 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0jMDy6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055B32275B;
	Wed, 15 Oct 2025 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528501; cv=none; b=LsnZcxR5cCeSU6JEzkcvLUg7yjQt2hqOR1FBjij/0l6uf2WtNcE/VekWBpLvxlY1SIaAiohtzf4p5CNrPJ55kqqWBSnpObR028aHiNVIVdLcpDzNUP3yIFcGanq2Mtyw77OsP9FQtUdX31Pxy0P/LDIbKt0MHkC/DYLAj21QVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528501; c=relaxed/simple;
	bh=Nr/HSx476NwD9xvr2iYYf3ng+JKmsaSImgAkyFBJ7rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiW0edxhE2rlcTZyT39DmcBpYBF+sGX35DcN+2U03bD1jaylDa1PApwMu6ehJ4SSv5BGrzzG6MlPFkiQXZD6jngzPDn4LrryjWhR/v+sVtW7oioD0OgkYMhMPI04AnOBnslJ66UwNCpeRffWZcFvRHb21/MaqF/4yTrtpJ4fVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0jMDy6i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528500; x=1792064500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nr/HSx476NwD9xvr2iYYf3ng+JKmsaSImgAkyFBJ7rQ=;
  b=i0jMDy6ign/fd1QvDityWuPfwJuldQF6hl8net+kEekVPD7X9hGXKhwP
   AKZIFc/tKlx3JGvSxF75DVUw+uCqgv5sbSHwrSBZ4Flp3dIy55kh2WUcv
   2cfqr1iuOYoMxZqZjYtiJCmUdNUnwPFU8qEJTXP7RN6b3gdz7Q7VudxXu
   XNcgyGgKW7n1/1fKB3XDNZqodcRDxbpJTXE9Kxv8ZhZeQ5b6PCLoFgXrE
   dJLtkS3DlvS4SgvN/1YchXoGuO3cePeZNWyxC1JZpqB4URtknsY2g6PSS
   jssIKoW8Kk6IWRXGVD6kSBw1JQuu4OLmTGs2LUefTBJMzdJWRrbiA0+Pe
   w==;
X-CSE-ConnectionGUID: n4fgRRewRqCzN7EbHzeizw==
X-CSE-MsgGUID: 3pzZB3E7TCCYLdbS1uVQ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73302555"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="73302555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:41:39 -0700
X-CSE-ConnectionGUID: 8ej06mtrRtq9JiZ0qDkxWg==
X-CSE-MsgGUID: UrstU36BR0auAEcQNKL3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181831045"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:41:33 -0700
Date: Wed, 15 Oct 2025 13:41:25 +0200
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
Subject: Re: [PATCH v12 08/18] media: rockchip: rkcif: add abstraction for
 interface and crop blocks
Message-ID: <ytwvzuk3wrxw5z5pbmmez2ewpkfwghaueoiovzgt6d3dumls4e@ebkdumjrsiby>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-8-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-8-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:54PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add an abstraction for the INTERFACE and CROP parts of the different
> Rockchip Camera Interface (CIF) variants. These parts are represented
> as V4L2 subdevice with one sink pad and one source pad. The sink pad
> is connected to a subdevice: either the subdevice provided by the
> driver of the companion chip connected to the DVP, or the subdevice
> provided by the MIPI CSI-2 receiver. The source pad is connected to
> V4l2 device(s) provided by one or many instance(s) of the DMA
> abstraction.
> 
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
 


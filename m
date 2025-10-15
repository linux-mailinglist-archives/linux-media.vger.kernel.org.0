Return-Path: <linux-media+bounces-44571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D40BDE4A7
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEE84502C04
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F11321F22;
	Wed, 15 Oct 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKhIlkwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030E3218DF;
	Wed, 15 Oct 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528277; cv=none; b=eskvRBaIGS4PmHhoxiSxup7sLODon2/8jcwd6G9zxv875TrFwrgPuBoU1nW6dhbv3Lkpf1UCUKxh+9/z4Tx+x/DsEXkWF+S9JaHSb0rDChX66osnpeEtM9ACHoTfy2ZSUKhtWbpfcsCQ4ExCj0DSDhj0PfbAH5ir7OE/QBG12A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528277; c=relaxed/simple;
	bh=BJ+2SR/KpWGdwemam3DESbxbbfj8Nd9/wR+hwgNUt10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTsxcLg8o4SU4AzD4VwFy/jFGq0EPmhZ2UxJrneZLC8uzfD4bZeCZNklfmH48eB/pciIBWmi/xm1zaAoEfkcmiRmDh4LymA8uGn8S+vMYjsYBRNdk5PW8LQjjLV8HD+P9zX27sp7FbAFMKtcirdScTptjZzg3m7zQe2xo6NEAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKhIlkwY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528276; x=1792064276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BJ+2SR/KpWGdwemam3DESbxbbfj8Nd9/wR+hwgNUt10=;
  b=DKhIlkwYpJl/4Dw5nBcoxO19TI1r34S587/iHRmsUkuCqT9oiORYdQi4
   LAVS0BSsxTSFNxPtMX/3O1deHRb/qeGWLd3RkYPTLZtbRBfBjMEyfx+pS
   IuDfiCz6dhZ4uXcvlGPHF0t4gBr/NEsS+ifuzXeYHOXagscWkRELSdty2
   E/4bumgnM/achmR2l0YtTaX0mFakhhqWn/42Vzl9KG70SbeWLYWdRmKw6
   /u3iewRUbkDyN8s1vFOm165WBb0cnkZnNnHx6gaK/aQndv3jufpuQBMDj
   DVlm8+VGTMqYqWNbtdbQjs0Nnk6PJsRrd+U06Q4hS//XZK6M0d8LYg/7i
   w==;
X-CSE-ConnectionGUID: 2EJCX2c7Sl6n+TYj/ZSpgg==
X-CSE-MsgGUID: Jg4etL0ETdSpavgiYPhGbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62795981"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62795981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:37:55 -0700
X-CSE-ConnectionGUID: /Orw3SdKQBCjlEN5Hkydig==
X-CSE-MsgGUID: F4S/ezpqRiOXba+i69Fv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="219294054"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:37:48 -0700
Date: Wed, 15 Oct 2025 13:37:24 +0200
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
Subject: Re: [PATCH v12 10/18] media: rockchip: rkcif: add support for px30
 vip dvp capture
Message-ID: <w4hx4pk44vyg2j7dxp3yv2dih34fay2p35egrv3b5doh6go7rx@lli3njjm7hmg>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-10-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-10-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:56PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The PX30 Video Input Processor (VIP) unit features a Digital Video
> Port (DVP). Add support for the DVP in general and for the PX30
> VIP DVP in particular.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait


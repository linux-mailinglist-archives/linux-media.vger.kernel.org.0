Return-Path: <linux-media+bounces-44569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82615BDE489
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2BB41356F5B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB3C321458;
	Wed, 15 Oct 2025 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb47XcX+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5A31E0F9;
	Wed, 15 Oct 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528191; cv=none; b=ClmEz2C8Y96ljH9sLsrYHk3ibQOW4hJoud19vFTC5zxl31xpsk8VJp6lJMYiTW3w2ImW7mpLzFdcPqth7/lIIo70/BHFpfOST0r6WrQx+jYc9Fsfxu686zkZpd/k7281hQhnZpWkPcSs7p9PRfJVQkIg7BYwTo2xPoIB6RYYz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528191; c=relaxed/simple;
	bh=ErQnLFtT2VWWYam/1SWthYQckbFaJsg61CQEzmoDe6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQkLQJvKp0yBXRYZq9m6bYK/7Ittyo7k98qi37G+TYO6JsbeIU036OfZ4FlEaMV9YH7GukY6MXcckitg7jJmw03s+yJBjukwCo97vLK433agJS0ZMgs+Jx2NtHIH0thn75jLyC9l1R4r4E0ZMd2sSEFz6L+zc7mxjV7SWGrcOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb47XcX+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528190; x=1792064190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ErQnLFtT2VWWYam/1SWthYQckbFaJsg61CQEzmoDe6I=;
  b=Zb47XcX+0wBuLfiRTFyZF3LavHVB5Va2WUeCYQ0QLb8K09l7diP1YZYV
   GpOOCtCYAhKUuZ+NtA3gQSMUZ+0nQp/X/xhZYfRCPpLUenuXQskw3SK0E
   YcUcl1Hccu6VRqU3D9p0yOJk5COMc+q5yajQaq3JNxNwadWzQ/oOfJFqF
   KWa8RM40azX83wIRhIdpQ3+b5HHVN1C/I0WTx1qMq6UpfDDlAj3qVsqHw
   egdkCvAyCWvz4BGNK6kiXiFhLtheMGOckQFsr3kuqgv21hutcx1GtO2Nq
   Ezxe0vV1am5bhlCOBqPga55zDNF9HWaqToQ5VWkdL3qtmjEkuovP4tQiH
   w==;
X-CSE-ConnectionGUID: u4zfMztIQUex/IhwuGcBQg==
X-CSE-MsgGUID: C32478awSo+P9TvoaVCEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62795853"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62795853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:36:29 -0700
X-CSE-ConnectionGUID: /d3Ph3l1RMOBRNZIpR99nQ==
X-CSE-MsgGUID: YraqQavTRsCnt2mqqJxSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="219293820"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:36:22 -0700
Date: Wed, 15 Oct 2025 13:36:15 +0200
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
Subject: Re: [PATCH v12 07/18] media: rockchip: add driver for the rockchip
 camera interface
Message-ID: <nrf4epgtmhujwdtkhbsjgpunqvwqxs6a4utipxgphakxi7hwsh@muazbpt325wu>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-7-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-7-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:53PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add the skeleton for a media controller centric V4L2 driver for the
> Rockchip Camera Interface (CIF).
> The skeleton features support for the PX30 Video Input Processor (VIP)
> and the RK3568 Video Capture (VICAP) unit.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait


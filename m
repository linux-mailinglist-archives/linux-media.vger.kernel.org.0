Return-Path: <linux-media+bounces-31544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8814AA65FF
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 00:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB86986EEE
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 22:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C142609C0;
	Thu,  1 May 2025 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyxB2h3v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844714AD2D;
	Thu,  1 May 2025 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137002; cv=none; b=UH23SY61i26Y1qxIqkOX1UoWWhORialoSXBVReSrMVmA+kqoR93U+AinvKmI9sM8JuRJrn6LfP36vnXfDTuA490zzEe4TIMHOlxpQ2Pm4qdxHeo1RZL+9XUqGXYmDIj1gC+fJgzBsqv0PPbLi4LpEEEWXDeZahXeIJPOKXiBS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137002; c=relaxed/simple;
	bh=DPAjQ3tcmkEJv3Lg42rr0PDxLthYy4jnQbe2u0kwB4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyM/orQYLhWzNtKJzb7smruNGhq7hiO1gAukxjKh+J+sQjC7mXQy7sITPHcOQ5Q6qrfQ7ScOea1/gGX7cndbeWrfcB4h9vS2gCxvN8Sdxa+u8/MZZ4rFazTNlbXdJToxBYEEjpLoZ6i3NIuROgSquE/kmf55bS3pgf1Rg0XvGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyxB2h3v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746137000; x=1777673000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPAjQ3tcmkEJv3Lg42rr0PDxLthYy4jnQbe2u0kwB4M=;
  b=HyxB2h3vU/I31qAOr57dKRjm+EQ52GUSwuZ60AG+zK2TiAbFMeSvBmyZ
   pA475POhbo6A/zxYdKg8j1SIl5tnC+B5wNA8vIk2Z1+wz3geJX77/5Q6A
   1NITNS7rXHCkuvSB7xtfNyNFhWb1eVudd8ztKd5N0EBP9NMtndOEQAvv7
   /eVHWRCbHQia5O0XtK8glHyUjDLvvqo5RTCJIpU1mVVHCJUohvJzaGAOw
   65T8NAIqouhBMAoKg6smCQBnEw1z+r9IatcXcsYyMH2hJFg1uG6tFNI9O
   HKEKCrTFFHUsK401YZriqJbxUzC5c+x9d0Y2BZhd5cf+6MlklBM3xaC7k
   Q==;
X-CSE-ConnectionGUID: 9MZIePiARzqedilBErtuqQ==
X-CSE-MsgGUID: oM2m9zksTkq2t7228d6Fww==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47707633"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47707633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:03:19 -0700
X-CSE-ConnectionGUID: x/h8zWSZSKGq/ivGo4f39A==
X-CSE-MsgGUID: oZ/+2AXHTPKdy9kwJsTIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165547378"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:03:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1EC6011F96E;
	Fri,  2 May 2025 01:03:10 +0300 (EEST)
Date: Thu, 1 May 2025 22:03:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v5 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <aBPvnkdakh9AtAjv@kekkonen.localdomain>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
 <aA-hsrXa_bwiDVKS@kekkonen.localdomain>
 <43682906-f965-4e6e-8f60-22217c34fd39@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43682906-f965-4e6e-8f60-22217c34fd39@collabora.com>

Hi Michael,

On Tue, Apr 29, 2025 at 06:08:51PM +0200, Michael Riesch wrote:
> Hi Sakari,
> 
> Thanks for your review.
> 
> On 4/28/25 17:41, Sakari Ailus wrote:
> > Hi Michael,
> > 
> > On Thu, Mar 06, 2025 at 05:56:06PM +0100, Michael Riesch wrote:
> >> [...]
> >> +
> >> +const struct rkcif_dvp_match_data px30_vip_dvp_match_data = {
> > 
> > Can you prefix this with e.g. "rk_"? It's not static...
> 
> Will do. "rkcif_" is the prefix for the other global symbols, so I'll
> use that here as well.

Ack.

> 
> > [...]
> >> +const struct rkcif_dvp_match_data rk3568_vicap_dvp_match_data = {
> >> +	.in_fmts = rk3568_dvp_in_fmts,
> >> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> >> +	.out_fmts = dvp_out_fmts,
> >> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> >> +	.setup = rk3568_dvp_grf_setup,
> >> +	.has_scaler = false,
> >> +	.regs = {
> >> +		[RKCIF_DVP_CTRL] = 0x00,
> >> +		[RKCIF_DVP_INTEN] = 0x04,
> >> +		[RKCIF_DVP_INTSTAT] = 0x08,
> >> +		[RKCIF_DVP_FOR] = 0x0c,
> >> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
> >> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> >> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> >> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> >> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> >> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> >> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> >> +		[RKCIF_DVP_CROP] = 0x34,
> >> +		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
> >> +		[RKCIF_DVP_LAST_LINE] = 0x44,
> >> +		[RKCIF_DVP_LAST_PIX] = 0x48,
> >> +	},
> >> +};
> > 
> > Does this belong here? Or on the user's side?
> 
> Not sure I understand your question. The *_dvp_match_data structs are
> mostly used by rkcif-capture-dvp.c, which would mean that they belong
> here. rkcif-dev.c stores the pointer to it, but I think it can be
> considered an opaque data structure.

Ack.

> 
> > 
> >> [...]
> >> +err_streams_unregister:
> >> +	for (; i >= 0; i--)
> > 
> > You can
> 
> ... use
> 
>    for (i++; i--; )
> 
> as you pointed out in your other mail? I would rather not, actually. I
> think this would require using "i - 1"...
> 
> > 
> >> +		rkcif_stream_unregister(&interface->streams[i]);
> 
> ... here:
> 
> rkcif_stream_unregister(&interface->streams[i - 1]);
> 
> which I find less readable. Or I am wrong, but then I did not understand
> the for loop definition above, which would mean that it is less readable
> than my version.

Would it? The values inside the loop are the same, it's just the loop that
is different and does not require a signed counter variable.

> 
> OK for you if I leave this as is?

Yours might be slightly easier to grasp but making the variable signed just
for that is not very pretty.

> 
> Unfortunately, your mail seems to be cut off here. Any further comments
> to the part below?

No, that was all for now.

-- 
Regards,

Sakari Ailus


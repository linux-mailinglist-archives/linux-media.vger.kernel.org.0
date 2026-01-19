Return-Path: <linux-media+bounces-51028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0646BD3A3D9
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D37E93027818
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9DD34FF59;
	Mon, 19 Jan 2026 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzzHXvLy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F143093C3;
	Mon, 19 Jan 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816594; cv=none; b=Ci6kMM2HEcW+GUYBINRVCg6+oNZmC9G8hOuFLBFibzSUNgcXL+Xv7tNc0KS52/9sBVrOxSJPwkQB74hQuItFQT0zIG3jAbzn9/amLBLdcmt/L/GwZfGaSqHFtFoIJpG/YY55LV+rnPlPiqUzFjbjEvOS7lHyV6LnkIctextwORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816594; c=relaxed/simple;
	bh=FgBYa0U3JLtsWj50KdlzMNY1o0Jj1BIn7SsCMNQadsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtGw/m/s9vPUfPTFMMoUdby/XfFp0TCA88m5E4HpNL6FdwUVAShFRyAXL4akBH6ISLEhQiOw0lb0d4W2FTxkeifNmOgnbiqIRFJuU/YADDI7RYLhTmw5gZAiUsauXtGNuis4esfpYzNs8F0OfI5rPwL4iem8FndrJm3RcZtWuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzzHXvLy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816593; x=1800352593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FgBYa0U3JLtsWj50KdlzMNY1o0Jj1BIn7SsCMNQadsk=;
  b=YzzHXvLyhAxKYDz+Rchq8VpMLjaAKC1NAahgcoB+O4ZlPfeb7M7lOaG1
   XAfe3MRTd9ndYZbQgCxmkd1VWNejUa01NJITgAXp2RAtcsNPTx/KP7w1I
   UWfmXe6ogIItzVRuUVXJiiqXl7GAwYRo7QtSA1mZ92P3hvHQbQyBNhJA0
   AcqzeGfGoO4ssR8aBqpzSDb9uXbdps/kmjb4nTqeUOtlI3bNXsmODnB1s
   8SNW0fRlPfTpWB527EnbigC7Kc4QjC9fLewm+0Mjtepzut0051NpsJO02
   IPKKir1XFRswQBumgVu5n4GpqvKbndaIeiX4910iQ40nkeqgcFqOKImL9
   A==;
X-CSE-ConnectionGUID: kCaFKKBpSbuD1SAHdxX4OQ==
X-CSE-MsgGUID: E3Ffaq1xQDesJt8g/phgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87604297"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87604297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:56:25 -0800
X-CSE-ConnectionGUID: /f0Xv8jgSkqq8tYz6QKBIA==
X-CSE-MsgGUID: GrWDzjQXSIOcEheq7QVB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210842283"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:56:20 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B53D120280;
	Mon, 19 Jan 2026 11:56:22 +0200 (EET)
Date: Mon, 19 Jan 2026 11:56:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Frank Li <Frank.li@nxp.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aW3_xSm2N42XTtzu@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
 <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>

Hi Michael,

On Mon, Jan 19, 2026 at 10:49:20AM +0100, Michael Riesch wrote:
> Hi Frank,
> 
> Thanks for your review.
> 
> On 1/16/26 17:08, Frank Li wrote:
> > On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
> >> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> >> one input port and one output port. It receives the data with the
> >> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> >> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
> >>
> >> Add a V4L2 subdevice driver for this unit.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> > ...
> >> +
> >> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
> >> +{
> >> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
> >> +}
> >> +
> >> +static inline __maybe_unused void
> > 
> > why need '__maybe_unused', needn't inline. compiler can auto decide and
> > report unused function if no 'inline'.
> 
> The __maybe_unused was helpful during development and is not really
> required now. It doesn't hurt either, so I left it in. I can remove it
> if you wish.

Please. :-)

> >> +static int dw_mipi_csi2_register_notifier(struct dw_mipi_csi2_device *csi2)
> >> +{
> >> +	struct v4l2_async_connection *asd;
> >> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
> >> +	struct v4l2_fwnode_endpoint vep;
> >> +	struct v4l2_subdev *sd = &csi2->sd;
> >> +	struct device *dev = csi2->dev;
> >> +	struct fwnode_handle *ep;
> >> +	int ret;
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > 
> > use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
> > handler.
> 
> Sorry, I don't see the benefit of that.

I'd prefer this, too, when you unconditionally need to release or put
something. It'll make error handling simpler, too.

-- 
Kind regards,

Sakari Ailus


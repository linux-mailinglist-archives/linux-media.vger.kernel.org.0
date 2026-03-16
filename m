Return-Path: <linux-media+bounces-55951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA88DUI9uGmpagEAu9opvQ
	(envelope-from <linux-media+bounces-55951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:26:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B2F29E27D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F52530B0107
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614763D3301;
	Mon, 16 Mar 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rbw219SB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCC3D091A;
	Mon, 16 Mar 2026 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681595; cv=none; b=sTgTA7ou3G5mWAIU6W46T2ifKwPl4TNZm8JyQvtMNjulRtdjTUskYF1ggQXxTD9cCOSvXmZqLnBJBee9S7qbx6sDavpmMOdTqFSmyPwpNnV9KLx5KVtZrjx9VW/dgWm1ZKGNiceTIrggHKjGchPIKEp8MxERllF3vY5IQF+cp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681595; c=relaxed/simple;
	bh=Zz/hRJjLBoN755q223kYJIQDnkqItfPZ1yDBYTf+0y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRW9YWa4x/TsBYmcDCeahqMKH0I1ApfDeVpJyddTy3TA+bo40VuMtB0XTvNzxsj9Vi4wOJpWaRvGHIf1obzdFmPM0C0yyEiW0+umBlSG5/J7avoRQIjy9ZxEfjZ3BPa5ts9BDfyyvgNTJHalSwDQeEPvV+gGLrqnHqqIaUZ+Q1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rbw219SB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773681594; x=1805217594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zz/hRJjLBoN755q223kYJIQDnkqItfPZ1yDBYTf+0y4=;
  b=Rbw219SBcbDLkzDXtV+dczYtJ0CO9rscPc4kX9alOWOVnPrREgf3Q8Ww
   B82It8zuJYvcFgljwQeio7VppCCHtkn1l7IafMgZBpGo5t7eQuSv19ien
   unEpptBYfkTIwIQZeCDNmLqY+NdPkyRLSats8xOUkGLuEgQ6N0xVoaZw7
   w63wIXcqILfyXI6Ou9znRLy/mJAt6R51HMIhxgKQbDD11nADNagi7/vLY
   lNKfKkXTGU/Q+iio+wWZ/M39IAI+RBSsgPdOg+vWJJuH8yfbHY6ZAUHE7
   /B7R07qB2R7KfE+l6XVra2oV07gg0Ab1C4xrChJjspGj6XvL1BEQWUclc
   w==;
X-CSE-ConnectionGUID: Uhu2Y3itRHyktD6X2sGeDw==
X-CSE-MsgGUID: nnvA7GgQRxC9/TfON190aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74677490"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74677490"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:19:53 -0700
X-CSE-ConnectionGUID: RJTg4zFsRNKBYc912rzrog==
X-CSE-MsgGUID: nQe6ouNASVu/x13EIFCQQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226118290"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.29])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:19:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 89A8C121D04;
	Mon, 16 Mar 2026 19:19:42 +0200 (EET)
Date: Mon, 16 Mar 2026 19:19:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Lubomir Rintel <lkundrak@v3.sk>, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint
 properties
Message-ID: <abg7rvczKjyIA5jN@kekkonen.localdomain>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260316135352.GA31616@killaraus.ideasonboard.com>
 <a429887b-13f7-4ba3-9260-ddae92adfe51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a429887b-13f7-4ba3-9260-ddae92adfe51@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,foss.st.com,jmondi.org,ragnatech.se,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55951-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 91B2F29E27D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof, Laurent,

On Mon, Mar 16, 2026 at 03:42:09PM +0100, Krzysztof Kozlowski wrote:
> On 16/03/2026 14:53, Laurent Pinchart wrote:
> > Hello Krzysztof,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Mar 16, 2026 at 02:45:34PM +0100, Krzysztof Kozlowski wrote:
> >> The "endpoint" node references video-interfaces.yaml schema with
> >> "unevaluatedProperties: false" which means that all properties from
> >> referenced schema apply.  Listing some of them with ": true" is simply
> >> redundant and does not make this code easier to read.
> > 
> > I think you know my opinion on this topic. I believe we would be better
> > off by turning "unevaluatedProperties: false" into
> > "additionalProperties: false" here, and keeping the list of applicable
> > properties. It brings value to device tree authors by telling which
> > properties are applicable to the device at hand. For instance ... (see
> > below)
> 
> (let me trim)
> 
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >> index 2d7937a372a2..7a05a1eda58d 100644
> >> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >> @@ -51,9 +51,6 @@ properties:
> >>          $ref: /schemas/media/video-interfaces.yaml#
> >>          unevaluatedProperties: false
> >>  
> >> -        properties:
> >> -          clock-noncontinuous: true
> >> -
> > 
> > ... Without this, an integrator will need to dive into driver code to
> > know if non-continuous clock is usable for the device.
> 
> I see. Our usual interpretation of common schema, expressed by @Rob in
> few places, that eventually all properties might be applicable. This
> applies especially for ABI tied to the core Linux specifics, e.g.
> rotation and orientation from video-interface-devices.yaml.
> 
> Absolutely every sensor can be mounted rotated, therefore every binding
> referencing video-interface-devices should allow it, even if driver is
> not using it. Because basically that's the ABI we want to define for
> each sensor, thus each binding referencing common schema should have
> "unevaluatedProps: true" without listing them.
> 
> Similarly touchscreen.yaml.
> 
> OTOH, second option, properties which are strictly hardware, e.g. name
> of power supply or whether clock has or has not non-continuous mode,
> should be allowed only when they match the hardware. Such bindings
> should use "additionalProperties: false" so the hardware description is
> constrained/fixed/specific.

The patch may be technically correct but I'm afraid it won't improve the
bindings but rather the opposite: it removes information telling whether a
property is relevant for a given device.

I bet there are a lot of possibilities to write invalid DTS while the
checker says it's fine (missing data-lanes or link-frequencies, for
instance). That may have been the case before the patch but I'd make
properties a driver needs to function mandatory rather than removing them
from bindings altogether.

It'd been on my to-do list to split the current video-interfaces.yaml into
several files: generic camera sensor properties, CSI-2 interface
properties, DVP/Bt.656 interface properties and the rest (full list
probably requires more thought). That way we could only include properties
that are relevant for the device without necessarily listing each one for
all bindings.

I'd also continue to list boolean properties relevant for devices as well
as other properties that are relevant for a device but not mandatory.

-- 
Regards,

Sakari Ailus


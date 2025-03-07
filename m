Return-Path: <linux-media+bounces-27822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA7A56453
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B11A1893938
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4660C20C033;
	Fri,  7 Mar 2025 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkEP1op/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825B1519B4;
	Fri,  7 Mar 2025 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340964; cv=none; b=TgjtH10wrnvj7tFhZyHKNN3uqV0Rp6ik+sFNXb9IpI8S3J59V3HzuJQVFjAIwMmtGt1dhJsN0aeeCEI5seWBEyXkaBvxtzbuhIOTmCT186toSdFrh9ZPBJ3+3rIFlksyrdYe6zYbOM8XfT6dFr79nF+ClMexBLsDL9/awchSQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340964; c=relaxed/simple;
	bh=UMv+mWNoFkGiSJzPQ4HjhZzF/GGFwH++BILQFYuqJjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqmA0Nj2l2WL426S/p3do00h95uWKLdGG4ga5wtkBijncokEGgq67CKU3q4JqAF2OEOAFL9svOWefKzAJU/xZFUE2GqX0a8ZODvN9BN98bVuGRFur8FLyH1TSmzSIbO2+9reAetbX79G5M7UGS1U81ougiL4iRdQ4LACv1oqLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkEP1op/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741340963; x=1772876963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMv+mWNoFkGiSJzPQ4HjhZzF/GGFwH++BILQFYuqJjc=;
  b=lkEP1op//qEerqIxLMJUlsPba89MAepx9HqUkw5DcJNuyJQuBIbGF2yp
   dlduPsWnaKBzvpS5XUb8L7AUmKb9ckqaVQdOmWIjZXKacyH+6/U1/iKa2
   npPqTRtB2ssF5gSWzLajbwH7LIaiZGeUMmKoA0ZYKejaJ0PA+7ejO5sX9
   pZdNxUJ3mIofBeamBA7N9igRxP1lKjaWLHP5bEEDrOoB6TvxBMzIbErld
   vGfT/twEteQuSex8/VjNJWynm/FB9+mWWXrzXlfTa6MvyHCNfAuXupYGN
   LRM8xVK0/qDyfSjR/BuKajiob0NK1h56sj7fui0EaYQdQrdx9HnTlCiEQ
   g==;
X-CSE-ConnectionGUID: 0W9mkAo1RyeGoEDCZJcizg==
X-CSE-MsgGUID: aCsGCXKiRbmiAnZLNkBXFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41553786"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="41553786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:49:22 -0800
X-CSE-ConnectionGUID: PaMUlQqVQtK1CzZrnIll9g==
X-CSE-MsgGUID: d7CscytIQdiOtvxDoGLfRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120197533"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:49:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C298411F9DA;
	Fri,  7 Mar 2025 11:49:12 +0200 (EET)
Date: Fri, 7 Mar 2025 09:49:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
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
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
 <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>

Hi Krzysztof, Michael,

On Fri, Mar 07, 2025 at 08:51:54AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
> > Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> > 
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> subject: only one media prefix, the first
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > ---
> >  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 170 insertions(+)
> > 
> 
> ...
> 
> > +  clocks:
> > +    items:
> > +      - description: ACLK
> > +      - description: HCLK
> > +      - description: DCLK
> > +      - description: ICLK
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: dclk
> > +      - const: iclk
> > +
> > +  rockchip,cif-clk-delaynum:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 127
> > +    description:
> > +      Delay the DVP path clock input to align the sampling phase, only valid
> > +      in dual edge sampling mode. Delay is zero by default and can be adjusted
> > +      optionally.
> 
> default: 0

And this is technically specific to the DVP port (0). Should (or could?) it
be located there?

> 
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: ARST
> > +      - description: HRST
> > +      - description: DRST
> > +      - description: PRST
> > +      - description: IRST
> > +
> > +  reset-names:
> > +    items:
> > +      - const: arst
> > +      - const: hrst
> > +      - const: drst
> > +      - const: prst
> > +      - const: irst
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle to general register file used for video input block control.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: The digital video port (DVP, a parallel video interface).
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-type:
> > +                enum: [5, 6]
> > +
> > +            required:
> > +              - bus-type
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Internal port connected to a MIPI CSI-2 host.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> 
> Hm, does it actually work? graph/port does not allow any other
> properties. You should use graph/port-base and probably still narrow
> lanes for both of port@0 and port@1.

I'd list the relevant properties for both DVP and CSI-2, either as
mandatory or with defaults (could be reasonable for DVP signal polarities
but not e.g. on number of CSI-2 lanes).

> 
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3568-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/rk3568-power.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> > +
> > +    parent {
> 
> soc {
> 
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> 
> Best regards,
> Krzysztof
> 

-- 
Kind regards,

Sakari Ailus


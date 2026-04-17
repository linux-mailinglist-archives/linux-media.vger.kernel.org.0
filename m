Return-Path: <linux-media+bounces-59016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPD4HkYp4mmO2QAAu9opvQ
	(envelope-from <linux-media+bounces-59016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:36:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9341B405
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19779304F239
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D11396B7F;
	Fri, 17 Apr 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHmpc5kL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA737187C;
	Fri, 17 Apr 2026 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429362; cv=none; b=q/dtHcfTv7fjKWEJPBAz+IkPDnAT9Kfyy4VZJ6kTRWB3CwMjeSezNcSAmYfOhMcO7vh1mSFUq5Uv0p0wDX8c7R77iNuQaXry8sQjnNuISlnlHWShcp8bIJPT4mjmIA+/HjyI2iOfFaDFEVMS8WmSqXRQHS7UXveRc/oBXmsdGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429362; c=relaxed/simple;
	bh=/w3dR8ZCpT4vjo3Uyh4otuAOLxMOYA7HdIN3qaecC1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwWITKfxtEfs4LVTQwpn2tnFWpLT7VqG+ooIbmYU264Er0dMMiu9Dy+trLspanCCmIQBlAhzeXhtCCAI+8hEyGCfXOId9BvehrIgpUClbd9wlY+GJ+AOPIKxm/5Sf0/LlSCyVkynTMrX5R6uyY43Ddmi389iikY66W6ROhXMJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHmpc5kL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776429360; x=1807965360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/w3dR8ZCpT4vjo3Uyh4otuAOLxMOYA7HdIN3qaecC1o=;
  b=FHmpc5kLLm7xx7Qu2QqlkYYNAFKMJAO8SncNhNxk8V5jYVr34cZeRGcR
   mIG6Lv/TKThuWFJDpMPbSkRZF5vy19pmrqC0ZJ/jnDeQ68sf+UGcLcbhQ
   yy/Ih6rmjcgQ72p1mm2Ozhft38u7B4EmF5dzXENJsvv6wNwbOSm0D/UvI
   g7Iy7FyC/uhbVJF7ItpPLTOE894+sI3kaW8ymQsQUqnpJUznCDJfZdxZ1
   L4NFI9ECkOG0N1G+9QPiKoWFdnaJ13149YP27AiwuueD2T19M3nW+bpGF
   aS0wpki7w7iphV5+6OfgP+rzVZY5FmSbQz0iCEPRDYlOcH1JFbvXqFY08
   g==;
X-CSE-ConnectionGUID: B5FjEawdRj+itNqRPpRW7A==
X-CSE-MsgGUID: PM+KYKLISOe9HvQSmd8uzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="95009902"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="95009902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:35:59 -0700
X-CSE-ConnectionGUID: ugOC7ITITBmeR0Q7T5rgpA==
X-CSE-MsgGUID: QoM5KGieQK2+nAcFq8FRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230950099"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:35:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E758E120E0E;
	Fri, 17 Apr 2026 15:36:14 +0300 (EEST)
Date: Fri, 17 Apr 2026 15:36:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <aeIpPvwpjJ1Q6eUl@kekkonen.localdomain>
References: <20260417114226.100033-1-clamor95@gmail.com>
 <20260417114226.100033-6-clamor95@gmail.com>
 <aeIkBR4cx54OVmGo@kekkonen.localdomain>
 <CAPVz0n3wi2yzVc0noYe=5=VR2NWEeyXke3EPKJpSPm81qrpp4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3wi2yzVc0noYe=5=VR2NWEeyXke3EPKJpSPm81qrpp4Q@mail.gmail.com>
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	TAGGED_FROM(0.00)[bounces-59016-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	R_DKIM_ALLOW(0.00)[intel.com:s=Intel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.891];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.53:email,devicetree.org:url,0.0.0.0:email]
X-Rspamd-Queue-Id: E7B9341B405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

On Fri, Apr 17, 2026 at 03:30:30PM +0300, Svyatoslav Ryhel wrote:
> пт, 17 квіт. 2026 р. о 15:13 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslav,
> >
> > Thanks for the set.
> >
> > This patch should be the first one in the set, or at least before those
> > using the bindings defined here.
> >
> 
> Maybe before conversion, but definitely not the first. I would like to
> avoid patch multiplication caused by schema adjustments after every
> single commit if possible.

You don't have to use all the properties defined but you can't use
properties in drivers not yet defined in bindings.

> 
> > On Fri, Apr 17, 2026 at 02:42:26PM +0300, Svyatoslav Ryhel wrote:
> > > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > > LEDs.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
> > >  1 file changed, 134 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > > new file mode 100644
> > > index 000000000000..460ea1fbc1e5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > > @@ -0,0 +1,134 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI LM3560 Synchronous Boost Flash Driver
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +description:
> > > +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
> > > +  1000-mA constant current drivers for high-current white LEDs. The dual high-
> > > +  side current sources allow for grounded cathode LED operation and can be
> > > +  tied together for providing flash currents at up to 2 A through a single LED.
> > > +  An adaptive regulation method ensures the current for each LED remains in
> > > +  regulation and maximizes efficiency.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,lm3559
> > > +      - ti,lm3560
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +  enable-gpios:
> > > +    description: GPIO connected to the HWEN pin.
> > > +    maxItems: 1
> > > +
> > > +  vin-supply:
> > > +    description: Supply connected to the IN line.
> > > +
> > > +  ti,peak-current-microamp:
> > > +    description:
> > > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
> > > +      When the current limit is reached, the LM3560 stops switching for the
> > > +      remainder of the switching cycle.
> > > +    enum: [16000000, 23000000, 30000000, 36000000]
> > > +    default: 36000000
> > > +
> > > +  ti,max-flash-timeout-ms:
> > > +    description:
> > > +      Maximum flash timeout in ms with step 32ms.
> > > +    minimum: 32
> > > +    maximum: 1024
> > > +    default: 1024
> > > +
> > > +patternProperties:
> > > +  '^led@[01]$':
> > > +    description: LED control bank nodes.
> > > +    $ref: /schemas/leds/common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: Control bank selection (0 = bank A, 1 = bank B).
> > > +        maximum: 1
> > > +
> > > +      ti,max-flash-current-microamp:
> > > +        description:
> > > +          Maximum flash current in uA with step 62500uA.
> > > +        minimum: 62500
> > > +        maximum: 1000000
> > > +        default: 1000000
> > > +
> > > +      ti,max-torch-current-microamp:
> >
> > Don't the LED flash bindings already have standardised properties for
> > these?
> >
> 
> Oh, they do! Thanks for pointing out. led-max-microamp,
> flash-max-microamp and flash-max-timeout-us. Very nice, I will adjust
> in the v2.

Sounds good, thanks!

I think it'd be worth standardising maximum input current, too, as other
devices use it, too.

> 
> > > +        description:
> > > +          Maximum flash current in uA with step 31250uA.
> > > +        minimum: 31250
> > > +        maximum: 250000
> > > +        default: 250000
> > > +
> > > +    required:
> > > +      - reg
> >
> > I'd say the max current properties are required as well, same for the
> > timeouts. Or make the lowest the default. The lowest values are very seldom
> > used in practice though.
> >
> 
> I have transferred from the driver which uses maximum values as
> default one. I can change to minimum if needed, that is not a big
> deal.

I'd just make these mandatory.

> 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#address-cells'
> > > +  - '#size-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        led-controller@53 {
> > > +            compatible = "ti,lm3560";
> > > +            reg = <0x53>;
> > > +
> > > +            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
> > > +            vin-supply = <&vdd_3v3_sys>;
> > > +
> > > +            ti,peak-current-microamp = <16000000>;
> > > +            ti,max-flash-timeout-ms = <1024>;
> > > +
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            led@0 {
> > > +                reg = <0>;
> > > +
> > > +                label = "white::flash";
> > > +                linux,default-trigger = "flash";
> > > +
> > > +                ti,max-flash-current-microamp = <562500>;
> > > +                ti,max-torch-current-microamp = <156250>;
> > > +            };
> > > +
> > > +            led@1 {
> > > +                reg = <1>;
> > > +
> > > +                label = "yellow::flash";
> > > +                linux,default-trigger = "flash";
> > > +
> > > +                ti,max-flash-current-microamp = <562500>;
> > > +                ti,max-torch-current-microamp = <156250>;
> > > +            };
> > > +        };
> > > +    };
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

-- 
Kind regards,

Sakari Ailus


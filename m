Return-Path: <linux-media+bounces-56005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFLSNS0VuWmOpgEAu9opvQ
	(envelope-from <linux-media+bounces-56005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:47:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E22A5E67
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0916303F7FD
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9416639BFFE;
	Tue, 17 Mar 2026 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJgCjWlc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704D19D081;
	Tue, 17 Mar 2026 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737090; cv=none; b=fpDHY47flqDGrV8GNdF1qk0d5fgovlTidVCTX1xLdf0R0RrEc6iYZdNW9QnTBERFtz9Oey6L9FWtUY2WOpJQ2GLl9h5Ql6vJ3KDmVDifzxSYpVBfpCRAGSoXYW76bAxFQaMKrl8/2rYT41UhRdLzKNNS2EgDbqx7nJNJcCku0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737090; c=relaxed/simple;
	bh=C0Pswvu3fjRMjD3j/kjNnnpBIbx7nPgIna/0wI7OubA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiH/EV/2sesVnNKKkGdDJ0bXTmAPCYf8Bb6OvSMyE7fPaJ0pFq7vF/mOzmg+gJd4hrkb4eJ0o883Yp13aQbmTKVarSdQZxJTaydnj+MdsPeVg55a0+fHAcJoSycXc1hf7WMDwSzB4XSCJ1JoXYNIM1TrdxNZeykWzz1MbYiaR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJgCjWlc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737089; x=1805273089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C0Pswvu3fjRMjD3j/kjNnnpBIbx7nPgIna/0wI7OubA=;
  b=CJgCjWlcnkZ26tZVPvIR/X7UXoXJdGpYxECcxy59jmlTyJGXhdBj/YI+
   cctmSJNRs8rNVrkwnf11dDqVHne7VwOwqTMm0zELJe4n/3DTmyhljZ7r6
   pQRfQHUVhh4aaHEjJrQqSWXGF555cqL25Ywf3XmbpDRFAxTmCZLwnuPyR
   98hwjvzUE7GCuNuCgWWgfv8/VRkzlpZytmIzGWpcihHY0cDLFqxQ20klS
   XgG6jQDZLxp/q9tFtovjyvwBiheADGuNAlSACppHqfgYQDeksjbFuLOc9
   8itjeaWOmcZLO+z7B4C5YSm2c/426LRTsk2xI7Aj0mlavwPxHWCNrpmUG
   w==;
X-CSE-ConnectionGUID: rTrRsISWTby2tV5+q8rx8w==
X-CSE-MsgGUID: mGqEmIodS+m4CwQ37P7Ilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946590"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:48 -0700
X-CSE-ConnectionGUID: lReVL7sOR0WiQbiCp2o3vw==
X-CSE-MsgGUID: Ss6gS+4MQsadj9fke/z+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432514"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 79572121D04;
	Tue, 17 Mar 2026 10:44:42 +0200 (EET)
Date: Tue, 17 Mar 2026 10:44:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 6/9] dt-bindings: media: i2c: document Omnivision
 OV08D10 CMOS image sensor
Message-ID: <abkUeiIjKjuG7vrD@kekkonen.localdomain>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
 <20260309-ov08d10-v2-6-81f8b5d99984@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-ov08d10-v2-6-81f8b5d99984@emfend.at>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56005-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,0.0.0.36:email,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D5E22A5E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Matthias,

On Mon, Mar 09, 2026 at 06:07:08PM +0100, Matthias Fend wrote:
> Add bindings for the Omnivision OV08D10 CMOS image sensor.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..96dbf61cf7c188544f4120216ae2b8e0155128b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov08d10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV08D10 1/4-Inch 8MP CMOS color image sensor
> +
> +maintainers:
> +  - Jimmy Su <jimmy.su@intel.com>

I think you should put yourself here unless you have agreed this with
Jimmy.

> +
> +description:
> +  The Omnivision OV08D10 is a 1/4-Inch 8MP CMOS color image sensor with an
> +  active array size of 3280 x 2464. It is programmable through I2C
> +  interface. Image data is transmitted via MIPI CSI-2 using 2 lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov08d10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK input clock (6 - 27 MHz)
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low XSHUTDN pin
> +    maxItems: 1
> +
> +  dovdd-supply:
> +    description: IO power supply (1.8V)
> +
> +  avdd-supply:
> +    description: Analog power supply (2.8V)
> +
> +  dvdd-supply:
> +    description: Core power supply (1.2V)
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@36 {
> +            compatible = "ovti,ov08d10";
> +            reg = <0x36>;
> +
> +            clocks = <&ov08d10_clk>;
> +
> +            dovdd-supply = <&ov08d10_vdddo_1v8>;
> +            avdd-supply = <&ov08d10_vdda_2v8>;
> +            dvdd-supply = <&ov08d10_vddd_1v2>;
> +
> +            orientation = <2>;
> +            rotation = <0>;
> +
> +            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                ov08d10_output: endpoint {
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <360000000 720000000>;
> +                    remote-endpoint = <&csi_input>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a54e17cc7449e5a80b6cdc83aa6fde..2484d0bcc1f09582828cafbdb7d45dd12b55af60 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19505,6 +19505,7 @@ M:	Jimmy Su <jimmy.su@intel.com>
>  L:	linux-media@vger.kernel.org

I suppose you might want to be listed as a reviewer for instance?

>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
>  F:	drivers/media/i2c/ov08d10.c
>  
>  OMNIVISION OV08X40 SENSOR DRIVER
> 

-- 
Kind regards,

Sakari Ailus


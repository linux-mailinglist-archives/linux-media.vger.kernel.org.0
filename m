Return-Path: <linux-media+bounces-56576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEpEJ5m+vWkbBQMAu9opvQ
	(envelope-from <linux-media+bounces-56576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:39:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC62E173D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9953D304F5D8
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7970E3A9633;
	Fri, 20 Mar 2026 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dssm0jXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4D23803C8;
	Fri, 20 Mar 2026 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042771; cv=none; b=N8X03U4utDlGW5Rj1bTziAN6Rlr4m9EI3Hrkw2xeDnudPLsvjB4FfCCoW4imfLpfqkU6T0/vTGemCXCYrLHveCn6lSUQapgpOukEDpEAlgM545O9J6AMpInJ6+c5uW2zxcl8YIfc7yMc2eipchXdIyY2vqLks06bvdO/fuf662E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042771; c=relaxed/simple;
	bh=oKrnccadkRO6kKUN+rINIP7x8FVn/hRXjRmAkAgzUrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji8Iu2m0sW8yoM3t0asKFeNI15aJmyC4C/6B8JbyEdaemFYtmU/qxXa3E5c8zwYUyDl21KKkbQtFR4wzP2MJtmQocR5uIH0EeZMfJlzEQ77fXheHn+Kq1vqnc+VX20nth+lbpS7XAqjUDzRa+oMVQM7pvKNiNcRErRpOaCznXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dssm0jXT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042770; x=1805578770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oKrnccadkRO6kKUN+rINIP7x8FVn/hRXjRmAkAgzUrg=;
  b=Dssm0jXTH0jdU5Vx8MzC87CT3hrj43Ogqe7ZVlVmEafIv1qPQgOKvAeN
   DqSA6AtEJJIftmlBgR0BQctqMA2K/q+5Njloc+u+1xHYRgn70fduLIyls
   dwXzYZmYDJCB+0e2JAI7PNZObM98F9pFKoOpM8Uct4Yu/rRtEni65N3JV
   BfBwsaQsI6aspiFrfwF2aB4M7NoOEf46dOYn6AwJeO+x4O9qMonNcBpux
   qOKQ7BG9uFlBl0NihEJ59cgaXqMeF77jP8uKNglVEQl5ljqkwIU+XFnsX
   yvR2q1jhUoOKOYx3039MR25KUZHDfMHWkFZkfw0pEg9kQzqMKyxtd0XNc
   Q==;
X-CSE-ConnectionGUID: P6JsFIM0S22UwFyiYM0Bmw==
X-CSE-MsgGUID: BCdVYUW2T8mTJRz2e5oNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75165360"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75165360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:39:29 -0700
X-CSE-ConnectionGUID: CqMUPZTjSBi+01D2UKo6jg==
X-CSE-MsgGUID: UePd2mvoQNG+5/Vku3tKyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228135123"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:39:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2646112033A;
	Fri, 20 Mar 2026 23:39:27 +0200 (EET)
Date: Fri, 20 Mar 2026 23:39:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <ab2-j6tMKTAlCDcT@kekkonen.localdomain>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-56576-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,proton.me:email,devicetree.org:url,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19FC62E173D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine,

On Fri, Mar 20, 2026 at 09:27:18AM +0000, Antoine Bernard wrote:
> From: Antoine Bernard <zalnir@proton.me>
> 
> Document the device tree bindings for OmniVision OV13B10 image
> sensor.
> 
> Signed-off-by: Antoine Bernard <zalnir@proton.me>
> ---
>  .../bindings/media/i2c/ovti,ov13b10.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
> new file mode 100644
> index 000000000000..4d6432488b79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov13b10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision ov13b10 image sensor
> +
> +maintainers:
> +  - Arec Kao <arec.kao@intel.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov13b10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: System clock.

Typically this is called "external clock" or something like that.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO connected to the XSHUTDOWN pin. Active low.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog circuit voltage supply.
> +
> +  dvdd-supply:
> +    description: Digital circuit voltage supply.
> +
> +  dovdd-supply:
> +    description: Digital I/O circuit voltage supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +            items:
> +              enum: [1, 2, 3, 4]
> +
> +          link-frequencies: true
> +          remote-endpoint: true

These two you can drop I believe.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
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
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov13b10: camera@36 {
> +            compatible = "ovti,ov13b10";
> +            reg = <0x36>;
> +
> +            clocks = <&sensor_xclk>;
> +            reset-gpios = <&gpio 117 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&ov13b10_avdd>;
> +            dvdd-supply = <&ov13b10_dvdd>;
> +            dovdd-supply = <&ov13b10_dovdd>;
> +
> +            port {
> +                ov13b10_ep: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <560000000>;
> +                    remote-endpoint = <&csiphy_ep>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Kind regrads,

Sakari Ailus


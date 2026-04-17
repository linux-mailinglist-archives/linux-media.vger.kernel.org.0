Return-Path: <linux-media+bounces-59011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFOgDQgk4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:14:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF241B22B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFFAC306434A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE013815D3;
	Fri, 17 Apr 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK8MztV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0B637107F;
	Fri, 17 Apr 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428024; cv=none; b=HRJmk7LDDKG+LGwa46/3PGOddwjWhapsvpkkiNu5AG9Hlqrvw9/DIvmdxNQnahHfoAZECNfwDX8wYMHTc6AMVQyxvwLbKNH+SiCVbEfheOI0obkjyu3Qb+BwDlYZ3Kq3tKGJ7khQX4HYWJnmPv6iAMf9AUYRG1sKrpHTwLZkQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428024; c=relaxed/simple;
	bh=6vV0tPd+iDgulVpOy/wCn3Ur6rPXEv+SBjpAHinR6GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5DBcWlZ8tx+a8OjWkISI3Qr4prYvtzmZHltLbCGutSWlslPi6RGhIuu1eO3xzHuJaVkdJwnF+YaYXcNyXzJ8goUQ/U6KDBwKGw+m/O1fxnyX/P7NQTvfVeyhWZMYyBAi3y9zLJE3MlWsB6qKnyvSbSSV5n1f5uLH1JAUm4bLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK8MztV+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776428022; x=1807964022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6vV0tPd+iDgulVpOy/wCn3Ur6rPXEv+SBjpAHinR6GA=;
  b=LK8MztV+MBL+zfTSwQY/RKRhpzpgNR8dMJP0CeftRCkMoqQGa+Z/LE5D
   lVgZdHgrDgg08II8yxJ6uJKFV7GHgpubcAiV06PW4Py7p7ziaN9pIb6D8
   j8tvkGOXRAxxGiHaGsrzpe+sXTYCY2akouPn3nnG87M+HBWeHDLH7ooEp
   OxO4Y6rZEsHiMFEDp2ajPKdS6w79NA+uhRyYrFfu0jsqYZ9SoSdoMkRtT
   XOsNK9bDbeAXSsr517eRYLd9+uqd+ukuIQkkB/rvsejvTN9jMyL/5TLla
   fDV4G5d37sKKpmf79BhbwrBGLZCBm/4Fs637jA5mFnzWGQGhIjrnOiMTP
   Q==;
X-CSE-ConnectionGUID: aT8muja8QrmWfIOCxSPKGw==
X-CSE-MsgGUID: Q9JLF0hPS1ybxVE1PxZLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77350876"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77350876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:13:42 -0700
X-CSE-ConnectionGUID: dxklX58ZSlSVM03O5JizWQ==
X-CSE-MsgGUID: qwUNsMKoS8egrTXkrJ1FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="227891219"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:13:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DFF30120E0E;
	Fri, 17 Apr 2026 15:13:57 +0300 (EEST)
Date: Fri, 17 Apr 2026 15:13:57 +0300
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
Message-ID: <aeIkBR4cx54OVmGo@kekkonen.localdomain>
References: <20260417114226.100033-1-clamor95@gmail.com>
 <20260417114226.100033-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417114226.100033-6-clamor95@gmail.com>
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-59011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[intel.com:s=Intel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_PROHIBIT(0.00)[0.0.0.53:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.887];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.1:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: CADF241B22B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

Thanks for the set.

This patch should be the first one in the set, or at least before those
using the bindings defined here.

On Fri, Apr 17, 2026 at 02:42:26PM +0300, Svyatoslav Ryhel wrote:
> Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> LEDs.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> new file mode 100644
> index 000000000000..460ea1fbc1e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3560 Synchronous Boost Flash Driver
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
> +  1000-mA constant current drivers for high-current white LEDs. The dual high-
> +  side current sources allow for grounded cathode LED operation and can be
> +  tied together for providing flash currents at up to 2 A through a single LED.
> +  An adaptive regulation method ensures the current for each LED remains in
> +  regulation and maximizes efficiency.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lm3559
> +      - ti,lm3560
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    description: GPIO connected to the HWEN pin.
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Supply connected to the IN line.
> +
> +  ti,peak-current-microamp:
> +    description:
> +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
> +      When the current limit is reached, the LM3560 stops switching for the
> +      remainder of the switching cycle.
> +    enum: [16000000, 23000000, 30000000, 36000000]
> +    default: 36000000
> +
> +  ti,max-flash-timeout-ms:
> +    description:
> +      Maximum flash timeout in ms with step 32ms.
> +    minimum: 32
> +    maximum: 1024
> +    default: 1024
> +
> +patternProperties:
> +  '^led@[01]$':
> +    description: LED control bank nodes.
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: Control bank selection (0 = bank A, 1 = bank B).
> +        maximum: 1
> +
> +      ti,max-flash-current-microamp:
> +        description:
> +          Maximum flash current in uA with step 62500uA.
> +        minimum: 62500
> +        maximum: 1000000
> +        default: 1000000
> +
> +      ti,max-torch-current-microamp:

Don't the LED flash bindings already have standardised properties for
these?

> +        description:
> +          Maximum flash current in uA with step 31250uA.
> +        minimum: 31250
> +        maximum: 250000
> +        default: 250000
> +
> +    required:
> +      - reg

I'd say the max current properties are required as well, same for the
timeouts. Or make the lowest the default. The lowest values are very seldom
used in practice though.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@53 {
> +            compatible = "ti,lm3560";
> +            reg = <0x53>;
> +
> +            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
> +            vin-supply = <&vdd_3v3_sys>;
> +
> +            ti,peak-current-microamp = <16000000>;
> +            ti,max-flash-timeout-ms = <1024>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@0 {
> +                reg = <0>;
> +
> +                label = "white::flash";
> +                linux,default-trigger = "flash";
> +
> +                ti,max-flash-current-microamp = <562500>;
> +                ti,max-torch-current-microamp = <156250>;
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +
> +                label = "yellow::flash";
> +                linux,default-trigger = "flash";
> +
> +                ti,max-flash-current-microamp = <562500>;
> +                ti,max-torch-current-microamp = <156250>;
> +            };
> +        };
> +    };

-- 
Kind regards,

Sakari Ailus


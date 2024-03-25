Return-Path: <linux-media+bounces-7792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F5288AEAB
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 19:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4431C60BC5
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CE35F47D;
	Mon, 25 Mar 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpx3jSgw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B24CB54;
	Mon, 25 Mar 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711391301; cv=none; b=C/agzODBnzjtA7vGPF8quVAmpgd0Y2MJQ6AJE2v+JF6QosPx1iMwoabhanu9GPd2Z7boIrjjI4uN+Oy7hc6rseNdXxKZzpup3NxpiCZ7/gS6+5qeNkPEnQD3GjhlLEVXpQlJ6btGjUoavsoC7BuF4GtG4MVNzPXknhKerwrkgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711391301; c=relaxed/simple;
	bh=eV6sCYc3GA/aPvpRf9gwi4YntWpHnRxnwRuoX86U1zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RU/a9JrZWhdODbrcO1DE6CPcolGPo/4XtigtLeWB1M771TO5bxb3AiF8fEUO/dHvcA6hTuqvzMA9Fgp04if6TpS0pLZXZclWXSeMZ438JNTyf+eVNw+zk8qGa5CrbU3lqfPBKExIX/p/BZbKFBlzYy7sONr1INLSxsbI2BYQ224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpx3jSgw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711391299; x=1742927299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eV6sCYc3GA/aPvpRf9gwi4YntWpHnRxnwRuoX86U1zg=;
  b=kpx3jSgw1Y9o906Lef5hez/z2FT5apr+9ClZyLKvjxo0gwdCH44H1/Ir
   6Tgl3urVQOmPkB7iudLYLK0lzQN84w6KuGyytKpf9ovsPe2rAGCohDbtY
   05kKJNw8A1JUe9gIgz+WuJc7C48qLjQhLL6mlLzpsgSpvDoRsbaNHOVlo
   M3Jwbz8lnFMJOjB3aTIBMzllMgetPifB+QFJzgzGffn+CCzw/Sh3s0hq4
   Ntgt1wX1i6MfabZKaT261Ph0pDF9wzShkLLrPc+QsyXUWsrNpcDK0p+Mn
   ulKtyhnanehycW/neG/iGLTZ+evhWZkgQHntYoVQlea6/T4+VAS32eIXz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6622711"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6622711"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 11:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="16136520"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 11:28:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4144111FB81;
	Mon, 25 Mar 2024 20:28:11 +0200 (EET)
Date: Mon, 25 Mar 2024 18:28:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 08/15] dt-bindings: media: Add bindings for
 bcm2835-unicam
Message-ID: <ZgHCOySoPhOS0u2M@kekkonen.localdomain>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-9-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301213231.10340-9-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thanks for the set.

On Fri, Mar 01, 2024 at 11:32:23PM +0200, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Introduce the dt-bindings documentation for bcm2835 CCP2/CSI2 Unicam
> camera interface.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v5:
> 
> - Squash MAINTAINERS changes in
> 
> Changes since v3:
> 
> - Make MAINTAINERS its own patch
> - Describe the reg and clocks correctly
> - Use a vendor entry for the number of data lanes
> ---
>  .../bindings/media/brcm,bcm2835-unicam.yaml   | 117 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> new file mode 100644
> index 000000000000..1938ace23b3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM283x Camera Interface (Unicam)
> +
> +maintainers:
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +
> +description: |-
> +  The Unicam block on BCM283x SoCs is the receiver for either
> +  CSI-2 or CCP2 data from image sensors or similar devices.
> +
> +  The main platform using this SoC is the Raspberry Pi family of boards.  On
> +  the Pi the VideoCore firmware can also control this hardware block, and
> +  driving it from two different processors will cause issues.  To avoid this,
> +  the firmware checks the device tree configuration during boot. If it finds
> +  device tree nodes whose name starts with 'csi' then it will stop the firmware
> +  accessing the block, and it can then safely be used via the device tree
> +  binding.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2835-unicam
> +
> +  reg:
> +    items:
> +      - description: Unicam block.
> +      - description: Clock Manager Image (CMI) block.
> +
> +  reg-names:
> +    items:
> +      - const: unicam
> +      - const: cmi
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Clock to drive the LP state machine of Unicam.
> +      - description: Clock for the VPU (core clock).
> +
> +  clock-names:
> +    items:
> +      - const: lp
> +      - const: vpu
> +
> +  power-domains:
> +    items:
> +      - description: Unicam power domain
> +
> +  brcm,num-data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 2, 4 ]
> +    description: |
> +      Number of CSI-2 data lanes supported by this Unicam instance. The number
> +      of data lanes actively used is specified with the data-lanes endpoint
> +      property.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +
> +        required:
> +          - data-lanes

As the device supports multiple data interfaces (at least so it seems when
looking at the driver code), you need to list the bus-type property here,
too.

> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - brcm,num-data-lanes
> +  - port
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/bcm2835.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/raspberrypi-power.h>
> +    csi1: csi@7e801000 {
> +        compatible = "brcm,bcm2835-unicam";
> +        reg = <0x7e801000 0x800>,
> +              <0x7e802004 0x4>;
> +        reg-names = "unicam", "cmi";
> +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clocks BCM2835_CLOCK_CAM1>,
> +                 <&firmware_clocks 4>;
> +        clock-names = "lp", "vpu";
> +        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
> +        brcm,num-data-lanes = <2>;
> +        port {
> +                csi1_ep: endpoint {
> +                        remote-endpoint = <&imx219_0>;
> +                        data-lanes = <1 2>;
> +                };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fada59148cb5..e50a59654e6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3997,6 +3997,12 @@ N:	bcm113*
>  N:	bcm216*
>  N:	kona
>  
> +BROADCOM BCM2835 CAMERA DRIVERS
> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> +
>  BROADCOM BCM47XX MIPS ARCHITECTURE
>  M:	Hauke Mehrtens <hauke@hauke-m.de>
>  M:	Rafał Miłecki <zajec5@gmail.com>

-- 
Regards,

Sakari Ailus


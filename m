Return-Path: <linux-media+bounces-17004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99796257A
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AC41C2113F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8422D16C6A8;
	Wed, 28 Aug 2024 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKZKm0Kf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329016B3BA;
	Wed, 28 Aug 2024 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843195; cv=none; b=WzlASe5YPyXjCZTmPD2ZsFDiSuLAXi/H1/Q74n9amNRPesKApzgBUkXlW179o/Feb4qqpKwpUwhAuWf0236PJs8BUpcAMdvoEuHWl5cDPEdvCFhxMiKCjVG6f0+scKhzTHAkuzU4qzhtBheSYcL0fP/n5nqUZuF6onShn3oZalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843195; c=relaxed/simple;
	bh=XZmmdO2kYeD5TGivqJdO4zd4Bfu/ZBI17NXpvzMGjEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYVxg+rsTnkRLSJkixov95CSqpkCkvkEi8ChkTXpJiW0j7JqNjFop2HGarFYTO69r49DTQlk+Sp28KZsKskUzPCxqf64XEUPxFtP+pHgtS7djm5z3UVTeyYfXmxuiX4QqV7Qhj609qCvmO4zUhYDY+FTc5wqXnbb1EeeZnoVx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKZKm0Kf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724843193; x=1756379193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XZmmdO2kYeD5TGivqJdO4zd4Bfu/ZBI17NXpvzMGjEY=;
  b=ZKZKm0Kfd6HxVAZI1O3Kcibm3eagaYXaf8eH0VSpZvBpIi8HV2eJ9CP4
   k9sBj+htr+EYPfttTlagjxCfb9SUZIyhAdVx/kJfVzaYqRsFMtTrJjWub
   ibp9cs2sdccz7XuYOpF2erespugr+fMGyPshgJqp9hNxgI24jr54bhCwA
   gPukm1QKFKLCs2vXS1yJ26cQPJAeSjD0z0F9hTe5z6ZV5IeH6OCU3bxkU
   YTIwKRBdL8s/ooAIDEpMKE6s/+bbDmbUQ71GGQ7ZYSIbLWvw8k5uyPNDC
   Hj2QBnnpu+i9nINQ/kcAHq6qFHajJ5hbemXYgfUeBHKSKTwc8fHUyWUW4
   A==;
X-CSE-ConnectionGUID: c08sg9tXSPq7bOk2UJ0DPw==
X-CSE-MsgGUID: YgAe4NpBQgGHvJyrivqnVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22887877"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="22887877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 04:06:30 -0700
X-CSE-ConnectionGUID: 4GY8qefQRVyn6EG4fH8Fvg==
X-CSE-MsgGUID: heAXf6J7T32tkoZMqb1/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63230839"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 04:06:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2780E1201A1;
	Wed, 28 Aug 2024 14:06:23 +0300 (EEST)
Date: Wed, 28 Aug 2024 11:06:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	20240531080707.34568-1-jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Message-ID: <Zs8ErwJVTGYkHfJl@kekkonen.localdomain>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
 <20240620-rp1-cfe-v2-2-b8b48fdba3b3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620-rp1-cfe-v2-2-b8b48fdba3b3@ideasonboard.com>

Moi,

Thanks for the set!

On Thu, Jun 20, 2024 at 02:07:51PM +0300, Tomi Valkeinen wrote:
> Add DT bindings for raspberrypi,rp1-cfe.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> new file mode 100644
> index 000000000000..851533de2305
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi PiSP Camera Front End
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +
> +description: |
> +  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
> +  controller, that contains:
> +  - MIPI D-PHY
> +  - MIPI CSI-2 receiver
> +  - Simple image processor (called PiSP Front End, or FE)
> +
> +  The FE documentation is available at:
> +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> +
> +  The PHY and CSI-2 receiver part have no public documentation.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: raspberrypi,rp1-cfe
> +
> +  reg:
> +    items:
> +      - description: CSI-2 registers
> +      - description: D-PHY registers
> +      - description: MIPI CFG (a simple top-level mux) registers
> +      - description: FE registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description: CSI-2 RX Port
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +          clock-lanes:
> +            maxItems: 1

minItems needs to be 1 as well.

Or... is this actually configurable in hardware?

> +
> +        required:
> +          - clock-lanes
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rp1 {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      csi@110000 {
> +        compatible = "raspberrypi,rp1-cfe";
> +        reg = <0xc0 0x40110000 0x0 0x100>,
> +              <0xc0 0x40114000 0x0 0x100>,
> +              <0xc0 0x40120000 0x0 0x100>,
> +              <0xc0 0x40124000 0x0 0x1000>;
> +
> +        interrupts = <42>;
> +
> +        clocks = <&rp1_clocks>;
> +
> +        port {
> +          csi_ep: endpoint {
> +            remote-endpoint = <&cam_endpoint>;
> +            clock-lanes = <0>;
> +            data-lanes = <1 2>;
> +          };
> +        };
> +      };
> +    };
> 

-- 
Terveisin,

Sakari Ailus


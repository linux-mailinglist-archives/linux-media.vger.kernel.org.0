Return-Path: <linux-media+bounces-48490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF82CB0EA4
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 20:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45238301AF0A
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 19:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4D2303C9A;
	Tue,  9 Dec 2025 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLBk1Fdj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06F1DDC37;
	Tue,  9 Dec 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765307776; cv=none; b=VSWjhZ6Yb/F154QmNf3t/2qFUkqkRhOuwinDNsP7qBXYWUrA0brQIaUivtJpPDTUBahJjzX9MLa/hpmBFAkj/k80a8FL6E1gaFMXsaCYIRg5Dv5yEW8Wb8PJrnUGqOxvC+0ygG+KoF3ZzDmUxL/47oI7LNLk8hsAfc+PnqrXMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765307776; c=relaxed/simple;
	bh=wbIgBz9jhfukqW45Bc1ESQeYwcynSBabt4gOrczvcsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWjW7sRP8Rqy7UY/FCa6Zm3ljp7YNO9jDTuiZMD/hMGvWQBjMheEXFgLPh+BzEyvpkMnW8t8vF+yK5n12y9xKnhs5GOq/V3+8J0Q5uBOP0YDa/bhS8xqYORnAfXnvk4E8fUKdEUxkhUVqgisXhMGThOmzcTCo80BTA1318906hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLBk1Fdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C7CC4CEF5;
	Tue,  9 Dec 2025 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765307776;
	bh=wbIgBz9jhfukqW45Bc1ESQeYwcynSBabt4gOrczvcsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLBk1FdjyckFSv3MfS7PhXI8v+1iC25qzsPR3e8EzrcTummIPgvbJTWN7C/hA6UWN
	 iup+CW7629dOGT0aQIyIQflkVkBHoTzj9pmg8bpKmVFi4vVQCWeSeaaEYPYRoGZUxQ
	 ibRlbZpTsN5DtKSIJ0vHG0MzAAnwsRUf8EzlwID0BZnUqoOu70199Zd0Ze+NbiJW4V
	 V125qsq30R+GoD1QnrjpjQ32NcfP+rnFNx/lBnJykaye0FB+ztrM1d/UXKCLOsdBO7
	 98xUhSTe+7+uLpchVsf5498wXxa3UL7ulhfqiVmowGtyIXCdRa0l2j/adYsYTRi41P
	 QGRq72UbzJo+w==
Date: Tue, 9 Dec 2025 13:16:12 -0600
From: Rob Herring <robh@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Message-ID: <20251209191612.GA961171-robh@kernel.org>
References: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
 <20251209100017.302518-2-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209100017.302518-2-himanshu.bhavani@siliconsignals.io>

On Tue, Dec 09, 2025 at 03:30:05PM +0530, Himanshu Bhavani wrote:
> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> 
> Add bindings for Omnivision OS05B10 sensor.
> 
> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> new file mode 100644
> index 000000000000..fabe01cc7003
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OS05B10 Image Sensor
> +
> +maintainers:
> +  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> +
> +description:
> +  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
> +  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
> +  1/2.78"optical format.
> +
> +properties:
> +  compatible:
> +    const: ovti,os05b10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active high)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
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
> +        camera-sensor@36 {
> +            compatible = "ovti,os05b10";
> +            reg = <0x36>;
> +            clocks = <&os05b10_clk>;
> +            reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&os05b10_avdd_2v8>;
> +            dvdd-supply = <&os05b10_dvdd_1v2>;
> +            dovdd-supply = <&os05b10_dovdd_1v8>;
> +
> +            port {
> +                cam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <600000000>;
> +                 };
> +             };

Indentation is wrong.

> +        };
> +    }

Missing ';'


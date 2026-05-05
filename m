Return-Path: <linux-media+bounces-60394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DzABzrK+WmgEAMAu9opvQ
	(envelope-from <linux-media+bounces-60394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:45:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6F4CBB88
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 12:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D37B3075398
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 10:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA41439001;
	Tue,  5 May 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QtJKsZHW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F965438FFB;
	Tue,  5 May 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976117; cv=none; b=WUBLzz2Nf3vl5Ngu7ztihubEnMUIjI52qVHuojnX+thdbAUfuQv6E5C3SbXEcwS1Ayb213JqPkYNKlGUpOgBdtxairwgxrCv85ZqkH3XzZaDBHvWyxNU7iLXpK0Wdq5IKDNek5nS+2oER0M/p7w9hvDFwPtoMdH+5QJvMoWZ7cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976117; c=relaxed/simple;
	bh=irhwqt3pKWI8A9+c4uATwd1lfeQj1Qp64GK5X6PBU6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gf1UfcriNl9ReJLFWahOVE2/WAH4PhjcKgaRQyPcOisUGYseC2JrCGIKnPsMUgLSh5Xr7CZ8jW/f/QC2kFTEJa/YKqedxQ/oDVCYV8kNSKtNLwSvON0AIe5BxR2PBmIVzQh0J05lM3vg7jdw6NVZA0iSySTDiqofgRlCSIo8fDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QtJKsZHW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2137874;
	Tue,  5 May 2026 12:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777976104;
	bh=irhwqt3pKWI8A9+c4uATwd1lfeQj1Qp64GK5X6PBU6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtJKsZHWMFVaYqitfZJGvVeX7ouWbbMSaaLfgMOAMxOO3NO+WlmzNkXqGrNDrZKoy
	 m2hurIMNnbwPRNxF76UutfbzPLtXgj0eG17LI5SGv0fuUuZy/LQRknnx9Qsul/oS0f
	 ZjGVbsfozGKrEje54UWlTMV5yHjDhSYPZvJA4xT8=
Date: Tue, 5 May 2026 13:15:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234
 image sensor binding
Message-ID: <20260505101505.GB1547435@killaraus.ideasonboard.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306103614.3208182-2-eagle.alexander923@gmail.com>
X-Rspamd-Queue-Id: 76B6F4CBB88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60394-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.10:email,killaraus.ideasonboard.com:mid]

Hi Alexander,

Thank you for the patch.

On Fri, Mar 06, 2026 at 01:36:13PM +0300, Alexander Shiyan wrote:
> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> index 000000000000..d93fa99e6535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> +
> +description:
> +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> +  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data lanes,
> +  and raw Bayer (8/10-bit) or monochrome output.
> +
> +properties:
> +  compatible:
> +    const: onnn,ar0234cs

Should we define separate compatible strings for the mono and colour
variants ? I know you identify the variant at runtime in the driver, but
avoid I2C communication at boot time can be beneficial (to reduce boot
time, and also to avoid flashing the privacy LED on systems that have
one, albeit the latter is probably less applicable to the AR0234).

> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference clock (external clock) input
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reset pin, usually active low (if needed)
> +    maxItems: 1
> +
> +  vaa-supply:
> +    description: Analog (2.8V) supply regulator
> +
> +  vdd-supply:
> +    description: Digital Core (1.2V) supply regulator
> +
> +  vddio-supply:
> +    description: I/O (1.8V-2.8V) supply regulator
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CSI-2 transmitter port
> +    additionalProperties: false
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          data-lanes:
> +            description:
> +              Number of MIPI CSI-2 data lanes. Supported values: 2, 4.
> +            minItems: 2
> +            maxItems: 4
> +            items:
> +              enum: [1, 2, 3, 4]
> +
> +          link-frequencies:
> +            description:
> +              Allowed MIPI link frequencies in Hz. The driver expects two
> +              frequencies: one for 8-bit and one for 10-bit modes,
> +              typically 360 MHz and 450 MHz, but any frequency supported
> +              by the sensor may be used.

What the driver supports isn't relevant for the DT bindings. The
frequencies should only be limited here to the range supported by the
device, regardless of the current driver implementation.

> +            minItems: 2
> +            maxItems: 2
> +            items:
> +              minimum: 360000000
> +              maximum: 450000000
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@10 {
> +            compatible = "onnn,ar0234cs";
> +            reg = <0x10>;
> +            clocks = <&clk_ext_camera>;
> +
> +            vaa-supply = <&reg_cam_vaa>;
> +            vdd-supply = <&reg_cam_vdd>;
> +            vddio-supply = <&reg_cam_vddio>;
> +
> +            reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                ar0234_ep: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <360000000 450000000>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart


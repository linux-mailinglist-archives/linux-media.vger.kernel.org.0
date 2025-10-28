Return-Path: <linux-media+bounces-45842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2016C15D46
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE7140726E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A031A2874ED;
	Tue, 28 Oct 2025 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPSilQ1w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FA91514E4;
	Tue, 28 Oct 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668779; cv=none; b=NSajrrMr8Eaqk4qcMtnKqsDwy4utiv8xWEsWCcK+u6WdeTpicMQqkYrW02v5JX7GgXwbDVyTDTKTpn3MzA0Bj1x+xU+BQI3hkUKYTXScf7ziHjYKGJ1WplYCr3SqaKDhQxstPEYvIfEiKoJxSh9JedYwatgsARchjVKv0udynIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668779; c=relaxed/simple;
	bh=VMA2jd9ttRLl+Xvs20kKch9qHU+XxkLKWizBy7+uAu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSXINA3jJiDHnQZN0T8e3lTCabXFtfxyd0cj6DeUPaKY4fy6G2R0HJg/iWpUcxZEUw3IQl06LhLkjBOJUK0WexM+8Ohups/HUci5igLT84CmpwaBiCm4hYIcgAmHDuNyE1igl+SeF7H//eDXG/GWyP1/ZdexdK5MgLRNIZYCa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPSilQ1w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761668777; x=1793204777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VMA2jd9ttRLl+Xvs20kKch9qHU+XxkLKWizBy7+uAu4=;
  b=kPSilQ1w4kIKEVyhOeoZiNjIEGrB1hubrqaXsV6OE6kvS5AOsljaqZdo
   TKJOKu1RMBB5Owf1LalslGpsPP5KUmGRqw8ooyl9hRJzNgse0rLg7q10b
   VhqXewmh2FJ/d6FJuzHC6gi/EY48S1KfvOF4BYYWscuVLvN81iYP/GTqU
   r3grDenHCMeci2X3IaHAaECdyACJJqBJJIGOk21QXkPfccvHT1Z6xTrJX
   03HKumPxXgkBZMD8qztmKqem9PEaOQMeGZ6HXQ7vbf91ilOFK/sGHyhCY
   +UtLqEUJgvAw6pJYjE08P6eWVPukov5wmQIXF0q7g1ukVKfHFwgfCaTje
   g==;
X-CSE-ConnectionGUID: LIov7iW8QWydZhrE63Orpw==
X-CSE-MsgGUID: 0xfIFDwbT3SlqsM4HXdcXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67639104"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="67639104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:26:16 -0700
X-CSE-ConnectionGUID: Mu0yYC5ER8aGMZlQI6chnQ==
X-CSE-MsgGUID: FWPe3wn/QNKV3PlXE/tHQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184639110"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:26:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5979E121E5D;
	Tue, 28 Oct 2025 18:26:10 +0200 (EET)
Date: Tue, 28 Oct 2025 18:26:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2 RESEND] dt-bindings: media: i2c: document Sony
 IMX111 CMOS sensor
Message-ID: <aQDuotTgvEyzgHnv@kekkonen.localdomain>
References: <20251028092200.7003-1-clamor95@gmail.com>
 <20251028092200.7003-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028092200.7003-2-clamor95@gmail.com>

Hi Svyatoslav,

On Tue, Oct 28, 2025 at 11:21:59AM +0200, Svyatoslav Ryhel wrote:
> Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx111.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> new file mode 100644
> index 000000000000..a70017588891
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX111 8MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  IMX111 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 2464H x 3280V. It is programmable through I2C interface. Image
> +  data is sent through MIPI CSI-2, through 1 or 2 lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx111
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: EXTCLK with possible frequency from 6 to 54 MHz
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  iovdd-supply:
> +    description: Digital IO power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  avdd-supply:
> +    description: Analog power supply (2.7V)
> +
> +  port:
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +          bus-type: true
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - bus-type

Can you drop bus-type? I.e. is the sensor D-PHY-only?

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
> +        camera@10 {
> +            compatible = "sony,imx111";
> +            reg = <0x10>;
> +
> +            clocks = <&imx111_clk>;
> +
> +            iovdd-supply = <&camera_vddio_1v8>;
> +            dvdd-supply = <&camera_vddd_1v2>;
> +            avdd-supply = <&camera_vdda_2v7>;
> +
> +            orientation = <1>;
> +            rotation = <90>;
> +
> +            nvmem = <&eeprom>;
> +            flash-leds = <&led>;
> +            lens-focus = <&vcm>;
> +
> +            reset-gpios = <&gpio 84 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx111_output: endpoint {
> +                    data-lanes = <1 2>;
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    link-frequencies = /bits/ 64 <271200000>;
> +                    remote-endpoint = <&csi_input>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Sakari Ailus


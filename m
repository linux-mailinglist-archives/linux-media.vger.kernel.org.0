Return-Path: <linux-media+bounces-41881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC87B4666F
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 00:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90EF5C59A7
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 22:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9452C2F49F8;
	Fri,  5 Sep 2025 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwu0tDL4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715F27FB2E;
	Fri,  5 Sep 2025 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110148; cv=none; b=hiq6CJfd4kul0dJ52rRVnE52//HXY0aWo5ytiPwhSE3yKRmRVWd4GNRzohnNlAxbfh4ouNqjwTiijVZN006YxP/MA0ty2yzpRgKAXjh2vb4ELTbY/5dhr1rep+V+gyDbwFtfz0bUUhybssOeGJMT9EMVU8KIk4GD+0Ebtnnb1/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110148; c=relaxed/simple;
	bh=/TPeH9cto/N6YnxdtGyvfsIjc53YTNDJ03yAgRoMtBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X51fKAJqAFsR4UyPqz8Zd5n6kl1gIXhK2ocb8xKqt/hJfTIoqQWK7dn8dLQDQDIvsh57/u+w44zO4+jBEIX5yRdzWFy7UgL9ZoZFrFGDK8O7+iTSUeCg1yk6wC9YnLVv+M4k80VNZAJn7NXSQI9R0ONt8f8UpiXRCL8XoHFMd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwu0tDL4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757110146; x=1788646146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TPeH9cto/N6YnxdtGyvfsIjc53YTNDJ03yAgRoMtBY=;
  b=iwu0tDL4ZrUqM24yNivWthT6TJc/jd6fHUBMuG+f9l7Vg+HXNa1wKvjA
   URzv9X5TBrDvFstpO2N0s3/BnA50RfcfphjaNR7am8tzDwca8aHfisqAs
   /ItmmWYf191ItULzVAMnAvhOEtdU15CZx93c/eBM7WDEP/V5ab6Ab5f4s
   2TiE/T5RNKZwFXhdRnzDwswzMgT/BNVpjXftLRFTMdwfgx55YSWCAY7ux
   zXDX5MBulk5zWlmyDRC0aRfof8jXXfPDV5V0nVXHqZCZB1CxRAnXjrz2Y
   G6cYfKDLsn3B8VIGJXIbvzVewl2EtScwZ7KHrqXzPuNZeMZilWNQ1vHec
   g==;
X-CSE-ConnectionGUID: E/yVtXiTS4+mTvQBCc/XSA==
X-CSE-MsgGUID: lyrdmyCFSDKYhffx/ZLDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59403603"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="59403603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 15:09:05 -0700
X-CSE-ConnectionGUID: WfROUo81QVOQEZVXuq0V4g==
X-CSE-MsgGUID: HqfMzvGLTPOs9RY7HDQoCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176594263"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.91])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 15:09:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 94F9C121F4E;
	Sat, 06 Sep 2025 01:08:58 +0300 (EEST)
Date: Sat, 6 Sep 2025 01:08:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aLtfesWNuMovjo-j@kekkonen.localdomain>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905215516.289998-7-mailingradian@gmail.com>

Hi Richard,

On Fri, Sep 05, 2025 at 05:55:18PM -0400, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.

How many data lanes are there? Don't you need to specify that as well?

> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx355.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> new file mode 100644
> index 000000000000..d4ba918807a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX355 Sensor
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
> +  camera in smartphones.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx355
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: mclk

You can omit this as there's just a single clock.

> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  dovdd-supply:
> +    description: Interface power supply.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false

How many data lanes are there? Don't you need to specify that as well?

> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx355";
> +            reg = <0x1a>;
> +
> +            clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            clock-names = "mclk";
> +
> +            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            assigned-clock-rates = <24000000>;
> +
> +            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&cam_front_ldo>;
> +            dvdd-supply = <&cam_front_ldo>;
> +            dovdd-supply = <&cam_vio_ldo>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_front_default>;
> +
> +            rotation = <270>;
> +            orientation = <0>;
> +
> +            port {
> +                cam_front_endpoint: endpoint {
> +                    data-lanes = <0 1 2 3>;
> +                    link-frequencies = /bits/ 64 <360000000>;
> +                    remote-endpoint = <&camss_endpoint1>;
> +                };
> +            };
> +        };
> +    };

-- 
Kind regards,

Sakari Ailus


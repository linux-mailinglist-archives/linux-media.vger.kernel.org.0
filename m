Return-Path: <linux-media+bounces-11720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A52AD8CC0FF
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A059285186
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7578013D610;
	Wed, 22 May 2024 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKCqmVdL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A27D3E0;
	Wed, 22 May 2024 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379903; cv=none; b=GD+f9+3SKnJ/8jsA0VYTcdJ9Ud7QeL4nf2JUBKvXhDaDJn2t9JK9tJiJfpXtZpgOH+krSd7iM997CUdvR/Ng76I0es8pyxkR9M3oAP1vk9Owj+sorThNT9Qp/hCUI5R2VeShG+ZAMaY9ASrkefMYuj+JX7z2Stx5piMQorG47IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379903; c=relaxed/simple;
	bh=CtnT05vnBc8AYHsVdRQfm3ZfZIHntoVJb50nT3GF2uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtcfCgP8QoJ684BZA6tmIYLFaCgU4Cgh/giue04aFF9ensqsoOVyjKopeokayR53X5on49UuF6+MzCujhYeloNKq2kFZ0APIVGDA1RV4Bn1o15g5Sx6PkjJnOoUvu8T+uxXrYUVmexYyIfu4jNrdQ2uX8ULCaQJEAKQYBoXDlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKCqmVdL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716379903; x=1747915903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CtnT05vnBc8AYHsVdRQfm3ZfZIHntoVJb50nT3GF2uw=;
  b=GKCqmVdLKoyUKOKy92N3dwNgKMdkPRnC4SemuNKJ8QlLUbAJdmgXthGk
   bBbVM6DIzFiXmO452g5kDNs3m6ktj+kNqXJQcsX/6WBTclqFz2ZtVAZun
   +8TDYVe20gsy1ZTq9I3m2CgTGEA7TFFahq4O41e4jCgpfQXykpoFtNW/f
   1skXDOBHJIphxrxdzVYN3cnpn+fRF3RTTvqZiRN0CIaZFmOEReDvMDXLv
   LjKitGRWIozDhd9IkTQAu2V4SB+GF6+3qwySdNhit4FbU+RzOJuBnqxfc
   Y20wtn3DOKf/2HZkTrnJRnpVfDc1mnVaZxVA+Fjxo5k+XkhddvDspw+ih
   g==;
X-CSE-ConnectionGUID: EO70mcJiS0KiAzZgj0877w==
X-CSE-MsgGUID: aniynrUMSSSw1dJL6m5KEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30147503"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="30147503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:11:42 -0700
X-CSE-ConnectionGUID: qAn5SldGQKOSRiq9taHSHw==
X-CSE-MsgGUID: dXaG29cbROCynHDuUw5X1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33259880"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:11:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F53611F82A;
	Wed, 22 May 2024 15:11:36 +0300 (EEST)
Date: Wed, 22 May 2024 12:11:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add galaxycore,gc2145
 DVP bus support
Message-ID: <Zk3g-CGWQOx5zZkT@kekkonen.localdomain>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
 <20240504164115.64603-2-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504164115.64603-2-andrej.skvortzov@gmail.com>

Hi Andrey,

On Sat, May 04, 2024 at 07:41:14PM +0300, Andrey Skvortsov wrote:
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/i2c/galaxycore,gc2145.yaml | 65 ++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> index 1726ecca4c77..3ca5bb94502d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> @@ -61,8 +61,38 @@ properties:
>          properties:
>            link-frequencies: true
>  
> +          bus-type:
> +            enum:
> +              - 4 # CSI-2 D-PHY
> +              - 5 # Parallel
> +            default: 4
> +
> +          bus-width:
> +            const: 8
> +
> +          hsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          vsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          pclk-sample:
> +            enum: [0, 1]
> +            default: 1

These are relevant for bus-type 5 only.

> +
>          required:
> -          - link-frequencies
> +          - bus-type
> +
> +        allOf:
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 4
> +            then:
> +              required:
> +                - link-frequencies

I think I'd keep the link-frequencies for DVP as well.

>  
>      required:
>        - endpoint
> @@ -84,6 +114,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/media/video-interfaces.h>
>      #include <dt-bindings/gpio/gpio.h>
>  
>      i2c {
> @@ -103,6 +134,7 @@ examples:
>              port {
>                  endpoint {
>                      remote-endpoint = <&mipid02_0>;
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                      data-lanes = <1 2>;
>                      link-frequencies = /bits/ 64 <120000000 192000000 240000000>;
>                  };
> @@ -110,4 +142,35 @@ examples:
>          };
>      };
>  
> +  - |
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3c {
> +            compatible = "galaxycore,gc2145";
> +            reg = <0x3c>;
> +            clocks = <&clk_ext_camera>;
> +            iovdd-supply = <&scmi_v3v3_sw>;
> +            avdd-supply = <&scmi_v3v3_sw>;
> +            dvdd-supply = <&scmi_v3v3_sw>;
> +            powerdown-gpios = <&mcp23017 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
> +            reset-gpios = <&mcp23017 4 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&parallel_from_gc2145>;
> +                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +                    bus-width = <8>;
> +                    hsync-active = <1>;
> +                    vsync-active = <1>;
> +                    pclk-sample = <1>;
> +                };
> +            };
> +        };
> +    };
> +
>  ...

-- 
Kind regards,

Sakari Ailus


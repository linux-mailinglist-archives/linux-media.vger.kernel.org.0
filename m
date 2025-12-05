Return-Path: <linux-media+bounces-48336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA9CA85BF
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 17:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 376003018941
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 16:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB313563EF;
	Fri,  5 Dec 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGthqBKv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943EE3563FE;
	Fri,  5 Dec 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947861; cv=none; b=GX/jTfNvUVGdcOa8b4eDD9B6To22QydEu9AgWiJWp3QsrIAriNpT8rdPl8XxMeiUf2bu1gpoGt/FTSdEFa2N3Q3lEiY7RVWQPVIn1kDawqh7x5u7GgRWN98BQodR4Jz0XlhCXSfbQ8/QBga++aXI48JQ+GVw1q8SkBe0N6upWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947861; c=relaxed/simple;
	bh=BB4eaQ8PpoTK9UBJHV2LcFmZVSlKkOLrpVcshPmDQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpfKB/UUs/FTKqko4d3dZ2IgN5WLpOy/S60PqPiX3KqtxDaaCkf59xKZedYU/NmMHpiibIUI4axOTXDg7qWjIFokCd/aKTXf/MsZEr5EEx1e0F9PwZ/V8ynvuNCIhmmw5aQb8m1xg60KBNT7vKZEtO17dpLeHVympcB/bU+kuGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGthqBKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B35C4CEF1;
	Fri,  5 Dec 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764947860;
	bh=BB4eaQ8PpoTK9UBJHV2LcFmZVSlKkOLrpVcshPmDQ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGthqBKvXwFcemONhO/g8xC1MSndvl1zaLLgCBYoX2z5jfzwtliM/CkMtstixDxKu
	 +7bVqrj7d1iwOv+cJEmAWkuoEnF82Xzze9a7i0tJSB/VEoVvNM8OHzRFMP6zTcInic
	 lqzMo+f2q9JKv1ZgQIA4LgAzPtOlEbCLFHTewb+HqFu/DJ8zSTMaerTF2aOafhZc2h
	 hmekByae6EE9ZhfmGVyRoeLcUxpJ5P7BhVsLCgB672nwnT5V5JQFL7kBBarXV2Cgi8
	 01Hl8ZwE1ow9A5wtl/FPomNFhi1tWbFQMnUHUbZ3X4oFbYSQ+VbZt1NqKs7wt4ZC/o
	 4gojgBY2Q2Kew==
Date: Fri, 5 Dec 2025 09:17:37 -0600
From: Rob Herring <robh@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hansg@kernel.org, mehdi.djait@linux.intel.com, ribalda@chromium.org,
	git@apitzsch.eu, vladimir.zapolskiy@linaro.org,
	benjamin.mugnier@foss.st.com, dongcheng.yan@intel.com,
	u-kumar1@ti.com, jai.luthra@linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] media: dt-bindings: ti,ds90ub960: Add support for
 DS90UB954-Q1
Message-ID: <20251205151737.GB158904-robh@kernel.org>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202102208.80713-4-y-abhilashchandra@ti.com>

On Tue, Dec 02, 2025 at 03:52:07PM +0530, Yemike Abhilash Chandra wrote:
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports
> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
> port. Therefore, add support for DS90UB954 within the existing bindings.
> 
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 300 +++++++++++++++---
>  1 file changed, 264 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index 6a78288aebaa..1ef977c2e479 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -13,12 +13,10 @@ description:
>    The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>    forwarding.
>  
> -allOf:
> -  - $ref: /schemas/i2c/i2c-atr.yaml#
> -
>  properties:
>    compatible:
>      enum:
> +      - ti,ds90ub954-q1
>        - ti,ds90ub960-q1
>        - ti,ds90ub9702-q1
>  
> @@ -129,39 +127,6 @@ properties:
>        Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
>        Their number is model-dependent.
>  
> -    properties:
> -      port@0:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 0
> -
> -      port@1:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 1
> -
> -      port@2:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 2
> -
> -      port@3:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 3
> -
> -      port@4:
> -        $ref: '#/$defs/CSI2-output-port'
> -        description: CSI-2 Output 0
> -
> -      port@5:
> -        $ref: '#/$defs/CSI2-output-port'
> -        description: CSI-2 Output 1
> -
> -    required:
> -      - port@0
> -      - port@1
> -      - port@2
> -      - port@3
> -      - port@4
> -      - port@5
> -
>  required:
>    - compatible
>    - reg
> @@ -204,9 +169,86 @@ $defs:
>            - data-lanes
>            - link-frequencies
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,ds90ub960-q1
> +              - ti,ds90ub9702-q1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 0
> +
> +            port@1:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 1
> +
> +            port@2:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 2
> +
> +            port@3:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 3
> +
> +            port@4:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 0
> +
> +            port@5:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 1
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +            - port@3
> +            - port@4
> +            - port@5
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,ds90ub954-q1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 0
> +
> +            port@1:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 1
> +
> +            port@2:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 0

Wouldn't making this port@4 be more compatible?

> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        links:
> +          properties:
> +            link@2: false
> +            link@3: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> +  # Example with ds90ub960 Deserializer
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>  
> @@ -406,4 +448,190 @@ examples:
>          };
>        };
>      };
> +
> +  # Example with ds90ub954 Deserializer
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>

I don't think we really need a whole other example for something 
that's a subset.

Rob



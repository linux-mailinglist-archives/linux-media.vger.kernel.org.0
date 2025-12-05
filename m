Return-Path: <linux-media+bounces-48335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8DCA81DC
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 16:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62BD930E47EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 15:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F011532D0F9;
	Fri,  5 Dec 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2M13w0O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021081E1E00;
	Fri,  5 Dec 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947523; cv=none; b=Cpb+ZOac0rcNjlnodguI2z+AIc3NqU2izuaPzxCrzZenio808rF4Ol3RpROjMOCaIFN9BSM/5Nkxdy055W6exPII7YLCnG0iQBi20uPWOGMWZ3d5e7Z9T/c7aBpsaLD/XtGQJyzxftjG8WIXgZbHU/EwX1+uzOMKxPHpXWUgeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947523; c=relaxed/simple;
	bh=85Dky3pdM4jMjTDfHuBlol9y7D65oizquATgsjhet0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpHaXzi8rztmB3HCam4imfeHkkM41uwO4YHR46162Kg8O2C5r6mXzcd1yDM7x1cXbNuFtIzDHVqIWbkXFkRIlv/CQYLF0D+ek3GZ2GD3KNDVZEipfj+KDEjz0/Is+h/REOgYcpayCloB/gzRYdXcOScULJojmBs4R0MsQL/1ayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2M13w0O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2506AC116D0;
	Fri,  5 Dec 2025 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764947521;
	bh=85Dky3pdM4jMjTDfHuBlol9y7D65oizquATgsjhet0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2M13w0OuAuANJ6G/U2OCflIoScaAcO61v9XZgWjW4ubvq+NLuyGnZ7hm31vBCSWM
	 X0RKUfX1hcKu6t4L7oVP/IXvNTZI3r7FTJGQJD/yNX7y5G5AXCYEmod7B/E+MaVgZR
	 g3x3K4BZqP2u+kTlUYGctJxViQQZkrVl0JRPACIY5KL1smjV9iKkx94hiIlEqt9dpR
	 Fm7ed0TsYQ6k56QCT2yZ3NPkycHmfPImoOXO3AnH3DxFIVYbZ07W3l6xnOaZJwojl0
	 9OYhcduWcqmAvuJa/eb/tL9ajTm4LpNryw86aRv+7puuXcZVBkkIPK8m/bN1PZ1BRe
	 74yveevGmwWJA==
Date: Fri, 5 Dec 2025 09:11:58 -0600
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
Subject: Re: [PATCH V2 1/4] media: dt-bindings: ti,ds90ub960: Refactor port
 definitions
Message-ID: <20251205151158.GA158904-robh@kernel.org>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202102208.80713-2-y-abhilashchandra@ti.com>

On Tue, Dec 02, 2025 at 03:52:05PM +0530, Yemike Abhilash Chandra wrote:
> The current bindings duplicate the port definitions for each FPD-Link RX
> and CSI-2 TX ports. This results in a large amount of repeated schema
> blocks and makes it harder to extend the bindings for new devices.
> 
> Refactor the bindings by introducing shared deftinitions for FPD-Link
> input ports and CSI-2 output ports. No functional change intended.
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
>  1 file changed, 44 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index 0539d52de422..6a78288aebaa 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -125,102 +125,35 @@ properties:
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> +    description: |

Don't need '|' unless you have formatting to preserve.

> +      Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
> +      Their number is model-dependent.

'The number of ports is...'

Wrap lines at 80.

>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/FPDLink-input-port'
>          description: FPD-Link input 0
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -            description:
> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> -              hsync-active and vsync-active must be defined.
> -
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/FPDLink-input-port'
>          description: FPD-Link input 1
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -            description:
> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> -              hsync-active and vsync-active must be defined.
> -
>        port@2:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/FPDLink-input-port'
>          description: FPD-Link input 2
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -            description:
> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> -              hsync-active and vsync-active must be defined.
> -
>        port@3:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/FPDLink-input-port'
>          description: FPD-Link input 3
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -            description:
> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> -              hsync-active and vsync-active must be defined.
> -
>        port@4:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/CSI2-output-port'
>          description: CSI-2 Output 0
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -
> -            properties:
> -              data-lanes:
> -                minItems: 1
> -                maxItems: 4
> -              link-frequencies:
> -                maxItems: 1
> -
> -            required:
> -              - data-lanes
> -              - link-frequencies
> -
>        port@5:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: '#/$defs/CSI2-output-port'
>          description: CSI-2 Output 1
>  
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> -
> -            properties:
> -              data-lanes:
> -                minItems: 1
> -                maxItems: 4
> -              link-frequencies:
> -                maxItems: 1
> -
> -            required:
> -              - data-lanes
> -              - link-frequencies
> -
>      required:
>        - port@0
>        - port@1
> @@ -236,6 +169,41 @@ required:
>    - clock-names
>    - ports
>  
> +$defs:
> +  FPDLink-input-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: FPD-Link input
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +        description:
> +          Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> +          hsync-active and vsync-active must be defined.
> +
> +  CSI2-output-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: CSI-2 Output
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +          link-frequencies:
> +            maxItems: 1
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 


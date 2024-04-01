Return-Path: <linux-media+bounces-8309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C43894452
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 19:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049F81C21B1F
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D04D135;
	Mon,  1 Apr 2024 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HeCE9IWT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2D48CDD;
	Mon,  1 Apr 2024 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711992522; cv=none; b=iozEb5SSWZymE88gk+lJm0Zs/TDv6P9tEcpZdT4xF9cs+707wg6sAo4X9GEUMgUzKcWEdzRgqIB+9nIqfaZkogGNosfzqQRcsOY4SI+MRi1CcHDsals3/iwFeb8Hmj/Zxr2WwH9KZYPMx5JrKaFpzRL/1CvbWbhMyaeWgHhRzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711992522; c=relaxed/simple;
	bh=H0hssSsyJSJLxkXL5lGTv9x13z+xtSpWrqhRuPazvNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgH+Fdfd9Lq1Lw0YlacyPa+VbY5pcwy8MRz+AWju8G4DHjFz1Yy9BX4tZseQiuvW0O/bH/uLK/Vv5Gk77YaMJGtu2b8PWGuWwq5HUtTGJPLL7q7IOCTTYwaGEzDptBwR25/ZZuw0K0DCSLgSvmLbg95KBbUHl0wzkXoU63r4zPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HeCE9IWT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6754F250;
	Mon,  1 Apr 2024 19:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711992482;
	bh=H0hssSsyJSJLxkXL5lGTv9x13z+xtSpWrqhRuPazvNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeCE9IWT9Wrdto2KdMcsEuGLSpll1kzIgE+RvyXUqWV6Y3BaddDJBUg22G+cGAX7E
	 bz8BwVridXhphX8P5pBkL68D3AL1X+PPMly/K8Rt0rCXDx1pQG8aDeajlsQOYyNXdW
	 xP8osJGV05O/d1jxBgdUUVvTRh3t6hOsH1Tcj9jY=
Date: Mon, 1 Apr 2024 20:28:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: sakari.ailus@linux.intel.com, rmfrfs@gmail.com, hansg@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] media: dt-bindings: ovti,ov2680: Document more
 properties
Message-ID: <20240401172826.GG8623@pendragon.ideasonboard.com>
References: <20240401154341.3173872-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240401154341.3173872-1-festevam@gmail.com>

Hi Fabio,

Thank you for the patch.

On Mon, Apr 01, 2024 at 12:43:41PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> OV2680 has a single data lane MIPI interface.
> 
> Document the clock-lanes and data-lanes properties to avoid
> the following dt-schema warning:
> 
> imx7s-warp.dtb: camera@36: port:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml#
> 
> While at it, also document the link-frequencies property as recommended
> by the following document:
> 
> https://www.kernel.org/doc/html/v6.9-rc1/driver-api/media/camera-sensor.html#handling-clocks
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Keep the existing 'additionalProperties: false'. (Krzysztof)
> - Also document link-frequencies.
> 
>  .../bindings/media/i2c/ovti,ov2680.yaml       | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index cf456f8d9ddc..a1cb08283818 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -50,9 +50,24 @@ properties:
>        Definition of the regulator used as digital power supply.
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
>      description:
>        A node containing an output port node.
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false

I recommend using

        additionalProperties: false

as the bindings shouldn't allow all the other properties defined in
video-interfaces.yaml that are not applicable for this device. It will
require adding

          remote-endpoint: true

to the properties below.

> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            const: 1

I see there's an ongoing discussion in v1 about these two properties,
I'll let Sakari and you figure it out :-)

> +
> +          link-frequencies: true

I think this one should one marked as mandatory.

>  
>  required:
>    - compatible
> @@ -89,6 +104,9 @@ examples:
>                  port {
>                          ov2680_to_mipi: endpoint {
>                                  remote-endpoint = <&mipi_from_sensor>;
> +                                clock-lanes = <0>;
> +                                data-lanes = <1>;
> +                                link-frequencies = /bits/ 64 <330000000>;
>                          };
>                  };
>          };

-- 
Regards,

Laurent Pinchart


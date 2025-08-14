Return-Path: <linux-media+bounces-39943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA4B27095
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 23:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47D51B673B7
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 21:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE74F274B32;
	Thu, 14 Aug 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FllSOPqY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB83597B;
	Thu, 14 Aug 2025 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755205921; cv=none; b=k9vByMbr1QNJ6XeZBhi6IYXcbtALfAhY+irCZrPOzKjY2ojuw/03E5C2qcU/eFP6yy6Bvkr1ECl6e6Cpfae5fKBEmPK86+906+IyA/XCtZLY5NpcmzRLFE/VwWQoxhoRdpYiMGw+7AR9g2Z6R1hU8yxJ1+1xOl6DoSDcXEfsEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755205921; c=relaxed/simple;
	bh=Z4EeFVPF1em/O3CNPJOKEevSnWIxuVv3NAboAYUqiqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovfUMOu4us6DGyfljEQ+gM6gfSEJsQnHnjFBRwd5G7khlK1x4THz064d0rWqox2KvvWY2Y5dZVzXC/5aYTnoELDeb4E3Lw0eN/UMqMaHqlNwkbS1DuBNvLgLp1BZQAjRPPkqetnHMNtHq7Y2NFSWyZ5SiAmh/BIV2ckyiWXi/ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FllSOPqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814A3C4CEED;
	Thu, 14 Aug 2025 21:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205920;
	bh=Z4EeFVPF1em/O3CNPJOKEevSnWIxuVv3NAboAYUqiqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FllSOPqYzIEsdidYZFcoLP93zCsufkrQeTD8A7A+WbcA8OTiPqPWDZWgcpX5xGgRl
	 UbvR7VVGW+XURGpvx9YYudVYLylGQSQCxF9OQmBgw4NaK9lfGxuga6SZk7GQSaek2j
	 tjy619s6UD97+Ar1ICc0OoqC7VPBCMgXMq9x2xtm292VY7XBZir+PYewdBq7M1uwXQ
	 sBAaS7ui4P2kp2NMbxdJRVMBu4Ex+pqJohMJ1hNa/zZWH3uLaxNp4F2+LdooKnvaNt
	 C3kk50O05TWXdYEk3R87AZ06FtnZS4Wy70ktEXVecWElAPXFLk/UID16grlCp2RoBg
	 BcmaZe5HM+Rwg==
Date: Thu, 14 Aug 2025 16:11:59 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add bindings for AP1302
Message-ID: <20250814211159.GA3912850-robh@kernel.org>
References: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
 <20250811-ap1302-v4-1-80cc41b91662@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-ap1302-v4-1-80cc41b91662@nxp.com>

On Mon, Aug 11, 2025 at 04:42:30PM -0400, Frank Li wrote:
> From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> 
> The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> connect RAW sensors (AR0144).
> 
> Add corresponding DT bindings.
> 
> Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous try:
> https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> 
> Change in v4:
> - base on discussion https://lore.kernel.org/imx/CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com/
>   change to use onnn,model property to descript connected raw sensor
> - Overall roll back to v2, move raw sensor information under "sensor" from
>   ports.
> - regs use enum [0, 1] to restrict address range
> - add supply name from sensor
> 
> Change in v3:
> - Move sensors under ports
> - use compatible string to indentify connected raw sensors
> - Add onnn,ar0144.yaml
> ---
>  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 184 +++++++++++++++++++++
>  MAINTAINERS                                        |   8 +
>  2 files changed, 192 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d66962d2eadca3f4d86c99a68d5ae7996bd1a522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:

You need a '>'

> +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> +  Frames are output side by side or on two virtual channels.
> +
> +  The sensors must be identical. They are connected to the AP1302 on dedicated
> +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> +  from the host.
> +
> +properties:
> +  compatible:
> +    const: onnn,ap1302
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description:
> +          Reference to the CLK clock.
> +
> +  enable-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the EN pin (active high).
> +
> +  reset-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the RST pin (active low).
> +
> +  standby-gpios:
> +    items:
> +      - description:
> +          Reference to the GPIO connected to the STANDBY pin (active high).
> +
> +  dvdd-supply: true
> +
> +  hmisc-supply: true
> +
> +  smisc-supply: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: MIPI CSI-2 output interface to the host.
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
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +        required:
> +          - data-lanes
> +
> +  sensors:
> +    type: object
> +    additionalProperties: false
> +    description: List of connected sensors
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      onnn,model:
> +        enum:
> +          - onnn,ar0144
> +          - onnn,ar0330
> +          - onnn,ar1335
> +        description:

You need a '>'

> +          Model of the connected sensors. Must be a valid compatible string.
> +
> +          If no sensor is connected, this property must no be specified, and
> +          the AP1302 can be used with it's internal test pattern generator.
> +
> +    patternProperties:
> +      "^sensor@[01]":

"^sensor@[01]$"

With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


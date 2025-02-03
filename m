Return-Path: <linux-media+bounces-25605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961AA2664A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 23:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1AAB1647B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 22:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862D8209684;
	Mon,  3 Feb 2025 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJDcfNuV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B54182B4;
	Mon,  3 Feb 2025 22:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620052; cv=none; b=rApFjyWicUtZDTAsJuWEycGyynQCcNA4PTz0rDy1OkvVObmlutUfknAcBDyhCNuPLrK+ycjo3wbefZOHT039kXvCOtLJO9VhXbcT/qTMjq96xJrcV6LVG86ZD1foRJ79aMz7IST+9fzUc3zWgyQqA8Mk4y+fIwcgM78j+0lqu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620052; c=relaxed/simple;
	bh=EezpAkBoF00zoksO8UOZh2TfHi73W3du7AXPR52YZEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmGrKS+xCeaStVBZj3SZ8ljUP/+n8GhhwEXfk9SkIQsRENGf7IPrlpXrySl31HH3SDBAGC/J69k+ihiD46lMqcD4XMNRY1NYC9HBhT4kWtPX2ORO/76Ay/4HXwYuc8433c+BGSvmWwMzWN0/CRhGVevrF3lMJYjxS5J+4ssZ8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJDcfNuV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D980C4CED2;
	Mon,  3 Feb 2025 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620051;
	bh=EezpAkBoF00zoksO8UOZh2TfHi73W3du7AXPR52YZEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJDcfNuVQehzIIhYWFfRycZA7HXKJl4RHWD3q0+OgGvbAvMdJ+peRG96CU7FvPvt4
	 3PDF/pyir2PwxQpzmGjFkOo5Jvvx1IhEVUw1ERanAvB66ZD500bSk10yuFMZYyY1d5
	 kR19G5gF0GEBUVYIUzZXwprGgMEcJ9L8jWSQkK1WvZ3oiVxCyCdW5eR0KQKG+XUyni
	 ZAT8zJlDNbBlUnjrvuqKHLv0kdmpyvhUarN4WgHOT2pqi6A9Vm/XWNwKYXGk8IIRA3
	 sAC7Uz8I3gKOLkQGqmxKHSzcelFE7ZuKBDjYwdMW57ybpXT3yDRkJSmFEfkjCCQs63
	 fL2rOKE1tmpIA==
Date: Mon, 3 Feb 2025 16:00:50 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [RFC 02/12] dt-bindings: i2c: maxim,max96712: add a couple of
 new properties
Message-ID: <20250203220050.GA114735-robh@kernel.org>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
 <20250131163408.2019144-3-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131163408.2019144-3-laurentiu.palcu@oss.nxp.com>

On Fri, Jan 31, 2025 at 06:33:56PM +0200, Laurentiu Palcu wrote:
> Add new properties for configuring FSYNC functionality and operation
> mode, as the chip can support both tunneling and pixel modes.
> 
> While at it, add the maxim,max96724 compatible to the bindings since it
> was already added in the driver some time back.

I don't see that change.

> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 26f85151afbd3..410004f3a032f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -36,6 +36,48 @@ properties:
>  
>    enable-gpios: true
>  
> +  '#gpio-cells':
> +    const: 2
> +    description: |

Don't need '|' if no formatting.

> +      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
> +      number must be in range of [0, 11].
> +
> +  gpio-controller: true
> +
> +  maxim,operation-mode:
> +    description: |
> +      Deserializer mode of operation: 0 - tunneling mode, 1 - pixel mode
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  maxim,fsync-config:
> +    description: |
> +      Frame synchronization (FSYNC) is used to align images sent from multiple
> +      sources in surround-view applications and is required for concatenation.
> +      In FSYNC mode, the deserializer sends a sync signal to each serializer;
> +      the serializers then send the signal to the connected sensor.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    items:
> +      - description: |
> +          FSYNC mode:
> +            0 - off, no FSYNC generation
> +            1 - internal, GPIO is not used as input or output
> +            2 - master, GPIO pin is used to drive a slave deserializer
> +            3 - slave, GPIO pin is used as FSYNC input driven by a master device
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +      - description: |
> +          FSYNC TX ID: GPIO ID used for transmitting FSYNC signal
> +        minimum: 0
> +        maximum: 31
> +        default: 0
> +      - description: |
> +          FSYNC pin: 0 - MFP0, 1 - MFP7. Not used for internal mode.
> +        enum: [0, 1]
> +        default: 0
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -92,6 +134,9 @@ examples:
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
>  
> +    maxim,operation-mode = <0>;
> +    maxim,fsync-config = <1 0>;
> +
>      i2c@e6508000 {
>              #address-cells = <1>;
>              #size-cells = <0>;
> -- 
> 2.44.1
> 


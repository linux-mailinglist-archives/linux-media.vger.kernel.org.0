Return-Path: <linux-media+bounces-36141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC431AEC019
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 21:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FD9C6A3C40
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F01221C190;
	Fri, 27 Jun 2025 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv3JKSY7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945D20B80B;
	Fri, 27 Jun 2025 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053099; cv=none; b=Rp9UYrO4PjGc7O5b5eb77Cgmtrei1YOqSZES7MWLA6169tzxOkV0vThB8H27TqAj7+dkli+1g/NQRo3udST6gOb2in1ECAu/uve1Wtu2U56M1AUHKw/CkHnswIYtiqZunsAoyq2WW8WobO3MTCSJqf+9BqV2jC/hIbFu8vW6uEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053099; c=relaxed/simple;
	bh=735/kAbCuqWFzGQy/87S1JSxB/l43GhAFiWH7b5eExk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/9W4l5Qx/UQ7v0i7XvxksKByQsgMeejvCSu/K45OgY/X4LIEl7Rm/TLRjZuncejxZEWcwJK4pdLN2Qh3Hgk1taTm64iPjuUsNuk2BPM+ElmGp01j8e+rotdl+RJFuELQ3fOR0rOaB705lUbMybHy59oxDsJk0CU06AB9s0YQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv3JKSY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E1FC4CEE3;
	Fri, 27 Jun 2025 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053099;
	bh=735/kAbCuqWFzGQy/87S1JSxB/l43GhAFiWH7b5eExk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv3JKSY7xsPIult6z98FBvCjWmWYP+vOw7hFbC3qqSEDzWLGlk9PB39DMgGDn4NbS
	 pHfesi22YUwypbfO06LdjDiPBepbwwUV1YFgR4acriSIeqXYQWqEBT+xyJhpOeahKn
	 r2iS7ymkJ5GArX5aC8dKyaISXLaOO5Cq2/hrfIwT9OBZc2jZFjLwGn8cgyMsk+DUDu
	 /ZgfrfM7hy2HGNXH29qTY70aGBlxRrIEeXfZirFgMwfS+LY3sw1hA1uPy8d+GHKjZx
	 gtBQo+pT8bnVY0eWfKkuhV+Sf8qJss6lFFzr2aDlf9dKhPRoW+bnqVgaCd8+lcWERm
	 wYwtnbRbpOv4w==
Date: Fri, 27 Jun 2025 14:38:18 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
Message-ID: <20250627193818.GA4051037-robh@kernel.org>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-5-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>

On Wed, Jun 18, 2025 at 12:58:40PM +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 167c3dd50683..5998e2518be9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -121,6 +121,116 @@ required:
>    - reg
>    - ports
>  
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [gpio, rclkout]
> +
> +      pins: true
> +      drive-open-drain: true
> +      drive-push-pull: true
> +      bias-disable: true
> +      output-disable: true
> +      output-enable: true
> +      output-low: true
> +      output-high: true
> +      input-enable: true
> +
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3
> +
> +      bias-pull-up:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-up
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-up
> +
> +      bias-pull-down:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-down
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-down
> +
> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.
> +
> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0

The minimum is already 0 being unsigned. Elsewhere too.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


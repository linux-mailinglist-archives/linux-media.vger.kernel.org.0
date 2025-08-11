Return-Path: <linux-media+bounces-39392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B14B1FEFC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9940A3BD602
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 06:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028E427E052;
	Mon, 11 Aug 2025 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRoDo3Ml"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F44A1E;
	Mon, 11 Aug 2025 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892599; cv=none; b=k+MRxk5mARf7I1tLy+pN4rwmXbyGlJgvX61X6/anH/dQ/plfpXC1kfwLwtwXlWkjngQ2xFny9qQShFPgQDnKSq58WwdR0Kdcq3BlBcwPtAwe4x2OGRg+H8NggR9PYznJmusIstuLzzZFzci64euiSCk6GVH4j1LWF/ZQjjmUEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892599; c=relaxed/simple;
	bh=YImJWo73EIDALzqv/DWR/rvJ8iwLwHxanbsRSC5tTx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XN3ITtt/+/ciKpU5ZCDMJhOBxXPmn8LU6/pb+F6lN99fTx/LCCtLr3DUegNz7kVfqTPpKGGAg6nP6LwgV7wZywSrH9RrRRYxFbZU4qpfuNA9W2ONcA5FhEYCnJ7AlSDPRuvxBBPjU5wxjCwy8V+idXF8eQUMGilYhiORMQFoB1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRoDo3Ml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C2CC4CEED;
	Mon, 11 Aug 2025 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754892598;
	bh=YImJWo73EIDALzqv/DWR/rvJ8iwLwHxanbsRSC5tTx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HRoDo3MlPxIn0S2fa7cLKOkZ5dGSRWLr+RmHV94i1tatY0RfF9UquROk01qMgh4w1
	 GNsNS+wFUfffmCbrBvBGlcwJqccQXgiMW+yLY6xK4BlnqdNJ0ZDkBZfBlaJtbE4MDO
	 49jm4FPff9mHypKDDX8KHX4fOdPFoh7fsawepGUfl8J2waMyaB9gaR08HE4MDt4999
	 7GGDmDyULPBeFXeK9OzO4CWW+HgMczkIEPNbLWwf+PRNlI2NIBuJ2D4dfdkxWB/KlI
	 nl8E236JwzGbcV8NqlAy9xI2XGvJspc7fJE69rdzVexJdBJhYlAtN8mQWqWhRKojyz
	 SQhSlJkQfR/7A==
Message-ID: <cbce029f-6a0e-4df6-ba6e-1e0aab4d77b1@kernel.org>
Date: Mon, 11 Aug 2025 08:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Pinefeat cef168 lens control board
To: Aliaksandr Smirnou <support@pinefeat.co.uk>, devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
References: <20250810192609.11966-1-support@pinefeat.co.uk>
 <20250810192609.11966-2-support@pinefeat.co.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250810192609.11966-2-support@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2025 21:26, Aliaksandr Smirnou wrote:
> Add the Device Tree schema and examples for the Pinefeat cef168 lens
>  control board. This board interfaces Canon EF & EF-S lenses with
>  non-Canon camera bodies, enabling electronic control of focus and
>  aperture via V4L2.
> 
> Signed-off-by: Aliaksandr Smirnou <support@pinefeat.co.uk>

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.
</form letter>

> ---
>  .../bindings/media/i2c/pinefeat,cef168.yaml   | 48 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  7 +++
>  3 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> new file mode 100644
> index 000000000000..ae0c77de5cb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2025 Pinefeat LLP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinefeat cef168 lens driver
> +
> +maintainers:
> +  - Aliaksandr Smirnou <support@pinefeat.co.uk>
> +
> +description: |
> +  Pinefeat produces an adapter designed to interface between
> +  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
> +  features for electronic focus and aperture adjustment. The cef168
> +  circuit board, included with the adapter, provides a software
> +  programming interface that allows control of lens focus and
> +  aperture positions. This driver enables controlling the lens
> +  focus and aperture via the V4L2 (Video4Linux2) API.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pinefeat,cef168
> +
> +  reg:
> +    maxItems: 1

Missing supply

> +
> +required:
> +  - compatible
> +  - reg

Also here

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        lens_node: cef168@d {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "pinefeat,cef168";
> +            reg = <0x0d>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 77160cd47f54..dab27f769b0a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1195,6 +1195,8 @@ patternProperties:
>      description: Picochip Ltd
>    "^pine64,.*":
>      description: Pine64
> +  "^pinefeat,.*":
> +    description: Pinefeat LLP
>    "^pineriver,.*":
>      description: Shenzhen PineRiver Designs Co., Ltd.
>    "^pixcir,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..50dbe343ffc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19985,6 +19985,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
>  F:	drivers/input/keyboard/pinephone-keyboard.c
>  
> +PINEFEAT CEF168 LENS DRIVER
> +M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
> +L:	linux-media@vger.kernel.org
> +S:	Supported
> +T:	git git://linuxtv.org/media.git

Drop, unless you have commit rights there.


Best regards,
Krzysztof


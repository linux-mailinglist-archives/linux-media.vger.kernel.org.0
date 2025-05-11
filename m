Return-Path: <linux-media+bounces-32248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7AAB2AA9
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 22:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C4E3B4EB3
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 20:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E6725DD10;
	Sun, 11 May 2025 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9D+vHWD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F41714AC;
	Sun, 11 May 2025 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746993819; cv=none; b=X2SgJpZf4eNeNk4w9oU2iIa/vqSvDmc8r/gg5Jf9XtQ3/7rxg2eNfeghB5751L79ihbdT0QE12l16ZgULRvi0V/SRAZEjFM/0m50rb9C+4yimdb3tNmyUhZ84FvtelZD4gWv6rIdUFqCohldeA0bfQ9e55ch+u9LJ6UmC9mi2dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746993819; c=relaxed/simple;
	bh=zWxkPb7GPUMz8xpMK0hqm+8jwUqUNLAwd3cO5x1lygM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NXAjPugdZXuHAtLcy7frawLaGKW9taQGamUBqT0bcoAINQQuvQqHSh4QBLcSkaPbRicCiQWQf1sglGMZjxijgU3XUn/8AsMn5B+TqjSB1Qtk2faBmeabUuVQvqKfgXiaJfc5shGZHVEMbS+dBXIPNCI8pugnn7jaT2+QM1YrhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9D+vHWD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EF6C4CEE4;
	Sun, 11 May 2025 20:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746993818;
	bh=zWxkPb7GPUMz8xpMK0hqm+8jwUqUNLAwd3cO5x1lygM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=m9D+vHWD8RBGHgAY31il4t9dVxEwy43J66ypcsTo5cnEjczS55psACq6lJ2saxM9I
	 aJcjQHUSPvicVAtglraqv9lUHwFZdxf92Ec20npE2RfMDHCy0rPA6l7BYBwQgG1l+U
	 LZpFKFDWQlU0xJ/I7XeHTQeFoO5G8ZSqUGC6ulW/9YFA5q0qFW5hyICfVMiQGihB2K
	 hlNCJHr7WEkrYNCOP/m/FYE0jJSLcEhhCPBu31KD3LBWriM/Lu3xqSJGiFDg/C+PhR
	 1lBNJsdLMSLQ2us93OUbmFX8VSlv4vBv/PRJVpZn+Ozeu3V2dIo5PwDGL+TcgCLQ9G
	 vsN/XDIGHDGXA==
Message-ID: <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
Date: Sun, 11 May 2025 22:03:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Junhao Xie <bigfoot@classfun.cn>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/05/2025 16:47, Yassine Ouaissa wrote:
> Add the device-tree bindings for the allegro-dvt Gen 3 IP decoders, and
> update the MAINTAINERS file.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegrodvt,al300-vdec.yaml | 86 +++++++++++++++++++

Looks untested so limited review follows.

A nit, subject: drop second/last, redundant "DT bindings". The
"dt-bindings" prefix is already stating that these are DT bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> 

Please organize the patch documenting compatible (DT bindings) before
their user.
See also:
https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> new file mode 100644
> index 000000000000..ea4a55de570c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description: |-
> +  The al300-vdec represents the latest generation of Allegro DVT IP decoding technology, offering

Wrap at 80, see Linux coding style.

> +  significant advancements over its predecessors. This new decoder features
> +  enhanced processing capabilities with improved throughput and reduced latency.
> +
> +  Communication between the host driver software and the MCU is implemented through
> +  a specialized mailbox interface mechanism. This mailbox system provides a
> +  structured channel for exchanging commands, parameters, and status information
> +  between the host CPU and the MCU controlling the codec engines.
> +
> +properties:
> +  compatible:
> +    const: allegrodvt,al300-vdec

Undocumented prefix.

What is the actual device name? al300? Can you have al300-adec? or
al300-dec?


> +
> +  reg:
> +    items:
> +      - description: The registers
> +      - description: the MCU APB register
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: apb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MCU clock
> +
> +  clock-names:
> +    items:
> +      - const: mcu_clk

Drop clock-names, pretty obvious

> +
> +  memory-region:
> +    items:
> +      - description: Used to allocate memory for the MCU firmware,
> +      and is also used for various operational buffers required by the MCU during codec operations.
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string

Drop, type is already fixed.

missing maxItems: 1

> +    description:
> +      If present, name of the file within the firmware search path containing
> +      the MCU firmware.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    axi {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ald300: ald300@a0120000 {

Drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "allegrodvt,al300-vdec";
> +            reg = <0 0xa0120000 0 0x80000>,

Here 0 is not hex

> +            <0x01 0x8000000 0x00 0x8000000>;

but here is hex?

Also misaligned.

Also: very odd large address space.

>  


Best regards,
Krzysztof


Return-Path: <linux-media+bounces-26025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EDDA3187B
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 23:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 117697A176C
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 22:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A63268FE6;
	Tue, 11 Feb 2025 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwxGUsru"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1DD267735;
	Tue, 11 Feb 2025 22:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739312453; cv=none; b=nuk+PEWnbzV1n2Qx+X1YpYTmfv32JYJkWpcMoH2bF5sKEBuCt/L8DUBl3vBejuN2d8g34nKXxUTT0O7mM7+67KZ9dm0g+ppy4y0QBt7MpIwzeC5s2Gr8NSx3U9BrfRoG7jLtRw3PO4EG6v9CZfJTKZr6YKOX9Q2B+iem1SF/4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739312453; c=relaxed/simple;
	bh=rm/mPom9O53rzuai9/9yCCN3l8DHv5fmZsGl/Jcd/cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1uFYrX9yvN8p9EKLnZ5TII+YnFs+SH/jSsykA94EmsVPQh6WHUbS8G4gYyYhyDocPJJWUGbVtqW5w2Hd85YxZbrGIBgYM+m5Icqd4WfS0WB7B5/ixHiwxjgUfVfQcKC3eraRZYZVtTNlKAXhH+XO/IwR5YeYPKMTbTv4hxJB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwxGUsru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9950C4CEDD;
	Tue, 11 Feb 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739312452;
	bh=rm/mPom9O53rzuai9/9yCCN3l8DHv5fmZsGl/Jcd/cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwxGUsru+22EfdRz6VurnP19Mh+6v8rbJsY6pBppKOb6FUwmeRwAVCRLQOpxFj/q/
	 ZUwGB+6X+pcMM2K4GFoimGUA1NnewnIEIFIscilqHBPWKsB0WzClu6Psb3HCz0wskk
	 Hu9E5UVN5RjPBUh7etb+Rxr9goc9FzeA3+3Fn9UjTPeyRG+/5y0sDlaAa5JYVKZFi7
	 b3SBuFrNTGIlkecNVNRCoRbWsMJXNTKthFxOSy3K6HwULlUXQC191OdjYj7yxJxZa9
	 oanPS68QwU1KHMciEW4saxbVJU5oIpUyPmoLjUaqSdpaxCsN1cgKTSYbm7V6SoKy6D
	 IYaIWXLABMnDA==
Date: Tue, 11 Feb 2025 16:20:50 -0600
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	review list <kernel-list@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250211222050.GA1285038-robh@kernel.org>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
 <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>

On Thu, Feb 06, 2025 at 06:02:36PM +0000, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/media/raspberrypi,hevc-dec.yaml       | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> new file mode 100644
> index 000000000000..06db7004c765
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi HEVC Decoder
> +
> +maintainers:
> +  - John Cox <john.cox@raspberrypi.com>
> +  - Dom Cobley <dom@raspberrypi.com>
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> +
> +description:
> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,hevc-dec

SoC specific compatible please. If they are 'the same' then 2712 can 
fallback to 2711.

> +
> +  reg:
> +    items:
> +      - description: The HEVC main register region
> +      - description: The Interrupt control register region
> +
> +  reg-names:
> +    items:
> +      - const: hevc
> +      - const: intc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The HEVC block clock
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    video-codec@7eb10000 {
> +        compatible = "raspberrypi,hevc-dec";
> +        reg = <0x7eb00000 0x10000>, /* HEVC */
> +              <0x7eb10000 0x1000>;  /* INTC */
> +        reg-names = "hevc",
> +                    "intc";
> +
> +        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&clk 0>;
> +    };
> +
> +...
> 
> -- 
> 2.34.1
> 


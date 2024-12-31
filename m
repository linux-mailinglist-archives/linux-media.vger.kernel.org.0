Return-Path: <linux-media+bounces-24197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FB9FEF9B
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 14:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9C63A2E63
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 13:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A66419E975;
	Tue, 31 Dec 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RX7Ao25i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4819D071;
	Tue, 31 Dec 2024 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650915; cv=none; b=Hvb5+AhpuOLo7m5XV3RSadVKBWsJwJU9Wf8hkmkcXYYTZbdAHioCb2vOxKTdwtxMp2AdoxgzhryXGS4OMaTI+2Xlj+z6WWzC2D0hRU3uNnu4kQxx8EKSOFSrykKVZNdAESgSFPaKknCrv3xKkYwkFnj0UpJfOQ7+RJ0QN2S8OOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650915; c=relaxed/simple;
	bh=nvsh9Hvz0RPwYbdby7Q7s9xJtS8h+MKFRF15jRDWILo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX+utCDo/sMdcIZdn/cbMWT5W5ZFQ2pVkX09DvbSiyW8S58rl98ai97L9tk4qg7k7oJZSUJRz9vE5beOiHyVOdiQWZ7y1vcNY6XPDRh5xZmxYBaMuwTicPV7ruDM9EB5eL5ymnp5wPAyL79wK2MM+10r/6EPUqAJ/Ha0E5wSd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RX7Ao25i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1147EC4CED2;
	Tue, 31 Dec 2024 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735650914;
	bh=nvsh9Hvz0RPwYbdby7Q7s9xJtS8h+MKFRF15jRDWILo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RX7Ao25i/Zdxjq3X/KZBLxYLx85vtFbipwhsDQ7mhWjFDk3q2buj+hBt0Q6Gwu+v9
	 g3s+V1mFrIo1AS/fQIzHIjpKvXkhjQFs5pnpA6nwzvkhMpagfuXdCO1X5XtgyB8GDm
	 g15BDyzzn55qpz6xywhLU+Btiml6oMPSps9ZkZ+0w0ll6E3BibGfgYI2wVDOnFckpg
	 0Q2sehbWgpFjzsblZyMxswCv8W/TtLTHtFGtB5NMOXDHqzregcOttYmtNfRHmyq9Nd
	 83pZqtwdCV7+Kgn/yOkC688PgYFdnXUcC9LiDeDEVMOJDoKm0sBr3OgsZG3ZaFkdN0
	 AffSaO8hqgQ9Q==
Date: Tue, 31 Dec 2024 07:15:12 -0600
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
Subject: Re: [PATCH 4/7] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20241231131512.GA45470-robh@kernel.org>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-4-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-4-0ebcc04ed42e@raspberrypi.com>

On Fri, Dec 20, 2024 at 04:21:15PM +0000, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> new file mode 100644
> index 000000000000..d9e804300297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> @@ -0,0 +1,72 @@
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
> +description: |-

Don't need '|-' if no formatting to preserve.

> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,hevc-dec
> +
> +  reg:
> +    items:
> +      - description: The HEVC main register region
> +      - description: The Interrupt control register region
> +
> +  reg-names:
> +    items:
> +      - const: intc
> +      - const: hevc

Doesn't match the description in reg.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The HEVC block clock
> +
> +  clock-names:
> +    items:
> +      - const: hevc

Not really useful when there is only 1 possible entry and also when it 
is optional.

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
> +        reg = <0x7eb10000 0x1000>,	/* INTC */
> +              <0x7eb00000 0x10000>; /* HEVC */
> +        reg-names = "intc",
> +                    "hevc";
> +
> +        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&clk 0>;
> +        clock-names = "hevc";
> +    };
> +
> +...
> 
> -- 
> 2.34.1
> 


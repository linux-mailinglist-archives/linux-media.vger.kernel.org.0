Return-Path: <linux-media+bounces-16458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6044956583
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 10:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61530282FE7
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D350A15B0EB;
	Mon, 19 Aug 2024 08:24:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B4158538;
	Mon, 19 Aug 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055865; cv=none; b=fGbxPOVeHNQMFSJ/IAYDKJVorzD2FTwSNaoqurQeSXDAQH3ypEDTECkVuBAhoq7IlZwR3zKkqVmyZ5kcrYveFsGo9FGa9p6IWBTQLG9sUAADunQhP8EysGn7vtb+4bItJTSaCFUqqlnw5yfrXcVo7qshA7Z3o7b0BAWXYs3LJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055865; c=relaxed/simple;
	bh=/Mu2Fxp3HAfnm01QnvBGwhr+2bpInI9/rue80SauDuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCVZxwer23c09vEnh4MmjJmu0WqoWk8fxwx8W3oyF3v/pz4g/g7vGLarWEKCYyySsh+eZM91qYD2slAnOVHAAa6wcbLmKnNUGQUHC64Oi3wpypY1Zw4PtVCVfs+7J2y3QgcLQ01lyV0z8E3GVxNQU/pHCLe8LUXm3XqsbWtjW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428163f7635so35308805e9.2;
        Mon, 19 Aug 2024 01:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724055862; x=1724660662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0eCcNffw7KnF9YgXX3UKwNuk5QFOegAlk5VPZFJsEM=;
        b=vNHXheDqSuKUxu7UskrFtvHuXq6jp/mh1NuhDmxoTwVWGzdCgaF26TVMiBx4nSBGUv
         jLE35oDVohfMvtsZ8Hl/lO/cmDHb4h70HdG0H7ZCiktoICvMKkInkWqKtu/K6u6ttVoN
         egY1bldEARcckUGM5a9FYGKoMLLKvCkboB4Ttb49ZKni4mFE6COJmOvHCKeaeClXzZ+h
         oWUxMhcnlw+xjzp470CqmJ1WUuTePaBMGhhY55fbkRy7x3SqumylVkfUAot5gt269U9a
         LeQJ9e0tkoaI+PhOpe/YzKE1jXp0JTYDuT7mlDGmdkOE3gj3b0HntWIVKiTO7FwfSNgx
         Dm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKc5nMCgtHqvILMvNKcp628ptu7eQB8TcUJ979EwzyVZFDyl9wkRm6BMxz5xgJxOA+iwA6icoB67eBpkM+wGhZiMq0r3DrbOUhgh9rF25kCiV3keoNTnWfsRKTzxDFuPzs/L7THZIpecreJbCShgSQvsHm3bUedFxwPySrIr8eWZWF5s9f
X-Gm-Message-State: AOJu0YyZReoFFbYSqDprsI0T0mIEMZTngpd6dKKEPXXYIOb3h6JfRpxX
	t1jE+5sh8ZFPJKKYVf/fTBGnUDPtZGvDdEeHWjL/iRh0HvTqSbB77Afryw==
X-Google-Smtp-Source: AGHT+IH7mpE5mezXCGqwhTCXdlU32Io00+sJo7Wg82P1kgrhRFRqhvNEluxZz/pLolJcGdWRdb8zgA==
X-Received: by 2002:a05:600c:1c25:b0:429:a0d:b710 with SMTP id 5b1f17b1804b1-429ed79c76fmr61970335e9.12.1724055861594;
        Mon, 19 Aug 2024 01:24:21 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded72524sm157543425e9.34.2024.08.19.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:24:20 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, eajames@linux.ibm.com, 
	mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au, hverkuil@xs4all.nl, 
	pmenzel@molgen.mpg.de, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Message-ID: <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
 <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819080859.1304671-2-jammy_huang@aspeedtech.com>

On Mon, Aug 19, 2024 at 04:08:58PM +0800, Jammy Huang wrote:
> The Video Engine block in ASPEED Silicon SoCs is responsible for video
> compressions with a wide range of video quality and compression
> ratio options. It can capture and compress video data from digital or
> analog sources.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/arm/aspeed/aspeed,video.yaml     | 81 +++++++++++++++++++

Why are you adding duplicated binding? Please read the first comments -
you need to first convert TXT to DT schema. Then you add new properties
in a new patch.

>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
> new file mode 100644
> index 000000000000..bef7bd2f310a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml

Filename matching compatible.

> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/aspeed/aspeed,video.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Video Engine

ASPEED or Aspeed?

> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +  - Jammy Huang <jammy_huang@aspeedtech.com>
> +
> +description: |

Drop |

> +  The ASPEED video engine can be configured to capture and compress video
> +  data from digital or analog sources.
> +
> +select:
> +  properties:
> +    compatible:
> +      pattern: "^aspeed,ast[0-9]+-video-engine$"
> +  required:
> +    - compatible

Drop entire select. No clue what is this.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Preferred naming style for compatibles of video components
> +        pattern: "^aspeed,ast[0-9]+-video-engine$"

???

No, drop.

> +
> +      - enum:
> +          - aspeed,ast2400-video-engine
> +          - aspeed,ast2500-video-engine
> +          - aspeed,ast2600-video-engine
> +
> +  reg:
> +    minItems: 1

No, maxItems.

> +
> +  clocks:
> +    minItems: 2

No. maxItems.

> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: eclk
> +
> +  interrupts:
> +    minItems: 1

maxItems

> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the scu node that is needed if video wants to capture
> +      from sources other than Host VGA.
> +
> +  aspeed,gfx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the Soc Display(gfx) node that needs to be queried to get
> +      related information if video wants to use gfx as capture source.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: true

NAK, this cannot be true. Where do you see any device binding having it
true?


> +
> +examples:
> +  - |
> +    video: video@1e700000 {

Drop unused label

> +          	compatible = "aspeed,ast2600-video-engine";

Fix indentation, this is supposed 4 spaces.


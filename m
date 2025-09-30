Return-Path: <linux-media+bounces-43369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FA3BAAC8A
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 02:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9EE3A57FF
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 00:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84161494CC;
	Tue, 30 Sep 2025 00:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aeTUPpAF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18486340
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 00:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759191613; cv=none; b=Cb4f9A+EE8Ulb9ZA3ey2P4+gmMcu8ujIP418Of6i262zzFk8hc7Ojt7DNa8AE2V/LK2X3cqoXfkCiHxdi4unZLkIZmOdPv2Yvs2/Z71xMBDp6kJNPv7yxXjl3tuIb6GrnLkbiWNcECGJGwfF+kplTis88DpLiqyFzvkMvDihbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759191613; c=relaxed/simple;
	bh=bGJExyvnphif6tEqyhuSLem/gtWUtTjLU/NamGZuKDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3SjPpt7463Y954q26f8+CVvGipZnHC4E5MPxFUVCAYZazIhBXxbMjfRTf0xhC+FgA78KCYFj9xyfsyfVmJCRvyLwu7ay0CFrWW8cvTgXcKT9d0dy+JdpfXWOODYSGaXfiVEQGMSKbsPFpvdRzERkvkoihVNTO1oBa1KKR9vWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aeTUPpAF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e504975dbso14567215e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 17:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759191610; x=1759796410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2aCUV6OLkXwTtwNzSY66MPjJRvAozma0kNGW9LaNrE=;
        b=aeTUPpAFcFjVVztIwRLOygSFFOCICyk1pi+SLaBo1O7Q/0i63V4Aw5JK3qb0qKlofx
         V6+M2hwmLuUAzZ8+I4mHrUK5CLaXDQbwlU7wz6KdP6dV3azxKQ6afoE8L+4TJrVHG3MP
         u84FIxpXONcVMyAf8of45olXaSzkU2pz63Dhi8ROpCQsvHjAoYgCBdkYSisgIgNsbGb2
         QlJwDUzDDD4IcIK7hd5NQjBChwPSOqZEeamDCOUq/lBHdDnK03IlfWWnOMjYM1/eaSrX
         0m4ZmKQXC+hykGUbLSLJUDFjSiqDVTa3RD0kzGHUMoG9ivFj7G6m6BlvZqACrRUqifxF
         XYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759191610; x=1759796410;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2aCUV6OLkXwTtwNzSY66MPjJRvAozma0kNGW9LaNrE=;
        b=uuXNNAW2myTgJ8vmqHJOiI1F04wctU7aej7VX95NBkdrfpflLzPZ6+7RtgSu5m4/zq
         YXUFO5dVw81FzMfnJdI5ScsA3ar28bpwMPPEiYpbheLIzlTfjxE9nwCOczUyFJI/8ypv
         g/Sw10yGwNJ8aJ+sbbe4o7rQuVJjlsOV5HOLT31InevIfi9rAVadINaMEO6UFFu+wl8I
         jpCpfhMdTxkFObtdLFo8h1MyQPSuvbtCV8oFXfYbRuishJdFHe/ggb3fDjtBf50xGZor
         nm8wAsbQZec9fybCexroE1Zm5VeTZ9fH3hEcWawI3JTmcyU2EqXV2rzjbt0zxui3qgN1
         OECQ==
X-Gm-Message-State: AOJu0Yy5TOfxjpcoUCbotR2uktf3QXZuKM8aC52+Om8rfAiI+kALllT1
	3960+0au2zwtW2eOVz60IzCXL7yIbxJ+EETsOs5ziZpCQNTd4BLo0v8V2ZWUGXq54ms=
X-Gm-Gg: ASbGncu0aMaQPXTy6NZI7o4XRv97m0TmyK9DOdt2wQO55y7mDYMqZT06XrrO9B6H7ua
	LrAU0xKjjBBs+aFU1B3rlvJVc7e10PSKIOql1vS2zd0ev7tuMl8ZD5WEd1eHObzjSN3luyWNqQL
	8vb2MZiP0a7uSdKB5ryAu/nkaR80FFVE3j+/2BY5QjxeQGM8KN1nFH3VYr2gHaC6gpHTzYD/fd8
	U/B4SAr9sd4t1GbY4u3MzTaeBDU3Ti1Q1pKpu7F284VV637AYes9IKFmLVV1odUQUTrcI59gdeD
	68M+LqdYdM7DLGORr0QEyG3qWLP2qSwxTUkwTy5u8BxAAa5hQgyTQ8uc6VREUJooHL5VPi4LSr3
	Z8DPoR7PyJdPaKyQQhdDV+EOAjcW/CrT6TO1ITO0JQhmnhkjpZv3j35+C9ExAKK/7/2qZqZbMDo
	DUBL5wkc2v6wt9M0CDv0GYZIq34xdVS+g=
X-Google-Smtp-Source: AGHT+IHXl9KNUIAY5LT7IQhdhWGKaz6kpmbHg2ltlnlV5LX2piwjkJPMXt7gP1unlCKB0JI7t/YWLA==
X-Received: by 2002:a05:600c:8b65:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46e36f81fbamr160812465e9.10.1759191609420;
        Mon, 29 Sep 2025 17:20:09 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3dcacsm33715495e9.2.2025.09.29.17.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 17:20:08 -0700 (PDT)
Message-ID: <1ccec2cd-0290-4804-b274-b3dcb481449e@linaro.org>
Date: Tue, 30 Sep 2025 01:20:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/17] media: dt-bindings: add rockchip rk3568 vicap
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-4-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-4-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 +++++++++++++++++++++
>   MAINTAINERS                                        |   1 +
>   2 files changed, 171 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> new file mode 100644
> index 000000000000..99861d236f5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> +  the data from camera sensors, video decoders, or other companion ICs and
> +  transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-vicap
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to general register file used for video input block control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The digital video port (DVP, a parallel video interface).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]

I meant to add my nit-pick comment here as I added my RB.

Its not important though.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


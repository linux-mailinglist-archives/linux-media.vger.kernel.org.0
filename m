Return-Path: <linux-media+bounces-15476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846893F91C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 17:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E681B28134F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA90156256;
	Mon, 29 Jul 2024 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oDOmKIV0"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4853C24;
	Mon, 29 Jul 2024 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265721; cv=none; b=aTuyXHFomocT7dpcQ9AQYQQohWXr6lHWr6+t7Vy783b89AcxIw38xLTFcoAOjXQ7MMklUREoCv8XbwKeuQkOVBlYB0RAiOwE334ACN5hVH4sKBlNO1wwqCxRSK3etHuEJFrld86hJB7PlleSEaDFEmk7rom9u/eCAu7WggAF1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265721; c=relaxed/simple;
	bh=oE3941iMkmp1NkNueazuR6dvGUAXaK0Aaqk8vu6dviI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kdusCireBD7K2UK5tSZOPPo53egW9xkDRtDac1Q6qJovC7Hz0oVZtJu+hZFc1fs4nb7FxAM9lnDll/wjZMO+Mg2vac0Mu3tenR+/yId8KqVRobJhHeP/4v/XIlttWihAWULuKCwx3ldxkkhIswiaM/ihuGCCmpLtkWZnHqcjcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oDOmKIV0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722265718;
	bh=oE3941iMkmp1NkNueazuR6dvGUAXaK0Aaqk8vu6dviI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=oDOmKIV0TiMufRCqaW16ExChGz0j/9U0bs/wdKq5S+Ow9bRrg/UTIj+vbF+TXWYF6
	 lCQLqRewEo1HNswghC6y27zXULi5ajGfFNLA2mJ8u0E7LAOtXrjCNyJRS2Uzku/gNK
	 5lG3jGhagd+GYI6gz1OPs68imOEGG8fq3hphY0QhOyx5K0Uwctw6j2dxDcJeU5eOD9
	 Aur+43OCeHX2D9vH00vGmzxei1vl/ti5rPTgVZhNZ8U49NzqAvpjsdl20IVD7bRtbc
	 0Oxbe/wE/dA/DYy7YklSYY9z0OrO5EVBTlxmGkD/WH8WHRTStzvsaVO8kKhUrBDLxL
	 t53md78ni84Wg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E7D73780C11;
	Mon, 29 Jul 2024 15:08:37 +0000 (UTC)
Message-ID: <2a01a1b2-4da7-42a2-b215-a32b53082290@collabora.com>
Date: Mon, 29 Jul 2024 17:08:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Louis Kuo <louis.kuo@mediatek.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
 <92b18918-979d-43f6-890d-888caea08561@collabora.com>
Content-Language: en-US
In-Reply-To: <92b18918-979d-43f6-890d-888caea08561@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 29/07/24 16:57, AngeloGioacchino Del Regno ha scritto:
> Il 29/07/24 16:48, Julien Stephan ha scritto:
>> From: Louis Kuo <louis.kuo@mediatek.com>
>>
>> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
>> some Mediatek SoC, such as the mt8365
>>
>> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
>> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>   .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
>>   MAINTAINERS                                        |   7 +
>>   2 files changed, 266 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml 
>> b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>> new file mode 100644
>> index 000000000000..8bd78ef424ac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>> @@ -0,0 +1,259 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) 2023 MediaTek, BayLibre
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Sensor Interface 3.0
>> +
> 
> ..snip..
> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/phy/phy.h>
>> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi@15040000 {
>> +            compatible = "mediatek,mt8365-seninf";
>> +            reg = <0 0x15040000 0 0x6000>;
>> +            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
>> +            clocks = <&camsys CLK_CAM_SENIF>,
>> +                     <&topckgen CLK_TOP_SENIF_SEL>;
>> +            clock-names = "camsys", "top_mux";
>> +
>> +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
>> +
>> +            phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
>> +            phy-names = "csi0", "csi1";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    seninf_in1: endpoint {
>> +                        clock-lanes = <2>;
>> +                        data-lanes = <1 3 0 4>;
>> +                        remote-endpoint = <&isp1_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +                };
>> +
>> +                port@3 {
>> +                    reg = <3>;
>> +                };
> 
> I don't really get why you got all those empty ports here, as you could simply
> avoid adding all of the empty nodes instead.
> 
> I don't have strong opinions about that anyway so, regardless of that....
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Wait a minute. No. The ports are all required?! Why?!

Regards,
Angelo

>> +
>> +                port@4 {
>> +                    reg = <4>;
>> +                    seninf_camsv1_endpoint: endpoint {
>> +                        remote-endpoint = <&camsv1_endpoint>;
>> +                    };
>> +                };
>> +
>> +                port@5 {
>> +                    reg = <5>;
>> +                    seninf_camsv2_endpoint: endpoint {
>> +                        remote-endpoint = <&camsv2_endpoint>;
>> +                    };
>> +                };
>> +
>> +                port@6 {
>> +                    reg = <6>;
>> +                };
>> +
>> +                port@7 {
>> +                    reg = <7>;
>> +                };
>> +
>> +                port@8 {
>> +                    reg = <8>;
>> +                };
>> +
>> +                port@9 {
>> +                    reg = <9>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d6c90161c7bf..6bd7df1c3e08 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14158,6 +14158,13 @@ M:    Sean Wang <sean.wang@mediatek.com>
>>   S:    Maintained
>>   F:    drivers/char/hw_random/mtk-rng.c
>> +MEDIATEK ISP3.0 DRIVER
>> +M:    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> +M:    Julien Stephan <jstephan@baylibre.com>
>> +M:    Andy Hsieh <andy.hsieh@mediatek.com>
>> +S:    Supported
>> +F:    Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>> +
>>   MEDIATEK SMI DRIVER
>>   M:    Yong Wu <yong.wu@mediatek.com>
>>   L:    linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>>
> 



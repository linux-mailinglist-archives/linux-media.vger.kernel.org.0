Return-Path: <linux-media+bounces-15290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA1939FBA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 13:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BA41F230B4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 11:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092A414F9F5;
	Tue, 23 Jul 2024 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="W/8PeQ5/"
X-Original-To: linux-media@vger.kernel.org
Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E90414A4DA;
	Tue, 23 Jul 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721733826; cv=none; b=it1BRgGKRkQM94Y4ucE+3PZTUQT5WwhNbKHsOCoI5iYivPotmva1mulkJH9azQPnwZ2A8UmI6oi7h45TRXKy0Cg7EI3Mh0vEeNdoQ3s+ogYlc+NkHcxKzdRs2X8AzP54obYtU4Utg4Yz8kii+MAiiQLvSHJAks0CcOCVdmnkidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721733826; c=relaxed/simple;
	bh=jRVtQ3BZO3bshrzxX70rszHGyrGeLPc84CE6qsh3gmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWGHcpgJPYjNpB/CwJ/auagIsWlca5OdTwvF1+CWxdxYFzO3oAePoo0JA7LwJKwS249vJR2u4dz5JuIV5jS5iWJ1IWY968LmLGBNsA82rNNw85RiWR38Ypp5s2yIOxErGIMgMyo+FanIOzaQKmjCM0HMhwGHsv/aCVM4Ls6YUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=W/8PeQ5/; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-main-19.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-19.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3143:0:640:c03:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id F22BA60D14;
	Tue, 23 Jul 2024 14:16:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-19.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 0GMbHe8MjOs0-nTBoCZiH;
	Tue, 23 Jul 2024 14:16:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1721733364; bh=hQGEU3zHiGtuAg5lw6tLccN2NCx3M597KI1h6UY8wsY=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=W/8PeQ5/NHRTycx3bkf14tAeDHhPk9jgFLzaTpYIRKidfHMdRj0KPp4w+srrLWdgt
	 jM+ZR4Dw66Yb7FtqPkbTsHQKly7s09YR+touruhtarMOPa0dc+961nqIWnFYkFbneo
	 odca78tAeet0wCgaLUCALf6V3D9/nrlgJ5R3GtEc=
Authentication-Results: mail-nwsmtp-smtp-production-main-19.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <ae3f574a-256f-4ced-a371-a26255024750@yandex.com>
Date: Tue, 23 Jul 2024 13:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
 <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
 <3328a8-669e6400-1-609f7800@94177214>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <3328a8-669e6400-1-609f7800@94177214>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/22/24 15:53, Shreeya Patel wrote:
> On Saturday, July 20, 2024 16:14 IST, Johan Jonker <jbx6244@yandex.com> wrote:
> 
> Hi Johan,
> 
>>
>>
>> On 7/19/24 14:40, Shreeya Patel wrote:
>>> Document bindings for the Synopsys DesignWare HDMI RX Controller.
>>>

>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Remove to trigger a new review.

>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>> ---
>>>
>>> Changes in v4 :-
>>>   - No change
>>>
>>> Changes in v3 :-
>>>   - Rename hdmirx_cma to hdmi_receiver_cma
>>>   - Add a Reviewed-by tag
>>>
>>> Changes in v2 :-
>>>   - Add a description for the hardware
>>>   - Rename resets, vo1 grf and HPD properties
>>>   - Add a proper description for grf and vo1-grf phandles
>>>   - Rename the HDMI Input node name to hdmi-receiver
>>>   - Improve the subject line
>>>   - Include gpio header file in example to fix dt_binding_check failure
>>>
>>>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>>>  1 file changed, 132 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>> new file mode 100644
>>> index 000000000000..96ae1e2d2816
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>> @@ -0,0 +1,132 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
>>> +
>>> +---
>>> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Synopsys DesignWare HDMI RX Controller
>>> +
>>> +maintainers:
>>> +  - Shreeya Patel <shreeya.patel@collabora.com>
>>> +
>>> +description:
>>> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
>>> +  allowing devices to receive and decode high-resolution video streams
>>> +  from external sources like media players, cameras, laptops, etc.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: rockchip,rk3588-hdmirx-ctrler
>>

>>> +      - const: snps,dw-hdmi-rx

remove

>>
>> 1: Compatible strings must be SoC orientated.
>> 2: In Linux there's no priority in which string will probed first. 
>> What's the point of having a fallback string when there's no common code, but instead only the first string is used?
>>
>> +static const struct of_device_id hdmirx_id[] = {
>> +	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
>> +	{ },
>> +};
>>
> 

> We believe the HDMIRX driver can be used for the Synopsys IP on other SoCs
> in the future, which is why we have added snps,dw-hdmi-rx as the fallback compatible.
> Currently, we have tested the driver only on the RK3588 Rock5B, so we are using the
> rockchip,rk3588-hdmirx-ctrler compatible in the driver instead of the fallback one.

The rule that compatible strings (for internal SoC components) must be SoC orientated also applies to the fallback string. "snps,xxxx" does not refer to an independent SoC.
Don't invent strings for devices that we don't know yet if it might or might not be compatible in the future.

Johan

> 
> 
> Thanks,
> Shreeya Patel
> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 3
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: cec
>>> +      - const: hdmi
>>> +      - const: dma
>>> +
>>> +  clocks:
>>> +    maxItems: 7
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: aclk
>>> +      - const: audio
>>> +      - const: cr_para
>>> +      - const: pclk
>>> +      - const: ref
>>> +      - const: hclk_s_hdmirx
>>> +      - const: hclk_vo1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 4
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: axi
>>> +      - const: apb
>>> +      - const: ref
>>> +      - const: biu
>>> +
>>> +  memory-region:
>>> +    maxItems: 1
>>> +
>>> +  hpd-gpios:
>>> +    description: GPIO specifier for HPD.
>>> +    maxItems: 1
>>> +
>>> +  rockchip,grf:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      The phandle of the syscon node for the general register file
>>> +      containing HDMIRX PHY status bits.
>>> +
>>> +  rockchip,vo1-grf:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      The phandle of the syscon node for the Video Output GRF register
>>> +      to enable EDID transfer through SDAIN and SCLIN.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - interrupt-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - power-domains
>>> +  - resets
>>> +  - pinctrl-0
>>> +  - hpd-gpios
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/power/rk3588-power.h>
>>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>>> +    hdmi_receiver: hdmi-receiver@fdee0000 {

>>> +      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";

      compatible = "rockchip,rk3588-hdmirx-ctrler";

>>> +      reg = <0xfdee0000 0x6000>;
>>> +      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
>>> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
>>> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +      interrupt-names = "cec", "hdmi", "dma";
>>> +      clocks = <&cru ACLK_HDMIRX>,
>>> +               <&cru CLK_HDMIRX_AUD>,
>>> +               <&cru CLK_CR_PARA>,
>>> +               <&cru PCLK_HDMIRX>,
>>> +               <&cru CLK_HDMIRX_REF>,
>>> +               <&cru PCLK_S_HDMIRX>,
>>> +               <&cru HCLK_VO1>;
>>> +      clock-names = "aclk",
>>> +                    "audio",
>>> +                    "cr_para",
>>> +                    "pclk",
>>> +                    "ref",
>>> +                    "hclk_s_hdmirx",
>>> +                    "hclk_vo1";
>>> +      power-domains = <&power RK3588_PD_VO1>;
>>> +      resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
>>> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
>>> +      reset-names = "axi", "apb", "ref", "biu";
>>> +      memory-region = <&hdmi_receiver_cma>;
>>> +      pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
>>> +      pinctrl-names = "default";
>>> +      hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
>>> +    };
> 


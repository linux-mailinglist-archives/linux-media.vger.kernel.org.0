Return-Path: <linux-media+bounces-15318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48A93B17E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 15:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CB7EB214F8
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 13:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21C3158D84;
	Wed, 24 Jul 2024 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="pfQ5kNty"
X-Original-To: linux-media@vger.kernel.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CB14F13D;
	Wed, 24 Jul 2024 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721827246; cv=none; b=S0paOqYojhA/NaJaWibjToFDr6Bo1uWmg2MHDd/bN2GHtyPFk2Gvfd/drcbgjpW9i1flEp+FZ5CS0MzoLMuCfbtZtbDFwXuUnGiExO4mDh8QxLefHa52AM8Wc/8+9ptIXgdCA4zZ4Yu8rcmxyxc3BA0J4G8Dyd5lfAej4Nl53HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721827246; c=relaxed/simple;
	bh=U7sU279GbkKIB2GW4QGpmSQQX+hEWCj1mzhTy76YVB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpLU3Yn1tKA1ox65CTEBGFrxv8K12e6uBsefZWaYNNhKpZAQkQuvzAH5c4Uu3EgrDjsafU456y+3/8Ms3kVBMIWdibOKL77SxRpH4MDAqB68Xi9YnjX6i7y0xXeqnQquPRBvL3dtQirYHIdbDkLdeLIykdpTAxCpPMVQuYzemto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=pfQ5kNty; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net [IPv6:2a02:6b8:c2a:245:0:640:bda:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id A0DC561A9A;
	Wed, 24 Jul 2024 16:20:33 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id SKPLkI2qEW20-wxrpCvQD;
	Wed, 24 Jul 2024 16:20:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1721827232; bh=+iu2sPO9qRuOHtyVNsDaCAm4+DJZSiPw1ZwyNCt0UxY=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=pfQ5kNtyn6lNqXT+34xQHUsLVc2+bd8K5n6yy4PhEA1SDS67HnoYad6x5nEKXAEXy
	 H8hK+7ZLuONlcgWyJosFyfQutJJvZ2ie14JAP27uTpBK9ahcOIK6FRAKNHazUn6Apk
	 WT8p0FkjXSTBtLt5tvgz4z0+KXImkHAYZHQCF+aY=
Authentication-Results: mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <80090f6e-7bc8-422a-bb2a-0c0a4abf32f0@yandex.com>
Date: Wed, 24 Jul 2024 15:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
 <ae3f574a-256f-4ced-a371-a26255024750@yandex.com>
 <6nzakkvpfodztxh6jnxlhknd7x7ni6agwpguxyqd6gcncedp53@vsk5mnaayfqs>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <6nzakkvpfodztxh6jnxlhknd7x7ni6agwpguxyqd6gcncedp53@vsk5mnaayfqs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/23/24 19:28, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Jul 23, 2024 at 01:16:00PM GMT, Johan Jonker wrote:
>> On 7/22/24 15:53, Shreeya Patel wrote:
>>> On Saturday, July 20, 2024 16:14 IST, Johan Jonker <jbx6244@yandex.com> wrote:
>>>> On 7/19/24 14:40, Shreeya Patel wrote:
>>>>> Document bindings for the Synopsys DesignWare HDMI RX Controller.
>>>>>
>>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Remove to trigger a new review.
>
> Rob and Dmitry both already reviewed the version with the fallback
> compatible. I don't think the rename of hdmirx_cma to hdmi_receiver_cma
> warrant a new review. Also FWIW:
>

> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Please have a look at the comments below before you tag.

>
>>>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>>>> ---
>>>>>
>>>>> Changes in v4 :-
>>>>>   - No change
>>>>>
>>>>> Changes in v3 :-
>>>>>   - Rename hdmirx_cma to hdmi_receiver_cma
>>>>>   - Add a Reviewed-by tag
>>>>>
>>>>> Changes in v2 :-
>>>>>   - Add a description for the hardware
>>>>>   - Rename resets, vo1 grf and HPD properties
>>>>>   - Add a proper description for grf and vo1-grf phandles
>>>>>   - Rename the HDMI Input node name to hdmi-receiver
>>>>>   - Improve the subject line
>>>>>   - Include gpio header file in example to fix dt_binding_check failure
>>>>>
>>>>>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>>>>>  1 file changed, 132 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..96ae1e2d2816
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>>>> @@ -0,0 +1,132 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
>>>>> +
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Synopsys DesignWare HDMI RX Controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Shreeya Patel <shreeya.patel@collabora.com>
>>>>> +
>>>>> +description:
>>>>> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
>>>>> +  allowing devices to receive and decode high-resolution video streams
>>>>> +  from external sources like media players, cameras, laptops, etc.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - const: rockchip,rk3588-hdmirx-ctrler
>>>>
>>
>>>>> +      - const: snps,dw-hdmi-rx
>>
>> remove
>>
>>>>

Relevant compatible methods in use for Rockchip drivers:

===================================================================================================

Compatible method #1:
Probe is triggered by a SoC orientated string.

compatible = "rockchip,rk3588-hdmirx-ctrler";

If for example a new SoC rk3599 is released that has the same device properties
then the old string can be used as fallback string.

compatible = ""rockchip,rk3599-hdmirx-ctrler" , "rockchip,rk3588-hdmirx-ctrler";

The driver structure:
{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },

===================================================================================================
Compatible method #2:
Probe is triggered by a IP orientated fallback string.

compatible = "rockchip,rk3588-hdmirx-ctrler" , "snps,dw-hdmi-rx";

If for example a new SoC rk3599 is released that has the same device properties
then add the same fallback string.

compatible = ""rockchip,rk3599-hdmirx-ctrler" , "snps,dw-hdmi-rx";

The driver structure:
{ .compatible = "snps,dw-hdmi-rx" },

If for example a new SoC rk3599 is released that has NOT the same device properties
then use method #1.

The driver structure:
{ .compatible = "rockchip,rk3599-hdmirx-ctrler" .data = &rk3599_ops },
{ .compatible = "snps,dw-hdmi-rx" },

===================================================================================================

Compatible method #3:
Probe is triggered by a vendor orientated fallback string.

Special case only useful if the driver is written long after all SoCs are released.
The standalone IP has a version register and the driver can handle all the feature difference
inside the IP depending on the version register.

compatible = "rockchip,sfc";

The driver structure:
{ .compatible = "rockchip,sfc"},

===================================================================================================

The rules:

1: Compatible strings must be SoC orientated.
2: In Linux there's no priority in which string will probed first.
3: There is a commitment that old DT's should still work with newer kernels.

>>>> What's the point of having a fallback string when there's no common code, but instead only the first string is used?
>>>>
>>>> +static const struct of_device_id hdmirx_id[] = {
>>>> +	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
>>>> +	{ },
>>>> +};
>>>>

The consequence of the third rule is that drivers must continue to support this string once added and
can not be removed as suggested below.

If for example the fallback is added later it will trigger 2 probes and it breaks rule #2.
Only one of string is allowed to trigger a probe in the driver.

This is wrong:
compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";

{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
{ .compatible = "snps,dw-hdmi-rx" },

Ones a compatible method is chosen the driver must stick to it.

===================================================================================================

>>>
>>
>>> We believe the HDMIRX driver can be used for the Synopsys IP on other SoCs
>>> in the future, which is why we have added snps,dw-hdmi-rx as the fallback compatible.
>>> Currently, we have tested the driver only on the RK3588 Rock5B, so we are using the
>>> rockchip,rk3588-hdmirx-ctrler compatible in the driver instead of the fallback one.
>>
>> The rule that compatible strings (for internal SoC components)
>> must be SoC orientated also applies to the fallback string.
>> "snps,xxxx" does not refer to an independent SoC.

This refers to compatible method #1.

>
> Where did you learn that? Having non-SoC specific generic fallback
> compatibles is pretty much standard throughout the kernel. See for
> example these RK3588 DesignWare compatibles:
>
> Synopsys Serial Controller:
>     Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
>     compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";

Compatible method #2:
	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },

>
> Synopsys USB3 Controller:
>     Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
>     compatible = "rockchip,rk3588-dwc3", "snps,dwc3";

Compatible method #2:
	{
		.compatible = "snps,dwc3"
	},

>
> Synopsys Ethernet Controller:
>     Documentation/devicetree/bindings/net/snps,dwmac.yaml
>     compatible = "rockchip,rk3588-gmac", "snps,dwmac-4.20a";

Compatible method #1:
	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },

	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||

>
> Synsopsys SATA Controller:
>     Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
>     compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci"

Compatible method #2:
	{ .compatible = "snps,dwc-ahci", &ahci_dwc_plat },

>
> It's also not specific to Synopsys (but RK3588 has a lot of Synopsys
> design incl. the HDMI-RX IP currently worked on by Shreeya). Here
> are some other examples:
>
> ARM Mali GPU:
>     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
>     compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";

Should be compatible method #2:
	{ .compatible = "rockchip,rk3588-mali" },
	{ .compatible = "arm,mali-valhall-csf" },

This is wrong!
Each strings will trigger a probe.
The string "rockchip,rk3588-mali" should be removed.

Review was done by Collabora people and without including the Rockchip mail list.
https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com

Could someone look at this and test.

>
> Generic EHCI:
>     Documentation/devicetree/bindings/usb/generic-ehci.yaml
>     compatible = "rockchip,rk3588-ehci", "generic-ehci";

compatible method #2:
	{ .compatible = "generic-ehci", },

>
> As you can see almost everything in RK3588 has a non SoC specific
> fallback :) It's also not a Rockchip/RK3588 specific thing, but
> I think you should be able to find enough references yourself by
> looking into the kernel's DTS files.

You are mixing up 2 compatible methods.
The driver has compatible method #1 and the DT has method #2.

>
>> Don't invent strings for devices that we don't know yet if it
>> might or might not be compatible in the future.
>
> Right now it's a sensible assumption, that an operating system driver
> for this hardware (i.e. not necessarily the one submitted by Shreeya
> right now) can handle the Synopsys HDMI receiver hardware from different
> SoCs just like it is the case for other Synopsys IP.
>
> Whatever is being done now is set in stone, since DT is considered
> ABI. So without the fallback compatible being available in DT from
> the beginning we need to carry the RK3588 specific compatible in the

> kernel driver forever. OTOH if we add the generic one now, the kernel
> can switch to use the generic one at any point in time and ignore the
> RK3588 specific one.

Ignoring breaks rule #3 as explained above.

For you the task to select a compatible method:

If the IP device registers are guaranteed remain the same then choose compatible method #2 and fix the driver.
If in doubt choose compatible method #1 and fix the binding.

Johan

>
> Greetings,
>
> -- Sebastian
>
>> Johan
>>
>>>
>>>
>>> Thanks,
>>> Shreeya Patel
>>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 3
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: cec
>>>>> +      - const: hdmi
>>>>> +      - const: dma
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 7
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: aclk
>>>>> +      - const: audio
>>>>> +      - const: cr_para
>>>>> +      - const: pclk
>>>>> +      - const: ref
>>>>> +      - const: hclk_s_hdmirx
>>>>> +      - const: hclk_vo1
>>>>> +
>>>>> +  power-domains:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  resets:
>>>>> +    maxItems: 4
>>>>> +
>>>>> +  reset-names:
>>>>> +    items:
>>>>> +      - const: axi
>>>>> +      - const: apb
>>>>> +      - const: ref
>>>>> +      - const: biu
>>>>> +
>>>>> +  memory-region:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  hpd-gpios:
>>>>> +    description: GPIO specifier for HPD.
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  rockchip,grf:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      The phandle of the syscon node for the general register file
>>>>> +      containing HDMIRX PHY status bits.
>>>>> +
>>>>> +  rockchip,vo1-grf:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      The phandle of the syscon node for the Video Output GRF register
>>>>> +      to enable EDID transfer through SDAIN and SCLIN.
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +  - interrupt-names
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - power-domains
>>>>> +  - resets
>>>>> +  - pinctrl-0
>>>>> +  - hpd-gpios
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +    #include <dt-bindings/power/rk3588-power.h>
>>>>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>>>>> +    hdmi_receiver: hdmi-receiver@fdee0000 {
>>
>>>>> +      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
>>
>>       compatible = "rockchip,rk3588-hdmirx-ctrler";
>>
>>>>> +      reg = <0xfdee0000 0x6000>;
>>>>> +      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
>>>>> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
>>>>> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>> +      interrupt-names = "cec", "hdmi", "dma";
>>>>> +      clocks = <&cru ACLK_HDMIRX>,
>>>>> +               <&cru CLK_HDMIRX_AUD>,
>>>>> +               <&cru CLK_CR_PARA>,
>>>>> +               <&cru PCLK_HDMIRX>,
>>>>> +               <&cru CLK_HDMIRX_REF>,
>>>>> +               <&cru PCLK_S_HDMIRX>,
>>>>> +               <&cru HCLK_VO1>;
>>>>> +      clock-names = "aclk",
>>>>> +                    "audio",
>>>>> +                    "cr_para",
>>>>> +                    "pclk",
>>>>> +                    "ref",
>>>>> +                    "hclk_s_hdmirx",
>>>>> +                    "hclk_vo1";
>>>>> +      power-domains = <&power RK3588_PD_VO1>;
>>>>> +      resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
>>>>> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
>>>>> +      reset-names = "axi", "apb", "ref", "biu";
>>>>> +      memory-region = <&hdmi_receiver_cma>;
>>>>> +      pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
>>>>> +      pinctrl-names = "default";
>>>>> +      hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
>>>>> +    };
>>>
>> _______________________________________________
>> Kernel mailing list -- kernel@mailman.collabora.com
>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>> This list is managed by https://mailman.collabora.com


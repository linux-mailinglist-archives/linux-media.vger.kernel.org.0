Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A514131ECB6
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbhBRQ6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbhBRPr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 10:47:58 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e] (unknown [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFFDF1F45D55;
        Thu, 18 Feb 2021 15:47:10 +0000 (GMT)
Subject: Re: [PATCH v1 18/18] arm64: dts: imx8mq: Add node to G2 hardware
To:     Ezequiel Garcia <ezequiel@collabora.com>, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-19-benjamin.gaignard@collabora.com>
 <b7338896a344ac06f41d782b6b56db227e359348.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <49b162a6-5b13-5b55-4c84-2d6e354a8ad4@collabora.com>
Date:   Thu, 18 Feb 2021 16:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b7338896a344ac06f41d782b6b56db227e359348.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 17/02/2021 à 21:43, Ezequiel Garcia a écrit :
> On Wed, 2021-02-17 at 09:03 +0100, Benjamin Gaignard wrote:
>> Split VPU node in two: one for G1 and one for G2 since they are
>> different hardware blocks.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   arch/arm64/boot/dts/freescale/imx8mq.dtsi | 43 +++++++++++++++++------
>>   1 file changed, 33 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> index d9d9efc8592d..3cab3f0b9131 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> @@ -1287,17 +1287,16 @@ vpu_reset: vpu-reset@38320000 {
>>                          #reset-cells = <1>;
>>                  };
>>   
>> -               vpu: video-codec@38300000 {
>> +               vpu_g1: video-codec@38300000 {
>>                          compatible = "nxp,imx8mq-vpu";
>> -                       reg = <0x38300000 0x10000>,
>> -                             <0x38310000 0x10000>;
>> -                       reg-names = "g1", "g2";
>> -                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>> -                                    <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>> -                       interrupt-names = "g1", "g2";
>> +                       reg = <0x38300000 0x10000>;
>> +                       reg-names = "g1";
>> +                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "g1";
>>                          clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>> -                                <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
>> -                       clock-names = "g1", "g2";
>> +                                <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>> +                                <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>> +                       clock-names = "g1", "g2", "bus";
> How come the G1 block needs the G2 clock?

It doesn't, I will remove it in v2

>
>>                          assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
>>                                            <&clk IMX8MQ_CLK_VPU_G2>,
>>                                            <&clk IMX8MQ_CLK_VPU_BUS>,
>> @@ -1306,12 +1305,36 @@ vpu: video-codec@38300000 {
>>                                                   <&clk IMX8MQ_VPU_PLL_OUT>,
>>                                                   <&clk IMX8MQ_SYS1_PLL_800M>,
>>                                                   <&clk IMX8MQ_VPU_PLL>;
>> -                       assigned-clock-rates = <600000000>, <600000000>,
>> +                       assigned-clock-rates = <600000000>, <300000000>,
>>                                                 <800000000>, <0>;
>>                          resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
>>                          power-domains = <&pgc_vpu>;
>>                  };
>>   
>> +               vpu_g2: video-codec@38310000 {
>> +                       compatible = "nxp,imx8mq-vpu-g2";
>> +                       reg = <0x38310000 0x10000>;
>> +                       reg-names = "g2";
>> +                       interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "g2";
>> +                       clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>> +                                <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> Ditto, the G2 block needs the G1 clock?
>
> Thanks,
> Ezequiel
>
>

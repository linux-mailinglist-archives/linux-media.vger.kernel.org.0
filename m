Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF2B40ABF8
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 12:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhINKqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 06:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhINKqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 06:46:04 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08447C061574;
        Tue, 14 Sep 2021 03:44:46 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q5vemMUENeJ0cQ5vfmnhTt; Tue, 14 Sep 2021 12:44:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631616284; bh=A7PSXwRUct2ieiaDlV2aNWzxAeZu/yaI3iXyN7KCi3E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UzVO2iZIuNS0jBUyzseDcdEn4X8/KB9ApySjw3u7xWIGSYtGqqY/crgbegVLaNew5
         X1NUF/s/O3Q/W3fzUKEw/x52PXUU/W9FUqfA/Y2nsvonWz5i06LOeuCnwYPiYoqsR3
         ftVCRJje7cNPMPQ9hbFCckeK+dXEij2gFEYCD0LvxEgMCGr7JUOyUg/SorH4rY5S3R
         tKMy8R4WxwiGKWh2ZOD9yJf+sY4VFh8+pSW9tI4915k2j5NCSxky0AB1loTrEH9Xse
         IjWr5KTA8JWBssKR3IpWmKl0S5CMjYSd8cpaE/p+myqMCIDA2cM0V7O6EGzUUDVwmq
         bDexeBa4whBPw==
Subject: Re: [EXT] Re: [PATCH v14 2/2] arm64: dts: imx8: Add jpeg
 encoder/decoder nodes
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
 <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
 <234f9d23-466d-18e5-e28b-c5e472c3c29c@xs4all.nl>
 <71a3c9b7d13a60614b80fbaaa701a65fea91b404.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3d63d65d-c230-d3a8-56c2-5d2b08400497@xs4all.nl>
Date:   Tue, 14 Sep 2021 12:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <71a3c9b7d13a60614b80fbaaa701a65fea91b404.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBGdtiy2b2ngKHtQoeSGnz929BymRbFDSzFk3igSpRe8Wlmi24YNsyAuvq8zvilh3YxQ7leMqweMjaoAhIJ4PjlDYgg0LsnDrdlu33d5FXnhBM4n4rP9
 g+6ZDZl4Uff8cKmfUiXEJR1Gb7/EEcynVVdHxpqNyTkHgGWTZyCZz+1cxfJUSr5cTpCg85KDD8En8ybKT8VM3bhGvUGb3o7ytXX84QKw0hVpSDIYR1VEzJjz
 Yqx0H0VwaT6UuM5ryizYgebOeA6eG7JwgVc14JKbw4lCOYl1sS2RuCct72J/cDTsQSZr2JDd7jnpcXsn2+RIYMvDwWzQYwEgevL5FCDPTJvHrsBj1QfVnDbE
 8mZMNo36TNuO4kSXwKJpM3YDDrmdzWxlZ7s8VKOci2NuJC6tmXOmMLilQN4byjMLLI3lt8HT8hGC+jO6M5+eQ+Q3JzWs1hJItBhp8ppbOOdeI5A/rdQ6vmJQ
 q/zAl0iMZpt3tMsEiGG7Vyu+u+Q2lZlGnVZx9i4w+NCgTmGt1bYcKUvaLcYyIXPGne8jlZLG0ZpjBzZC86KL1FiJ1inEvmiuR+Yq6OF1YjKMRhjI6OPsp49d
 WTZB6IqxO9aCzy/ORiSm6ndEE3sKE/WswDLN6ZwXNVcb6uTCCPgZS0eiByZGYkPwe4krQHL6WMaNDu7rg0OKwL7HqPq0xE+bG/qx9ByJTU2ywMglb2ByB015
 8NdyEkW8exzW7jrmwOA2RMKBBzbaW2VchN5AbFihb1793nS+gMptKCokxNCvNYvU892BtEUnxeeCE9xE/oKqFGQdTTvlTk6UQwP+Dxb2SRCEycIc3W+FtWyx
 3DSW8qmpsPFVJD9ThtK9akdYm/HO8qZ0OoTVj/1a6NwkPfc/2KI7+R0JEUqYbgB0i5iz7LdPVKivqtZkaSP6mrIGa51K6pxboWmnmMH3HYoCokAam1D8HN3A
 pf6EeiVD4uftPj+vUQ7YhFsvJCCxlHqemOFtHcf0ei0oCdvs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 12:42, Mirela Rabulea wrote:
> Hi Hans,
> 
> On Tue, 2021-09-14 at 09:11 +0200, Hans Verkuil wrote:
>> Caution: EXT Email
>>
>> Hi Mirela,
>>
>> On 19/06/2021 16:36, Mirela Rabulea (OSS) wrote:
>>> From: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>
>>> Add dts for imaging subsytem, include jpeg nodes here.
>>> Tested on imx8qxp/qm.
>>
>> I've posted a pull request for the first bindings patch for v5.16, so
>> this dts patch can be merged
>> through whatever tree takes such dts patches.
> 
> Thanks for the notice. I see the patch is already in linux-next. Any
>  more action required from my behalf?

No, that's it.

Regards,

	Hans

> 
> Regards,
> Mirela
> 
>>
>> Regards,
>>
>>         Hans
>>
>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>> ---
>>> Changes in v14:
>>>   Address feedback from Aisheng Dong and Ezequiel Garcia:
>>>     - use imx8 instead of imx in patch subject
>>>     - keep jpeg and LPCGs used by jpeg enabled by default in
>>> platform dts (no change here)
>>>
>>>  .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 80
>>> +++++++++++++++++++
>>>  .../boot/dts/freescale/imx8qm-ss-img.dtsi     | 12 +++
>>>  arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  2 +
>>>  .../boot/dts/freescale/imx8qxp-ss-img.dtsi    | 13 +++
>>>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
>>>  5 files changed, 109 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-
>>> img.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-
>>> img.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
>>> new file mode 100644
>>> index 000000000000..a90654155a88
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
>>> @@ -0,0 +1,80 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright 2019-2021 NXP
>>> + * Zhou Guoniu <guoniu.zhou@nxp.com>
>>> + */
>>> +img_subsys: bus@58000000 {
>>> +     compatible = "simple-bus";
>>> +     #address-cells = <1>;
>>> +     #size-cells = <1>;
>>> +     ranges = <0x58000000 0x0 0x58000000 0x1000000>;
>>> +
>>> +     img_ipg_clk: clock-img-ipg {
>>> +             compatible = "fixed-clock";
>>> +             #clock-cells = <0>;
>>> +             clock-frequency = <200000000>;
>>> +             clock-output-names = "img_ipg_clk";
>>> +     };
>>> +
>>> +     jpegdec: jpegdec@58400000 {
>>> +             reg = <0x58400000 0x00050000>;
>>> +             interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
>>> +             clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
>>> +                      <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
>>> +             clock-names = "per", "ipg";
>>> +             assigned-clocks = <&img_jpeg_dec_lpcg
>>> IMX_LPCG_CLK_0>,
>>> +                               <&img_jpeg_dec_lpcg
>>> IMX_LPCG_CLK_4>;
>>> +             assigned-clock-rates = <200000000>, <200000000>;
>>> +             power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
>>> +                             <&pd IMX_SC_R_MJPEG_DEC_S0>,
>>> +                             <&pd IMX_SC_R_MJPEG_DEC_S1>,
>>> +                             <&pd IMX_SC_R_MJPEG_DEC_S2>,
>>> +                             <&pd IMX_SC_R_MJPEG_DEC_S3>;
>>> +     };
>>> +
>>> +     jpegenc: jpegenc@58450000 {
>>> +             reg = <0x58450000 0x00050000>;
>>> +             interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
>>> +             clocks = <&img_jpeg_enc_lpcg IMX_LPC[GIT PULL FOR
>>> v5.16]G_CLK_0>,
>>> +                      <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
>>> +             clock-names = "per", "ipg";
>>> +             assigned-clocks = <&img_jpeg_enc_lpcg
>>> IMX_LPCG_CLK_0>,
>>> +                               <&img_jpeg_enc_lpcg
>>> IMX_LPCG_CLK_4>;
>>> +             assigned-clock-rates = <200000000>, <200000000>;
>>> +             power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
>>> +                             <&pd IMX_SC_R_MJPEG_ENC_S0>,
>>> +                             <&pd IMX_SC_R_MJPEG_ENC_S1>,
>>> +                             <&pd IMX_SC_R_MJPEG_ENC_S2>,
>>> +                             <&pd IMX_SC_R_MJPEG_ENC_S3>;
>>> +     };
>>> +
>>> +     img_jpeg_dec_lpcg: clock-controller@585d0000 {
>>> +             compatible = "fsl,imx8qxp-lpcg";
>>> +             reg = <0x585d0000 0x10000>;
>>> +             #clock-cells = <1>;
>>> +             clocks = <&img_ipg_clk>, <&img_ipg_clk>;
>>> +             clock-indices = <IMX_LPCG_CLK_0>,
>>> +                             <IMX_LPCG_CLK_4>;
>>> +             clock-output-names = "img_jpeg_dec_lpcg_clk",
>>> +                                  "img_jpeg_dec_lpcg_ipg_clk";
>>> +             power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
>>> +     };
>>> +
>>> +     img_jpeg_enc_lpcg: clock-controller@585f0000 {
>>> +             compatible = "fsl,imx8qxp-lpcg";
>>> +             reg = <0x585f0000 0x10000>;
>>> +             #clock-cells = <1>;
>>> +             clocks = <&img_ipg_clk>, <&img_ipg_clk>;
>>> +             clock-indices = <IMX_LPCG_CLK_0>,
>>> +                             <IMX_LPCG_CLK_4>;
>>> +             clock-output-names = "img_jpeg_enc_lpcg_clk",
>>> +                                  "img_jpeg_enc_lpcg_ipg_clk";
>>> +             power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
>>> +     };
>>> +};
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
>>> new file mode 100644
>>> index 000000000000..7764b4146e0a
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
>>> @@ -0,0 +1,12 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright 2021 NXP
>>> + */
>>> +
>>> +&jpegdec {
>>> +     compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
>>> +};
>>> +
>>> +&jpegenc {
>>> +     compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgenc";
>>> +};
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>>> index 12cd059b339b..aebbe2b84aa1 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>>> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>>> @@ -166,11 +166,13 @@
>>>       };
>>>
>>>       /* sorted in register address */
>>> +     #include "imx8-ss-img.dtsi"
>>>       #include "imx8-ss-dma.dtsi"
>>>       #include "imx8-ss-conn.dtsi"
>>>       #include "imx8-ss-lsio.dtsi"
>>>  };
>>>
>>> +#include "imx8qm-ss-img.dtsi"
>>>  #include "imx8qm-ss-dma.dtsi"
>>>  #include "imx8qm-ss-conn.dtsi"
>>>  #include "imx8qm-ss-lsio.dtsi"
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
>>> new file mode 100644
>>> index 000000000000..3a087317591d
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
>>> @@ -0,0 +1,13 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright 2021 NXP
>>> + *   Dong Aisheng <aisheng.dong@nxp.com>
>>> + */
>>> +
>>> +&jpegdec {
>>> +     compatible = "nxp,imx8qxp-jpgdec";
>>> +};
>>> +
>>> +&jpegenc {
>>> +     compatible = "nxp,imx8qxp-jpgenc";
>>> +};
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>> index 1e6b4995091e..a625fb6bdc62 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>> @@ -258,12 +258,14 @@
>>>       };
>>>
>>>       /* sorted in register address */
>>> +     #include "imx8-ss-img.dtsi"
>>>       #include "imx8-ss-adma.dtsi"
>>>       #include "imx8-ss-conn.dtsi"
>>>       #include "imx8-ss-ddr.dtsi"
>>>       #include "imx8-ss-lsio.dtsi"
>>>  };
>>>
>>> +#include "imx8qxp-ss-img.dtsi"
>>>  #include "imx8qxp-ss-adma.dtsi"
>>>  #include "imx8qxp-ss-conn.dtsi"
>>>  #include "imx8qxp-ss-lsio.dtsi"
>>>


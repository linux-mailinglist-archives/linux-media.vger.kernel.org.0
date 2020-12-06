Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2851F2D0643
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 18:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgLFRV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 12:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFRV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 12:21:28 -0500
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B04C0613D1;
        Sun,  6 Dec 2020 09:20:42 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc20b.ng.seznam.cz (email-smtpc20b.ng.seznam.cz [10.23.18.25])
        id 25cda0067ec3f46f24646c58;
        Sun, 06 Dec 2020 18:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607275229; bh=Xa+1KZEu4DSBX1VK7gEW8PMltXYhhx/+mEhX6AFrfn4=;
        h=Received:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YpF7fa2AANOlMA/VsPXkgD8TOQQrKbVodF/5V8dF8XmoO1IZzwKukHDBnv/+c3MzH
         ilyQRFf3kySSzTR9zY1BZOJexm6d8M/3FSn4BG8QAKLo6C/9OeTrpzDp3h/D0BBpf3
         8MDi2GCLKCW2wvBVEoG9APt4V2FFpPVr3OFTii5A=
Received: from [192.168.1.213] (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay17.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sun, 06 Dec 2020 18:20:27 +0100 (CET)  
Subject: Re: [PATCH 3/3] arm64: dts: update device trees to specify
 clock-frequency in imx219 node
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
 <20201205183355.6488-3-michael.srba@seznam.cz>
 <CAMuHMdXO4p_uckdA=hysACxgJqdM=tL0MMz95N=F3_Wa=3XV+w@mail.gmail.com>
From:   Michael Srba <Michael.Srba@seznam.cz>
Message-ID: <9bba5765-667c-7a9f-4fc1-0b189375daaf@seznam.cz>
Date:   Sun, 6 Dec 2020 18:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXO4p_uckdA=hysACxgJqdM=tL0MMz95N=F3_Wa=3XV+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> Hi Michael,
>
> On Sat, Dec 5, 2020 at 7:36 PM <michael.srba@seznam.cz> wrote:
>> From: Michael Srba <Michael.Srba@seznam.cz>
>>
>> This patch adds the clock-frequency property to all device trees that use
>> the imx219 binding, with the value of exactly 24Mhz which was previously
>> implicitly assumed.
>>
>> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> Thanks for your patch!
>
>> --- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
>> @@ -82,6 +82,7 @@ imx219: imx219@10 {
>>                 compatible = "sony,imx219";
>>                 reg = <0x10>;
>>                 clocks = <&osc25250_clk>;
>> +               clock-frequency = <24000000>;
>>                 VANA-supply = <&imx219_vana_2v8>;
>>                 VDIG-supply = <&imx219_vdig_1v8>;
>>                 VDDL-supply = <&imx219_vddl_1v2>;
>> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
>> index f0829e905506..db4b801b17b5 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
>> @@ -59,6 +59,7 @@ &imx219 {
>>         port {
>>                 imx219_ep: endpoint {
>>                         clock-lanes = <0>;
>> +                       clock-frequency = <24000000>;
> Why is this change needed? This is not the imx219 node, but its endpoint
> subnode (the imx219 is imported from aistarvision-mipi-adapter-2.1.dtsi).
My bad, I must have been really tired.
will rectify this

>>                         data-lanes = <1 2>;
>>                         link-frequencies = /bits/ 64 <456000000>;
>>                         /* uncomment remote-endpoint property to tie imx219 to
> -
> Gr{oetje,eeting}s,
>
>                         Geert
>
Michael

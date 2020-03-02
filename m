Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D3A175BE8
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 14:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgCBNk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 08:40:26 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57521 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbgCBNk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 08:40:26 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGgRW-1jDlV93PvO-00Dkhz; Mon, 02 Mar 2020 14:40:13 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EB3F164FF0D;
        Mon,  2 Mar 2020 13:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WWMbcQw5Ey6r; Mon,  2 Mar 2020 14:40:12 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4199864ED3F;
        Mon,  2 Mar 2020 14:40:12 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 2 Mar 2020 14:40:11 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E5D86804EF; Mon,  2 Mar 2020 14:40:11 +0100 (CET)
Date:   Mon, 2 Mar 2020 14:40:11 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200302134011.GA3717@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141556.GI3606@pflmari>
 <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F63776B
X-Provags-ID: V03:K1:gvQ7Is8n0lpg67NQuR/HsSkPH2SLWS727/gSY2xDGIs3RA0zszq
 c41zsFwgNphFi0WrOkpGBh3AzzHd3Tyc1STiHmPaS9Jo8WdSzExm7tziq8NIpDNjrbjDkJk
 /1l5CnDXlkFc1D81I9TJwOTPHlj45jzZhexz02c8d0vddrafKIjiaRO+NU+Y4idhJEci/0I
 78w5CCpGwKFJhCN4lxFvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8RssGpzGfu0=:DPiPlhp3bW5ME/WwSl80xy
 W2kU4HNPhI8Qbs7HNx+ix3N6v2FQ++3dP0ZwXVbf+ErWqATVz7lMoLtT42vvoVc3G57fLsjEY
 98mZ/W2HfkyjHEr73xhqfVKeeMiArH1iDjZ8JdZCbJiJd8TkLABRHTuNcz80GupuhnNgnkL/0
 bnWh5Qv8lFThGBe+w9U2dYR/B/4x6elJkkkdaxJ2k1gDysDNeUBbQbLsQIqCG7vE6ghas7Lcg
 TLTiZz4k0p4uB01JOhojhM9HMEBNcUFI9nnPVhW1A6sBQh7T4uWU4cAoSLvgRy6OQwyzcqblH
 4ErstnI4t+CosJwFBUIScHdnq2pu19O+UnoYXi/xEER+l6wvj7i0KxQgNAtIel0kAXkpFuI2c
 B00sc0ab+leJH8HB7VAQjnqOldb6VkMdfu3Sb5LbG9ePvcYzWYQjB9l5Q7WwZAA7YRGALcMqS
 POIXLleBI0fzWxIm+/JchXgnJW+EVuoYVoAsSaBjS16GIS2f5drrP7TBozvOidQQ8jZStkzWH
 +8k1JT8g+PNltYTQeW6NF76bO3VddpsIC4X8ZFBLX9UT6vJjP9frD1SrWU2onaNNQLhrW1zG6
 HRnMkwPaFJxOJiDxNMR+nhd3jELL4j9lH/CNMx21noSmU9eK2G4LDlnnwP/V8FAw/cELEZxM0
 dtDohagGnstqUQ0xZHVACZ/paNI+kmWlqifeYAvnA3PmrEtRagmQ+bfUEApv695dj3QUrIjs1
 WwlIVhU7CwF3xN+PaIYX637Ki4M3bjgZRRW+p7AoCxG997xi4JV4OvFkpiupbux3Apj4E+YNV
 JfiFsbRvLDa6BcZbWM5jBqeMJsbSrbnT5igG/KkBIoqSCxt1rjj94xPKLXyzVS5Dx4MpQAm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Geert Uytterhoeven, Mon, Mar 02, 2020 13:28:13 +0100:
> Hi Alex,
> 
> Thanks for your patch!
> 
> On Mon, Jan 13, 2020 at 3:24 PM Alex Riesen
> <alexander.riesen@cetitec.com> wrote:
> > Not sure if all variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, as it is on
> > Salvator-X ES1, so the the ADV7482 endpoint and connection definitions
> > are placed in the board file.
> 
> Both Salvator-X and Salvator-XS have SSI4 wired to the ADV7482.
> 
> > I do assume though that all Salvator variants have the CLK_C clock line
> > hard-wired to the ADV7482 HDMI decoder, and remove it from the list of
> > clocks provided by the R-Car sound system.
> 
> Yes, both Salvator-X and Salvator-XS have it wired that way.

Ok, seems like I can move that part into the common file as well.
Integrations of ADV7482 and R-Car which use salvator-common.dts can still
redefine the endpoint settings in their board files, right?

> But please see below.

...

> > The I2C wiring is also likely to persist across the variants (similar
> > to ak4613, connected to the same interface), so that is in the common
> > file.
> >
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> 
> Below are my comments w.r.t. the board-specific wiring.
> I'll defer to the multimedia people for commenting on the audio parts.
> 
> BTW, what is the status of the other patches in this series?

"Submitted", at the moment. Besides you and Rob Herring no one said anything
yet (either that or I missed the replies).

> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > @@ -322,6 +322,10 @@
> >         clock-frequency = <22579200>;
> >  };
> >
> > +&audio_clk_c {
> > +       clock-frequency = <12288000>;
> > +};
> 
> Does the ADV7482 always generate a 12.288 MHz clock signal?
> Or is this programmable?

Oops. It looks like it is and the value is derived from the sampling rate
(48kHz) and the master clock multiplier. Both hard-coded in the board file.

> > video-receiver@70 {
> > 	compatible = "adi,adv7482";
> > ...
> > +   clocks = <&rcar_sound 3>, <&audio_clk_c>;
> > +   clock-names = "clk-hdmi-video", "clk-hdmi-i2s-mclk";
> 
> The above declares the Audio CLK C to be a clock input of the ADV7482, while
> it is an output.

I would gladly give it right direction if I *really* understood what I was
doing...

> Furthermore, the DT bindings do not document that clocks can be specified.

Should the DT bindings document that the clock cannot be specified than?

> > @@ -686,7 +700,8 @@
> >         };
> >
> >         sound_pins: sound {
> > -               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
> > +               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
> > +                        "ssi4_data";
> 
> Missing "ss4_ctrl", for the SCK4 and WS4 pins.

I'll add them.
As the device seems to function even without thoes, does this mean the pins in
the group are used "on demand" by whatever needs them?

> > @@ -760,8 +775,18 @@
> >                  <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> >                  <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> >                  <&audio_clk_a>, <&cs2000>,
> > -                <&audio_clk_c>,
> 
> Why remove it? This is the list of clock inputs, not outputs.

...probably because I was thinking the specification was exactly the other way
around.

Does a "clocks = ..." statement always mean input clocks?

I shall correct that and re-test (might take a while, I don't have the
hardware anymore).

Thanks for looking!
Regards,
Alex

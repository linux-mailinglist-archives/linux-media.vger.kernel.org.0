Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085CF175DDD
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgCBPHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:07:22 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:51753 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCBPHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:07:22 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MPXQi-1inQJq0rpa-00Marv; Mon, 02 Mar 2020 16:07:08 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EA8FB64FC2B;
        Mon,  2 Mar 2020 15:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GhsWmSQpHrC5; Mon,  2 Mar 2020 16:07:06 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 77F3764FB47;
        Mon,  2 Mar 2020 16:07:06 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 2 Mar 2020 16:07:06 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 1CEAD804EF; Mon,  2 Mar 2020 16:07:06 +0100 (CET)
Date:   Mon, 2 Mar 2020 16:07:06 +0100
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
Message-ID: <20200302150706.GB3717@pflmari>
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
 <20200302134011.GA3717@pflmari>
 <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F63776B
X-Provags-ID: V03:K1:vOVbK2DsFg7SX9pxGLNnfcHuRTuLm+XbuwenDwgHRnvBswnGikn
 Cn0SrAENmZPtAV8HIiI5WNh3Cxf1wjaTRzN0ZE4sQ9L4zGn7o+gEo8bUG94r1pY7uuMlsla
 6HOKcjKBxsvOsdoQTejcmnGMRYLxEQZh90VeNvyE//J5uxXHNMb6ObJKaSYu5JEO/DBle+I
 7pk1O7jC+YHrfAqve0cOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XvsG33bYZEM=:fdor2OGUiLrPhgNiUn4pai
 TocsOSG2bbB4IwYTAUq8u6x1ABq/HV11hpykCkyitvbyGNmPlBVyiyCnemOX+4+ACJYikxd/7
 2mcbHe8n9OeSBA5kC536pDcy9pvGzURmNW4Izxrkz79jj4C7rIa1Oanfld7M8PtMeIe3T0SO5
 B4tFc40RciFaxG06ZUExeRKdU82oELuCpTDl8jnZ2qjCh6r89KrV8q8Rd1XkMNOUkVzzB5i8z
 paAqs3bc9U7ZsCO1YwWTvT+vUIZJA+irPqLr6/Ux3lNcc69Ym93jtmY+BvW+QzSOIpvaS6g78
 BSeTXo7OQMDKkXPp0HxLv4hD61OcQgegXRX7XAuRFTofs32WcAeChqRw1SXWDI9AoUDY/qotx
 V8xAxFncImhtfGv/y3LMSO8cxmxSmTpoqySMrxOxbk5GSY/H+rUFoTg/Rd4w1H5KFsOeY6EmU
 DsTvRjl1wJgeyS33Y2LQHd75o8gwjfuEL6mfDqa0TTBCmYuawbcYcovifqGt0Rkk5/UeU2a6G
 YYFM6PnzV1HGOt/EtrNhg4zP2ZRtohCCnrejGnOwl6yfIJNYDbaP7nxR5Cy5JoIPjGjFT5jCD
 tnlmckvvWQCO1qcpqCA6jt3NyvisljiyV6JPv2juK3tfxU0P9ZoEfLJrfiILhXeSskCiUBWpS
 rnh0WukoPdX51BjdZttO0bl8QoOSLVHmpyn9YVLecaa1pWyrkhj+AdikJM6ZG4/2MalmCTJ2i
 3KSJmbEMo8jy5DvNzXtslArNKmw9Kkef8xE9V8Nxvl0lWDQgiDCJ2R5tWzzRpMMYLFtdGbHm5
 tEcP7juKebhigvNaUMsnTIdbBYUrn7plAHbc4apMgMO1el7YHUHTggFeUOFKOrbE4XMI1ox
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Geert Uytterhoeven, Mon, Mar 02, 2020 14:47:46 +0100:
> On Mon, Mar 2, 2020 at 2:40 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > @@ -322,6 +322,10 @@
> > > >         clock-frequency = <22579200>;
> > > >  };
> > > >
> > > > +&audio_clk_c {
> > > > +       clock-frequency = <12288000>;
> > > > +};
> > >
> > > Does the ADV7482 always generate a 12.288 MHz clock signal?
> > > Or is this programmable?
> >
> > Oops. It looks like it is and the value is derived from the sampling rate
> > (48kHz) and the master clock multiplier. Both hard-coded in the board file.
> 
> Where are these hardcoded in the board file?

In the endpoint definition, arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts

So the frequency can be set at the run-time, perhaps even derived from
endpoint connected to the output. In this case, rsnd_endpoint3,
which has the "mclk-fs" setting. Not sure if the sampling rate
can be set to something else for the HDMI, though.

> Even if they are, technically this is a clock output of the ADV7482.

... which I hope to correct as soon as I steal the hardware from whoever stole
it from me...

> > > > video-receiver@70 {
> > > >     compatible = "adi,adv7482";
> > > > ...
> > > > +   clocks = <&rcar_sound 3>, <&audio_clk_c>;
> > > > +   clock-names = "clk-hdmi-video", "clk-hdmi-i2s-mclk";
> > >
> > > The above declares the Audio CLK C to be a clock input of the ADV7482, while
> > > it is an output.
> >
> > I would gladly give it right direction if I *really* understood what I was
> > doing...
> 
> :-)
> 
> > > Furthermore, the DT bindings do not document that clocks can be specified.
> >
> > Should the DT bindings document that the clock cannot be specified than?
> 
> It currently does say so, as it doesn't list "clocks" in its properties section.

The bindings documentation file, which we're talking about here and which does
not list the specifiable input clocks in its properties, is it the

    Documentation/devicetree/bindings/media/i2c/adv748x.txt

?

And this absence of documentation also means that whatever clocks (both input
in "clocks=" and output in "#clock-cells") listed in a specific .dts are just
an integration detail?

Does this below makes more sense, than?

    video-receiver@70 {
        compatible = "adi,adv7482";
        clocks = <&rcar_sound 3>;
        clock-names = "clk-hdmi-video";
        adv748x_mclk: mclk {
            compatible = "fixed-clock";
            #clock-cells =  <0>;
            /* frequency hard-coded for illustration */
            clock-frequency = <12288000>;
            clock-output-names = "clk-hdmi-i2s-mclk";
        };
    };

Now I'm a bit hazy on how to declare that the MCLK output of the
video-receiver@70 is connected to the Audio Clock C of the SoC...
Probably remove use of "audio_clk_c" completely?

> > > > @@ -686,7 +700,8 @@
> > > >         };
> > > >
> > > >         sound_pins: sound {
> > > > -               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
> > > > +               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
> > > > +                        "ssi4_data";
> > >
> > > Missing "ss4_ctrl", for the SCK4 and WS4 pins.
> >
> > I'll add them.
> > As the device seems to function even without thoes, does this mean the
> > pins in the group are used "on demand" by whatever needs them?
> 
> Probably the SCK4/WS4 functions are the reset-state defaults.

That ... might require some trial and testing: when I add them to the group,
the reset defaults will be overridden by the platform initialization, which is
not necessarily the reset default. Will see.

> >
> > Does a "clocks = ..." statement always mean input clocks?
> 
> Yes it does.
> If a device has clock outputs and is thus a clock provider, it should
> have a #clock-cells property, and this should be documented in the bindings.
> 
> A clock consumer will refer to clocks of a provider using the "clocks"
> property, specifying a clock specifier (phandle and zero or more indices)
> for each clock referenced.

Something like this?

    &rcar_sound {
        clocks = ...,
                 <&adv748x_mclk>,
                 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
        clock-names = ...,
                      "clk_c",
                      "clk_i";
    };

Regards,
Alex

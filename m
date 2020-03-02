Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE7D175F3A
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 17:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgCBQJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 11:09:20 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:43619 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCBQJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 11:09:20 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYvTs-1iveUO1sdk-00Uq1M; Mon, 02 Mar 2020 17:09:08 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 9BA1664FE2C;
        Mon,  2 Mar 2020 16:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1WiNoKVEaVO8; Mon,  2 Mar 2020 17:09:07 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 2EB2B64F542;
        Mon,  2 Mar 2020 17:09:07 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 2 Mar 2020 17:09:06 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id CAA4D804EF; Mon,  2 Mar 2020 17:09:06 +0100 (CET)
Date:   Mon, 2 Mar 2020 17:09:06 +0100
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
Message-ID: <20200302160906.GC3717@pflmari>
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
 <20200302150706.GB3717@pflmari>
 <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F637663
X-Provags-ID: V03:K1:DrpGReJT2AM4nIuozNnH+hDFTM5zFm14d62b0E79p22VClFAM6n
 KCng978oz5455J5dGQrXJkiNTSezjSjV++6T1RWxyrRReQEdYIhinTQv2Jl5u5MBvENL47d
 iOKVwVdXROJLCYpF511n/j8JCknkpqQ6BTD9GM13RKcH+X2T0rHYXLcwhor9IMw8CqRcKhX
 bmh5aJblkJavO97rJoJyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gt2gbcPu0aA=:gV5OYaZwDpwhzC5IDkDIzc
 tflq+nkusHeiK7YSlEgC9eDf4IAR8ysDGm4Ce8YoV9OnqVscFV46S9BN1SqY31gwNtsaqmjrd
 JC589RrB6du/VKNa4LAW5UOX4niMv6mvUnip5uuzaP0AMJ8H2IbsThFI2LYjaGBex/Pcr6lmR
 XdWKuE6dU4htltR3gESkPKqljbLw1yOOOfGxM/YXCm9HSGg6Ted+rHP4u5+2awnxC7mwC6A8o
 aviDBoYaqmCiUuBYIv7mtstDkk90116OFCCf+wRvL6dPhRjFCXziIqgxRMW/wmW0JGrevLTvl
 Bp1B6r+B/tuqY17kjo41EnMiH/QPXn9o5pnsaxDhnwEShxwKYbPMedGjlfyMcfTyF7TE3CqBq
 fsCxSHWlFsZshK0L0+ouKsSrqKC4YHa+1p/MiyE7ZvTmqqu0DH3arEkcNbZd+2ua3VCI7RsBC
 pLsM6oOO+yLJAhDWbuhhvHS62af0gYkIm4c2GkKlyb3twu2PTIfOXbF4f3T4VuRHKAu4SgP8k
 mkI5+lPsfoAQj0rQ2opJHHSB0+UkVFSOpG2o9jIUleWHPRVBHdtykibU+fnoTqx0ucmBRGS/4
 OgzzuXK9rg8GrodnBdbQJXXEdW1yta+3m2roxVfL/A7xLxksRCifB9VyI6gGYXZTenA+89Tvz
 wl2B1VYQTr87JnKUn65CGPFxQL1Z579fvSyxUIsSN/isATyra3kpB4rfKYJmn8OO3p3gZTTY3
 i/iXiclCvco8cMHKyTfNgA3hqMfzJfPX6Xdyhfwaw7KheK+Ajez9VelGneojS4V1IAsWQv58r
 QQDCnP2GejBhTdCKs6Y++NiE5UCcfHsGdZlBfLYjA2Vs6xJ6HSmzLQW6FChDBPALIQF2RKS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> > And this absence of documentation also means that whatever clocks (both input
> > in "clocks=" and output in "#clock-cells") listed in a specific .dts are just
> > an integration detail?
> 
> No, the absence probably means that any clock-related properties in a .dts
> file will just be ignored.
> 
> Looking at the driver source, it indeed has no support related to clocks at all.

...

> > Does this below makes more sense, than?
> >
> >     video-receiver@70 {
> >         compatible = "adi,adv7482";
> >         clocks = <&rcar_sound 3>;
> >         clock-names = "clk-hdmi-video";
> >         adv748x_mclk: mclk {
> >             compatible = "fixed-clock";
> >             #clock-cells =  <0>;
> >             /* frequency hard-coded for illustration */
> >             clock-frequency = <12288000>;
> >             clock-output-names = "clk-hdmi-i2s-mclk";
> >         };
> >     };
> 
> The #clock-cells should be in the main video-receiver node.
> Probably there is more than one clock output, so #clock-cells may be 1?

AFAICS, the device can provide only this one clock line (audio master clock
for I2S output)... I shall re-check, just in case.

> There is no need for a fixed-clock compatible, nor for clock-frequency
> and clock-output-names.
> 
> But most important: this should be documented in the adv748x DT bindings,
> and implemented in the adv748x driver.

So if the driver is to export that clock for the kernel (like in this case),
it must implement its support?

> > > > Does a "clocks = ..." statement always mean input clocks?
> > >
> > > Yes it does.
> > > If a device has clock outputs and is thus a clock provider, it should
> > > have a #clock-cells property, and this should be documented in the bindings.
> > >
> > > A clock consumer will refer to clocks of a provider using the "clocks"
> > > property, specifying a clock specifier (phandle and zero or more indices)
> > > for each clock referenced.
> >
> > Something like this?
> >
> >     &rcar_sound {
> >         clocks = ...,
> >                  <&adv748x_mclk>,
> >                  <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> >         clock-names = ...,
> >                       "clk_c",
> >                       "clk_i";
> >     };
> 
> More or less.
> 
> Might become
> 
>     find_a_better_label_choice: video-receiver@70 {
>             ...
>     };
> 
>     &rcar_sound {
>             clock = ...,
>                     <&find_a_better_label_choice 0>,
>                     ...
>     };
> 
> as there may be multiple clock outputs on the ADV7482.

I see. Working on it.

Thanks a lot!

Regards,
Alex


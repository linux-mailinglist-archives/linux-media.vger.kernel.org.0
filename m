Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8663617A7AA
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 15:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgCEOgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 09:36:43 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:60317 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgCEOgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 09:36:42 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MkYsS-1jeGjj40v0-00m1dA; Thu, 05 Mar 2020 15:36:30 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 4C17D65007B;
        Thu,  5 Mar 2020 14:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TuPCA_-QNJ3X; Thu,  5 Mar 2020 15:36:28 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id DD21B64F3BB;
        Thu,  5 Mar 2020 15:36:28 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 5 Mar 2020 15:36:28 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 85278804EF; Thu,  5 Mar 2020 15:36:28 +0100 (CET)
Date:   Thu, 5 Mar 2020 15:36:28 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Driver Development <devel@driverdev.osuosl.org>,
        Linux Media <linux-media@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Renesas SoC <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200305143628.GB25741@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Driver Development <devel@driverdev.osuosl.org>,
        Linux Media <linux-media@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Renesas SoC <linux-renesas-soc@vger.kernel.org>
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141556.GI3606@pflmari>
 <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari>
 <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari>
 <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari>
 <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F637367
X-Provags-ID: V03:K1:89pAwl+MGQIIUBHltXlUW/W8nwgm0att8RcwyUmT97Nq5Uh6QfA
 Cao/sAEAcgeUGTCWZAGVEVO+ZB68y8ulEc9SSSMy6RI4da/n/jVJVkavJKD8Jj5Z52ijCHP
 zqxu5prvzW3aRp7kLbE+iui2QyQM7VaIh2xxYo/G7i07KYlWQbatOw8k/e/vEMzIzD9N2AD
 SKuGXYI4F+AQ+3VKgRlEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oQ4Mw24lMPY=:ED7Cu+cwK558t9q4OZzyFK
 qa3OZ3XCPSovu6NVhb0CL01nZqasgqIvg1USKZOveCeTRgmRUa0YK82vGTUpDs5YnxE+OwPFQ
 K/WJiKnBXhNTme8d6KXpHi4xCf4KxjsOX/kOY+uyA0BVfK5gm/ebjU7LkJfrj73ZaX7F812v2
 omZeOCKRATZBIha5wAGBoSY9a9hHLGco8rtk/4JGCfIdILZjOQT0OYVd/d+eyRvAzcrMIkvaR
 QlfR8I2e0coYwvt9m7jbv5v/GXK8Oh+A2CJyvbKzCVuvXc4B2YxFv7fBM5CV8xfMakCfij95h
 qqcD7cWVxlHpNbljro/Rg/Ub5sWQedtXcWRPfpMt2GiyK9ERuVYfpk6wvR2gJLUpoQf6XwD7z
 w5wXMPDdClitHvqkgFLrDNtaaXRmsqCsW+UJIAig8hN4GKH5a4csKbsNVS8VARIL7U+UfAd8i
 JZwFgvU2uAFA5LiQ4ckESKg3rbisVDo/xV26uMMgy0mWb7oG/BnSw5yFx4lRSbP55USfCpS0I
 IDcLMDA4dhl8kfa5AoyHiV2kH21UkrEjyfrb+Sxlhz6u2bHZ3mDT519vJ2l3hB6jkLulq+gTD
 IBYaXqGch9x4MOR7YXavq/RWhe1cd2LhrWqiT4djW2R3IrGNRdsndnZiHjvKEfLrH2Aj6/PYV
 L9I+ZtvXtbKPVs7NE59OcJA/dBsEYxOHQgURyWtkspyDf+ZtLQL+Tibfi9MztM8e3It5aybdg
 hyOjqxs4GsdI89In369H4gIlLPVq4gLZkoWYLgLKQEduOuGnTD/Tjr6iaH5+vv1HIb2G7Oo8/
 XWta5CNRXvHS0G5BEMeYSLRUSOYPvseq4JzgjguFF6DD7WGrhjIfgDVRz7arwbO8LBHO9Pk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Mon, Mar 02, 2020 17:13:30 +0100:
> On Mon, Mar 2, 2020 at 5:09 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> > >
> > > The #clock-cells should be in the main video-receiver node.
> > > Probably there is more than one clock output, so #clock-cells may be 1?
> >
> > AFAICS, the device can provide only this one clock line (audio master clock
> > for I2S output)... I shall re-check, just in case.

And you're right, of course: the audio output formatting module of the ADV748x
devices provides a set of clock lines related to the I2S pins: the already
discussed master clock, left-right channel clock and the serial clock (bit
clock?).

> > > There is no need for a fixed-clock compatible, nor for clock-frequency
> > > and clock-output-names.
> > >
> > > But most important: this should be documented in the adv748x DT bindings,
> > > and implemented in the adv748x driver.
> >
> > So if the driver is to export that clock for the kernel (like in this case),
> > it must implement its support?
> 
> Exactly.  Unless that pin is hardcoded to output a fixed clock, in which case
> you can just override the existing audio_clk_c rate.

Just to try it out (I'll set #clock-cells to 1), I registered a fixed rate
clock in the driver, added a clock provider:

adv748x_probe:

    clk = clk_register_fixed_rate(state->dev,
				  "clk-hdmi-i2s-mclk",
				  NULL     /* parent_name */,
				  0        /* flags */,
				  12288000 /* rate */);
    of_clk_add_provider(state->dev->of_node, of_clk_src_simple_get, clk);

And removed the audio_clk_c frequency setting. I also replaced the audio_clk_c
in the list of input clocks of the R-Car-side sound card with the phandle of
the adv7482 main node:

salvator-common.dtsi:

    &i2c4 {
	status = "okay";

	adv7482_hdmi_decoder: video-receiver@70 {
	    #clock-cells = <0>; // to be replaced with <1>
	};
    };

    &rcar_sound {
	clocks = ..., <&adv7482_hdmi_decoder>, ...;
    };

As everything continues to work as before, I assume that at least the clock
dependencies were resolved.

Is there a way to verify that the added input clock is actually used?
IOW, if its frequency is actually has been programmed into the ssi4 (R-Car
receiving hardware) registers, and not just a left-over from previuos attempts
or plain default setting?

As the ADV748x devices seem to provide also the clocks for video outputs, will
it make any sense to place the clock definition into the port node?
Or should all provided clocks be indexed in the main device node?

Regards,
Alex

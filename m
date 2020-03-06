Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215AA17BF5C
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 14:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCFNmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 08:42:08 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47109 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgCFNmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 08:42:08 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MPGNn-1j0Vx30J4P-00PfWP; Fri, 06 Mar 2020 14:41:56 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E0ECD64F2B8;
        Fri,  6 Mar 2020 13:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CcPke4HdLmdh; Fri,  6 Mar 2020 14:41:54 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 756F064CD35;
        Fri,  6 Mar 2020 14:41:54 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 6 Mar 2020 14:41:54 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 1C188804FA; Fri,  6 Mar 2020 14:41:54 +0100 (CET)
Date:   Fri, 6 Mar 2020 14:41:54 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Driver Development <devel@driverdev.osuosl.org>,
        Linux Media <linux-media@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Renesas SoC <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200306134154.GD27714@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Driver Development <devel@driverdev.osuosl.org>,
        Linux Media <linux-media@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Renesas SoC <linux-renesas-soc@vger.kernel.org>
References: <20200113141556.GI3606@pflmari>
 <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari>
 <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari>
 <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari>
 <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
 <20200305143628.GB25741@pflmari>
 <20200306131632.GA4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306131632.GA4878@pendragon.ideasonboard.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F637265
X-Provags-ID: V03:K1:MYH9fUJEmTLzs751ZE7H3XogVug1Pd2e7lMETYI9kqko498wXNx
 fS9i28Ga1cv76eGr+epr2aoYeAf+3/0v+C3bR5fSV4MQL6PYBg3RlgzdWL87ggLplsNCWt1
 BQnhRnOFTMNC4+JFERxh53ICgSF/4HRJyu6zBt8KlCs4A1gKnKm1D5LvqZy/cZLSl051F3a
 2G0JSrc3wR+Ispc6U0wEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WrJyyEo45XY=:3W85t6wsawv8PDgR4Ad48W
 v0IRf2VWdD/r58UILsmFTdhqAQ9WDEXoio61ZzKFznl+q0+C6iStlkELGmo6oOgEk7qWB0STV
 v5l5ZdGhmNj+nLac8u5LLT00BPNyjHfigc+DWD3Nbl4oBH+BFp0v8DgtfmNGK0qohRo95/sYQ
 mWSnG6RW/lCn7tACYETXXrcz+6uNzE7HOooQE6CCT99JdrwJ5KtEjwqQTxbfeA65MV07b7r5w
 jATaNQZzgubHId8O1DpALTUePbPYu7n2/JafaH9aCR8MOn//DYkdCYvHVFrEDHOHFdk9dxXv5
 nrz0nPU3kx1hBfaSnwp3Tgp41RYKsokNNrKS10DhMbcIjw8rcJd6V+Ch4jjXeXgDZkuU9lfF5
 lQg4BjcF/OiZX+NSBkENPqHff8E+Re+xWiDmPAplfW80F9KDNzn0aBExMNYoOtYpHezaPYgXf
 Io+xOXkjnet0IzOEz5L9q3sEIXMf4YUf7DCTBVPyAsw0SNrCt0r260Gwd456NDzeqzwMVTzRr
 PSdqX8eLo7z9nfkSFq6J6CP+/nzcD03BPezbz0mvC89TPKwmVM3zrPCLW/8HlTznDy6duDoSB
 CpeuaWUJb7CT3jK/2SEl6HycAz2U3aOWtUVqyyaM65u3BKugf7n/qYHM8MZGsNgA+vt5kpKi7
 FBRY8bB65RJ/mUxJbmF5AmQjJlDifcdz8H82QuOM0YCz/EQQyG8xqstZv9xUEMA8S5q629ush
 JoF6KEO1yZ3cxqlspDsqC2TeLUvWh0hBeZm9G5MKO1/UIj41cYFlZJGwAkawMyn8dRXV+2Ns5
 IB1lLsNWuHvVgUIFLLe5zpFvqSLzei0zi1XJvWl/sZtbIDFqHEsM7WcPGYDS10YRdq3xrCY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Fri, Mar 06, 2020 14:16:32 +0100:
> On Thu, Mar 05, 2020 at 03:36:28PM +0100, Alex Riesen wrote:
> > Geert Uytterhoeven, Mon, Mar 02, 2020 17:13:30 +0100:
> > > On Mon, Mar 2, 2020 at 5:09 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> > > > >
> > > > > The #clock-cells should be in the main video-receiver node.
> > > > > Probably there is more than one clock output, so #clock-cells may be 1?
> > > >
> > > > AFAICS, the device can provide only this one clock line (audio master clock
> > > > for I2S output)... I shall re-check, just in case.
> > 
> > And you're right, of course: the audio output formatting module of the ADV748x
> > devices provides a set of clock lines related to the I2S pins: the already
> > discussed master clock, left-right channel clock and the serial clock (bit
> > clock?).
> 
> I don't think we need to model the last two clocks through CCF though,
> they're part of the I2S protocol, not clock sources that need to be
> explicitly controlled (or queried).

That's good, because I'm right now having hard time finding out how to
calculate the frequencies!

> > Just to try it out (I'll set #clock-cells to 1), I registered a fixed rate
> > clock in the driver, added a clock provider:
> > 
> > adv748x_probe:
> > 
> >     clk = clk_register_fixed_rate(state->dev,
> > 				  "clk-hdmi-i2s-mclk",
> > 				  NULL     /* parent_name */,
> > 				  0        /* flags */,
> > 				  12288000 /* rate */);
> >     of_clk_add_provider(state->dev->of_node, of_clk_src_simple_get, clk);
> > 
> > And removed the audio_clk_c frequency setting. I also replaced the audio_clk_c
> > in the list of input clocks of the R-Car-side sound card with the phandle of
> > the adv7482 main node:
> > 
> > salvator-common.dtsi:
> > 
> >     &i2c4 {
> > 	status = "okay";
> > 
> > 	adv7482_hdmi_decoder: video-receiver@70 {
> > 	    #clock-cells = <0>; // to be replaced with <1>
> > 	};
> >     };
> > 
> >     &rcar_sound {
> > 	clocks = ..., <&adv7482_hdmi_decoder>, ...;
> >     };
> > 
> > As everything continues to work as before, I assume that at least the clock
> > dependencies were resolved.
> 
> This looks good to me.

Ok, I settle on this than.

> > Is there a way to verify that the added input clock is actually used?
> > IOW, if its frequency is actually has been programmed into the ssi4 (R-Car
> > receiving hardware) registers, and not just a left-over from previuos attempts
> > or plain default setting?
> > 
> > As the ADV748x devices seem to provide also the clocks for video outputs, will
> > it make any sense to place the clock definition into the port node?
> > Or should all provided clocks be indexed in the main device node?
> 
> Those clocks are part of the CSI-2 protocol and also don't need to be
> explicitly controlled. As far as I can tell from a quick check of the
> ADV7482 documentation, only the I2S MCLK is a general-purpose clock that
> needs to be exposed.

Thanks, that's good to know!

Do you know, by chance, which of the snd_soc* callbacks should be used to
implement setting of the MCLK? The one in snd_soc_component_driver or
snd_soc_dai_driver->ops (snd_soc_dai_ops)?

Or how the userspace interface looks like? Or, if there is no userspace
interface for this, how the MCLK is supposed to be set? Through mclk-fs?

Regards,
Alex


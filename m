Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B4717BF7A
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 14:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgCFNpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 08:45:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44666 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgCFNpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 08:45:52 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77C6924B;
        Fri,  6 Mar 2020 14:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583502349;
        bh=BSy2aXmh/FFModnDKvd7NQ8aM1f7EgIy6d2/sKiaOPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sbCykm53iHNv0u4G2jCHQy1Zz1GXIc8VCynX3Zr87JX1yenX9lfdacmc5AQ/bTM7N
         0NJEFjzpQ1UH/MBpv2Ty29ODIxThh1u45WwM6XgEqwsH8XkmHEcP+z2SREy2dGd+lf
         r+A9/1BgvdFnmrhn69N9hADO9OKEvbM5KSK6kBp4=
Date:   Fri, 6 Mar 2020 15:45:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
Message-ID: <20200306134546.GE4878@pendragon.ideasonboard.com>
References: <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari>
 <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari>
 <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari>
 <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
 <20200305143628.GB25741@pflmari>
 <20200306131632.GA4878@pendragon.ideasonboard.com>
 <20200306134154.GD27714@pflmari>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200306134154.GD27714@pflmari>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

(CC'ing Morimoto-san)

On Fri, Mar 06, 2020 at 02:41:54PM +0100, Alex Riesen wrote:
> Laurent Pinchart, Fri, Mar 06, 2020 14:16:32 +0100:
> > On Thu, Mar 05, 2020 at 03:36:28PM +0100, Alex Riesen wrote:
> >> Geert Uytterhoeven, Mon, Mar 02, 2020 17:13:30 +0100:
> >>> On Mon, Mar 2, 2020 at 5:09 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> >>>> Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> >>>>>
> >>>>> The #clock-cells should be in the main video-receiver node.
> >>>>> Probably there is more than one clock output, so #clock-cells may be 1?
> >>>>
> >>>> AFAICS, the device can provide only this one clock line (audio master clock
> >>>> for I2S output)... I shall re-check, just in case.
> >> 
> >> And you're right, of course: the audio output formatting module of the ADV748x
> >> devices provides a set of clock lines related to the I2S pins: the already
> >> discussed master clock, left-right channel clock and the serial clock (bit
> >> clock?).
> > 
> > I don't think we need to model the last two clocks through CCF though,
> > they're part of the I2S protocol, not clock sources that need to be
> > explicitly controlled (or queried).
> 
> That's good, because I'm right now having hard time finding out how to
> calculate the frequencies!
> 
> >> Just to try it out (I'll set #clock-cells to 1), I registered a fixed rate
> >> clock in the driver, added a clock provider:
> >> 
> >> adv748x_probe:
> >> 
> >>     clk = clk_register_fixed_rate(state->dev,
> >> 				  "clk-hdmi-i2s-mclk",
> >> 				  NULL     /* parent_name */,
> >> 				  0        /* flags */,
> >> 				  12288000 /* rate */);
> >>     of_clk_add_provider(state->dev->of_node, of_clk_src_simple_get, clk);
> >> 
> >> And removed the audio_clk_c frequency setting. I also replaced the audio_clk_c
> >> in the list of input clocks of the R-Car-side sound card with the phandle of
> >> the adv7482 main node:
> >> 
> >> salvator-common.dtsi:
> >> 
> >>     &i2c4 {
> >> 	status = "okay";
> >> 
> >> 	adv7482_hdmi_decoder: video-receiver@70 {
> >> 	    #clock-cells = <0>; // to be replaced with <1>
> >> 	};
> >>     };
> >> 
> >>     &rcar_sound {
> >> 	clocks = ..., <&adv7482_hdmi_decoder>, ...;
> >>     };
> >> 
> >> As everything continues to work as before, I assume that at least the clock
> >> dependencies were resolved.
> > 
> > This looks good to me.
> 
> Ok, I settle on this than.
> 
> >> Is there a way to verify that the added input clock is actually used?
> >> IOW, if its frequency is actually has been programmed into the ssi4 (R-Car
> >> receiving hardware) registers, and not just a left-over from previuos attempts
> >> or plain default setting?
> >> 
> >> As the ADV748x devices seem to provide also the clocks for video outputs, will
> >> it make any sense to place the clock definition into the port node?
> >> Or should all provided clocks be indexed in the main device node?
> > 
> > Those clocks are part of the CSI-2 protocol and also don't need to be
> > explicitly controlled. As far as I can tell from a quick check of the
> > ADV7482 documentation, only the I2S MCLK is a general-purpose clock that
> > needs to be exposed.
> 
> Thanks, that's good to know!
> 
> Do you know, by chance, which of the snd_soc* callbacks should be used to
> implement setting of the MCLK? The one in snd_soc_component_driver or
> snd_soc_dai_driver->ops (snd_soc_dai_ops)?
> 
> Or how the userspace interface looks like? Or, if there is no userspace
> interface for this, how the MCLK is supposed to be set? Through mclk-fs?

I'm afraid my knowledge of the sound subsystem is limited. Morimoto-san
is the main developer and maintainer of Renesas sound drivers.
Morimoto-sensei, would you have an answer to that question ? :-)

-- 
Regards,

Laurent Pinchart

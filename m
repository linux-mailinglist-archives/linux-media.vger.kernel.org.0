Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC9617DE45
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 12:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCILJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 07:09:50 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49957 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCILJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 07:09:49 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNss4-1j0MB33BHc-00OKYg; Mon, 09 Mar 2020 12:09:33 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id AEACE650061;
        Mon,  9 Mar 2020 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EF_gs1Tv7aJJ; Mon,  9 Mar 2020 12:09:32 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4495A64FD05;
        Mon,  9 Mar 2020 12:09:32 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 12:09:32 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E1BA1804F8; Mon,  9 Mar 2020 12:09:31 +0100 (CET)
Date:   Mon, 9 Mar 2020 12:09:31 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200309110931.GB3593@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
References: <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari>
 <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari>
 <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
 <20200305143628.GB25741@pflmari>
 <20200306131632.GA4878@pendragon.ideasonboard.com>
 <20200306134154.GD27714@pflmari>
 <20200306134546.GE4878@pendragon.ideasonboard.com>
 <87r1y2wbze.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87r1y2wbze.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F637D63
X-Provags-ID: V03:K1:gR6rW5ecslKFmSCgJXl9/tgvA5veb1fTHa5FSn9E02NiSYn8MTc
 jfTRnhmhxG1xh05nAmModYg4ablDUwhsTEWRtMKNiwF1Ba+Q4XBvXEXLZUfES35/yWi0Siv
 mW5lPK8HZK2Ymp/Dyg8Uz8kFjgeAWLhSrZtsSOuyib7tUn57ibP939fs3UC9nCbF83YzvKM
 Ng06OF7KQ36aOR0aRClNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rLu4bN4ajpU=:h8UFrs8QFFhECyg3qTXbrA
 3JNpp6c0hdSW7ncjvgVXWh2iQHS+Y0jct46wxyEhGGkrV0oCDArK5DhnpdUcTzm78L5zXPGKi
 yIPl2CNrEgIkSA/5VERu1sHyqn+VdfnDQLHYd7snDgsll+j0MiIpq+/ZK1Z3+6d7K6rZcXMzR
 w3A7az7S6srz5fz9Auy2RJAPxI0Fe4EBrF7R8bTpT2KJsmch3TyiTErVRCCsOCAo+bdCdZFsM
 MPvcyE5Q7YLmnY6HMBZnbUUknhGzSVJgthMI1+GqGD6yvp9OU1qI2Z4O8YAbg5ttdRFJbT9Bk
 Ov05BmUmMHLO/1Msl0vZ20gPoJid/qxpyEbcedDUmDM7Mv27UMAjgKQMo8YVN6ctelyix7s4k
 JogLp4RV9krJ96qClbNo7DRUsjsAU3w+h4uzi5HGZhhSH4rUJFjBETcK5lykq3IYQFfIOw31D
 pwdGjPjH++xAyVltzpVnLerAsQkO00qa1hc4nsTUgHCfH5DSa8d2/GHtCBcyRCzN9PHtsdYXy
 XoWJ78Ckt5RTFgxJ05xxzyMAgX2/TgzhwtWt4XYSFYqs6cDKe+eSNnpo0iaO/eBEQeoJD+1AI
 N0YtFEfiY4uw5lMmZVkOns/8ii0WQrLWxZg4Ld/wir7iFW3D00Y2iaW5zAj+nxuNttzuospw0
 lgy3NUXLdIEwl8WiWDDDnndRbKoMJfsiB9/2tvJ5wvlUM3RFFNH5Z8OSk49IERX5QJwWTQRPs
 cGgih8YlLjJw4IZgfSClkNtM7w1mk4vjsDvESjtaCr1YiTgaaQ/uL73fsR6f5DtBYYzZ/IhI0
 rymrCcY3m1GBu0hpUne15zhelObdrhOC+u5oCsc21Vn87GFy0Wody6vBthbrHoWPTpXLz52
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Kuninori Morimoto, Mon, Mar 09, 2020 02:31:01 +0100:
> > > > Those clocks are part of the CSI-2 protocol and also don't need to be
> > > > explicitly controlled. As far as I can tell from a quick check of the
> > > > ADV7482 documentation, only the I2S MCLK is a general-purpose clock that
> > > > needs to be exposed.
> (snip)
> > > Do you know, by chance, which of the snd_soc* callbacks should be used to
> > > implement setting of the MCLK? The one in snd_soc_component_driver or
> > > snd_soc_dai_driver->ops (snd_soc_dai_ops)?
> > > 
> > > Or how the userspace interface looks like? Or, if there is no userspace
> > > interface for this, how the MCLK is supposed to be set? Through mclk-fs?
> > 
> > I'm afraid my knowledge of the sound subsystem is limited. Morimoto-san
> > is the main developer and maintainer of Renesas sound drivers.
> > Morimoto-sensei, would you have an answer to that question ? :-)
> 
> In my quick check, it goes to AUDIO_CLKC.
> If so, you can update rcar_sound::clocks.
> 
> 	&rcar_sound {
> 		...
> -		/* update <audio_clk_b> to <cs2000> */
> +		/* update <audio_clk_b> to <cs2000>,
> +		 *        <audio_clk_c> to <adv748x> */
> 		clocks = <&cpg CPG_MOD 1005>,
> 			...
> 			 <&audio_clk_a>, <&cs2000>,
> -			 <&audio_clk_c>,
> +			 <&adv748x>,
> 			 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> 
> Thank you for your help !!

Thanks.

Should the adv748x driver also implement anything to configure the frequency
of MCLK clock? I mean something like .set_sysclk and .set_fmt callbacks of
snd_soc_dai_ops?

Or is the driver implementation, which depends on mclk-fs to be 256, the audio
stream format to be 8x S24_LE, and requires strictly 48kHz sampling rate on
the HDMI input, a totally acceptable first attempt at writing a DAI driver?

I'm a bit bothered by that, as the hardware is also capable of decoding
stereo, sampling rate 32-192kHz, a variety of PCM and compressed/encrypted
formats, 128-768fs MCLK multipliers, and a row of I2S options.

I just find it confusing to place the configuration interfaces.
For instance, the patches use the media ioctl for audio output selection to
select I2S protocol. While works, it does not feel right (shouldn't it be in
the device tree?)

Maybe you can point me at a driver doing something similar? I'm studying media
drivers now, but not many of them use ASoC interfaces for devices providing a
clock. Or maybe I should better look at sound/soc/...?

Thanks in advance,
Alex

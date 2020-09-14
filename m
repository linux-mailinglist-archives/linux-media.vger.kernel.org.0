Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2940126870F
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 10:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgINISw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 04:18:52 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37353 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbgINIRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 04:17:41 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1g3U-1kg7Dy0gTw-011xYK; Mon, 14 Sep 2020 10:17:10 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A4ACB1E01E7;
        Mon, 14 Sep 2020 08:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fT1QDICKneYm; Mon, 14 Sep 2020 10:17:08 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.10.5.94])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 29C7B1E01E6;
        Mon, 14 Sep 2020 10:17:08 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 1802980518; Mon, 14 Sep 2020 10:17:21 +0200 (CEST)
Date:   Mon, 14 Sep 2020 10:17:21 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200914081721.GA4705@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <90f2c14fcbe5d06eefdaeadbe8a6efc8c91523f3.1585852001.git.alexander.riesen@cetitec.com>
 <fd19ca3c-e815-499e-0c46-0a4e2684b6b9@ideasonboard.com>
 <c7d93d6c-4893-8bd0-5859-87f30389b5d5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d93d6c-4893-8bd0-5859-87f30389b5d5@ideasonboard.com>
X-Provags-ID: V03:K1:UHcFLjAKEiiKW4tNPExK/jcV8LIPMVxxdUxhNXRdIikco3TrDmb
 o/cyr2b4x5Mwrrviosr4vfXYTCUCUGPFYLR3Z825Bfv8F5YI8D/7XS7HydSH7VHHR7r/+cQ
 eS9YMhvcQBrAQbEjgGHfU0ZHDoVlUawgEkQLExImqd+ohQ1IRzSIuhk281L4kKQhQpvEhxg
 SwlknkW7VuighC67pb6nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q14iHgKArkU=:QQqH5vimPezMIzYeJW/C8J
 7WQLNV3JpR1JqJiDAQ+tGqJVmrljT7vGLTUQOlwdcMW8lsmrLQAYPUh/yewDE3CN8xfr2Fq0N
 qspPB5DanBCMSexlQvu+5BSkpzHD52S65lovUnStC6rhCWfWe+VtvgUGfxN9GAPaYZcVFQtuh
 fDOPU9KpoNyrYtbPChwHvh66UWHy+FhHC1akqY47TJkBJhEVl2QVB5w3gMqKh7TBNsqXdcbMR
 /5qj7IunfhPB/6v0zg2kam/g9+Sq9YyK1zxPWvsqXJLBccoG8ejeWkV0AhDjy28HJqQby8DND
 Nw1oSfYs9XP8aRHKqREjbm3QRCYQLBHYr1dvw/rqR36fjIFLDnACvDgxWniIrK2RAt4g3D+xY
 OfmlXfN9fZltWwRGSn+zFc96tirkekDLtmFhDa2b+BA0W8f+c/9/4T1JLeR4J7ErMQ0o+lVEY
 8XdgpCLD4Hn50fhxeBIwU/ENO2pPjf9iw5ZnuG6ToiWWU8COMk8XQg2sCQq1hsIz0BOvHaw9T
 JjoRx9MdEWfeWjj89bWwfr17NoO+dqnt8nwCwrwPZQBWiu9rsXiYXU67xhZZFoeeocfSfLTWx
 JPnNqodHCQtjYyAMnhtUof+CVpLJNDJG9FIXsF1wav4sR0DzlVQKjoj6wZHzOjv+SzhX1s8jU
 2nnqqof6olRUTZBZkx76UZSezcd8fjVtHq5F49X5i9Di8otbPYHmaTPsC12LDCh9DdSmzZ7op
 RDoLgB6iZmuin7e+Sf3qTgkLPNhCZHasKoJGzqPGKlrlz7SB8Pl3D8CMC4wNvm3D7BPtBp1Jl
 Lnv3zyhcapHS5PWlk4KVhFlJkiThLDLQrTftcvyGhFOXQ96Evb5a9cLCPDQ5xmiDTGux6ny97
 WjE2J0/hdkZiS6e6dsOQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Kieran Bingham, Tue, Aug 25, 2020 16:57:04 +0200:
> On 18/06/2020 17:32, Kieran Bingham wrote:
> > On 02/04/2020 19:35, Alex Riesen wrote:
> >> As all known variants of the Salvator board have the HDMI decoder
> >> chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> >> endpoint and the connection definitions are placed in the common board
> >> file.
> >>
> >> For the same reason, the CLK_C clock line and I2C configuration (similar
> >> to the ak4613, on the same interface) are added into the common file.
> >> ...
> >> ---
> >>  .../boot/dts/renesas/r8a77950-salvator-x.dts  |  3 +-
> >>  arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  1 +
> >>  .../boot/dts/renesas/salvator-common.dtsi     | 47 +++++++++++++++++--
> 
> Once again I'm back trying to test this series, and one issue I've had
> is that the board I have (r8a77951-salvator-xs.dts) isn't included in
> this DT update.
> 
> For v6, Should we include the relevant changes to all the following?

Ok. I shall add them as a separate patch though, as I have no way to verify
those boards (and some verification seem to be in order...)

> arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> arch/arm64/boot/dts/renesas/salvator-x.dtsi
> 
> And perhaps handle the salvator-xs in a second (yet very similar) patch?
> 
> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> 
> I think I've added the relevant entries to my dtb, but I haven't
> successfully captured audio yet.
> 
> I can see the device being listed through arecord:
> 
> kbingham@salvator-xs:~$ arecord -l
> **** List of CAPTURE Hardware Devices ****
> card 0: rcarsound [rcar-sound], device 0: rsnd-dai.0-ak4613-hifi ak4613-hifi-0 []
>   Subdevices: 0/1
>   Subdevice #0: subdevice #0
> card 0: rcarsound [rcar-sound], device 3: rsnd-dai.3-adv748x-i2s adv748x.4-0070-3 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> But as yet, everything I try to record fails or is empty silence.
> 
> Debugging ...

Does it fail somewhere in the ASoC infrastructure? If so, how'd you find out
where exactly and what fails?

Asking, because when I was writing this code I ended up adding quite a bit of
tracing into the SoC core to figure that out, and I just hope there is a
better way to get at the diagnostics.

> >> diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> >> index 2438825c9b22..e16c146808b6 100644
> >> --- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> >> +++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> >> @@ -146,7 +146,8 @@ &sata {
> >>  &sound_card {
> >>  	dais = <&rsnd_port0	/* ak4613 */
> >>  		&rsnd_port1	/* HDMI0  */
> >> -		&rsnd_port2>;	/* HDMI1  */
> >> +		&rsnd_port2	/* HDMI1  */
> >> +		&rsnd_port3>;	/* adv7482 hdmi-in  */
> > 
> > Ah - that was confusing at first... but HDMI0 and HDMI1 are *outputs*,
> > where of course the adv7482 is an input ;-)

I shall add an "output" to HDMI0 and HDMI1.

> > Otherwise, I can't spot anything else yet so:
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

> > But I fear there may have been some churn around here, so it would be
> > good to see a rebase too.

Of course, I shall rebase on top of linux-media/master.
Should I wait with submission until you get data out of your boards?

Regards,
Alex

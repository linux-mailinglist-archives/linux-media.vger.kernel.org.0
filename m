Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8124D31AAFD
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 12:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhBMLVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Feb 2021 06:21:01 -0500
Received: from mout01.posteo.de ([185.67.36.65]:48284 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhBMLU7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 06:20:59 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id AFEA716006C
        for <linux-media@vger.kernel.org>; Sat, 13 Feb 2021 12:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1613215200; bh=LdSMwsAk/xXFN+Y8P4/lPu3FFkk8ht3k2CuANxWxN+o=;
        h=Date:From:To:Cc:Subject:From;
        b=REgD1Z/6HIAXxfkkCD9uJi50/Qx2znnMo2p9QMqd9C5hfHNcVFgcjZ326b0XvTBWG
         tu5Pdr473MU09lsG99AVsyxfpdP+kTxozhrj8e4+gcik4HtBiSagVMyFvYQ1E+hZTk
         x2UCMVEOQ81FH27eP62yAT2Oa1itUA8ZLchFGrDkYrXk6B5P7BE/QAAFIOg8d1XGJL
         BcnexzWu0ZTSxDUqlVoPd99TypQxQGOKUwXUCkhzQ90Q6DD3It21ff1Or6Uzu2AY8V
         SNREdaEbvIQa1RhgAsw+ilu581s58f+IzlGTxmGJShq2vKSCW6G32kTJjdch/8pAqm
         pIGNJc1QTZddw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Dd7FB123Zz6tmJ;
        Sat, 13 Feb 2021 12:19:58 +0100 (CET)
Date:   Sat, 13 Feb 2021 12:19:57 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210213111957.3ocxgcyno6ent4vt@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <808992741.0ifERbkFSE@diego>
 <20210211052515.qdqe256cipdwwrz6@basti-TUXEDO-Book-XA1510>
 <16789691.tv2OnDr8pf@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16789691.tv2OnDr8pf@diego>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Heiko,

On 11.02.2021 15:42, Heiko Stübner wrote:
>Hi Sebastian,
>
>Am Donnerstag, 11. Februar 2021, 06:25:15 CET schrieb Sebastian Fricke:
>> Hey Heiko,
>>
>> On 10.02.2021 12:15, Heiko Stübner wrote:
>> >Hi Sebastian,
>> >
>> >Am Freitag, 5. Februar 2021, 15:55:56 CET schrieb Heiko Stübner:
>> >> Hi Sebastian,
>> >>
>> >> I did some tests myself today as well and can confirm your
>> >> hdmi related finding - at least when plugged in on boot.
>> >>
>> >> I tried some combinations of camera vs. hdmi and it seems
>> >> really only when hdmi is plugged in on boot
>> >
>> >as you can see in v2, it should work now even with hdmi
>> >connected on boot. My patch ignored the grf-clock when
>> >doing the grf-based init.
>> >
>> >All clocks are on during boot and I guess the hdmi-driver
>> >did disable it after its probe. The phy_power_on functions
>> >did handle it correctly already, so it was only happening
>> >with hdmi connected on boot.
>>
>> Thank you very much for solving that problem, I've tested the scenarios
>> described below and it works like a charm. (With your V2)
>> >
>> >
>> >Btw. do you plan on submitting your ov13850 driver
>> >soonish?
>>
>> Actually, I have posted the patch already see here:
>> https://patchwork.kernel.org/project/linux-media/patch/20210130182313.32903-2-sebastian.fricke@posteo.net/
>
>very cool to see
>
>> I currently review the requested changes and questions and will soon
>> post a second version, but I expect quite some time until it is actually
>> merged.
>
>could you Cc me on future versions?

Sure will do :)

>
>
>Thanks
>Heiko

Sebastian
>>
>> Greetings,
>> Sebastian
>>
>> >
>> >
>> >>
>> >> (1)
>> >> - boot
>> >> - camera
>> >> --> works
>> >>
>> >> (2)
>> >> - boot
>> >> - camera
>> >> - hdmi plugged in
>> >> - hdmi works
>> >> - camera
>> >> --> works
>> >>
>> >> (3)
>> >> - hdmi plugged in
>> >> - boot
>> >> - hdmi works
>> >> - camera
>> >> --> camera doesn't work
>> >>
>> >> (4)
>> >> - boot
>> >> - hdmi plugged in
>> >> - hdmi works
>> >> - camera
>> >> -> camera works
>> >>
>> >>
>> >> With a bit of brute-force [0] it seems the camera also works again even
>> >> with hdmi connected on boot. So conclusion would be that some clock
>> >> is misbehaving.
>> >>
>> >> Now we'll "only" need to find out which one that is.
>> >>
>> >>
>> >> Heiko
>> >>
>> >>
>> >> [0]
>> >> Don't disable any clock gates
>> >>
>> >> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
>> >> index 070dc47e95a1..8daf1fc3388c 100644
>> >> --- a/drivers/clk/clk-gate.c
>> >> +++ b/drivers/clk/clk-gate.c
>> >> @@ -61,6 +61,9 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
>> >>
>> >>         set ^= enable;
>> >>
>> >> +if (!enable)
>> >> +return;
>> >> +
>> >>         if (gate->lock)
>> >>                 spin_lock_irqsave(gate->lock, flags);
>> >>         else
>> >>
>> >>
>> >>
>> >> Am Freitag, 5. Februar 2021, 09:15:47 CET schrieb Heiko Stübner:
>> >> > Hi Sebastian,
>> >> >
>> >> > Am Freitag, 5. Februar 2021, 07:43:35 CET schrieb Sebastian Fricke:
>> >> > > On 03.02.2021 20:54, Heiko Stübner wrote:
>> >> > > >Am Mittwoch, 3. Februar 2021, 19:14:22 CET schrieb Sebastian Fricke:
>> >> > > >> I have tested your patch set on my nanoPC-T4, here is a complete log
>> >> > > >> with:
>> >> > > >> - relevant kernel log entries
>> >> > > >> - system information
>> >> > > >> - media ctl output
>> >> > > >> - sysfs entry information
>> >> > > >>
>> >> > > >> https://paste.debian.net/1183874/
>> >> > > >>
>> >> > > >> Additionally, to your patchset I have applied the following patches:
>> >> > > >> https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup
>> >> > > >>
>> >> > > >> And just to not cause confusion the `media_dev` entries come from this
>> >> > > >> unmerged series:
>> >> > > >> https://patchwork.kernel.org/project/linux-media/list/?series=426269
>> >> > > >>
>> >> > > >> I have actually been able to stream with both of my cameras at the same
>> >> > > >> time using the libcamera cam command.
>> >> > > >> I would like to thank you a lot for making this possible.
>> >> > > >
>> >> > > >Thanks for testing a dual camera setup. On my board I could only test
>> >> > > >the second ISP. And really glad it works for you tool :-) .
>> >> > > >
>> >> > > >Out of curiosity, do you also see that green tint in the images the cameras
>> >> > > >produce?
>> >> > >
>> >> > > Yes, I do. Actually, I currently have two forms of a green tint, on my
>> >> > > OV13850 everything is quite dark and greenish, which is caused by the
>> >> > > missing 3A algorithms. On my OV4689, I have big patches of the image
>> >> > > with bright green color and flickering, I investigated if this is
>> >> > > connected to the 2nd ISP instance, but that doesn't seem to be the case
>> >> > > as I have the same results when I switch the CSI ports of the cameras.
>> >> > >
>> >> > > I have found another issue, while testing I discovered following
>> >> > > issue:
>> >> > > When I start the system with an HDMI monitor connected, then the camera
>> >> > > on the 2nd port doesn't work. This is probably because the RX/TX is
>> >> > > reserved as a TX.
>> >> > > But it made me wonder because if the system has an RX, a TX, and
>> >> > > an RX/TX, why isn't the pure TX used by the monitor and the
>> >> > > cameras take RX and RX/TX?
>> >> > > Or do you think that this is maybe a malfunction of this patch?
>> >> >
>> >> > I don't think it is an issue with this specific series, but still puzzling.
>> >> >
>> >> > I.e. the DPHYs are actually only relevant to the DSI controllers,
>> >> > with TX0 being connected to DSI0 and TX1RX1 being connected
>> >> > to DSI1. So having an hdmi display _in theory_ shouldn't matter at all.
>> >> >
>> >> > Out of curiosity what happens, when you boot without hdmi connected
>> >> > turn on the cameras, connect the hdmi after this, try the cameras again?
>> >> >
>> >> >
>> >> > Heiko
>> >> >
>> >> > >
>> >> > > >
>> >> > > >Thanks
>> >> > > >Heiko
>> >> > >
>> >> > > Greetings,
>> >> > > Sebastian
>> >> > >
>> >> > > >
>> >> > > >
>> >> > > >> If you like to you can add:
>> >> > > >> Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
>> >> > > >>
>> >> > > >> On 02.02.2021 15:56, Heiko Stuebner wrote:
>> >> > > >> >The rk3399 has two ISPs and right now only the first one is usable.
>> >> > > >> >The second ISP is connected to the TXRX dphy on the soc.
>> >> > > >> >
>> >> > > >> >The phy of ISP1 is only accessible through the DSI controller's
>> >> > > >> >io-memory, so this series adds support for simply using the dsi
>> >> > > >> >controller is a phy if needed.
>> >> > > >> >
>> >> > > >> >That solution is needed at least on rk3399 and rk3288 but no-one
>> >> > > >> >has looked at camera support on rk3288 at all, so right now
>> >> > > >> >only implement the rk3399 specifics.
>> >> > > >> >
>> >> > > >> >
>> >> > > >> >Heiko Stuebner (6):
>> >> > > >> >  drm/rockchip: dsi: add own additional pclk handling
>> >> > > >> >  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>> >> > > >> >  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>> >> > > >> >  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>> >> > > >> >  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>> >> > > >> >  arm64: dts: rockchip: add isp1 node on rk3399
>> >> > > >> >
>> >> > > >> > .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
>> >> > > >> > arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
>> >> > > >> > drivers/gpu/drm/rockchip/Kconfig              |   2 +
>> >> > > >> > .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
>> >> > > >> > 4 files changed, 384 insertions(+)
>> >> > > >> >
>> >> > > >>
>> >> > > >
>> >> > > >
>> >> > > >
>> >> > > >
>> >> > >
>> >> >
>> >> >
>> >>
>> >>
>> >
>> >
>> >
>> >
>>
>
>
>
>

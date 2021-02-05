Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED8E311540
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 23:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbhBEW0b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 5 Feb 2021 17:26:31 -0500
Received: from gloria.sntech.de ([185.11.138.130]:44268 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231708AbhBEOUM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 09:20:12 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l82Wb-0002S7-Fm; Fri, 05 Feb 2021 15:55:57 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date:   Fri, 05 Feb 2021 15:55:56 +0100
Message-ID: <5860385.iIbC2pHGDl@diego>
In-Reply-To: <5271305.e9J7NaK4W3@diego>
References: <20210202145632.1263136-1-heiko@sntech.de> <20210205064335.6c3gs3h3pgvhceku@basti-TUXEDO-Book-XA1510> <5271305.e9J7NaK4W3@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

I did some tests myself today as well and can confirm your
hdmi related finding - at least when plugged in on boot.

I tried some combinations of camera vs. hdmi and it seems
really only when hdmi is plugged in on boot

(1)
- boot
- camera
--> works

(2)
- boot
- camera
- hdmi plugged in
- hdmi works
- camera
--> works

(3)
- hdmi plugged in
- boot
- hdmi works
- camera
--> camera doesn't work

(4)
- boot
- hdmi plugged in
- hdmi works
- camera
-> camera works


With a bit of brute-force [0] it seems the camera also works again even
with hdmi connected on boot. So conclusion would be that some clock
is misbehaving.

Now we'll "only" need to find out which one that is.


Heiko


[0]
Don't disable any clock gates

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 070dc47e95a1..8daf1fc3388c 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -61,6 +61,9 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 
        set ^= enable;
 
+if (!enable)
+return;
+
        if (gate->lock)
                spin_lock_irqsave(gate->lock, flags);
        else



Am Freitag, 5. Februar 2021, 09:15:47 CET schrieb Heiko St�bner:
> Hi Sebastian,
> 
> Am Freitag, 5. Februar 2021, 07:43:35 CET schrieb Sebastian Fricke:
> > On 03.02.2021 20:54, Heiko St�bner wrote:
> > >Am Mittwoch, 3. Februar 2021, 19:14:22 CET schrieb Sebastian Fricke:
> > >> I have tested your patch set on my nanoPC-T4, here is a complete log
> > >> with:
> > >> - relevant kernel log entries
> > >> - system information
> > >> - media ctl output
> > >> - sysfs entry information
> > >>
> > >> https://paste.debian.net/1183874/
> > >>
> > >> Additionally, to your patchset I have applied the following patches:
> > >> https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup
> > >>
> > >> And just to not cause confusion the `media_dev` entries come from this
> > >> unmerged series:
> > >> https://patchwork.kernel.org/project/linux-media/list/?series=426269
> > >>
> > >> I have actually been able to stream with both of my cameras at the same
> > >> time using the libcamera cam command.
> > >> I would like to thank you a lot for making this possible.
> > >
> > >Thanks for testing a dual camera setup. On my board I could only test
> > >the second ISP. And really glad it works for you tool :-) .
> > >
> > >Out of curiosity, do you also see that green tint in the images the cameras
> > >produce?
> > 
> > Yes, I do. Actually, I currently have two forms of a green tint, on my
> > OV13850 everything is quite dark and greenish, which is caused by the
> > missing 3A algorithms. On my OV4689, I have big patches of the image
> > with bright green color and flickering, I investigated if this is
> > connected to the 2nd ISP instance, but that doesn't seem to be the case
> > as I have the same results when I switch the CSI ports of the cameras.
> > 
> > I have found another issue, while testing I discovered following
> > issue:
> > When I start the system with an HDMI monitor connected, then the camera
> > on the 2nd port doesn't work. This is probably because the RX/TX is
> > reserved as a TX.
> > But it made me wonder because if the system has an RX, a TX, and
> > an RX/TX, why isn't the pure TX used by the monitor and the
> > cameras take RX and RX/TX?
> > Or do you think that this is maybe a malfunction of this patch?
> 
> I don't think it is an issue with this specific series, but still puzzling.
> 
> I.e. the DPHYs are actually only relevant to the DSI controllers,
> with TX0 being connected to DSI0 and TX1RX1 being connected
> to DSI1. So having an hdmi display _in theory_ shouldn't matter at all.
> 
> Out of curiosity what happens, when you boot without hdmi connected
> turn on the cameras, connect the hdmi after this, try the cameras again?
> 
> 
> Heiko
> 
> > 
> > >
> > >Thanks
> > >Heiko
> > 
> > Greetings,
> > Sebastian
> > 
> > >
> > >
> > >> If you like to you can add:
> > >> Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> > >>
> > >> On 02.02.2021 15:56, Heiko Stuebner wrote:
> > >> >The rk3399 has two ISPs and right now only the first one is usable.
> > >> >The second ISP is connected to the TXRX dphy on the soc.
> > >> >
> > >> >The phy of ISP1 is only accessible through the DSI controller's
> > >> >io-memory, so this series adds support for simply using the dsi
> > >> >controller is a phy if needed.
> > >> >
> > >> >That solution is needed at least on rk3399 and rk3288 but no-one
> > >> >has looked at camera support on rk3288 at all, so right now
> > >> >only implement the rk3399 specifics.
> > >> >
> > >> >
> > >> >Heiko Stuebner (6):
> > >> >  drm/rockchip: dsi: add own additional pclk handling
> > >> >  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
> > >> >  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
> > >> >  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
> > >> >  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
> > >> >  arm64: dts: rockchip: add isp1 node on rk3399
> > >> >
> > >> > .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> > >> > arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
> > >> > drivers/gpu/drm/rockchip/Kconfig              |   2 +
> > >> > .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
> > >> > 4 files changed, 384 insertions(+)
> > >> >
> > >>
> > >
> > >
> > >
> > >
> > 
> 
> 





Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1879430894E
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 14:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbhA2MBB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 29 Jan 2021 07:01:01 -0500
Received: from gloria.sntech.de ([185.11.138.130]:55258 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232418AbhA2L6s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 06:58:48 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l5S1u-0006XH-P2; Fri, 29 Jan 2021 12:33:34 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Cc:     kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@vanguardiasur.com.ar
Subject: Re: RkISP1 simulataneously streaming with two cameras
Date:   Fri, 29 Jan 2021 12:33:34 +0100
Message-ID: <32898055.ATrlOLLGV9@diego>
In-Reply-To: <1966374.K71DO8KEF6@diego>
References: <20210117131209.4m2vqht4mflci7hy@basti-TUXEDO-Book-XA1510> <7d7a9785-eec7-cc8a-105a-596e29f41c89@collabora.com> <1966374.K71DO8KEF6@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, 18. Januar 2021, 23:34:21 CET schrieb Heiko Stübner:
> Am Montag, 18. Januar 2021, 22:41:19 CET schrieb Helen Koike:
> > 
> > On 1/18/21 3:12 PM, Helen Koike wrote:
> > > Hi Sebastian,
> > > 
> > > On 1/17/21 10:12 AM, Sebastian Fricke wrote:
> > >> Hello,
> > >>
> > >> I am currently trying to figure out how to configure my NanoPC-T4 for
> > >> streaming with two cameras at the same time. The cameras are the CAM1320
> > >> (OV13850) and the MCAM40(OV4689), I have ported the drivers from the
> > >> downstream BSP Kernel to the current 5.11 rc1 kernel.
> > >> My current attempt is to enable the second instance of the RkISP1, the
> > >> mipi_dphy_tx1rx1 and setup the OV13850 on i2c1 and the OV4689 on the
> > > 
> > > The driver phy-rockchip-dphy-rx0.c doesn't support tx1rx1.
> > 
> > In case you are interested, it seems to be supported by the downstream
> > driver:
> > 
> >     https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/phy/rockchip/phy-rockchip-mipi-rx.c
> 
> I also did start implementing how I think this could look last year, though never
> got it to work at the time.
> 
> Relevant code is at:
> 	https://github.com/mmind/linux-rockchip/commits/wip/tc358749
> 
> especially:
> 	https://github.com/mmind/linux-rockchip/commit/e0d4b03976d2aab85a8c1630be937ea003b5df88
> 
> which allows dsi1 to act like a phy instead as it contains the controls
> for the tx1rx1 dphy.
> 
> 
> Though I can't say if and when I'll revisit this myself again.

change of plans :-D

I made the tx1rx1 phy to work now - also thanks to the ov13850 driver I
found in your tree. Need to clean up more though.


Heiko



> > Adding support for it upstream would be more then welcome :)
> > We didn't add it when we merged because we didn't have hw to test it.
> > 
> > Thanks!
> > Helen
> > 
> > > 
> > > Regards,
> > > Helen
> > > 
> > >> i2c2.
> > >> The patch that I apply in this case is the following:
> > >> https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/9a8e594a660d67f3790da32f3268bebd3d233526> 
> > >> Here is the dmesg ouput when I start the kernel with this patch:
> > >> ```
> > >> [    7.021079] mc: Linux media interface: v0.10
> > >> ...
> > >> [    7.084369] videodev: Linux video capture interface: v2.00
> > >> ...
> > >> [    7.125911] ov4689 2-0036: driver version: 00.01.01
> > >> [    7.125939] ov4689 2-0036: could not get module information!
> > >> [    7.130037] ov4689 2-0036: Unexpected sensor id(000000), ret(-5)
> > >> ...
> > >> [    7.143951] ov13850 1-0010: driver version: 00.01.01
> > >> [    7.143980] ov13850 1-0010: could not get module information!
> > >> [    7.149127] ov13850 1-0010: Detected OV00d850 sensor, REVISION 0xb1
> > >> ...
> > >> [    7.259601] rkisp1 ff910000.isp0: Adding to iommu group 4
> > >> [    7.260911] rkisp1: registered rkisp1_mainpath as /dev/video1
> > >> [    7.261100] rkisp1: registered rkisp1_selfpath as /dev/video2
> > >> ...
> > >> [    7.262628] rkisp1 ff910000.isp0: registered ep id 0 with 2 lanes
> > >> [    7.263666] rkvdec ff660000.video-codec: Adding to iommu group 1
> > >> [    7.265120] rkisp1 ff910000.isp0: Async subdev notifier completed
> > >> [    7.265458] rkisp1 ff920000.isp1: Adding to iommu group 5
> > >> [    7.266441] rkisp1: registered rkisp1_mainpath as /dev/video6
> > >> [    7.267380] rkisp1: registered rkisp1_selfpath as /dev/video7
> > >> [    7.267945] rkisp1 ff920000.isp1: registered ep id 0 with 2 lanes
> > >> [    7.267994] debugfs: Directory 'rkisp1' with parent '/' already present!
> > >> ```
> > >>
> > >> And here is the long version of the log with pinctrl and gpio debug
> > >> output. https://paste.debian.net/1181487/
> > >>
> > >> These are the drivers that I use:
> > >> OV13850: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov13850.c
> > >> OV4689: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov4689.c
> > >>
> > >> I have the following questions:
> > >> 1. Within the mipi_dphy_tx1rx1, I chose the phy-cells value to be `<0>`, but I have to say I am not entirely sure about this value. My current research was within the Documentation/devicetree/bindings/phy folder where I was able to find:
> > >>> #phy-cells:    Number of cells in a PHY specifier;  The meaning of all
> > >>> those cells is defined by the binding for the phy node. The PHY
> > >>> provider can use the values in cells to find the appropriate PHY.
> > >> But as there is only a binding for the rx0, I felt like I had to guess.
> > >> Could someone give me a hint in the right direction?
> > >>
> > >> 2. Both ISP instances try to acquire the same endpoint 0, I found out
> > >> within the code at `rkisp1-dev.c:257`, that the rkisp1 driver tries to
> > >> get the endpoint from the firmware node at port 0. Looking deeper into
> > >> the code I can see that there are multiple debugging messages which
> > >> might be useful, how do I enable the debugging output for prints like:
> > >> `drivers/media/v4l2-core/v4l2-fwnode.c:419` ? I already enabled
> > >> CONFIG_DEBUG_KERNEL & CONFIG_DEBUG_MISC & CONFIG_DYNAMIC_DEBUG
> > >>
> > >> 3. Is it correct when two camera sensors try to multiplex the
> > >> cif-clkout-a pinctrl? I have taken this from the friendlyElec fork of
> > >> the rockchip BSP downstream kernel. https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/arch/arm64/boot/dts/rockchip/rk3399-nanopi4-rkisp1.dtsi#L30
> > >> I have been testing on of their official images and there the dual mipi setup works.
> > >> So, I currently ask myself has something significantly changed in this
> > >> part of the code that I am unaware of?
> > >> And also I have a really hard time figuring out, where the cif-clkout-a
> > >> pinctrl is actually used.
> > >>
> > >> 4. Has anyone been able to set up the dual cam setup on the rkisp1 on an
> > >> upstream kernel? If yes how did you do it?
> > >>
> > >> Greetings,
> > >> Sebastian
> > 
> 
> 





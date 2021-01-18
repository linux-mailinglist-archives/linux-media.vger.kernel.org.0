Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506272FA870
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407428AbhARSOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:14:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46696 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407409AbhARSNb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:13:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B87301F44A00
Subject: Re: RkISP1 simulataneously streaming with two cameras
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@vanguardiasur.com.ar, heiko@sntech.de
References: <20210117131209.4m2vqht4mflci7hy@basti-TUXEDO-Book-XA1510>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <4e3159d4-7320-271f-ede8-1399fd23b0d6@collabora.com>
Date:   Mon, 18 Jan 2021 15:12:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210117131209.4m2vqht4mflci7hy@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

On 1/17/21 10:12 AM, Sebastian Fricke wrote:
> Hello,
> 
> I am currently trying to figure out how to configure my NanoPC-T4 for
> streaming with two cameras at the same time. The cameras are the CAM1320
> (OV13850) and the MCAM40(OV4689), I have ported the drivers from the
> downstream BSP Kernel to the current 5.11 rc1 kernel.
> My current attempt is to enable the second instance of the RkISP1, the
> mipi_dphy_tx1rx1 and setup the OV13850 on i2c1 and the OV4689 on the

The driver phy-rockchip-dphy-rx0.c doesn't support tx1rx1.

Regards,
Helen

> i2c2.
> The patch that I apply in this case is the following:
> https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/9a8e594a660d67f3790da32f3268bebd3d233526> 
> Here is the dmesg ouput when I start the kernel with this patch:
> ```
> [    7.021079] mc: Linux media interface: v0.10
> ...
> [    7.084369] videodev: Linux video capture interface: v2.00
> ...
> [    7.125911] ov4689 2-0036: driver version: 00.01.01
> [    7.125939] ov4689 2-0036: could not get module information!
> [    7.130037] ov4689 2-0036: Unexpected sensor id(000000), ret(-5)
> ...
> [    7.143951] ov13850 1-0010: driver version: 00.01.01
> [    7.143980] ov13850 1-0010: could not get module information!
> [    7.149127] ov13850 1-0010: Detected OV00d850 sensor, REVISION 0xb1
> ...
> [    7.259601] rkisp1 ff910000.isp0: Adding to iommu group 4
> [    7.260911] rkisp1: registered rkisp1_mainpath as /dev/video1
> [    7.261100] rkisp1: registered rkisp1_selfpath as /dev/video2
> ...
> [    7.262628] rkisp1 ff910000.isp0: registered ep id 0 with 2 lanes
> [    7.263666] rkvdec ff660000.video-codec: Adding to iommu group 1
> [    7.265120] rkisp1 ff910000.isp0: Async subdev notifier completed
> [    7.265458] rkisp1 ff920000.isp1: Adding to iommu group 5
> [    7.266441] rkisp1: registered rkisp1_mainpath as /dev/video6
> [    7.267380] rkisp1: registered rkisp1_selfpath as /dev/video7
> [    7.267945] rkisp1 ff920000.isp1: registered ep id 0 with 2 lanes
> [    7.267994] debugfs: Directory 'rkisp1' with parent '/' already present!
> ```
> 
> And here is the long version of the log with pinctrl and gpio debug
> output. https://paste.debian.net/1181487/
> 
> These are the drivers that I use:
> OV13850: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov13850.c
> OV4689: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov4689.c
> 
> I have the following questions:
> 1. Within the mipi_dphy_tx1rx1, I chose the phy-cells value to be `<0>`, but I have to say I am not entirely sure about this value. My current research was within the Documentation/devicetree/bindings/phy folder where I was able to find:
>> #phy-cells:    Number of cells in a PHY specifier;  The meaning of all
>> those cells is defined by the binding for the phy node. The PHY
>> provider can use the values in cells to find the appropriate PHY.
> But as there is only a binding for the rx0, I felt like I had to guess.
> Could someone give me a hint in the right direction?
> 
> 2. Both ISP instances try to acquire the same endpoint 0, I found out
> within the code at `rkisp1-dev.c:257`, that the rkisp1 driver tries to
> get the endpoint from the firmware node at port 0. Looking deeper into
> the code I can see that there are multiple debugging messages which
> might be useful, how do I enable the debugging output for prints like:
> `drivers/media/v4l2-core/v4l2-fwnode.c:419` ? I already enabled
> CONFIG_DEBUG_KERNEL & CONFIG_DEBUG_MISC & CONFIG_DYNAMIC_DEBUG
> 
> 3. Is it correct when two camera sensors try to multiplex the
> cif-clkout-a pinctrl? I have taken this from the friendlyElec fork of
> the rockchip BSP downstream kernel. https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/arch/arm64/boot/dts/rockchip/rk3399-nanopi4-rkisp1.dtsi#L30
> I have been testing on of their official images and there the dual mipi setup works.
> So, I currently ask myself has something significantly changed in this
> part of the code that I am unaware of?
> And also I have a really hard time figuring out, where the cif-clkout-a
> pinctrl is actually used.
> 
> 4. Has anyone been able to set up the dual cam setup on the rkisp1 on an
> upstream kernel? If yes how did you do it?
> 
> Greetings,
> Sebastian

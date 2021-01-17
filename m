Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE902F926C
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 14:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbhAQNNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 08:13:12 -0500
Received: from mout01.posteo.de ([185.67.36.65]:41197 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728775AbhAQNNK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 08:13:10 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 67640160062
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 14:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1610889132; bh=D2+fQr6gZuKqJCs8YmGcsqMjksO4LecMV0l2lgb7Voc=;
        h=Date:From:To:Cc:Subject:From;
        b=HDA6cdxBrp8lqpV3OlG7LZdiA5Hgpw0HWHoeSdGIIYFQaKJ6E8eEAKnOdCpJJ4c4i
         lSHI9ZEb5G8/gjfKA7T9HhAgz6fRVPde9H8GZh61AaqIxEbdD3IKFpJ/4J9X4apZuf
         4hGlpC1c6SZH0dOZ9wsH0b6hJXUFzfjMc+PuA+ekrSWtytptpgwH+QUlqUNZivN1ZG
         lTLi9NrSDSTOMWhIMwj37/eujaNlwB7Nc8P10slR8MozEsZpiYiAvMVv5OiuAB2d+H
         jdWNRiIq1uRNPApTNfhXYjYeET8RjitzUgSMyhgOpoevnfTpYFQyK8Tul8IGd5yVrU
         mFdxCOLX+cWqw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DJb163B7Gz6tmM;
        Sun, 17 Jan 2021 14:12:10 +0100 (CET)
Date:   Sun, 17 Jan 2021 14:12:09 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@vanguardiasur.com.ar,
        heiko@sntech.de
Subject: RkISP1 simulataneously streaming with two cameras
Message-ID: <20210117131209.4m2vqht4mflci7hy@basti-TUXEDO-Book-XA1510>
Reply-To: Sebastian Fricke <sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I am currently trying to figure out how to configure my NanoPC-T4 for
streaming with two cameras at the same time. The cameras are the CAM1320
(OV13850) and the MCAM40(OV4689), I have ported the drivers from the
downstream BSP Kernel to the current 5.11 rc1 kernel.
My current attempt is to enable the second instance of the RkISP1, the
mipi_dphy_tx1rx1 and setup the OV13850 on i2c1 and the OV4689 on the
i2c2.
The patch that I apply in this case is the following:
https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/9a8e594a660d67f3790da32f3268bebd3d233526

Here is the dmesg ouput when I start the kernel with this patch:
```
[    7.021079] mc: Linux media interface: v0.10
...
[    7.084369] videodev: Linux video capture interface: v2.00
...
[    7.125911] ov4689 2-0036: driver version: 00.01.01
[    7.125939] ov4689 2-0036: could not get module information!
[    7.130037] ov4689 2-0036: Unexpected sensor id(000000), ret(-5)
...
[    7.143951] ov13850 1-0010: driver version: 00.01.01
[    7.143980] ov13850 1-0010: could not get module information!
[    7.149127] ov13850 1-0010: Detected OV00d850 sensor, REVISION 0xb1
...
[    7.259601] rkisp1 ff910000.isp0: Adding to iommu group 4
[    7.260911] rkisp1: registered rkisp1_mainpath as /dev/video1
[    7.261100] rkisp1: registered rkisp1_selfpath as /dev/video2
...
[    7.262628] rkisp1 ff910000.isp0: registered ep id 0 with 2 lanes
[    7.263666] rkvdec ff660000.video-codec: Adding to iommu group 1
[    7.265120] rkisp1 ff910000.isp0: Async subdev notifier completed
[    7.265458] rkisp1 ff920000.isp1: Adding to iommu group 5
[    7.266441] rkisp1: registered rkisp1_mainpath as /dev/video6
[    7.267380] rkisp1: registered rkisp1_selfpath as /dev/video7
[    7.267945] rkisp1 ff920000.isp1: registered ep id 0 with 2 lanes
[    7.267994] debugfs: Directory 'rkisp1' with parent '/' already present!
```

And here is the long version of the log with pinctrl and gpio debug
output. https://paste.debian.net/1181487/

These are the drivers that I use:
OV13850: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov13850.c
OV4689: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/dual_cam/drivers/media/i2c/ov4689.c

I have the following questions:
1. Within the mipi_dphy_tx1rx1, I chose the phy-cells value to be `<0>`, but I have to say I am not entirely sure about this value. My current research was within the Documentation/devicetree/bindings/phy folder where I was able to find:
> #phy-cells:	Number of cells in a PHY specifier;  The meaning of all
> those cells is defined by the binding for the phy node. The PHY
> provider can use the values in cells to find the appropriate PHY.
But as there is only a binding for the rx0, I felt like I had to guess.
Could someone give me a hint in the right direction?

2. Both ISP instances try to acquire the same endpoint 0, I found out
within the code at `rkisp1-dev.c:257`, that the rkisp1 driver tries to
get the endpoint from the firmware node at port 0. Looking deeper into
the code I can see that there are multiple debugging messages which
might be useful, how do I enable the debugging output for prints like:
`drivers/media/v4l2-core/v4l2-fwnode.c:419` ? I already enabled
CONFIG_DEBUG_KERNEL & CONFIG_DEBUG_MISC & CONFIG_DYNAMIC_DEBUG

3. Is it correct when two camera sensors try to multiplex the
cif-clkout-a pinctrl? I have taken this from the friendlyElec fork of
the rockchip BSP downstream kernel. https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/arch/arm64/boot/dts/rockchip/rk3399-nanopi4-rkisp1.dtsi#L30
I have been testing on of their official images and there the dual mipi setup works.
So, I currently ask myself has something significantly changed in this
part of the code that I am unaware of?
And also I have a really hard time figuring out, where the cif-clkout-a
pinctrl is actually used.

4. Has anyone been able to set up the dual cam setup on the rkisp1 on an
upstream kernel? If yes how did you do it?

Greetings,
Sebastian

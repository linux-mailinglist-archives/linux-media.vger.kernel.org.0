Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754926541D7
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiLVN2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 08:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiLVN2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 08:28:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F25DEBD
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 05:28:34 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F560471;
        Thu, 22 Dec 2022 14:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671715712;
        bh=OP1J84PQuhFENSKhoftZNSgekyacRSVGy1u8cFbaba4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FAoHE9gHS+c6xGtfrCQBKC62L0MSovBYz7qDVDhKx22kYU8vQ2xVXiXhqe+zpe5Vp
         kOBNnNflkFKe1icnDpTtpLmAmoJ0uxWN5FE/pfM9xHQEjO/ztLPMzMBQz+MUphc0aZ
         qIJ/xL7bFj04ua8ebBVl44XrjkBcRu14uRwgdzOI=
Date:   Thu, 22 Dec 2022 14:28:28 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Aishwarya Kothari <aishwaryakothari75@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <20221222132828.pyfgjl57ntwfe4xl@uno.localdomain>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
 <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
 <20221207190529.tkphzyuf7w56t43g@uno.localdomain>
 <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Aishwarya

On Thu, Dec 22, 2022 at 02:19:21PM +0100, Aishwarya Kothari wrote:
> Hello,
>
> On 07.12.22 20:05, Jacopo Mondi wrote:
> > Hello Aishwarya,
> >
> > On Wed, Dec 07, 2022 at 08:44:13PM +0200, Laurent Pinchart wrote:
> > > Hi Aishwarya,
> > >
> > > (CC'ing Jacopo and Sakari)
> > >
> > > On Wed, Dec 07, 2022 at 12:14:29PM +0100, Aishwarya Kothari wrote:
> > > > Hi,
> > > >
> > > > I was trying ov5640 camera sensor with the mainline BSP 6.0.0-rc3 kernel
> > > > and it fails to works, while it works quiet well on v5.18. When I
> > > > bisect, it points out to this commit 1f391df4 (media: v4l2-async: Use
> > > > endpoints in __v4l2_async_nf_add_fwnode_remote()) by Laurent Pinchart
> > > > and this is what it says in the logs :
> > > >
> > > > [    4.291355] imx-ipuv3-csi imx-ipuv3-csi.0: Registered ipu1_csi0 capture as /dev/video0
> > > > [    4.305228] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpenc capture as /dev/video1
> > > > [    4.317974] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpvf capture as /dev/video2
> > > > [    4.331039] imx-ipuv3-csi imx-ipuv3-csi.1: Registered ipu1_csi1 capture as /dev/video3
> > > > [    4.344255] imx-ipuv3-csi imx-ipuv3-csi.4: Registered ipu2_csi0 capture as /dev/video4
> > > > [    4.356940] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
> > > > [    4.369322] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
> > > > [    4.382119] imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> > > > [    4.395455] imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to match on endpoints
> > > > [    4.414971] stmpe-adc stmpe-adc: DMA mask not set
> > > >
> > > > So, now when I try to revert the change done by this commit, it still
> > > > fails. I assume there are a lot more changes following the commit that
> > > > could lead to this failure. Below are the logs.
> > > > Is there a way to get it to work without reverting any changes? Or Is
> > > > there something I'm missing or have to do any changes in the
> > > > corresponding files to get it to work?
> > >
> > > The commit you reference wasn't meant to break anything, so there's
> > > clearly something I've overlooked. Jacopo, have you noticed anything
> > > similar when working on the ov5640 driver ?
> > >
> > > > TDX Wayland with XWayland Upstream 6.1.0-devel-20221109+build.104
> > > > (kirkstone) apalis-imx6-10774951 ttymxc0
> > > > Apalis-iMX6_Reference-Multimedia-Image-upstream
> > > >
> > > > apalis-imx6-10774951 login: root
> > > > root@apalis-imx6-10774951:~# cat ov5640.sh
> > > > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > > # Configure pads
> > > > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> > > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> > > > media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/1920x1080 field:none]"
> > > > root@apalis-imx6-10774951:~# sh ov5640.sh
> > > > root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3'
> > > > ! videoconvert ! waylandsink
> > > > [   56.031510] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > [   56.649032] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > >
> > > This surprises me. I would have expected an issue with commit
> > > 1f391df44607 ("media: v4l2-async: Use endpoints in
> > > __v4l2_async_nf_add_fwnode_remote()") to prevent the ov5640 from being
> > > detected at all. Could you double-check the bisection, to verify that
> > > commit 229fac6c44dc works and commit 1f391df44607 doesn't ? What
> > > difference does it make in the full kernel log ?
> > >
> Yes, the commit 229fac6c44dc works. This is the first commit 1f391df44607
> ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> that fails. The ov5640 driver is not detected and the /dev/media is not
> present.
>
> This is the difference in dmesg:
> --- dmesg_229fac6c44dc_nt	2022-12-22 13:37:31.901276466 +0100
> +++ dmesg_1f391df44607_nt	2022-12-21 11:27:08.374139972 +0100
> @@ -1,5 +1,5 @@
>  Booting Linux on physical CPU 0x0
> -Linux version 5.18.0-rc3-00051-g229fac6c44dc (aishwarya@aishwarya-nb)
> (arm-none-linux-gnueabihf-gcc (Arm GNU Toolchain 11.3.Rel1) 11.3.1 20220712,
> GNU ld (Arm GNU Toolchain 11.3.Rel1) 2.38.20220708) #28 SMP Wed Dec 21
> 11:13:19 CET 2022
> +Linux version 5.18.0-rc3-00052-g1f391df44607 (aishwarya@aishwarya-nb)
> (arm-none-linux-gnueabihf-gcc (Arm GNU Toolchain 11.3.Rel1) 11.3.1 20220712,
> GNU ld (Arm GNU Toolchain 11.3.Rel1) 2.38.20220708) #29 SMP Wed Dec 21
> 11:21:31 CET 2022
>  CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
>  CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>  OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation
> Board
> @@ -228,7 +228,7 @@
>  SPI driver ads7846 has no spi_device_id for ti,ads7845
>  SPI driver ads7846 has no spi_device_id for ti,ads7873
>  rtc-ds1307 0-0068: registered as rtc0
> -rtc-ds1307 0-0068: setting system clock to 2022-12-21T10:14:44 UTC
> (1671617684)
> +rtc-ds1307 0-0068: setting system clock to 2022-12-21T10:22:46 UTC
> (1671618166)
>  snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc1
>  i2c_dev: i2c /dev entries driver
>  Bluetooth: HCI UART driver ver 2.3
> @@ -269,6 +269,7 @@
>  imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
>  imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
>  imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> +imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to
> match on endpoints
>  sgtl5000 2-000a: sgtl5000 revision 0x11
>  random: crng init done
>  imx6q-pcie 1ffc000.pcie: Phy link never came up
> @@ -318,10 +319,12 @@
>  usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice=
> 5.18
>  usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>  usb usb1: Product: EHCI Host Controller
> -usb usb1: Manufacturer: Linux 5.18.0-rc3-00051-g229fac6c44dc ehci_hcd
> +usb usb1: Manufacturer: Linux 5.18.0-rc3-00052-g1f391df44607 ehci_hcd
>  usb usb1: SerialNumber: ci_hdrc.1
>  hub 1-0:1.0: USB hub found
>  hub 1-0:1.0: 1 port detected
> +video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver
> video-mux to match on endpoints
> +video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver
> video-mux to match on endpoints
>  imx_thermal 20c8000.anatop:tempmon: Extended Commercial CPU temperature
> grade - max:105C critical:100C passive:95C
>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW
>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW
> @@ -384,7 +387,7 @@
>  systemd[1]: Mounting Kernel Debug File System...
>  systemd[1]: Mounting Kernel Trace File System...
>  systemd[1]: Mounting Temporary Directory /tmp...
> -systemd[1]: Create List of Static Device Nodes was skipped because of a
> failed condition check (ConditionFileNotEmpty=/lib/modules/5.18.0-rc3-00051-g229fac6c44dc/modules.devname).
> +systemd[1]: Create List of Static Device Nodes was skipped because of a
> failed condition check (ConditionFileNotEmpty=/lib/modules/5.18.0-rc3-00052-g1f391df44607/modules.devname).
>  systemd[1]: Starting Load Kernel Module configfs...
>  systemd[1]: Starting Load Kernel Module drm...
>  systemd[1]: Starting Load Kernel Module fuse...
> @@ -413,7 +416,7 @@
>  systemd[1]: Starting Remount Root and Kernel File Systems...
>  systemd[1]: Started Journal Service.
>  EXT4-fs (mmcblk2p2): re-mounted. Quota mode: none.
> -systemd-journald[217]: Received client request to flush runtime journal.
> +systemd-journald[216]: Received client request to flush runtime journal.
>  evbug: Connected device: input0 (gpio-keys at gpio-keys/input0)
>  coda 2040000.vpu: Firmware code revision: 46076
>  coda 2040000.vpu: Initialized CODA960.
> @@ -426,19 +429,15 @@
>  ov5640 1-003c: supply DOVDD not found, using dummy regulator
>  ov5640 1-003c: supply AVDD not found, using dummy regulator
>  ov5640 1-003c: supply DVDD not found, using dummy regulator
> -imx-media: Registered ipu_ic_pp csc/scaler as /dev/video12
> +ov5640 1-003c: Consider updating driver ov5640 to match on endpoints
>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW
>  using random self ethernet address
>  using random host ethernet address
> -usb0: HOST MAC 26:b4:a4:fa:fe:15
> -usb0: MAC 8e:e0:94:47:d3:6a
> +usb0: HOST MAC 26:4d:ee:18:a3:b6
> +usb0: MAC ce:ea:96:16:e2:a9
>  Micrel KSZ9031 Gigabit PHY 2188000.ethernet-1:07: attached PHY driver
> (mii_bus:phy_addr=2188000.ethernet-1:07, irq=123)
> -systemd-journald[217]: Data hash table of
> /run/log/journal/6126bf14c3ea4128a506478d46ca2b38/system.journal has a fill
> level at 75.2 (2737 of 3640 items, 2097152 file size, 766 bytes per hash
> table item), suggesting rotation.
> -systemd-journald[217]:
> /run/log/journal/6126bf14c3ea4128a506478d46ca2b38/system.journal: Journal
> header limits reached or header out-of-date, rotating.
> +systemd-journald[216]: Data hash table of
> /run/log/journal/6126bf14c3ea4128a506478d46ca2b38/system.journal has a fill
> level at 75.1 (2733 of 3640 items, 2097152 file size, 767 bytes per hash
> table item), suggesting rotation.
> +systemd-journald[216]:
> /run/log/journal/6126bf14c3ea4128a506478d46ca2b38/system.journal: Journal
> header limits reached or header out-of-date, rotating.
>  IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
>  fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
>  IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> -cfg80211: failed to load regulatory.db
>
> >
> > If my understanding is correct, 1f391df44607 is unrelated as Aishwarya
> > reports " So, now when I try to revert the change done by this commit, it still
> > fails".
> >
> > There is a long list of changes that went in with recent kernels for
> > ov5640 but I'm afraid I'm now sure how many of them have landed on
> > your BSP. Try to diff with a recent mainline, and then maybe bisect from
> > there ?
> >
> We use the the recent mainline kernel without any changes.
> It stops working at 1f391df44607. With 1f391df44607 reverted, bisecting
> reveals that a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats")
> introduces another regression. I'm still investigating what could be the
> problem. The format used below, it no longer being recognised:
> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
>

That should be easy. Just lookg at the a89f14bbcfa5 commit and you'll
see that the 2X8 media bus variants are not supported anymore in MIPI
mode. Just use UYVY1X16 everywhere and you should be good.

Thanks
  j

> > > > Setting pipeline to PAUSED ...
> > > > [   57.082630] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > Pipeline is live and does not need PREROLL ...
> > > > Pipeline is PREROLLED ...
> > > > Setting pipeline to PLAYING ...
> > > > New clock: GstSystemClock
> > > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed to allocate required memory.
> > > > Additional debug info:
> > > > ../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2src.c(759):
> > > > gst_v4l2src_decide_allocation ():
> > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > > Buffer pool activation failed
> > > > Execution ended after 0:00:00.119459642
> > > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal data stream error.
> > > > Setting pipeline to NULL ...
> > > > Additional debug info:
> > > > ../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > > streaming stopped, reason not-negotiated (-4)
> > > > Freeing pipeline ...
> > > > root@apalis-imx6-10774951:~# v4l2-ctl --device /dev/video3 --stream-mmap
> > > > --stream-to=x.raw --stream-count=1
> > > > [ 1124.339793] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > >             VIDIOC_STREAMON returned -1 (Broken pipe)
> > > >> --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> I'm grateful for any hints or comments?
> Regards,
> Aishwarya Kothari
>

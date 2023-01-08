Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94B646613D8
	for <lists+linux-media@lfdr.de>; Sun,  8 Jan 2023 08:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjAHHLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Jan 2023 02:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjAHHLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Jan 2023 02:11:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CEB1741A
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 23:11:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 401651254;
        Sun,  8 Jan 2023 08:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673161858;
        bh=mOk90jlNrO9Z1CwKpELsMMslWtke8O9MkSv4Y9SzUMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vV00vRlnBrP23NI3MnIPt12kjASwmFFRDJYERjbFsvC/QNO19nlEv2Ljlj7Fs24Z/
         akDtq+plPBQvnUGZa2R/AuG4ax8ICKbGgY0Dt6q1Yqt9/JCPTjUEFxRwNh1Z7DfrOO
         9sW5HW7Z3KyyM5RP6HNEJLdjeC3yanWEtkqQwdwE=
Date:   Sun, 8 Jan 2023 09:10:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Aishwarya Kothari <aishwaryakothari75@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <Y7psfj+J/cF0n+4W@pendragon.ideasonboard.com>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
 <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
 <20221207190529.tkphzyuf7w56t43g@uno.localdomain>
 <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
 <20221222132828.pyfgjl57ntwfe4xl@uno.localdomain>
 <0d9748b7-457f-6274-bf3f-3f37944decf4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d9748b7-457f-6274-bf3f-3f37944decf4@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Aishwarya

On Thu, Jan 05, 2023 at 03:35:42PM +0100, Aishwarya Kothari wrote:
> On 22.12.22 14:28, Jacopo Mondi wrote:
> > On Thu, Dec 22, 2022 at 02:19:21PM +0100, Aishwarya Kothari wrote:
> >> On 07.12.22 20:05, Jacopo Mondi wrote:
> >>> On Wed, Dec 07, 2022 at 08:44:13PM +0200, Laurent Pinchart wrote:
> >>>> On Wed, Dec 07, 2022 at 12:14:29PM +0100, Aishwarya Kothari wrote:
> >>>>> Hi,
> >>>>>
> >>>>> I was trying ov5640 camera sensor with the mainline BSP 6.0.0-rc3 kernel
> >>>>> and it fails to works, while it works quiet well on v5.18. When I
> >>>>> bisect, it points out to this commit 1f391df4 (media: v4l2-async: Use
> >>>>> endpoints in __v4l2_async_nf_add_fwnode_remote()) by Laurent Pinchart
> >>>>> and this is what it says in the logs :
> >>>>>
> >>>>> [    4.291355] imx-ipuv3-csi imx-ipuv3-csi.0: Registered ipu1_csi0 capture as /dev/video0
> >>>>> [    4.305228] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpenc capture as /dev/video1
> >>>>> [    4.317974] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpvf capture as /dev/video2
> >>>>> [    4.331039] imx-ipuv3-csi imx-ipuv3-csi.1: Registered ipu1_csi1 capture as /dev/video3
> >>>>> [    4.344255] imx-ipuv3-csi imx-ipuv3-csi.4: Registered ipu2_csi0 capture as /dev/video4
> >>>>> [    4.356940] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
> >>>>> [    4.369322] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
> >>>>> [    4.382119] imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> >>>>> [    4.395455] imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to match on endpoints
> >>>>> [    4.414971] stmpe-adc stmpe-adc: DMA mask not set
> >>>>>
> >>>>> So, now when I try to revert the change done by this commit, it still
> >>>>> fails. I assume there are a lot more changes following the commit that
> >>>>> could lead to this failure. Below are the logs.
> >>>>> Is there a way to get it to work without reverting any changes? Or Is
> >>>>> there something I'm missing or have to do any changes in the
> >>>>> corresponding files to get it to work?
> >>>>
> >>>> The commit you reference wasn't meant to break anything, so there's
> >>>> clearly something I've overlooked. Jacopo, have you noticed anything
> >>>> similar when working on the ov5640 driver ?
> >>>>
> >>>>> TDX Wayland with XWayland Upstream 6.1.0-devel-20221109+build.104
> >>>>> (kirkstone) apalis-imx6-10774951 ttymxc0
> >>>>> Apalis-iMX6_Reference-Multimedia-Image-upstream
> >>>>>
> >>>>> apalis-imx6-10774951 login: root
> >>>>> root@apalis-imx6-10774951:~# cat ov5640.sh
> >>>>> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> >>>>> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> >>>>> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> >>>>> # Configure pads
> >>>>> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> >>>>> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> >>>>> media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/1920x1080 field:none]"
> >>>>> root@apalis-imx6-10774951:~# sh ov5640.sh
> >>>>> root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3'
> >>>>> ! videoconvert ! waylandsink
> >>>>> [   56.031510] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> >>>>> [   56.649032] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> >>>>
> >>>> This surprises me. I would have expected an issue with commit
> >>>> 1f391df44607 ("media: v4l2-async: Use endpoints in
> >>>> __v4l2_async_nf_add_fwnode_remote()") to prevent the ov5640 from being
> >>>> detected at all. Could you double-check the bisection, to verify that
> >>>> commit 229fac6c44dc works and commit 1f391df44607 doesn't ? What
> >>>> difference does it make in the full kernel log ?
> >>
> >> Yes, the commit 229fac6c44dc works. This is the first commit 1f391df44607
> >> ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> >> that fails. The ov5640 driver is not detected and the /dev/media is not
> >> present.
> >>
> >> This is the difference in dmesg:
> >> --- dmesg_229fac6c44dc_nt	2022-12-22 13:37:31.901276466 +0100
> >> +++ dmesg_1f391df44607_nt	2022-12-21 11:27:08.374139972 +0100

[snip]

> >> @@ -269,6 +269,7 @@
> >>  imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
> >>  imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
> >>  imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> >> +imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to match on endpoints
> >>  sgtl5000 2-000a: sgtl5000 revision 0x11
> >>  random: crng init done
> >>  imx6q-pcie 1ffc000.pcie: Phy link never came up
> >> @@ -318,10 +319,12 @@
> >>  usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice=5.18
> >>  usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> >>  usb usb1: Product: EHCI Host Controller
> >> -usb usb1: Manufacturer: Linux 5.18.0-rc3-00051-g229fac6c44dc ehci_hcd
> >> +usb usb1: Manufacturer: Linux 5.18.0-rc3-00052-g1f391df44607 ehci_hcd
> >>  usb usb1: SerialNumber: ci_hdrc.1
> >>  hub 1-0:1.0: USB hub found
> >>  hub 1-0:1.0: 1 port detected
> >> +video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver video-mux to match on endpoints
> >> +video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver video-mux to match on endpoints
> >>  imx_thermal 20c8000.anatop:tempmon: Extended Commercial CPU temperature grade - max:105C critical:100C passive:95C
> >>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW
> >>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW

[snip]

> >> @@ -426,19 +429,15 @@
> >>  ov5640 1-003c: supply DOVDD not found, using dummy regulator
> >>  ov5640 1-003c: supply AVDD not found, using dummy regulator
> >>  ov5640 1-003c: supply DVDD not found, using dummy regulator
> >> -imx-media: Registered ipu_ic_pp csc/scaler as /dev/video12
> >> +ov5640 1-003c: Consider updating driver ov5640 to match on endpoints
> >>  fsl-ssi-dai 2028000.ssi: No cache defaults, reading back from HW
> >>  using random self ethernet address
> >>  using random host ethernet address

[snip]

> >>  IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
> >>  fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> >>  IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> >> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> >> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> >> -ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> >> -cfg80211: failed to load regulatory.db
> 
> Well, the commit 1f391df4 (media: v4l2-async: Use endpoints in 
> __v4l2_async_nf_add_fwnode_remote()) is actually the one introducing 
> regression. As mentioned before, /dev/media0 is not created.

I'll try to see if I can reproduce this. I don't have a board with an
i.MX6 SoC, but it may be possible to reproduce the bug with different
drivers.

> >>> If my understanding is correct, 1f391df44607 is unrelated as Aishwarya
> >>> reports " So, now when I try to revert the change done by this commit, it still
> >>> fails".
> >>>
> >>> There is a long list of changes that went in with recent kernels for
> >>> ov5640 but I'm afraid I'm now sure how many of them have landed on
> >>> your BSP. Try to diff with a recent mainline, and then maybe bisect from
> >>> there ?
> >>
> >> We use the the recent mainline kernel without any changes.
> >> It stops working at 1f391df44607. With 1f391df44607 reverted, bisecting
> >> reveals that a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats")
> >> introduces another regression. I'm still investigating what could be the
> >> problem. The format used below, it no longer being recognised:
> >> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> >> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> > 
> > That should be easy. Just lookg at the a89f14bbcfa5 commit and you'll
> > see that the 2X8 media bus variants are not supported anymore in MIPI
> > mode. Just use UYVY1X16 everywhere and you should be good.
> 
> Thanks
> Reverting the commit 1f391df4 (media: v4l2-async: Use endpoints in 
> __v4l2_async_nf_add_fwnode_remote()) and setting the format as below 
> works fine when tested on v6.0 and v6.1
> root@apalis-imx6-10774951:~# cat ov5640.sh
> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> # Configure pads
> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"

[snip]

-- 
Regards,

Laurent Pinchart

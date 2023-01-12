Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB7F666F49
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 11:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjALKPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 05:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjALKN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 05:13:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C8AE25
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 02:12:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63521505;
        Thu, 12 Jan 2023 11:12:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673518324;
        bh=KtLSDjj1KfJzrfSHpmmzK1bRPcyETc+S+AJAMLA4hJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sUZ0FPmAsTTy3sF/U9O1/ULKRT00v6yo8b5T0sx8NSQzycOG0F32kdlOWY/UMTt/i
         a0IcanzRgasn1r16CzfPd3ymN6dfpnC02MWO+oHAlq1bmbXCHthWeZ0GzuSh7Mfkwr
         fWX3O5Yizuv6yqAjtqzzfUjG8NTtd57TLkg+RFHE=
Date:   Thu, 12 Jan 2023 12:12:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Aishwarya Kothari <aishwaryakothari75@gmail.com>,
        linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <Y7/c9IVUkC9Mbb7/@pendragon.ideasonboard.com>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
 <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
 <20221207190529.tkphzyuf7w56t43g@uno.localdomain>
 <1f316bda-5bc7-009c-ee22-a1e72653d58c@gmail.com>
 <20221222132828.pyfgjl57ntwfe4xl@uno.localdomain>
 <0d9748b7-457f-6274-bf3f-3f37944decf4@gmail.com>
 <20230111115038.ncu2kt3jnnn7xotv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111115038.ncu2kt3jnnn7xotv@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Jan 11, 2023 at 12:50:38PM +0100, Jacopo Mondi wrote:
> On Thu, Jan 05, 2023 at 03:35:42PM +0100, Aishwarya Kothari wrote:
> > On 22.12.22 14:28, Jacopo Mondi wrote:
> > > On Thu, Dec 22, 2022 at 02:19:21PM +0100, Aishwarya Kothari wrote:
> > > > On 07.12.22 20:05, Jacopo Mondi wrote:
> > > > > On Wed, Dec 07, 2022 at 08:44:13PM +0200, Laurent Pinchart wrote:
> > > > > > On Wed, Dec 07, 2022 at 12:14:29PM +0100, Aishwarya Kothari wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I was trying ov5640 camera sensor with the mainline BSP 6.0.0-rc3 kernel
> > > > > > > and it fails to works, while it works quiet well on v5.18. When I
> > > > > > > bisect, it points out to this commit 1f391df4 (media: v4l2-async: Use
> > > > > > > endpoints in __v4l2_async_nf_add_fwnode_remote()) by Laurent Pinchart
> > > > > > > and this is what it says in the logs :
> > > > > > >
> > > > > > > [    4.291355] imx-ipuv3-csi imx-ipuv3-csi.0: Registered ipu1_csi0 capture as /dev/video0
> > > > > > > [    4.305228] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpenc capture as /dev/video1
> > > > > > > [    4.317974] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpvf capture as /dev/video2
> > > > > > > [    4.331039] imx-ipuv3-csi imx-ipuv3-csi.1: Registered ipu1_csi1 capture as /dev/video3
> > > > > > > [    4.344255] imx-ipuv3-csi imx-ipuv3-csi.4: Registered ipu2_csi0 capture as /dev/video4
> > > > > > > [    4.356940] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
> > > > > > > [    4.369322] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
> > > > > > > [    4.382119] imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> > > > > > > [    4.395455] imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to match on endpoints
> > > > > > > [    4.414971] stmpe-adc stmpe-adc: DMA mask not set
> > > > > > >
> > > > > > > So, now when I try to revert the change done by this commit, it still
> > > > > > > fails. I assume there are a lot more changes following the commit that
> > > > > > > could lead to this failure. Below are the logs.
> > > > > > > Is there a way to get it to work without reverting any changes? Or Is
> > > > > > > there something I'm missing or have to do any changes in the
> > > > > > > corresponding files to get it to work?
> > > > > >
> > > > > > The commit you reference wasn't meant to break anything, so there's
> > > > > > clearly something I've overlooked. Jacopo, have you noticed anything
> > > > > > similar when working on the ov5640 driver ?
> > > > > >
> > > > > > > TDX Wayland with XWayland Upstream 6.1.0-devel-20221109+build.104
> > > > > > > (kirkstone) apalis-imx6-10774951 ttymxc0
> > > > > > > Apalis-iMX6_Reference-Multimedia-Image-upstream
> > > > > > >
> > > > > > > apalis-imx6-10774951 login: root
> > > > > > > root@apalis-imx6-10774951:~# cat ov5640.sh
> > > > > > > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > > > > > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > > > > > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > > > > > # Configure pads
> > > > > > > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> > > > > > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> > > > > > > media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/1920x1080 field:none]"
> > > > > > > root@apalis-imx6-10774951:~# sh ov5640.sh
> > > > > > > root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3'
> > > > > > > ! videoconvert ! waylandsink
> > > > > > > [   56.031510] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > > > > [   56.649032] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > > >
> > > > > > This surprises me. I would have expected an issue with commit
> > > > > > 1f391df44607 ("media: v4l2-async: Use endpoints in
> > > > > > __v4l2_async_nf_add_fwnode_remote()") to prevent the ov5640 from being
> > > > > > detected at all. Could you double-check the bisection, to verify that
> > > > > > commit 229fac6c44dc works and commit 1f391df44607 doesn't ? What
> > > > > > difference does it make in the full kernel log ?
> > > >
> > > > Yes, the commit 229fac6c44dc works. This is the first commit 1f391df44607
> > > > ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > > > that fails. The ov5640 driver is not detected and the /dev/media is not
> > > > present.
> > > >
> > > > This is the difference in dmesg:

[snip]

> > Well, the commit 1f391df4 (media: v4l2-async: Use endpoints in
> > __v4l2_async_nf_add_fwnode_remote()) is actually the one introducing
> > regression. As mentioned before, /dev/media0 is not created.
> >
> > > > > If my understanding is correct, 1f391df44607 is unrelated as Aishwarya
> > > > > reports " So, now when I try to revert the change done by this commit, it still
> > > > > fails".
> > > > >
> > > > > There is a long list of changes that went in with recent kernels for
> > > > > ov5640 but I'm afraid I'm now sure how many of them have landed on
> > > > > your BSP. Try to diff with a recent mainline, and then maybe bisect from
> > > > > there ?
> > > >
> > > > We use the the recent mainline kernel without any changes.
> > > > It stops working at 1f391df44607. With 1f391df44607 reverted, bisecting
> > > > reveals that a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats")
> > > > introduces another regression. I'm still investigating what could be the
> > > > problem. The format used below, it no longer being recognised:
> > > > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> > > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> > >
> > > That should be easy. Just lookg at the a89f14bbcfa5 commit and you'll
> > > see that the 2X8 media bus variants are not supported anymore in MIPI
> > > mode. Just use UYVY1X16 everywhere and you should be good.
> > >
> >
> > Thanks
> > Reverting the commit 1f391df4 (media: v4l2-async: Use endpoints in
> > __v4l2_async_nf_add_fwnode_remote()) and setting the format as below works
> > fine when tested on v6.0 and v6.1
> > root@apalis-imx6-10774951:~# cat ov5640.sh
> > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > # Configure pads
> > media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> 
> I reproduced the issue by booting the most recent media tree master on
> an i.MX6Q board with an ov5640 sensor connected.
> 
> Looking at the list of pending async subdevices at the end of the boot
> sequence (thanks Laurent for letting me know such sysfs attribute
> existed :)
> 
> # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> ipu2_csi1_mux:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@4/endpoint
> ipu1_csi0_mux:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@1/endpoint
> imx6-mipi-csi2:
> ipu2_csi1:
> ipu2_csi0:
> ipu1_csi1:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@2/endpoint
> ipu1_csi0:
> imx-media:
> ov5640 2-003c:
> 
> it is clear that there are unsatisfied dependencies on subdevices that
> should be registered by the mipi-csi2 driver.
> 
> The mipi-csi2 DTS layout is the following
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/imx6q.dtsi#L486
> with 1 source port connected to the sensor and 4 sink ports with an
> endpoint each connected to the 2 muxes and the 2 IPU[1,2] CSI[0,1] (see
> "Figure 19-1. CSI2IPU gasket connectivity" of the IMX6DQRM TRM).
> 
> The CSI-2 driver registers one subdevice only
> https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx6-mipi-csi2.c#L629
> and with the logic implemented in v4l2_async for heterogeneous
> matching
> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L79
> the first driver that probes and that searches from an endpoint in
> the mipi-csi2 device node gets satisfied while the other 3 will be
> left pending. That's why you see "ipu2_csi0:" above having no pending
> subdevs, while "ipu1_csi1:", "ipu1_csi0_mux:" and "ipu2_csi1_mux:"
> have pending subdevices.
> 
> Before commit 1f391df4 (media: v4l2-async: Use endpoints in
> __v4l2_async_nf_add_fwnode_remote())" all the notifiers in ipu1_csi1,
> ipu1_csi0_mux, ipu2_csi0 and ipu2_csi1_mux pointed to the same device
> node "imx6-mipi-csi2". In order to register multiple notifiers with
> an asd that point the same device node you can see that both the
> imx-media-csi and video-mux implement a workaround in the form of:
> 
> 		asd = v4l2_async_nf_add_fwnode_remote(&vmux->notifier, ep,
> 						      struct v4l2_async_subdev);
> 
> 		fwnode_handle_put(ep);
> 
> 		if (IS_ERR(asd)) {
> 			ret = PTR_ERR(asd);
> 			/* OK if asd already exists */
> 			if (ret != -EEXIST)
> 				return ret;
> 		}
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/imx/imx-media-csi.c#L1925
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/video-mux.c#L382
> 
> as registering multiple asd with on the same fwnode fails when adding
> the asd at:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L459
> (thanks again Laurent for spotting this 'workaround')
> 
> This can also be seen in the kernel logs when running with 1f391df4
> reverted and debug enabled on v4l2-async:
> 
> [    3.735368] (NULL device *): subdev descriptor already listed in this or other notifiers
> [    4.242167] (NULL device *): subdev descriptor already listed in this or other notifiers
> [    4.245655] (NULL device *): subdev descriptor already listed in this or other notifiers
> 
> The end result is that a single notifier that points to the mipi_csi2
> device node is registered instead of 4 notifiers as it happens when
> matching on endpoints. When the single notifier binds it registers
> links for all its sink pads (see the _bound callbacks in imx-media-csi
> and video-mux that call v4l2_create_fwnode_links() and
> v4l2_create_fwnode_links_to_pad() respectively) and you have a working
> media-device. Fragile at best as a design, but that's what we'll have
> to live with I'm afraid.
> 
> Now, how to fix this. I tried to think of a way to let the remote
> subdev decide if it has to be matched on endpoints or device node so
> that the decision is up to the mipi-csi2 driver. The alternative would
> be to manually add to the notifier an asd that points to the device
> node instead of using v4l2_async_nf_add_fwnode_remote(). This would be
> fine for the imx-mipi-csi component, as it is always paired the
> mipi-csi2 device so it can safely assume the remote has to be matched
> on device node.  However the video-mux would have to be modified in
> the same way, and as it is a generic component we cannot make any
> assumption on the remote there...
> 
> Any ideas ?

Not any easy one :-S

The video-mux messes it up, as it's the only component not part of the
IPU, so we can't modify it with any hardcoded assumption regarding
device vs. endpoint matching or introduce any hack specific to this
situation. It really worked by chance before.

One option would be to add support for registering a subdev to the
v4l2-async framework with multiple endpoint nodes, but I'm scared it
would require lots of changes, and lots of work. I haven't looked at
what unexpected consequences this would cause. Sakari, what do you think
?

Another option would be to replace the video-mux by an ad-hoc component
specific to the IPU, but I don't think that's possible without DT
changes. It seems that a standard video-mux driver was a bad idea after
all :-S

> > > > > > > Setting pipeline to PAUSED ...
> > > > > > > [   57.082630] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > > > > Pipeline is live and does not need PREROLL ...
> > > > > > > Pipeline is PREROLLED ...
> > > > > > > Setting pipeline to PLAYING ...
> > > > > > > New clock: GstSystemClock
> > > > > > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed to allocate required memory.
> > > > > > > Additional debug info:
> > > > > > > ../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2src.c(759):
> > > > > > > gst_v4l2src_decide_allocation ():
> > > > > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > > > > > Buffer pool activation failed
> > > > > > > Execution ended after 0:00:00.119459642
> > > > > > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal data stream error.
> > > > > > > Setting pipeline to NULL ...
> > > > > > > Additional debug info:
> > > > > > > ../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > > > > > streaming stopped, reason not-negotiated (-4)
> > > > > > > Freeing pipeline ...
> > > > > > > root@apalis-imx6-10774951:~# v4l2-ctl --device /dev/video3 --stream-mmap
> > > > > > > --stream-to=x.raw --stream-count=1
> > > > > > > [ 1124.339793] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> > > > > > >             VIDIOC_STREAMON returned -1 (Broken pipe)

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A5F64613F
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 19:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLGSoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 13:44:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLGSoT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 13:44:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283DF4FFA6
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 10:44:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53CB387B;
        Wed,  7 Dec 2022 19:44:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670438656;
        bh=zOaaUgdeCKKbwXeyrrF98ddt7VYQDDt5kLaJrt/Da3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VngK9nL6fpRhXAzoofSvHhmu2lLBbH48cdENmjBD/mdSwyGpcq+TRfo+A4EXmNJJD
         H0xrAnIePWeXBOOaRYXLxQoPkBfVgXxHudT/IjNLcBANgD9VyMc2L3V5ys1/AoqK6i
         JFPjmI6YtnYKpOqZ+/qH29BmdcICxX+5ZI0KAPxQ=
Date:   Wed, 7 Dec 2022 20:44:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Aishwarya Kothari <aishwaryakothari47@gmail.com>
Cc:     linux-media@vger.kernel.org, francesco.dolcini@toradex.com,
        marcel.ziswiler@toradex.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Issue with ov5640 camera sensor on apalis imx6
Message-ID: <Y5De/R956xERjjP/@pendragon.ideasonboard.com>
References: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aishwarya,

(CC'ing Jacopo and Sakari)

On Wed, Dec 07, 2022 at 12:14:29PM +0100, Aishwarya Kothari wrote:
> Hi,
> 
> I was trying ov5640 camera sensor with the mainline BSP 6.0.0-rc3 kernel 
> and it fails to works, while it works quiet well on v5.18. When I 
> bisect, it points out to this commit 1f391df4 (media: v4l2-async: Use 
> endpoints in __v4l2_async_nf_add_fwnode_remote()) by Laurent Pinchart 
> and this is what it says in the logs :
> 
> [    4.291355] imx-ipuv3-csi imx-ipuv3-csi.0: Registered ipu1_csi0 capture as /dev/video0
> [    4.305228] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpenc capture as /dev/video1
> [    4.317974] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpvf capture as /dev/video2
> [    4.331039] imx-ipuv3-csi imx-ipuv3-csi.1: Registered ipu1_csi1 capture as /dev/video3
> [    4.344255] imx-ipuv3-csi imx-ipuv3-csi.4: Registered ipu2_csi0 capture as /dev/video4
> [    4.356940] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture as /dev/video5
> [    4.369322] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture as /dev/video6
> [    4.382119] imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 capture as /dev/video7
> [    4.395455] imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to match on endpoints
> [    4.414971] stmpe-adc stmpe-adc: DMA mask not set
> 
> So, now when I try to revert the change done by this commit, it still 
> fails. I assume there are a lot more changes following the commit that 
> could lead to this failure. Below are the logs.
> Is there a way to get it to work without reverting any changes? Or Is 
> there something I'm missing or have to do any changes in the 
> corresponding files to get it to work?

The commit you reference wasn't meant to break anything, so there's
clearly something I've overlooked. Jacopo, have you noticed anything
similar when working on the ov5640 driver ?

> TDX Wayland with XWayland Upstream 6.1.0-devel-20221109+build.104 
> (kirkstone) apalis-imx6-10774951 ttymxc0
> Apalis-iMX6_Reference-Multimedia-Image-upstream
> 
> apalis-imx6-10774951 login: root
> root@apalis-imx6-10774951:~# cat ov5640.sh
> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> # Configure pads
> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
> media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/1920x1080 field:none]"
> root@apalis-imx6-10774951:~# sh ov5640.sh
> root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3' 
> ! videoconvert ! waylandsink
> [   56.031510] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> [   56.649032] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2

This surprises me. I would have expected an issue with commit
1f391df44607 ("media: v4l2-async: Use endpoints in
__v4l2_async_nf_add_fwnode_remote()") to prevent the ov5640 from being
detected at all. Could you double-check the bisection, to verify that
commit 229fac6c44dc works and commit 1f391df44607 doesn't ? What
difference does it make in the full kernel log ?

> Setting pipeline to PAUSED ...
> [   57.082630] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed to allocate required memory.
> Additional debug info:
> ../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2src.c(759): 
> gst_v4l2src_decide_allocation (): 
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.119459642
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal data stream error.
> Setting pipeline to NULL ...
> Additional debug info:
> ../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> Freeing pipeline ...
> root@apalis-imx6-10774951:~# v4l2-ctl --device /dev/video3 --stream-mmap 
> --stream-to=x.raw --stream-count=1
> [ 1124.339793] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
>             VIDIOC_STREAMON returned -1 (Broken pipe)

-- 
Regards,

Laurent Pinchart

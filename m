Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF733EE35
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCQKUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbhCQKTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:19:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E54C06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 03:19:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 144B93E7;
        Wed, 17 Mar 2021 11:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615976383;
        bh=neJpTl06g2Q8O9IoBnBxuAYUO5py0kIDnr1owmxq0+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGOUE31aqON6KjrRiCf0vB7bnCtZ3Ve+mCwaE/xZH7v0OCYd+fl1W7mRi0y7I5Ccb
         9JDiddkYz+5ercqCEsUeSNJoPSqDpwgwY3toMCivK2EuZRhhbYyQQCMJFjG+qr6cBY
         MiA8S2B5P5ntrjnwyVuSLfV6Q7zqupeOJCbqS/js=
Date:   Wed, 17 Mar 2021 12:19:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com
Subject: Re: [PATCH] imx7-media-csi: csi2 only
Message-ID: <YFHXm4vnyJ3SKEB8@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210316115635.4096574-1-martin.kepplinger@puri.sm>
 <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
 <9079ec9d39d48acbc3630db079b92dc223d6f1f4.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9079ec9d39d48acbc3630db079b92dc223d6f1f4.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Mar 17, 2021 at 11:08:57AM +0100, Martin Kepplinger wrote:
> Am Dienstag, dem 16.03.2021 um 20:05 +0200 schrieb Laurent Pinchart:
> > On Tue, Mar 16, 2021 at 12:56:35PM +0100, Martin Kepplinger wrote:
> > > ---
> > > 
> > > hi Laurent,
> > > 
> > > thanks a lot for posting this series!
> > > 
> > > First: I only test imx7-media-csi (csi bridge) because I run it on imx8mq.
> > > overall, I'm very happy with all of this and I get the same image out
> > > of it as I get with the mx6s_capture nxp driver.
> > 
> > That's good news :-)
> > 
> > > one issue I have is with is_csi2, so I post this patch that I need in
> > > order to test. It's obviously no solution, just to describe the issue:
> > > 
> > > I'm not sure why but imx7_csi_pad_link_validate() isn't called in my case
> > > and is_csi2 doesn't get set, so I force it. Would it make sense to> make
> > > a dts property for this?
> > 
> > Some platforms support both parallel and CSI-2 inputs, so we can't
> > hardcode which one is used in DT. I'd advise trying to debug why the
> > function is never called in your case, it's meant to be called with the
> > following call stack
> > 
> > - imx7_csi_pad_link_validate() (through
> > v4l2_subdev_pad_ops.link_validate)
> > - v4l2_subdev_link_validate() (through
> > media_entity_operations.link_validate)
> > - __media_pipeline_start()
> > - imx_media_pipeline_set_stream()
> > - capture_start_streaming()
> > - ...
> 
> possible the 2 issues are related. I have to say that media-ctl (and
> the api) is kind of new to me and this is not strictly related to the
> patchset anymore. The patchset is certainly required for us to have.
> this is just me trying to test it properly...
> 
> 
> I tried to set what I know that my sensor driver sends to mipi:
> 
> media-ctl -V "'csi':0 [fmt:SBGGR10/640x480 colorspace:raw]"
> 
> 
> Device topology
> - entity 1: csi (2 pads, 1 link)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:SBGGR10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> 	pad1: Source
> 		[fmt:SBGGR10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: mxc-mipi-csi2.0 (0 pad, 0 link)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1

The sensor is missing from the media graph, so that's not very likely to
work :-) Has the sensor driver probed correctly ? Also, the
mxc-mipi-csi2.0 entity doesn't have pads, that's not right.

> now the mipi and camera drivers don't seem to be a "media" drivers, but
> is that strictly necessary?
>
> anyways, capture_start_streaming() calls capture_validate_fmt() which
> fails due to the colorspace 0 it finds:
> 
> [   77.754721] capture_start_streaming: starting
> [   77.759758] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt: capture_find_format err
> [   77.768150] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt: capture_find_format found colorspace 0x0 != 0x1
> [   77.778372] imx7-csi 30a90000.csi1_bridge: capture format not valid
> 
> > > The other thing is that
> > > v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=0
> > > doesn't call the sensor drivers' set_fmt() pad function. That means that
> > > only the one mode I hard-code as default will work. instead I just
> > > see this:
> > 
> > That's expected. With a driver based on the media controller API, you
> > have to configure the format on each subdev manually. You can use the
> > media-ctl utility for that. The video node is only used to control the
> > DMA engine, the kernel driver doesn't propagate the configuration to
> > subdevices.
> > 
> > > [  742.977677] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
> > > [  742.977702] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
> > > [  742.977709] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
> > > [  742.977714] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
> > > [  742.977720] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
> > > [  742.977985] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
> > > [  742.977992] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
> > > [  742.977997] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
> > > [  742.978002] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
> > > [  742.978008] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
> > > [  742.978025] mc: media_release: Media Release
> > > 
> > > Does anything come to your mind that would prevent the set_fmt call here?
> > > That's what the (nxp) mipi driver looks like I'm running here:
> > > https://source.puri.sm/martin.kepplinger/linux-next/-/blob/5.12-rc3/librem5__integration_byzantium/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c

-- 
Regards,

Laurent Pinchart

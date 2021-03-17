Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A0333EE1E
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhCQKJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:09:51 -0400
Received: from comms.puri.sm ([159.203.221.185]:43250 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229717AbhCQKJd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:09:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id B34FCDF73F;
        Wed, 17 Mar 2021 03:09:02 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VH9b-7_iegTu; Wed, 17 Mar 2021 03:09:01 -0700 (PDT)
Message-ID: <9079ec9d39d48acbc3630db079b92dc223d6f1f4.camel@puri.sm>
Subject: Re: [PATCH] imx7-media-csi: csi2 only
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com
Date:   Wed, 17 Mar 2021 11:08:57 +0100
In-Reply-To: <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
         <20210316115635.4096574-1-martin.kepplinger@puri.sm>
         <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, dem 16.03.2021 um 20:05 +0200 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Tue, Mar 16, 2021 at 12:56:35PM +0100, Martin Kepplinger wrote:
> > ---
> > 
> > hi Laurent,
> > 
> > thanks a lot for posting this series!
> > 
> > First: I only test imx7-media-csi (csi bridge) because I run it on
> > imx8mq.
> > overall, I'm very happy with all of this and I get the same image
> > out
> > of it as I get with the mx6s_capture nxp driver.
> 
> That's good news :-)
> 
> > one issue I have is with is_csi2, so I post this patch that I need
> > in
> > order to test. It's obviously no solution, just to describe the
> > issue:
> > 
> > I'm not sure why but imx7_csi_pad_link_validate() isn't called in
> > my case
> > and is_csi2 doesn't get set, so I force it. Would it make sense to
> > make
> > a dts property for this?
> 
> Some platforms support both parallel and CSI-2 inputs, so we can't
> hardcode which one is used in DT. I'd advise trying to debug why the
> function is never called in your case, it's meant to be called with
> the
> following call stack
> 
> - imx7_csi_pad_link_validate() (through
> v4l2_subdev_pad_ops.link_validate)
> - v4l2_subdev_link_validate() (through
> media_entity_operations.link_validate)
> - __media_pipeline_start()
> - imx_media_pipeline_set_stream()
> - capture_start_streaming()
> - ...

possible the 2 issues are related. I have to say that media-ctl (and
the api) is kind of new to me and this is not strictly related to the
patchset anymore. The patchset is certainly required for us to have.
this is just me trying to test it properly...


I tried to set what I know that my sensor driver sends to mipi:

media-ctl -V "'csi':0 [fmt:SBGGR10/640x480 colorspace:raw]"


Device topology
- entity 1: csi (2 pads, 1 link)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
xfer:none ycbcr:601 quantization:full-range]
	pad1: Source
		[fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
xfer:none ycbcr:601 quantization:full-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: mxc-mipi-csi2.0 (0 pad, 0 link)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1


now the mipi and camera drivers don't seem to be a "media" drivers, but
is that strictly necessary?

anyways, capture_start_streaming() calls capture_validate_fmt() which
fails due to the colorspace 0 it finds:

[   77.754721] capture_start_streaming: starting
[   77.759758] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt:
capture_find_format err
[   77.768150] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt:
capture_find_format found colorspace 0x0 != 0x1
[   77.778372] imx7-csi 30a90000.csi1_bridge: capture format not valid

thanks so far,
                                   martin

> 
> > The other thing is that
> > v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=0
> > doesn't call the sensor drivers' set_fmt() pad function. That means
> > that
> > only the one mode I hard-code as default will work. instead I just
> > see this:
> 
> That's expected. With a driver based on the media controller API, you
> have to configure the format on each subdev manually. You can use the
> media-ctl utility for that. The video node is only used to control
> the
> DMA engine, the kernel driver doesn't propagate the configuration to
> subdevices.
> 
> > [  742.977677] imx7-csi 30a90000.csi1_bridge: begin graph walk at
> > 'csi capture'
> > [  742.977702] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi'
> > on stack
> > [  742.977709] imx7-csi 30a90000.csi1_bridge: walk: skipping entity
> > 'csi capture' (already seen)
> > [  742.977714] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi'
> > [  742.977720] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi capture'
> > [  742.977985] imx7-csi 30a90000.csi1_bridge: begin graph walk at
> > 'csi capture'
> > [  742.977992] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi'
> > on stack
> > [  742.977997] imx7-csi 30a90000.csi1_bridge: walk: skipping entity
> > 'csi capture' (already seen)
> > [  742.978002] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi'
> > [  742.978008] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi capture'
> > [  742.978025] mc: media_release: Media Release
> > 
> > Does anything come to your mind that would prevent the set_fmt call
> > here?
> > That's what the (nxp) mipi driver looks like I'm running here:
> > https://source.puri.sm/martin.kepplinger/linux-next/-/blob/5.12-rc3/librem5__integration_byzantium/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c
> > 



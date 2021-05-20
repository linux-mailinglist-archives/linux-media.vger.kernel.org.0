Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E26E38A924
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 12:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239185AbhETK6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 06:58:25 -0400
Received: from comms.puri.sm ([159.203.221.185]:51006 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238798AbhETKz4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 06:55:56 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 690D7DFF7B;
        Thu, 20 May 2021 03:54:34 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8j1nm7JO3W3I; Thu, 20 May 2021 03:54:33 -0700 (PDT)
Message-ID: <f1d44bbd85edf547bc2b7c758b5e822e08cc80d0.camel@puri.sm>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Date:   Thu, 20 May 2021 12:54:27 +0200
In-Reply-To: <YKUy8gu3Jc3VDy5i@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
         <20210504155939.1194369-1-martin.kepplinger@puri.sm>
         <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
         <1da3de6c879474b814f4d820ca5eb5ba07174a26.camel@puri.sm>
         <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
         <7f922c8b3d4396c00ba15ad99dd572699f4b69b1.camel@puri.sm>
         <YKUy8gu3Jc3VDy5i@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 19.05.2021 um 18:46 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Wed, May 19, 2021 at 05:21:11PM +0200, Martin Kepplinger wrote:
> > Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb Laurent
> > Pinchart:
> > > On Tue, May 18, 2021 at 04:39:00PM +0200, Martin Kepplinger
> > > wrote:
> > > > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb Laurent
> > > > Pinchart:
> > > > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin Kepplinger
> > > > > wrote:
> > > > > > hi Laurent, again thanks a lot for posting this series! I
> > > > > > can't fully test
> > > > > > it, but base my work for imx8mq on it now. imx8mq includes
> > > > > > yet another mipi phy version than this and below is some
> > > > > > very rough testing
> > > > > > code. it's not at all something I sign-off on but my
> > > > > > following
> > > > > > problem is based on it.
> > > > > 
> > > > > Unless I'm mistaken, the CSI-2 receiver in the i.MX8MQ is a
> > > > > completely
> > > > > different device. I wouldn't try to support it in the imx7-
> > > > > mipi-csis
> > > > > driver, but in a separate driver.
> > > > > 
> > > > > >  * configured to use both staging csi drivers
> > > > > >  * the csi bridge driver at least streams frames together
> > > > > > with the
> > > > > > nxp "yav" mipi driver
> > > > > > 
> > > > > > media-ctl -p now says the output below, so one link from
> > > > > > mipi to
> > > > > > csi is missing.
> > > > > > 
> > > > > > Note that
> > > > > > 
> > > > > > media-ctl --set-v4l2 "'csi':0 [fmt:SBGGR10/640x480]"
> > > > > > works in that it changes the configured format below, but
> > > > > > 
> > > > > > media-ctl -l "'imx7-mipi-csis.0':1" -> "'csi':0[1]"
> > > > > > doesn't create said missing link.
> > > > > 
> > > > > media-ctl can't create links, it can only enable or disable
> > > > > them. Link
> > > > > creation is the prerogative of drivers.
> > > > > 
> > > > > > Do I maybe use that wrongly? If now, does anything come to
> > > > > > mind that would
> > > > > > be missing specifically?
> > > > > 
> > > > > The link should be created by the call to
> > > > > media_create_pad_link() in
> > > > > imx_media_capture_device_register(). You'll need to figure
> > > > > out if the
> > > > > function is called and returns an error early, or if it
> > > > > doesn't get
> > > > > called at all, and why.
> > > > > 
> > > > > > When trying to stream anyway (if that makes sense), I get
> > > > > > the
> > > > > > following:
> > > > > > 
> > > > > > [ 2008.377470] capture_start_streaming: starting
> > > > > > [ 2008.381883] capture_find_format: calling
> > > > > > imx_media_find_mbus_format with code 0x2006
> > > > > > [ 2008.389671] imx7-csi 30a90000.csi1_bridge:
> > > > > > capture_validate_fmt: capture_find_format err
> > > > > > [ 2008.397794] imx7-csi 30a90000.csi1_bridge:
> > > > > > capture_validate_fmt: capture_find_format found colorspace
> > > > > > 0x1 != 0x0
> > > > > > [ 2008.407999] imx7-csi 30a90000.csi1_bridge: capture
> > > > > > format not valid: -32
> > > > > > 
> > > > > > and if I ignore that (because I'm not yet sure whether that
> > > > > > is specific to
> > > > > > platforms including an IPU), I get a WARN_ON from
> > > > > > vb2_start_streaming()
> > > > > 
> > > > > That I have a fix for, I'll post it as part of an imx7-media-
> > > > > csi
> > > > > series.
> > > > 
> > > > Hi Laurent,
> > > > 
> > > > You haven't posted that fix you're talking about, right?
> > > 
> > > Correct. It's now fixed (see "[PATCH] media: imx: imx7-media-csi:
> > > Fix
> > > buffer return upon stream start failure", I've CC'ed you).
> > > 
> > > > The below
> > > > driver (attached; I'll send it as patches after I successfully
> > > > tested
> > > > myself, and cleanup and fixes obviously)
> > > 
> > > Don't forget the DT bindings at that point :-)
> > > 
> > > > results in the same situation I described above:
> > > > 
> > > > * missing link from mipi (entity 10) -> csi (entity 1):
> > > 
> > > The link is supposed to be created by
> > > v4l2_create_fwnode_links_to_pad(),
> > > called from imx7_csi_notify_bound(). Could you trace the calls
> > > and
> > > figure out what goes wrong ?
> > 
> > that bound callback imx7_csi_notify_bound() is called only once
> > during
> > probe: v4l2_create_fwnode_links_to_pad() returns 0 and
> > imx7_csi_async_register() returns success too.
> 
> What subdev is it called for (I assume the imx8mq-mipi-csis.0) ? Have
> you traced inside the function to see why it doesn't create links ?

I fixed mipi -> csi link. I had the DT port descriptions for mipi csi
wrong.

now, just because I think it makes sense, I do:

media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"

which now prints:

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw
xfer:none ycbcr:601 quantization:full-range]
		<- "imx8mq-mipi-csis.0":1 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw
xfer:none ycbcr:601 quantization:full-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: imx8mq-mipi-csis.0 (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
	pad0: Sink
		<- "hi846 2-0020":0 []
	pad1: Source
		-> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: hi846 2-0020 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
	pad0: Source
		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw]
		-> "imx8mq-mipi-csis.0":0 []

> > 
> > btw, my test is:
> > 
> > v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
> > index0" --set-fmt-video=width=640,height=480 --stream-mmap --
> > stream-
> > to=test.raw --stream-count=1
> > 
> > and that (probably because of the missing link) fails with
> > 
> > VIDIOC_STREAMON returned -1 (No such device)
> > 
> > which is in the kernel:
> > 
> > imx7-csi 30a90000.csi1_bridge: pipeline start failed with -19
> 
> Let's fix the missing link first.
> 

But now when trying to stream a frame, the error is:

Because of:

media bus code not compatible with the pixel format set on the video
node: 1 != 0

I get :

imx7-csi 30a90000.csi1_bridge: capture format not valid

which becomes for userspace:

VIDIOC_STREAMON returned -1 (Broken pipe)

Could that be a "user-problem" because "fmt" is not exactly the same
everywhere? Also, the sensor entity pad is not yet ENABLED...

(media-ctl is still very new to me, sorry if that's dumb questions now)

                          martin



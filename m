Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DDC34BC93
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 16:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhC1O0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 10:26:15 -0400
Received: from comms.puri.sm ([159.203.221.185]:38576 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229499AbhC1O0C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 10:26:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 12BB4DFE04;
        Sun, 28 Mar 2021 07:25:32 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8_QDUlBngpvc; Sun, 28 Mar 2021 07:25:31 -0700 (PDT)
Message-ID: <d693de36b91bb06f0d5209140e75355b1e16a197.camel@puri.sm>
Subject: Re: [PATCH] imx7-media-csi: csi2 only
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com
Date:   Sun, 28 Mar 2021 16:25:26 +0200
In-Reply-To: <YFHXm4vnyJ3SKEB8@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
         <20210316115635.4096574-1-martin.kepplinger@puri.sm>
         <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
         <9079ec9d39d48acbc3630db079b92dc223d6f1f4.camel@puri.sm>
         <YFHXm4vnyJ3SKEB8@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 17.03.2021 um 12:19 +0200 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Wed, Mar 17, 2021 at 11:08:57AM +0100, Martin Kepplinger wrote:
> > Am Dienstag, dem 16.03.2021 um 20:05 +0200 schrieb Laurent
> > Pinchart:
> > > On Tue, Mar 16, 2021 at 12:56:35PM +0100, Martin Kepplinger
> > > wrote:
> > > > ---
> > > > 
> > > > hi Laurent,
> > > > 
> > > > thanks a lot for posting this series!
> > > > 
> > > > First: I only test imx7-media-csi (csi bridge) because I run it
> > > > on imx8mq.
> > > > overall, I'm very happy with all of this and I get the same
> > > > image out
> > > > of it as I get with the mx6s_capture nxp driver.
> > > 
> > > That's good news :-)
> > > 
> > > > one issue I have is with is_csi2, so I post this patch that I
> > > > need in
> > > > order to test. It's obviously no solution, just to describe the
> > > > issue:
> > > > 
> > > > I'm not sure why but imx7_csi_pad_link_validate() isn't called
> > > > in my case
> > > > and is_csi2 doesn't get set, so I force it. Would it make sense
> > > > to> make
> > > > a dts property for this?
> > > 
> > > Some platforms support both parallel and CSI-2 inputs, so we
> > > can't
> > > hardcode which one is used in DT. I'd advise trying to debug why
> > > the
> > > function is never called in your case, it's meant to be called
> > > with the
> > > following call stack
> > > 
> > > - imx7_csi_pad_link_validate() (through
> > > v4l2_subdev_pad_ops.link_validate)
> > > - v4l2_subdev_link_validate() (through
> > > media_entity_operations.link_validate)
> > > - __media_pipeline_start()
> > > - imx_media_pipeline_set_stream()
> > > - capture_start_streaming()
> > > - ...
> > 
> > possible the 2 issues are related. I have to say that media-ctl
> > (and
> > the api) is kind of new to me and this is not strictly related to
> > the
> > patchset anymore. The patchset is certainly required for us to
> > have.
> > this is just me trying to test it properly...
> > 
> > 
> > I tried to set what I know that my sensor driver sends to mipi:
> > 
> > media-ctl -V "'csi':0 [fmt:SBGGR10/640x480 colorspace:raw]"
> > 
> > 
> > Device topology
> > - entity 1: csi (2 pads, 1 link)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
> > xfer:none ycbcr:601 quantization:full-range]
> >         pad1: Source
> >                 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
> > xfer:none ycbcr:601 quantization:full-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > 
> > - entity 10: mxc-mipi-csi2.0 (0 pad, 0 link)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> 
> The sensor is missing from the media graph, so that's not very likely
> to
> work :-) Has the sensor driver probed correctly ? Also, the
> mxc-mipi-csi2.0 entity doesn't have pads, that's not right.
> 
> 

ok. what I try is adding a mipi driver (based on nxps') to the staging
drivers and what media-ctl -p says so far is below. Despite no sensor
being shown (not sure what's missing there), the sensors' get_format()
and get_frame_interval() are being called during "media-ctl -p" and
hence the "mxc-mipi-csi2.0" sink format is correct.

somehow commands like these just don't change anything:

media-ctl -l "'mxc-mipi-csi2.0':4" -> "'csi':0[1]"
or setting already set up links to active [1] or inactive [0] doesn't
change anything either:
media-ctl -l "'csi':1" -> "'csi capture':0" "[1]"

does anything come to mind what's missing here by chance? thanks a lot
for all your help!


Media device information
------------------------
driver          imx7-csi
model           imx-media
serial          
bus info        
hw revision     0x0
driver version  5.12.0

Device topology
- entity 1: csi (2 pads, 1 link)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
	pad1: Source
		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: mxc-mipi-csi2.0 (8 pads, 0 link)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
	pad0: Sink
		[fmt:SBGGR10_1X10/640x480@1/30 field:none
colorspace:unknown]
	pad1: Unknown
	pad2: Unknown
	pad3: Unknown
	pad4: Source
	pad5: Unknown
	pad6: Unknown
	pad7: Unknown




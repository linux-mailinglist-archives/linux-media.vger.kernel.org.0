Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD5638C55D
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 13:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbhEULEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 07:04:02 -0400
Received: from comms.puri.sm ([159.203.221.185]:37676 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230387AbhEULEB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 07:04:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 573B2DFD7B;
        Fri, 21 May 2021 04:02:38 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Z33JWzdz0crk; Fri, 21 May 2021 04:02:37 -0700 (PDT)
Message-ID: <bd5dc783e39d750693ac2b49050681c5e3088330.camel@puri.sm>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Date:   Fri, 21 May 2021 13:02:30 +0200
In-Reply-To: <YKeAuGJbr9CorhZR@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
         <20210504155939.1194369-1-martin.kepplinger@puri.sm>
         <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
         <1da3de6c879474b814f4d820ca5eb5ba07174a26.camel@puri.sm>
         <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
         <7f922c8b3d4396c00ba15ad99dd572699f4b69b1.camel@puri.sm>
         <YKUy8gu3Jc3VDy5i@pendragon.ideasonboard.com>
         <f1d44bbd85edf547bc2b7c758b5e822e08cc80d0.camel@puri.sm>
         <YKZX8z1Vb0PAYk+G@pendragon.ideasonboard.com>
         <eff48d63017dc4ed1111b7d87a731d587f51885d.camel@puri.sm>
         <YKeAuGJbr9CorhZR@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 21.05.2021 um 12:43 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Fri, May 21, 2021 at 11:25:20AM +0200, Martin Kepplinger wrote:
> > Am Donnerstag, dem 20.05.2021 um 15:37 +0300 schrieb Laurent
> > Pinchart:
> > > On Thu, May 20, 2021 at 12:54:27PM +0200, Martin Kepplinger
> > > wrote:
> > > > Am Mittwoch, dem 19.05.2021 um 18:46 +0300 schrieb Laurent
> > > > Pinchart:
> > > > > On Wed, May 19, 2021 at 05:21:11PM +0200, Martin Kepplinger
> > > > > wrote:
> > > > > > Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb Laurent
> > > > > > Pinchart:
> > > > > > > On Tue, May 18, 2021 at 04:39:00PM +0200, Martin
> > > > > > > Kepplinger wrote:
> > > > > > > > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb
> > > > > > > > Laurent Pinchart:
> > > > > > > > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin
> > > > > > > > > Kepplinger wrote:
> > > 
> > > [snip]
> > > 
> > > > I fixed mipi -> csi link. I had the DT port descriptions for
> > > > mipi
> > > > csi wrong.
> > > 
> > > \o/
> > > 
> > > > now, just because I think it makes sense, I do:
> > > > 
> > > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480
> > > > colorspace:raw]"
> > > > 
> > > > which now prints:
> > > > 
> > > > Device topology
> > > > - entity 1: csi (2 pads, 2 links)
> > > >             type V4L2 subdev subtype Unknown flags 0
> > > >             device node name /dev/v4l-subdev0
> > > >         pad0: Sink
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > >                 <- "imx8mq-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> > > >         pad1: Source
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > 
> > > > - entity 4: csi capture (1 pad, 1 link)
> > > >             type Node subtype V4L flags 0
> > > >             device node name /dev/video1
> > > >         pad0: Sink
> > > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > 
> > > > - entity 10: imx8mq-mipi-csis.0 (2 pads, 2 links)
> > > >              type V4L2 subdev subtype Unknown flags 0
> > > >              device node name /dev/v4l-subdev1
> > > >         pad0: Sink
> > > >                 <- "hi846 2-0020":0 []
> > > >         pad1: Source
> > > >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > 
> > > This subdev doesn't seem to report formats on its sink and source
> > > pads,
> > > which is weird. I've had a quick look at the .get_fmt() and
> > > .set_fmt()
> > > implementations in the code you've posted, and they're wrong.
> > > They
> > > shouldn't pass the calls to the source subdev with
> > > v4l2_subdev_call(),
> > > they should instead implement get and set format on this subdev.
> > > You can
> > > look at the imx7-mipi-csis driver to see how that's done. Once
> > > you'll
> > > have fixed this, you'll have to set the format on each pad with
> > > media-ctl to make sure formats through the pipeline match.
> > > 
> > > The only location where you imx8mq-mipi-csis driver should use
> > > v4l2_subdev_call() is in .s_stream(), to propagate the operation
> > > to the
> > > source.
> > > 
> > > By the way, I'd replace every occurence of "csis" with "csi2" in
> > > your
> > > driver. The name "csis" in the i.MX7 driver comes from the CSI-2
> > > RX IP
> > > core that is named CSIS. That's not the case on the i.MX8QM.
> > > 
> > > > - entity 15: hi846 2-0020 (1 pad, 1 link)
> > > >              type V4L2 subdev subtype Sensor flags 0
> > > >              device node name /dev/v4l-subdev2
> > > >         pad0: Source
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw]
> > > >                 -> "imx8mq-mipi-csis.0":0 []
> > > 
> > > You need to enable this link, the following should do
> > > 
> > > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csis.0':0 [1]"
> > 
> > ok makes sense, even though I basically just allow a set of formats
> > without yet having to configure anything format-specific (I can at
> > least use bits-per-pixel later, so it makes sense to have them).
> > nevermind. I again append the current driver I use here.
> > 
> > then I do:
> > 
> > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > media-ctl --set-v4l2 "'imx8mq-mipi-csi2.0':0 [fmt:SGBRG10/640x480
> > colorspace:raw]"
> > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0 [1]"
> > 
> > which gets me:
> > 
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw
> > xfer:none ycbcr:601 quantization:full-range]
> >                 <- "imx8mq-mipi-csi2.0":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw
> > xfer:none ycbcr:601 quantization:full-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > 
> > - entity 10: imx8mq-mipi-csi2.0 (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [fmt:SGBRG10_1X10/640x480]
> >                 <- "hi846 2-0020":0 [ENABLED]
> >         pad1: Source
> >                 [fmt:SGBRG10_1X10/640x480]
> >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 15: hi846 2-0020 (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [fmt:SGBRG10_1X10/640x480 field:none
> > colorspace:raw]
> >                 -> "imx8mq-mipi-csi2.0":0 [ENABLED]
> 
> This looks better.
> 
> > but streaming still fails with:
> > 
> > [  352.255129] imx7-csi 30a90000.csi1_bridge: media bus code not
> > compatible with the pixel format set on the video node: 1 != 0
> 
> What is the capture command line ? Can you trace this (I assume the
> message is printed by capture_validate_fmt(), it's not present in
> mainline so I don't know what 1 and 0 correspond to, even though I
> suspect they would be IPUV3_COLORSPACE_* values) to see why it fails
> ?

capture command:

v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
index0" --set-fmt-video=width=640,height=480 --stream-mmap --stream-
to=test.raw --stream-count=1

I'll have to continue after the weekend, but let's share some logs.
Yes, "1 != 0" is from capture_validate_fmt():

priv->vdev.cc->cs != cc->cs

When I print the format the imx_media_find_mbus_format() finds and do:

media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"

I see:

[  184.251144] mc: media_release: Media Release
[  184.254397] selected specific mbus code 0 for list nr 0 (fourcc
0x59565955)
[  184.264564] selected specific mbus code 0 for list nr 0 (fourcc
0x59565955)
[  184.274763] selected specific mbus code 0 for list nr 21 (fourcc
0x36314247)
[  184.285102] selected specific mbus code 0 for list nr 21 (fourcc
0x36314247)
[  184.295383] selected specific mbus code 0 for list nr 21 (fourcc
0x36314247)
[  184.305752] selected specific mbus code 0 for list nr 21 (fourcc
0x36314247)

21 is the correct bayer format I want, but there's 0, so
"MEDIA_BUS_FMT_UYVY8_2X8" found the first 2 times. That is
IPUV3_COLORSPACE_YUV (1) while the correct Bayer format 21 is
IPUV3_COLORSPACE_RGB (0).

so some format settings not yet correct.


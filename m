Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1232E38C3AA
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 11:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237057AbhEUJo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 05:44:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbhEUJor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 05:44:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 478BC8D8;
        Fri, 21 May 2021 11:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621590202;
        bh=mN3U+w8SyVb2SmZwX/4IvpV9KdQ7sQaDay4iii/NjIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vWG5Mm4GL9Ul9tFNskQs5qTz7dWy0BzkYnvbihcdme1l1U3cf1rRTBQQ+JEpRlPUP
         NnMhNmUR1hJf1tcp+AVv3fOnMeDI/8IJSJ/y33bRcc0L1LVq9x8JRAccASS4+tboyD
         ILkzjXSYsSngXCsZkDEdo2Nk9FTpRhoNsAOSYWxQ=
Date:   Fri, 21 May 2021 12:43:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
Message-ID: <YKeAuGJbr9CorhZR@pendragon.ideasonboard.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eff48d63017dc4ed1111b7d87a731d587f51885d.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, May 21, 2021 at 11:25:20AM +0200, Martin Kepplinger wrote:
> Am Donnerstag, dem 20.05.2021 um 15:37 +0300 schrieb Laurent Pinchart:
> > On Thu, May 20, 2021 at 12:54:27PM +0200, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 19.05.2021 um 18:46 +0300 schrieb Laurent Pinchart:
> > > > On Wed, May 19, 2021 at 05:21:11PM +0200, Martin Kepplinger wrote:
> > > > > Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb Laurent Pinchart:
> > > > > > On Tue, May 18, 2021 at 04:39:00PM +0200, Martin Kepplinger wrote:
> > > > > > > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb Laurent Pinchart:
> > > > > > > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin Kepplinger wrote:
> > 
> > [snip]
> > 
> > > I fixed mipi -> csi link. I had the DT port descriptions for mipi
> > > csi wrong.
> > 
> > \o/
> > 
> > > now, just because I think it makes sense, I do:
> > > 
> > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > > 
> > > which now prints:
> > > 
> > > Device topology
> > > - entity 1: csi (2 pads, 2 links)
> > >             type V4L2 subdev subtype Unknown flags 0
> > >             device node name /dev/v4l-subdev0
> > >         pad0: Sink
> > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > >                 <- "imx8mq-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> > >         pad1: Source
> > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > 
> > > - entity 4: csi capture (1 pad, 1 link)
> > >             type Node subtype V4L flags 0
> > >             device node name /dev/video1
> > >         pad0: Sink
> > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > 
> > > - entity 10: imx8mq-mipi-csis.0 (2 pads, 2 links)
> > >              type V4L2 subdev subtype Unknown flags 0
> > >              device node name /dev/v4l-subdev1
> > >         pad0: Sink
> > >                 <- "hi846 2-0020":0 []
> > >         pad1: Source
> > >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > 
> > This subdev doesn't seem to report formats on its sink and source pads,
> > which is weird. I've had a quick look at the .get_fmt() and .set_fmt()
> > implementations in the code you've posted, and they're wrong. They
> > shouldn't pass the calls to the source subdev with v4l2_subdev_call(),
> > they should instead implement get and set format on this subdev. You can
> > look at the imx7-mipi-csis driver to see how that's done. Once you'll
> > have fixed this, you'll have to set the format on each pad with
> > media-ctl to make sure formats through the pipeline match.
> > 
> > The only location where you imx8mq-mipi-csis driver should use
> > v4l2_subdev_call() is in .s_stream(), to propagate the operation to the
> > source.
> > 
> > By the way, I'd replace every occurence of "csis" with "csi2" in your
> > driver. The name "csis" in the i.MX7 driver comes from the CSI-2 RX IP
> > core that is named CSIS. That's not the case on the i.MX8QM.
> > 
> > > - entity 15: hi846 2-0020 (1 pad, 1 link)
> > >              type V4L2 subdev subtype Sensor flags 0
> > >              device node name /dev/v4l-subdev2
> > >         pad0: Source
> > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw]
> > >                 -> "imx8mq-mipi-csis.0":0 []
> > 
> > You need to enable this link, the following should do
> > 
> > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csis.0':0 [1]"
> 
> ok makes sense, even though I basically just allow a set of formats
> without yet having to configure anything format-specific (I can at
> least use bits-per-pixel later, so it makes sense to have them).
> nevermind. I again append the current driver I use here.
> 
> then I do:
> 
> media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> media-ctl --set-v4l2 "'imx8mq-mipi-csi2.0':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0 [1]"
> 
> which gets me:
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> 		<- "imx8mq-mipi-csi2.0":1 [ENABLED,IMMUTABLE]
> 	pad1: Source
> 		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: imx8mq-mipi-csi2.0 (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
> 	pad0: Sink
> 		[fmt:SGBRG10_1X10/640x480]
> 		<- "hi846 2-0020":0 [ENABLED]
> 	pad1: Source
> 		[fmt:SGBRG10_1X10/640x480]
> 		-> "csi":0 [ENABLED,IMMUTABLE]
> 
> - entity 15: hi846 2-0020 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
> 	pad0: Source
> 		[fmt:SGBRG10_1X10/640x480 field:none colorspace:raw]
> 		-> "imx8mq-mipi-csi2.0":0 [ENABLED]

This looks better.

> but streaming still fails with:
> 
> [  352.255129] imx7-csi 30a90000.csi1_bridge: media bus code not compatible with the pixel format set on the video node: 1 != 0

What is the capture command line ? Can you trace this (I assume the
message is printed by capture_validate_fmt(), it's not present in
mainline so I don't know what 1 and 0 correspond to, even though I
suspect they would be IPUV3_COLORSPACE_* values) to see why it fails ?

> [  352.266439] imx7-csi 30a90000.csi1_bridge: capture format not valid

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2D434BD4E
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1QpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 12:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhC1Qoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 12:44:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDF9C061756
        for <linux-media@vger.kernel.org>; Sun, 28 Mar 2021 09:44:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 273A6436;
        Sun, 28 Mar 2021 18:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616949875;
        bh=uAODWAEd4LDJZmNU9+slD83thh/+/acmaXXopi01YYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IgI9TjS3dxHGg568GN3bDTAp1UIVbdrwx0waz8T81xdUUaKJvoXp9KH2jB3FiQ0ml
         7hGqrKfuRA8SWzsECC8BB5LCcw9r6D0WGTWRd73uy9Q8UkMphy33uwnGnkCBmCta2l
         sdR2/aHRWet3uqhLhGLREwjG0zg2MXTco+oCC6/8=
Date:   Sun, 28 Mar 2021 19:43:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com
Subject: Re: [PATCH] imx7-media-csi: csi2 only
Message-ID: <YGCyRwCNqtorq1eu@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210316115635.4096574-1-martin.kepplinger@puri.sm>
 <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
 <9079ec9d39d48acbc3630db079b92dc223d6f1f4.camel@puri.sm>
 <YFHXm4vnyJ3SKEB8@pendragon.ideasonboard.com>
 <d693de36b91bb06f0d5209140e75355b1e16a197.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d693de36b91bb06f0d5209140e75355b1e16a197.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Sun, Mar 28, 2021 at 04:25:26PM +0200, Martin Kepplinger wrote:
> Am Mittwoch, dem 17.03.2021 um 12:19 +0200 schrieb Laurent Pinchart:
> > On Wed, Mar 17, 2021 at 11:08:57AM +0100, Martin Kepplinger wrote:
> > > Am Dienstag, dem 16.03.2021 um 20:05 +0200 schrieb Laurent Pinchart:
> > > > On Tue, Mar 16, 2021 at 12:56:35PM +0100, Martin Kepplinger wrote:
> > > > > ---
> > > > > 
> > > > > hi Laurent,
> > > > > 
> > > > > thanks a lot for posting this series!
> > > > > 
> > > > > First: I only test imx7-media-csi (csi bridge) because I run it on imx8mq.
> > > > > overall, I'm very happy with all of this and I get the same image out
> > > > > of it as I get with the mx6s_capture nxp driver.
> > > > 
> > > > That's good news :-)
> > > > 
> > > > > one issue I have is with is_csi2, so I post this patch that I need in
> > > > > order to test. It's obviously no solution, just to describe the issue:
> > > > > 
> > > > > I'm not sure why but imx7_csi_pad_link_validate() isn't called in my case
> > > > > and is_csi2 doesn't get set, so I force it. Would it make sense to make
> > > > > a dts property for this?
> > > > 
> > > > Some platforms support both parallel and CSI-2 inputs, so we can't
> > > > hardcode which one is used in DT. I'd advise trying to debug why the
> > > > function is never called in your case, it's meant to be called with the
> > > > following call stack
> > > > 
> > > > - imx7_csi_pad_link_validate() (through
> > > > v4l2_subdev_pad_ops.link_validate)
> > > > - v4l2_subdev_link_validate() (through
> > > > media_entity_operations.link_validate)
> > > > - __media_pipeline_start()
> > > > - imx_media_pipeline_set_stream()
> > > > - capture_start_streaming()
> > > > - ...
> > > 
> > > possible the 2 issues are related. I have to say that media-ctl (and
> > > the api) is kind of new to me and this is not strictly related to the
> > > patchset anymore. The patchset is certainly required for us to have.
> > > this is just me trying to test it properly...
> > > 
> > > 
> > > I tried to set what I know that my sensor driver sends to mipi:
> > > 
> > > media-ctl -V "'csi':0 [fmt:SBGGR10/640x480 colorspace:raw]"
> > > 
> > > 
> > > Device topology
> > > - entity 1: csi (2 pads, 1 link)
> > >             type V4L2 subdev subtype Unknown flags 0
> > >             device node name /dev/v4l-subdev0
> > >         pad0: Sink
> > >                 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
> > > xfer:none ycbcr:601 quantization:full-range]
> > >         pad1: Source
> > >                 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw
> > > xfer:none ycbcr:601 quantization:full-range]
> > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > 
> > > - entity 4: csi capture (1 pad, 1 link)
> > >             type Node subtype V4L flags 0
> > >             device node name /dev/video0
> > >         pad0: Sink
> > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > 
> > > - entity 10: mxc-mipi-csi2.0 (0 pad, 0 link)
> > >              type V4L2 subdev subtype Unknown flags 0
> > >              device node name /dev/v4l-subdev1
> > 
> > The sensor is missing from the media graph, so that's not very likely to
> > work :-) Has the sensor driver probed correctly ? Also, the
> > mxc-mipi-csi2.0 entity doesn't have pads, that's not right.
> 
> ok. what I try is adding a mipi driver (based on nxps') to the staging
> drivers and what media-ctl -p says so far is below. Despite no sensor
> being shown (not sure what's missing there), the sensors' get_format()
> and get_frame_interval() are being called during "media-ctl -p" and
> hence the "mxc-mipi-csi2.0" sink format is correct.
> 
> somehow commands like these just don't change anything:
> 
> media-ctl -l "'mxc-mipi-csi2.0':4" -> "'csi':0[1]"
> or setting already set up links to active [1] or inactive [0] doesn't
> change anything either:
> media-ctl -l "'csi':1" -> "'csi capture':0" "[1]"
> 
> does anything come to mind what's missing here by chance? thanks a lot
> for all your help!
> 
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial          
> bus info        
> hw revision     0x0
> driver version  5.12.0
> 
> Device topology
> - entity 1: csi (2 pads, 1 link)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
> 	pad1: Source
> 		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video1
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: mxc-mipi-csi2.0 (8 pads, 0 link)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
> 	pad0: Sink
> 		[fmt:SBGGR10_1X10/640x480@1/30 field:none colorspace:unknown]
> 	pad1: Unknown
> 	pad2: Unknown
> 	pad3: Unknown
> 	pad4: Source
> 	pad5: Unknown
> 	pad6: Unknown
> 	pad7: Unknown

I can't tell what wrong without looking at the code, but for instance
the 8 pads above also look fishy.

I'd recommend extending the existing imx7-mipi-csis driver instead of
creating a new driver. The CSI-2 receivers in i.MX7 and i.MX8 are very
similar, the latter having a more recent version of the same IP core
(originating from Samsung, and actually also supported in one separate
driver for Exynos which should ideally be merged with imx7-mipi-csis
into a single implementation, but that's a separate matter). A new
i.MX8-specific driver will have little chance of being accepted upstream
given the above.

-- 
Regards,

Laurent Pinchart

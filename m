Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5DB747493
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjGDO4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjGDO4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:56:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A719E99
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:56:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F6966DF;
        Tue,  4 Jul 2023 16:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688482531;
        bh=+4hnIOkzGTKLGwMCWsB408tBaEQjHxeuzs+vR9Q4m+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=poiPiqtHHwk0fgw0EkmwuwJkfVLuxGyg+20TlrFqL7gx2h9Zf52KSt3mMvaj2cRWq
         De0rikmqEDbbIShSj+cI9jJbS7zg3eIzPSpq8eVmSMJ4SjiP55zo/pgl0ozlcGGO+z
         uyECyBWsa5UHVGxl+osDGrnO08xAsphPE4niwbVk=
Date:   Tue, 4 Jul 2023 17:56:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] Documentation: v4l: Flip handling for RAW sensors
Message-ID: <20230704145616.GA7503@pendragon.ideasonboard.com>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-2-jacopo.mondi@ideasonboard.com>
 <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
 <bnk6t3td26dlrik54gw4jf33anajvfpgah4qut6nn4bstxd6zu@b2ajma7t4hf5>
 <CAPY8ntAx5VXQD_NTpSq9D3B-MOSY21P=hA0p5ktkuJK3Ah1VbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntAx5VXQD_NTpSq9D3B-MOSY21P=hA0p5ktkuJK3Ah1VbQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 04, 2023 at 12:03:00PM +0100, Dave Stevenson wrote:
> On Tue, 4 Jul 2023 at 11:24, Jacopo Mondi wrote:
> > On Tue, Jul 04, 2023 at 10:58:11AM +0100, Dave Stevenson wrote:
> > > Hi Jacopo
> > >
> > > Thanks for adding documentation.
> > > Sorry I couldn't be at your presentation, but I'll find the slides
> > > (and recording if there is one).
> >
> > videos and slides should be already available for attendees. If not I
> > can send you the slide deck, but trust me, there is nothing new for
> > you there.
> >
> > > On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi wrote:
> > > >
> > > > Document the requirement of notifying to userspace the possible
> > > > re-ordering of the color sample components when a vertical or horizontal
> > > > flip is applied to a RAW camera sensor.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index 93f4f2536c25..ee4a7fe5f72a 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
> > > >  The default values of these controls shall be 0 (disabled). Especially these
> > > >  controls shall not be inverted, independently of the sensor's mounting
> > > >  rotation.
> > > > +
> > > > +Flip handling for raw camera sensors
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Possibly "for colour raw camera sensors".
> > > Mono sensors are still raw in that they need processing for black
> > > level, lens shading, etc, but they won't change the colour ordering.
> >
> > Thanks, good point
> >
> > > > +
> > > > +Applying vertical and horizontal flips on raw camera sensors inverts the color
> > > > +sample reading direction on the sensor's pixel array. This causes the
> > > > +re-ordering of the color samples on the sensor's output frame.
> > >
> > > This *may* cause the re-ordering....
> > >
> > > Not all sensors do. Some shift the readout by one line/column to keep
> > > the Bayer order the same, and technically should update the selection.
> > > OnSemi sensors in particular seem to do this, as do the Sony
> > > IMX327/290/462 family.
> >
> > Is it the driver doing the shift or is it the sensor automatically
> > adjusting ?
> 
> The sensor does it.

Both cases exist, some drivers do the adjustments internally. That's not
something I would recommend, but it was implemented to allow changing
the flip controls during streaming as we lacked (and still lack) a
solution to this problem.

There are also sensors that make this behaviour configurable, with a
register bit to indicate if the crop rectangle should be adjusted
automatically.

While moving the crop rectangle by one pixel in a large resolution
sensor could seem difficult to notice, it can have very noticeable
effects. For instance, defective pixel correction that operates on a
list of known bad pixels will require adjustement.

> For IMX290, the array is defined horizontally as:
> 4 ignored pixels
> 8 pixels margin for colour processing
> 1920 recording pixel area
> 9 pixels margin for colour processing
> 4 ignored pixels
> (3 dummy pixels)

Do you know what those dummy pixels are, and how they differ from the
ignored pixels that are not supposed to be read out either ?

> Ignoring the dummy ones, that gives a width of 1945 pixels.
> 
> Vertically is similar with 1109 pixels total (9 colour margin / 1080
> active / 8 colour margin).
> 
> That means it is a red pixel in all 4 corners of the full 1945x1109
> array, and it keeps the 8 pixels margin on the left of the image read
> out in all circumstances, and 8 at the top too so that readout always
> follows that.
> It's slightly weird as a sensor in that it has presets for 1080p and
> 720p, as well as a windowed mode where you can arbitrarily crop from
> the whole array. The driver only uses the two presets, so exactly what
> is going on is partly reverse engineering.
> 
> With regard OnSemi, we asked them about it several years ago, and the
> response was that there was no way to change that behaviour for the
> sensor we were looking at.
> From that datasheet:
> "While the sensor’s format is W × H, the additional active columns and
> active rows are included for use when horizontal or vertical mirrored
> readout is enabled, to allow readout to start on the same pixel. The
> pixel adjustment is always performed for monochrome or color versions"
> Definition of the VERT_FLIP bit
> "1: Readout is flipped (mirrored) vertically so that the row specified
> by y_addr_end_ (+1) is read out of the sensor first"
> and HORIZ_MIRROR bit
> "1: Readout is mirrored horizontally so that the column specified by
> x_addr_end_ (+1) is read out of the sensor first."
> 
> Having just checked a different OnSemi datasheet, that doesn't state
> that it alters the pixel read out first when flipped. It possibly
> depends on the target market for the sensor, and how configurable they
> anticipate the ISPs to be.
> 
> > > > As an example, a
> > > > +raw camera sensor with a Bayer pattern color filter array and a native RGGB
> > > > +Bayer order will produce frames with GRBG component ordering when a vertical
> > > > +flip is applied.
> > >
> > > Vertical flip of RGGB would be GBRG as the RG and GB get swapped, not
> > > GRBG (which would be horizontal flip).
> >
> > I clearly mean horizontal sorry. I'll fix.
> >
> > > > Camera sensor drivers where inverting the reading order
> > > > +direction causes a re-ordering of the color components are requested to register
> > > > +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > > +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace that enabling
> > > > +a flip can potentially change the output buffer content layout. Flips should
> > > > +also be taken into account when enumerating and handling media bus formats
> > > > +on the camera sensor source pads.

-- 
Regards,

Laurent Pinchart

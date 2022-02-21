Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5F64BE9A4
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiBUNcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 08:32:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiBUNcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 08:32:32 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA39B7C
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 05:32:07 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 989EBE0005;
        Mon, 21 Feb 2022 13:32:01 +0000 (UTC)
Date:   Mon, 21 Feb 2022 14:31:59 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, jbrunet@baylibre.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <20220221133159.xmjunkptxbu6rtch@uno.localdomain>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <a5a75d0b-7f40-39d0-a8ec-4e143c5f3b1c@microchip.com>
 <20220211112500.7p3fi2xhwutap6ak@uno.localdomain>
 <23ac37a4-a979-2dbf-32ae-012d4ff45806@microchip.com>
 <20220214143816.wbtpd2klb6wvzt3c@uno.localdomain>
 <8c39e96c-1c1f-a279-a67c-1d113153ec13@microchip.com>
 <20220214185647.tbqv4lbuf3ba4yw7@uno.localdomain>
 <6d2f7f6d-e610-fb35-0f4f-224dbaae262d@microchip.com>
 <20220221085146.airuxkbi4e5trxkp@uno.localdomain>
 <011950d4-d2bc-1963-3d20-33883c7142ac@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <011950d4-d2bc-1963-3d20-33883c7142ac@microchip.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again Eugen
  one more last favour :)

On Mon, Feb 21, 2022 at 09:04:39AM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/21/22 10:51 AM, Jacopo Mondi wrote:
> > Hi Eugen
> >
> >>>>
> >>>> So I assume you have been reworking the frame sizes.
> >>>>
> >>>> With your series, I have tested RGGB at 1280x720 , 1920x1080 .
> >>>> I also tested YUYV at 640x480 and RGB565_LE at 640x480.
> >>>>
> >>>> I can't go higher with the YUYV/RGB565, I don't receive frames anymore.
> >>>
> >>> Ah, I wonder if
> >>> 07b49ac59fd9 media: ov5640: Fix durations to comply with FPS
> >>> 82aebf4b7314 media: ov5640: Rework analog crop rectangles
> >>>
> >>> Might have impacted DVP...
> >>>
> >>> Should I keep separate fields for MIPI mode and leave the totals for
> >>> DVP untouched ?

Could you try to revert these two ? I'm reworking the series and
knowing where I break DVP might be useful. In example, I think if:

82aebf4b7314 media: ov5640: Rework analog crop rectangles

is harmless it should be kept for DVP as well.

Thanks
   j

> >>
> >> Hi Jacopo,
> >>
> >> I tested again without your series, and I can capture YUYV directly
> >> @1280x720 , which does not work anymore with your patches.
> >>
> >> The image has some bad pixels in it, but still, capture is pretty good.
> >> I am not sure whether it's a timing problem on capturing pixels, I
> >> uploaded it here so you can have a look :
> >>
> >> https://ibb.co/Yt8c0dJ
> >>
> >
> > This is without my series ? Or with it applied ? Sorry for the dumb
> > question :)
>
> This photo is *without* your series. *With* your series, I cannot
> capture YUYV at this resolution at all. No frames received.
>
> >
> >> Eugen
> >>
> >>>
> >>> Thanks again for your very useful testing
> >>>
> >>>
> >>>> I can't go higher with the bayer to 2592x1944 . But this did not work
> >>>> before your patches either.
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>>> I managed to get it working fine at 640x480 .
> >>>>>>>>
> >>>>>>>> The sensor looks to report valid framesizes for this mbus code :
> >>>>>>>>
> >>>>>>>> # v4l2-ctl -d /dev/v4l-subdev1 --list-subdev-mbus-codes
> >>>>>>>> \ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
> >>>>>>>>              0x4001: MEDIA_BUS_FMT_JPEG_1X8
> >>>>>>>>              0x2006: MEDIA_BUS_FMT_UYVY8_2X8
> >>>>>>>>              0x200f: MEDIA_BUS_FMT_UYVY8_1X16
> >>>>>>>>              0x2008: MEDIA_BUS_FMT_YUYV8_2X8
> >>>>>>>>              0x2011: MEDIA_BUS_FMT_YUYV8_1X16
> >>>>>>>>              0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
> >>>>>>>>              0x1007: MEDIA_BUS_FMT_RGB565_2X8_BE
> >>>>>>>>              0x1017: MEDIA_BUS_FMT_RGB565_1X16
> >>>>>>>>              0x100a: MEDIA_BUS_FMT_RGB888_1X24
> >>>>>>>>              0x1013: MEDIA_BUS_FMT_BGR888_1X24
> >>>>>>>>              0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> >>>>>>>>              0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
> >>>>>>>>              0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
> >>>>>>>>              0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
> >>>>>>>> # v4l2-ctl -d /dev/v4l-subdev1 --list-subdev-framesizes pad=0,code=0x2008
> >>>>>>>> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=0)
> >>>>>>>>              Size Range: 160x120 - 160x120
> >>>>>>>>              Size Range: 176x144 - 176x144
> >>>>>>>>              Size Range: 320x240 - 320x240
> >>>>>>>>              Size Range: 640x480 - 640x480
> >>>>>>>>              Size Range: 720x480 - 720x480
> >>>>>>>>              Size Range: 720x576 - 720x576
> >>>>>>>>              Size Range: 1024x768 - 1024x768
> >>>>>>>>              Size Range: 1280x720 - 1280x720
> >>>>>>>>              Size Range: 1920x1080 - 1920x1080
> >>>>>>>>              Size Range: 2592x1944 - 2592x1944
> >>>>>>>> #
> >>>>>>>>
> >>>>>>>> but the ISC does not receive any frames at 1024x768 and 1920x1080.
> >>>>>>>
> >>>>>>> Are 1080p and 1024x768 working without this series applied on your
> >>>>>>> setup ?
> >>>>>>
> >>>>>> I remember they weren't working before either.
> >>>>>>
> >>>>>> I don't know exactly to which patches to add my Tested-by , as I have
> >>>>>> not tested the explicit patch behavior for each patch (e.g. where you
> >>>>>> add HBLANK control, I have not tested that ).
> >>>>>>
> >>>>>
> >>>>> I think it's good enough making sure I have not broke DVP.
> >>>>>
> >>>>> As you can see the driver now behaves in two different ways in DVP and
> >>>>> MIPI mode. The DVP works as it used to, and the framerate is
> >>>>> controlled by s_frame_interval, the frame size is fixed and the PCLK
> >>>>> is computed dyanically to accomodate the required FPS. In MIPI mode the
> >>>>> framerate is controlled by changing the vertical blankings. To each
> >>>>> mode a pixel rate is assigned and userspace changes the frame duration
> >>>>> by changing blankings. The most obvious gain is that the frame rate is
> >>>>> controllable in a continuous interval instead of being limited to a
> >>>>> few fixed values. It is my understanding that all drivers should be
> >>>>> moved to this model and s_frame_intervall should be dropped, but
> >>>>> unfortunately some bridge drivers in mainline still deman that.
> >>>>>
> >>>>> If you are interested, I think the DVP mode should be moved to use the
> >>>>> same mecahnism as MIPI mode. I can't test so I haven't done so in this
> >>>>> series.
> >>>>>
> >>>>> For now I think it's enough to make sure there are no regressions in
> >>>>> DVP mode.
> >>>>>
> >>>>> For the tag, I think it would be appropriate to add it to the
> >>>>> following one:
> >>>>>
> >>>>> 91ae667b0d47 media: ov5640: Limit frame_interval to DVP mode only
> >>>>>
> >>>>>> Is there something particular you would like me to try , except my usual
> >>>>>> image captures ?
> >>>>>
> >>>>> RGB888 is weird on both the platforms I've tested on and I cannot get
> >>>>> colors right. Does your platform support RGB888 ?
> >>>>
> >>>> I can't test this one unfortunately. It's a 1X24 . I have only 8 bits
> >>>> connected, so unless you can make this a 3x8 , there isn't anything I
> >>>> can do.
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>>      j
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> Eugen
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks again for testin!
> >>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> What I can say is that the raw bayer format works at 1920x1080 , frames
> >>>>>>>> are received correctly.
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Eugen
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> v1 -> v2:
> >>>>>>>>> - rework the modes definition to process the full pixel array
> >>>>>>>>> - rework get_selection to report the correct BOUND and DEFAULT targets
> >>>>>>>>> - implement init_cfg
> >>>>>>>>> - minor style changes as suggested by Laurent
> >>>>>>>>> - test with 1 data lane
> >>>>>>>>>
> >>>>>>>>> Thanks
> >>>>>>>>>         j
> >>>>>>>>>
> >>>>>>>>> Jacopo Mondi (23):
> >>>>>>>>>        media: ov5640: Add pixel rate to modes
> >>>>>>>>>        media: ov5604: Re-arrange modes definition
> >>>>>>>>>        media: ov5640: Add ov5640_is_csi2() function
> >>>>>>>>>        media: ov5640: Associate bpp with formats
> >>>>>>>>>        media: ov5640: Add LINK_FREQ control
> >>>>>>>>>        media: ov5640: Update pixel_rate and link_freq
> >>>>>>>>>        media: ov5640: Rework CSI-2 clock tree
> >>>>>>>>>        media: ov5640: Rework timings programming
> >>>>>>>>>        media: ov5640: Fix 720x480 in RGB888 mode
> >>>>>>>>>        media: ov5640: Rework analog crop rectangles
> >>>>>>>>>        media: ov5640: Re-sort per-mode register tables
> >>>>>>>>>        media: ov5640: Remove ov5640_mode_init_data
> >>>>>>>>>        media: ov5640: Add HBLANK control
> >>>>>>>>>        media: ov5640: Add VBLANK control
> >>>>>>>>>        media: ov5640: Fix durations to comply with FPS
> >>>>>>>>>        media: ov5640: Implement init_cfg
> >>>>>>>>>        media: ov5640: Implement get_selection
> >>>>>>>>>        media: ov5640: Limit frame_interval to DVP mode only
> >>>>>>>>>        media: ov5640: Register device properties
> >>>>>>>>>        media: ov5640: Add RGB565_1X16 format
> >>>>>>>>>        media: ov5640: Add RGB888/BGR888 formats
> >>>>>>>>>        media: ov5640: Restrict sizes to mbus code
> >>>>>>>>>        media: ov5640: Adjust format to bpp in s_fmt
> >>>>>>>>>
> >>>>>>>>>       drivers/media/i2c/ov5640.c | 1143 ++++++++++++++++++++++++++----------
> >>>>>>>>>       1 file changed, 830 insertions(+), 313 deletions(-)
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> 2.35.0
> >>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>
>

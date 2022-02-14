Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6F54B5376
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 15:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355222AbiBNOh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 09:37:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344075AbiBNOhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 09:37:21 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CB9488AB
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 06:37:12 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 71819E0010;
        Mon, 14 Feb 2022 14:37:07 +0000 (UTC)
Date:   Mon, 14 Feb 2022 15:38:16 +0100
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
Message-ID: <20220214143816.wbtpd2klb6wvzt3c@uno.localdomain>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <a5a75d0b-7f40-39d0-a8ec-4e143c5f3b1c@microchip.com>
 <20220211112500.7p3fi2xhwutap6ak@uno.localdomain>
 <23ac37a4-a979-2dbf-32ae-012d4ff45806@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23ac37a4-a979-2dbf-32ae-012d4ff45806@microchip.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Mon, Feb 14, 2022 at 02:06:02PM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/11/22 1:25 PM, Jacopo Mondi wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Eugen
> >
> >          thanks very much for testing
> >
> > On Fri, Feb 11, 2022 at 10:09:04AM +0000, Eugen.Hristev@microchip.com wrote:
> >> On 2/10/22 1:04 PM, Jacopo Mondi wrote:
> >>
> >> Hello Jacopo,
> >>
> >>> v1:
> >>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> >>>
> >>> A branch for testing based on the most recent media-master is available at
> >>> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2
> >>>
> >>> If anyone with a DVP setup could verify I have not broken their use case
> >>> I would very much appreciate that :)
> >>
> >> I started testing this on my bench.
> >> So far things look good.
> >>
> >
> > \o/
> >
> >> To be able to test this, I have to revert this patch :
> >> "media: i2c: ov5640: Remain in power down for DVP mode unless streaming"
> >>
> >> Otherwise the sensor will not power up when starting streaming.
> >>
> >>
> >> I have tested several formats, as you worked more on this sensor, could
> >> you tell me, does format YUYV_2x8 work in parallel mode at 1920x1080 or
> >> 1024x768 ?
> >
> > I never tested the sensor driver with a parallel setup I'm afraid.
> > The idea behind this series is that DVP shouldn't be affected and
> > continue working like it did.
>
> Hi Jacopo,
>
> I was hoping that you had more information about the driver than myself.

Not on DVP mode I'm sorry :(

> I can tell that the parallel mode is not affected by your series from
> what I've seen so far.

That's great, thanks for testing.

>
> >
> >> I managed to get it working fine at 640x480 .
> >>
> >> The sensor looks to report valid framesizes for this mbus code :
> >>
> >> # v4l2-ctl -d /dev/v4l-subdev1 --list-subdev-mbus-codes
> >> \ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
> >>           0x4001: MEDIA_BUS_FMT_JPEG_1X8
> >>           0x2006: MEDIA_BUS_FMT_UYVY8_2X8
> >>           0x200f: MEDIA_BUS_FMT_UYVY8_1X16
> >>           0x2008: MEDIA_BUS_FMT_YUYV8_2X8
> >>           0x2011: MEDIA_BUS_FMT_YUYV8_1X16
> >>           0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
> >>           0x1007: MEDIA_BUS_FMT_RGB565_2X8_BE
> >>           0x1017: MEDIA_BUS_FMT_RGB565_1X16
> >>           0x100a: MEDIA_BUS_FMT_RGB888_1X24
> >>           0x1013: MEDIA_BUS_FMT_BGR888_1X24
> >>           0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> >>           0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
> >>           0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
> >>           0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
> >> # v4l2-ctl -d /dev/v4l-subdev1 --list-subdev-framesizes pad=0,code=0x2008
> >> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=0)
> >>           Size Range: 160x120 - 160x120
> >>           Size Range: 176x144 - 176x144
> >>           Size Range: 320x240 - 320x240
> >>           Size Range: 640x480 - 640x480
> >>           Size Range: 720x480 - 720x480
> >>           Size Range: 720x576 - 720x576
> >>           Size Range: 1024x768 - 1024x768
> >>           Size Range: 1280x720 - 1280x720
> >>           Size Range: 1920x1080 - 1920x1080
> >>           Size Range: 2592x1944 - 2592x1944
> >> #
> >>
> >> but the ISC does not receive any frames at 1024x768 and 1920x1080.
> >
> > Are 1080p and 1024x768 working without this series applied on your
> > setup ?
>
> I remember they weren't working before either.
>
> I don't know exactly to which patches to add my Tested-by , as I have
> not tested the explicit patch behavior for each patch (e.g. where you
> add HBLANK control, I have not tested that ).
>

I think it's good enough making sure I have not broke DVP.

As you can see the driver now behaves in two different ways in DVP and
MIPI mode. The DVP works as it used to, and the framerate is
controlled by s_frame_interval, the frame size is fixed and the PCLK
is computed dyanically to accomodate the required FPS. In MIPI mode the
framerate is controlled by changing the vertical blankings. To each
mode a pixel rate is assigned and userspace changes the frame duration
by changing blankings. The most obvious gain is that the frame rate is
controllable in a continuous interval instead of being limited to a
few fixed values. It is my understanding that all drivers should be
moved to this model and s_frame_intervall should be dropped, but
unfortunately some bridge drivers in mainline still deman that.

If you are interested, I think the DVP mode should be moved to use the
same mecahnism as MIPI mode. I can't test so I haven't done so in this
series.

For now I think it's enough to make sure there are no regressions in
DVP mode.

For the tag, I think it would be appropriate to add it to the
following one:

91ae667b0d47 media: ov5640: Limit frame_interval to DVP mode only

> Is there something particular you would like me to try , except my usual
> image captures ?

RGB888 is weird on both the platforms I've tested on and I cannot get
colors right. Does your platform support RGB888 ?

Thanks
  j


>
>
> Eugen
>
> >
> > Thanks again for testin!
> >
> >>
> >>
> >> What I can say is that the raw bayer format works at 1920x1080 , frames
> >> are received correctly.
> >>
> >> Thanks,
> >> Eugen
> >>
> >>>
> >>> v1 -> v2:
> >>> - rework the modes definition to process the full pixel array
> >>> - rework get_selection to report the correct BOUND and DEFAULT targets
> >>> - implement init_cfg
> >>> - minor style changes as suggested by Laurent
> >>> - test with 1 data lane
> >>>
> >>> Thanks
> >>>      j
> >>>
> >>> Jacopo Mondi (23):
> >>>     media: ov5640: Add pixel rate to modes
> >>>     media: ov5604: Re-arrange modes definition
> >>>     media: ov5640: Add ov5640_is_csi2() function
> >>>     media: ov5640: Associate bpp with formats
> >>>     media: ov5640: Add LINK_FREQ control
> >>>     media: ov5640: Update pixel_rate and link_freq
> >>>     media: ov5640: Rework CSI-2 clock tree
> >>>     media: ov5640: Rework timings programming
> >>>     media: ov5640: Fix 720x480 in RGB888 mode
> >>>     media: ov5640: Rework analog crop rectangles
> >>>     media: ov5640: Re-sort per-mode register tables
> >>>     media: ov5640: Remove ov5640_mode_init_data
> >>>     media: ov5640: Add HBLANK control
> >>>     media: ov5640: Add VBLANK control
> >>>     media: ov5640: Fix durations to comply with FPS
> >>>     media: ov5640: Implement init_cfg
> >>>     media: ov5640: Implement get_selection
> >>>     media: ov5640: Limit frame_interval to DVP mode only
> >>>     media: ov5640: Register device properties
> >>>     media: ov5640: Add RGB565_1X16 format
> >>>     media: ov5640: Add RGB888/BGR888 formats
> >>>     media: ov5640: Restrict sizes to mbus code
> >>>     media: ov5640: Adjust format to bpp in s_fmt
> >>>
> >>>    drivers/media/i2c/ov5640.c | 1143 ++++++++++++++++++++++++++----------
> >>>    1 file changed, 830 insertions(+), 313 deletions(-)
> >>>
> >>> --
> >>> 2.35.0
> >>>
> >>
>

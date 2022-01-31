Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CE84A4957
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236812AbiAaOcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiAaOcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:32:04 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06673C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:32:03 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 810C4FF811;
        Mon, 31 Jan 2022 14:31:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 00/17] media: ov5640: Rework the clock tree programming for MIPI
Date:   Mon, 31 Jan 2022 15:32:24 +0100
Message-Id: <20220131143245.128089-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Heya
   this series changes the way the ov5640 clock tree is programmed and moves the
driver to control frame rate by changing the vertical blanking when used in MIPI
mode.

A bit of background:
The OV5640 is -everywhere-. After a long long time since it has been put on the
market it still is one of the most common sensors found in EVKs from several
several vendors. Touching it is scary, it will likely make a lot of people
complain as there are a lot of active users out there.

The current driver implementation as it is barely works at least here. Testing
in UYVY mode I can only capture in 1080p from the few tests I've run. Other
resolutions do not work or have a completely off frame rate.

The current implementation operates in the following way:

- it allows to control frame rate through the s_frame_interval operation
- fixes a set of frame rates supported by each mode (15, 30 or 60FPS)
- tries to adjust the pixel rate to comply with the configured frame rate
  and capture resolution

The idea is then to fix the frame size (visible and blanking) and compute
the pixel rate dynamically and adjust the clock tree accordingly.

As it was hard to obtain correct operations in that way, and that frame rates
were fixed to only a few of the achievable ones I have decided to flip the table
and move to an opposite model:

- Set a fixed pixel clock per each supported mode according to the indications
  reported in the chip manual
- Program the clock tree according to the above pixel rate
- Adjust the frame rate by controlling the frame vertical blankings

With this new configuration I can capture in all the sensor supported modes in
YUYV, RGB565, RGB888 and SBGGR modes with the following limitations:

- 16bpp modes works in all resolutions
- RAW 8bpp mode works for high resolutions from 1280x720 up
- RGB888 mode works for low resolutions up to 1280x720

The blankings for each mode have been adjusted to work by default at 30FPS
in YUYV/RGB565 mode, and can be adjusted to precisely obtain the desired frame
rate. Unfortunately the minimum blanking values are not documented so shrinking
them too much might hinder capture operations.

I tested the series on both i.MX6Q and i.MX8MP and I get the same results on
both platforms.

There remain two issues:

- RGB888 colors are off, both on imx6 and imx8. I tested all the RGB color
  permutations the chip can perform and I am not able to get the color
  ordering "right". It might be due to how I perform decoding or to a bug in
  the sensor manual.

- I was not able to test JPEG, which I would like to support next. If anyone
  has been able to test JPEG capture in the past and would like to share it's
  setup I would be very glad.

Are we there yet ? No, I don't think so. My main concern at the moment is that
this sensor supports -a lot- of different formats, and the pixel rates I
have fixed are compromises to a have all formats working. In example, for
640x480 I could have gone for 96MHz instead of 48. This would allow to
push the sensor up to 60FPS per second in YUYV/RGB565 mode, but would break
capturing in RGB888 mode, for which 96Mhz @24bpp is too high as a pixel rate.
-Ideally-  userspace should be able to select the pixel rate which is
ideal for the mode currently in use. The PIXEL_RATE control is however marked
as READ_ONLY by the framework, and the only alternative I'm left with is to
create per-mode pixel rates but this would make the driver a lot mode
complicated... Ideas ?

The series changes the clock tree programming for MIPI only. I have not tried
to maintain the current behaviour for parallel mode which, as far as I'm aware,
works correctly. As I cannot test parallel, I would really appreciate a
confirmation I have not broken parallel mode :)

Ah, v4l2-compliance seems happy too:
Total for device /dev/v4l-subdev3: 43, Succeeded: 43, Failed: 0, Warnings: 0

Thanks
   j

Jacopo Mondi (21):
  media: ov5640: Add pixel rate to modes
  media: ov5604: Re-arrange modes definition
  media: ov5640: Add is_mipi() function
  media: ov5640: Associate bpp with formats
  media: ov5640: Update pixel_rate and link_freq
  media: ov5640: Rework CSI-2 clock tree
  media: ov5640: Rework timings programming
  media: ov5640: Re-sort per-mode register tables
  media: ov5640: Remove ov5640_mode_init_data
  media: ov5640: Add HBLANK control
  media: ov5640: Add VBLANK control
  media: ov5640: Fix durations to comply with FPS
  media: ov5640: Initialize try format
  media: ov5640: Implement get_selection
  media: ov5640: Limit format to FPS in DVP mode only
  media: ov5640: Disable s_frame_interval in MIPI mode
  media: ov5640: Register device properties
  media: ov5640: Add RGB565_1X16 format
  media: ov5640: Add RGB888/BGR888 formats
  media: ov5640: Restrict sizes to mbus code
  media: ov5640: Adjust format to bpp in s_fmt

 drivers/media/i2c/ov5640.c | 1063 ++++++++++++++++++++++++++----------
 1 file changed, 778 insertions(+), 285 deletions(-)

--
2.35.0

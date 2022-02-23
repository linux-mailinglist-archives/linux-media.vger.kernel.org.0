Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3E34C1074
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239525AbiBWKlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiBWKlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:41:18 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7713968E
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:40:47 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 3484824000A;
        Wed, 23 Feb 2022 10:40:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 00/27] media: ov5640: Rework the clock tree programming for MIPI
Date:   Wed, 23 Feb 2022 11:40:07 +0100
Message-Id: <20220223104034.91550-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
v2:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7311

A branch for testing based on the most recent media-master is available at
https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v3

The series has now grown by 4 patches and the driver is now even larger
being the formats and the timings for DVP and CSI-2 defined separately.

Tested in CSI-2 mode with UYVY, RGB565, SBGGR and RGB24 in all supported modes.

Tested format and sizes enumeration with the new formats definition.

Tested frame rate handling:

	vblank = ( duration msec * pixe_rate MHz / htot - height)

  640x480 YUYV 15FPS (default 30 FPS)

	duration = 666666 msec
	pixel_rate = 48 Mhz
	htot = 1600
	vtot = 1999
	vblank = vtot - height = 1519

	$ v4l2-ctl -d /dev/v4l-subdev4 -c 0x009e0901=1519
	$ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
	...
	10 (2) [-] any 11 614400 B 2189.317617 2189.317629 15.244 fps ts mono/EoF
	11 (3) [-] any 12 614400 B 2189.383212 2189.383224 15.245 fps ts mono/EoF
	12 (4) [-] any 13 614400 B 2189.448810 2189.448821 15.244 fps ts mono/EoF
	13 (5) [-] any 14 614400 B 2189.514405 2189.514417 15.245 fps ts mono/EoF
	14 (6) [-] any 15 614400 B 2189.580002 2189.580015 15.245 fps ts mono/EoF
	..

  2592x1944 YUVV 15 FPS (default)
	$ yavta -f YUYV -s 2592x1944 -c100 --skip 7 /dev/video0
	...
	6 (6) [-] any 7 10077696 B 2438.377592 2438.377605 15.009 fps ts mono/EoF
	7 (7) [-] any 8 10077696 B 2438.444219 2438.444233 15.009 fps ts mono/EoF
	8 (0) [-] any 9 10077696 B 2438.510846 2438.510860 15.009 fps ts mono/EoF
	9 (1) [-] any 10 10077696 B 2438.577474 2438.577488 15.009 fps ts mono/EoF
	10 (2) [-] any 11 10077696 B 2438.644101 2438.644116 15.009 fps ts mono/EoF
	11 (3) [-] any 12 10077696 B 2438.710727 2438.710740 15.009 fps ts mono/EoF
	12 (4) [-] any 13 10077696 B 2438.777358 2438.777370 15.008 fps ts mono/EoF
	13 (5) [-] any 14 10077696 B 2438.843984 2438.843998 15.009 fps ts mono/EoF
	14 (6) [-] any 15 10077696 B 2438.910611 2438.910623 15.009 fps ts mono/EoF
	15 (7) [-] any 16 10077696 B 2438.977238 2438.977252 15.009 fps ts mono/EoF
	16 (0) [-] any 17 10077696 B 2439.043865 2439.043877 15.009 fps ts mono
	...


To enable higher FPS the LINK_FREQ control should be made writable to increase
the pixel rate

  640x480 YUYV 60 FPS (pixel_rate = 96 Mhz)

	$ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
 	...
	9 (1) [-] any 10 614400 B 57.098649 57.098667 59.995 fps ts mono/EoF
	10 (2) [-] any 11 614400 B 57.115314 57.115332 60.006 fps ts mono/EoF
	11 (3) [-] any 12 614400 B 57.131978 57.131994 60.010 fps ts mono/EoF
	12 (4) [-] any 13 614400 B 57.148645 57.148664 59.999 fps ts mono/EoF
	13 (5) [-] any 14 614400 B 57.165310 57.165328 60.006 fps ts mono/EoF
	14 (6) [-] any 15 614400 B 57.181977 57.181996 59.999 fps ts mono/EoF
	15 (7) [-] any 16 614400 B 57.198642 57.198660 60.006 fps ts mono/EoF

Changelog:

v2->v3:

- Eugen (thanks) reported regression in DVP mode :(
  To maintain the DVP timings un-changed in this version the mode definition now
  looks like

		/* 640x480 */
		.id		= OV5640_MODE_VGA_640_480,
		.dn_mode	= SUBSAMPLING,
		.pixel_rate	= OV5640_PIXEL_RATE_48M,
		.width		= 640,
		.height		= 480,
		.dvp_timings = {
			.analog_crop = {
				.left	= 0,
				.top	= 4,
				.width	= 2624,
				.height	= 1944,
			},
			.crop = {
				.left	= 16,
				.top	= 6,
				.width	= 640,
				.height	= 480,
			},
			.htot		= 1896,
			.vblank_def	= 600,
			.max_fps	= OV5640_60_FPS
		},
		.csi2_timings = {
			.analog_crop = {
				/* Feed the full valid pixel array to the ISP. */
				.left	= OV5640_PIXEL_ARRAY_LEFT,
				.top	= OV5640_PIXEL_ARRAY_TOP,
				.width	= OV5640_PIXEL_ARRAY_WIDTH,
				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
			},
			.crop = {
				/* Maintain a minimum digital crop processing margins. */
				.left	= 2,
				.top	= 4,
				.width	= 640,
				.height	= 480,
			},
			.htot		= 1600,
			.vblank_def	= 520,
		},
		.reg_data	= ov5640_setting_low_res,
		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),

  with a .dvp_timings and a .csi2_timings members to separate the two.
  Is it nice ? No it's not, but it should help maintaining DVP users happy.

  Eugen: if you are willing to run another test round to confirm if this version
  does not regress DVP it would be great :)

- Split image formats between CSI-2 and DVP
- Remove RGB888 as per the CSIS discussion with Laurent
- Removed register tables for modes < 720 as they're all equal
- Minor fixes on Laurent's comments
- Add Adam's tag

v1 -> v2:
- rework the modes definition to process the full pixel array
- rework get_selection to report the correct BOUND and DEFAULT targets
- implement init_cfg
- minor style changes as suggested by Laurent
- test with 1 data lane

Jacopo Mondi (27):
  media: ov5640: Add pixel rate to modes
  media: ov5604: Re-arrange modes definition
  media: ov5640: Add ov5640_is_csi2() function
  media: ov5640: Associate bpp with formats
  media: ov5640: Add LINK_FREQ control
  media: ov5640: Update pixel_rate and link_freq
  media: ov5640: Rework CSI-2 clock tree
  media: ov5640: Rework timings programming
  media: ov5640: Fix 720x480 in RGB888 mode
  media: ov5640: Split DVP and CSI-2 timings
  media: ov5640: Provide timings accessor
  media: ov5640: Re-sort per-mode register tables
  media: ov5640: Remove duplicated mode settings
  media: ov5640: Remove ov5640_mode_init_data
  media: ov5640: Add HBLANK control
  media: ov5640: Add VBLANK control
  media: ov5640: Change CSI-2 timings to comply with FPS
  media: ov5640: Implement init_cfg
  media: ov5640: Implement get_selection
  media: ov5640: Limit frame_interval to DVP mode only
  media: ov5640: Register device properties
  media: ov5640: Add RGB565_1X16 format
  media: ov5640: Add BGR888 formats
  media: ov5640: Restrict sizes to mbus code
  media: ov5640: Adjust format to bpp in s_fmt
  media: ov5640: Split DVP and CSI-2 formats
  media: ov5640: Move format mux config in format

 drivers/media/i2c/ov5640.c | 1619 ++++++++++++++++++++++++++----------
 1 file changed, 1157 insertions(+), 462 deletions(-)

--
2.35.0


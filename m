Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA204B0BAF
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbiBJLCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:02:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240434AbiBJLCu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:02:50 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16EC1B6B
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:02:48 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0427C2000B;
        Thu, 10 Feb 2022 11:02:42 +0000 (UTC)
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
Subject: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming for MIPI
Date:   Thu, 10 Feb 2022 12:03:07 +0100
Message-Id: <20220210110330.152352-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7249

A branch for testing based on the most recent media-master is available at
https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2

If anyone with a DVP setup could verify I have not broken their use case
I would very much appreciate that :)

v1 -> v2:
- rework the modes definition to process the full pixel array
- rework get_selection to report the correct BOUND and DEFAULT targets
- implement init_cfg
- minor style changes as suggested by Laurent
- test with 1 data lane

Thanks
   j

Jacopo Mondi (23):
  media: ov5640: Add pixel rate to modes
  media: ov5604: Re-arrange modes definition
  media: ov5640: Add ov5640_is_csi2() function
  media: ov5640: Associate bpp with formats
  media: ov5640: Add LINK_FREQ control
  media: ov5640: Update pixel_rate and link_freq
  media: ov5640: Rework CSI-2 clock tree
  media: ov5640: Rework timings programming
  media: ov5640: Fix 720x480 in RGB888 mode
  media: ov5640: Rework analog crop rectangles
  media: ov5640: Re-sort per-mode register tables
  media: ov5640: Remove ov5640_mode_init_data
  media: ov5640: Add HBLANK control
  media: ov5640: Add VBLANK control
  media: ov5640: Fix durations to comply with FPS
  media: ov5640: Implement init_cfg
  media: ov5640: Implement get_selection
  media: ov5640: Limit frame_interval to DVP mode only
  media: ov5640: Register device properties
  media: ov5640: Add RGB565_1X16 format
  media: ov5640: Add RGB888/BGR888 formats
  media: ov5640: Restrict sizes to mbus code
  media: ov5640: Adjust format to bpp in s_fmt

 drivers/media/i2c/ov5640.c | 1143 ++++++++++++++++++++++++++----------
 1 file changed, 830 insertions(+), 313 deletions(-)

--
2.35.0


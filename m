Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2A2526381
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbiEMOOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiEMOOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:14:25 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88190DF24
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:14:24 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5989F10000D;
        Fri, 13 May 2022 14:14:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 00/28] media: ov5640: Rework the clock tree programming for MIPI
Date:   Fri, 13 May 2022 16:13:48 +0200
Message-Id: <20220513141416.120552-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro, Sakari,

  this v7 is just to fix a warning on patch [4/28] by moving
ov5640_code_to_bpp() to [6/28] where it is first used. Sorry for not addressing
the warning earlier and for not building with -Werror=unused-function

https://lore.kernel.org/linux-media/20220513151908.60c01b50@coco.lan/T/#u

Reduce the receivers list as this version only serves as a base for a new
pull request.

Thanks
   j

Hugues Fruchet (1):
  media: ov5640: Adjust vblank with s_frame_interval

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
  media: ov5640: Remove frame rate check from find_mode()
  media: ov5640: Change CSI-2 timings to comply with FPS
  media: ov5640: Implement init_cfg
  media: ov5640: Implement get_selection
  media: ov5640: Register device properties
  media: ov5640: Add RGB565_1X16 format
  media: ov5640: Add BGR888 format
  media: ov5640: Restrict sizes to mbus code
  media: ov5640: Adjust format to bpp in s_fmt
  media: ov5640: Split DVP and CSI-2 formats
  media: ov5640: Move format mux config in format

 drivers/media/i2c/ov5640.c | 1650 ++++++++++++++++++++++++++----------
 1 file changed, 1188 insertions(+), 462 deletions(-)

--
2.35.1


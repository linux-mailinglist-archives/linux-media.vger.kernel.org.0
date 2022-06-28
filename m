Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C848155E37E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbiF1MGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbiF1MGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:06:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4343334F
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:05:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A6A560EFD
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D6FC3411D;
        Tue, 28 Jun 2022 12:05:24 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH 0/8] Add dynamic arrays and v4l2_ctrl_modify_dimensions
Date:   Tue, 28 Jun 2022 14:05:15 +0200
Message-Id: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for dynamic array controls and for a
new v4l2_ctrl_modify_dimensions() function to modify the dimensions
of an array control by the driver.

The dynamic array patches are unchanged and are already used in two
patch series (stateless HEVC uAPI and the dw100 driver), but they are
added here since the last 5 patches that add support for
v4l2_ctrl_modify_dimensions() build on those.

The vivid driver is also extended with such controls to make it
possible to test this.

Xavier, the v4l2_ctrl_modify_dimensions() are mostly identical to
the patches I mailed you before and that you added to v6 of dw100.
Just improved documentation and commit logs and a minor checkpatch
fix. For a v7 of your driver, please use this series.

Regards,

	Hans

Hans Verkuil (8):
  videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
  v4l2-ctrls: add support for dynamically allocated arrays.
  vivid: add dynamic array test control
  v4l2-ctrls: allocate space for arrays
  v4l2-ctrls: alloc arrays in ctrl_ref
  v4l2-ctrls: add v4l2_ctrl_modify_dimensions
  v4l2-ctrls: add change flag for when dimensions change
  vivid: add pixel_array test control

 .../media/v4l/vidioc-dqevent.rst              |   5 +
 .../media/v4l/vidioc-queryctrl.rst            |   8 +
 .../media/videodev2.h.rst.exceptions          |   2 +
 drivers/media/test-drivers/vivid/vivid-core.h |   1 +
 .../media/test-drivers/vivid/vivid-ctrls.c    |  29 +++
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   4 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 139 ++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 188 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
 include/media/v4l2-ctrls.h                    |  90 ++++++++-
 include/uapi/linux/videodev2.h                |   2 +
 12 files changed, 413 insertions(+), 71 deletions(-)

-- 
2.35.1


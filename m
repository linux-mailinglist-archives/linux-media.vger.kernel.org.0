Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF52156FFBF
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 13:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiGKLMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 07:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiGKLL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 07:11:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2AA32D86
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 03:21:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 318EFB80E7F
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 10:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28451C34115;
        Mon, 11 Jul 2022 10:21:12 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 0/8] Add dynamic arrays and v4l2_ctrl_modify_dimensions
Date:   Mon, 11 Jul 2022 12:21:03 +0200
Message-Id: <20220711102111.2688139-1-hverkuil-cisco@xs4all.nl>
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

The three dynamic array patches are identical to those used in the
stateless HEVC uAPI patches and are part of this pull request:

https://patchwork.linuxtv.org/project/linux-media/patch/8409c576-e2f3-489a-23df-dc16386aac13@xs4all.nl/

The remaining five patches build on those and add support for
v4l2_ctrl_modify_dimensions().

Note that patch 7 is one that I strongly believe is needed since
it adds no overhead and there is no other way to inform userspace
that the dimensions have changed. But if this is truly deemed
unacceptable, then it can be dropped.

Changes since v1:

- patch 6/8: simplify elems calculation, use cur2new to copy
  the updated current value to the new value (uses a memcpy
  internally), add missing lockdep_assert_held(), improve
  function description, call send_event to indicate that
  the current value has changed.

- patch 7/8: this just adds the new control flag since the
  send_event call is now added in the previous patch.

- patch 8/8: downsample the resolution to speed up
  vivid_update_format_cap().

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
 drivers/media/test-drivers/vivid/vivid-core.h |   5 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  29 +++
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   4 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 140 ++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 188 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
 include/media/v4l2-ctrls.h                    |  94 ++++++++-
 include/uapi/linux/videodev2.h                |   2 +
 12 files changed, 421 insertions(+), 72 deletions(-)

-- 
2.35.1


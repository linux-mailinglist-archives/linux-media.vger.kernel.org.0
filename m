Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A3A56C3DD
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 01:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239318AbiGHSyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 14:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239305AbiGHSyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 14:54:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA42218E06
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 11:54:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60581B80522
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 18:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F343C341C0;
        Fri,  8 Jul 2022 18:54:48 +0000 (UTC)
Message-ID: <8409c576-e2f3-489a-23df-dc16386aac13@xs4all.nl>
Date:   Fri, 8 Jul 2022 20:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Move HEVC stateless controls out of staging
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks to the hard work of Benjamin, Jernej, Ezequiel and Nicolas this series
finally moves the HEVC stateless codec public API out of staging and into
mainline. This makes it possible for several codec drivers in staging to
move to mainline as well in the very near future (5.21?).

This is a major milestone for V4L2 codec support and it was, as always,
a pleasure working with all of you on this!

Regards,

	Hans

The following changes since commit e670f5d672ef3d00b0b8c69eff09a019e6dd4ef9:

  media: amphion: only insert the first sequence startcode for vc1l format (2022-07-08 18:18:49 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20h

for you to fetch changes up to 444d22d2cd9386472e1ca823487f3be544f87576:

  media: uapi: move HEVC stateless controls out of staging (2022-07-08 20:09:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (14):
      media: uapi: HEVC: Add missing fields in HEVC controls
      media: uapi: HEVC: Rename HEVC stateless controls with STATELESS prefix
      media: uapi: HEVC: Change pic_order_cnt definition in v4l2_hevc_dpb_entry
      media: uapi: HEVC: Add SEI pic struct flags
      media: uapi: HEVC: Add documentation to uAPI structure
      media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a dynamic array
      media: uapi: Move parsed HEVC pixel format out of staging
      media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
      media: uapi: Move the HEVC stateless control type out of staging
      media: controls: Log HEVC stateless control in .std_log
      media: hantro: Stop using Hantro dedicated control
      media: uapi: HEVC: fix padding in v4l2 control structures
      media: uapi: Change data_bit_offset definition
      media: uapi: move HEVC stateless controls out of staging

Hans Verkuil (3):
      videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
      v4l2-ctrls: add support for dynamically allocated arrays.
      vivid: add dynamic array test control

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 902 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 780 -----------------------------------------------------
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |   7 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |  20 ++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   8 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |   6 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c                      |  15 ++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                            | 103 +++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           | 212 +++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                           |  38 +--
 drivers/media/v4l2-core/v4l2-ctrls-priv.h                           |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c                        |  13 +-
 drivers/staging/media/hantro/hantro_drv.c                           |  62 +----
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c                   |  44 ++-
 drivers/staging/media/hantro/hantro_hevc.c                          |  10 +-
 drivers/staging/media/hantro/hantro_hw.h                            |   4 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                         |  26 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                     |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                    |  23 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                   |   1 -
 include/media/hevc-ctrls.h                                          | 250 -----------------
 include/media/v4l2-ctrls.h                                          |  48 +++-
 include/uapi/linux/v4l2-controls.h                                  | 459 ++++++++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h                                      |  13 +
 24 files changed, 1831 insertions(+), 1226 deletions(-)
 delete mode 100644 include/media/hevc-ctrls.h

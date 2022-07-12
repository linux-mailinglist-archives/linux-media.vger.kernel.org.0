Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9D857190F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 13:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiGLLyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 07:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbiGLLxo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 07:53:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C56B521D
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 04:52:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5C7D6155D
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 11:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B73BC3411C;
        Tue, 12 Jul 2022 11:52:41 +0000 (UTC)
Message-ID: <55858df1-6d8a-befe-5301-809665b9f2e3@xs4all.nl>
Date:   Tue, 12 Jul 2022 13:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] hantro/cedrus/vb2 updates
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>
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

This PR sits on top of the stateless HEVC uAPI series:

https://patchwork.linuxtv.org/project/linux-media/patch/8409c576-e2f3-489a-23df-dc16386aac13@xs4all.nl/

This series adds hantro 10 bit encoding, various cedrus fixes (patches 1-4
of this series: https://patchwork.linuxtv.org/project/linux-media/list/?series=8237),
and the series replacing vb2_find_timestamp with vb2_find_buffer.

Note that patch 5 of the cedrus series needs more work, which is why I skipped
patches 5-7 for now.

Regards,

	Hans

The following changes since commit 444d22d2cd9386472e1ca823487f3be544f87576:

  media: uapi: move HEVC stateless controls out of staging (2022-07-08 20:09:00 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20j

for you to fetch changes up to 8faa98fb0e80223d43c96693fd8e011ebb47545b:

  videobuf2: Remove vb2_find_timestamp() (2022-07-12 13:42:24 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (9):
      media: Add P010 tiled format
      videobuf2: Introduce vb2_find_buffer()
      mediatek: vcodec: Use vb2_find_buffer
      tegra-vde: Use vb2_find_buffer
      vicodec: Use vb2_find_buffer
      hantro: Use vb2_find_buffer
      rkvdec: Use vb2_find_buffer
      cedrus: Use vb2_find_buffer
      videobuf2: Remove vb2_find_timestamp()

Jernej Skrabec (10):
      media: hantro: Support format filtering by depth
      media: hantro: postproc: Fix buffer size calculation
      media: hantro: postproc: Fix legacy regs configuration
      media: hantro: postproc: Properly calculate chroma offset
      media: hantro: Store VP9 bit depth in context
      media: hantro: sunxi: Enable 10-bit decoding
      media: cedrus: h265: Fix flag name
      media: cedrus: h265: Fix logic for not low delay flag
      media: cedrus: Improve error messages for controls
      media: cedrus: Add error handling for failed setup

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst        | 18 +++++++++++++++---
 drivers/media/common/videobuf2/videobuf2-v4l2.c                    | 11 +++++------
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c |  7 +++----
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c      |  7 +++----
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  |  8 ++++----
 drivers/media/platform/nvidia/tegra-vde/h264.c                     |  9 ++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c                  |  8 ++------
 drivers/media/v4l2-core/v4l2-common.c                              |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                               |  1 +
 drivers/staging/media/hantro/hantro.h                              |  4 ++++
 drivers/staging/media/hantro/hantro_drv.c                          | 29 +++++++++++++++++++++++++----
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c                   | 18 +++++-------------
 drivers/staging/media/hantro/hantro_postproc.c                     | 38 ++++++++++++++++++++++++++++++--------
 drivers/staging/media/hantro/hantro_v4l2.c                         | 50 ++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/staging/media/hantro/hantro_v4l2.h                         |  3 +++
 drivers/staging/media/hantro/sunxi_vpu_hw.c                        | 27 +++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-h264.c                         | 41 ++++++++++++++---------------------------
 drivers/staging/media/rkvdec/rkvdec-vp9.c                          | 10 +++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.c                        |  7 +++++--
 drivers/staging/media/sunxi/cedrus/cedrus.h                        | 26 +++++++++++++++-----------
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                    | 23 +++++++++++++++++------
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                   | 21 +++++++++++----------
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                   | 53 ++++++++++++++++++++++++++++++++++++++++-------------
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c                  | 32 +++++++++++---------------------
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h                   |  3 +--
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c                    | 48 +++++++++++-------------------------------------
 include/media/videobuf2-v4l2.h                                     | 12 +++---------
 include/uapi/linux/videodev2.h                                     |  1 +
 28 files changed, 312 insertions(+), 204 deletions(-)

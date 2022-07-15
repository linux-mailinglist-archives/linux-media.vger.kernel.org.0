Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9C1576406
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiGOPDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbiGOPDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:03:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79ED7BE1A
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:03:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7319961FD8
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 15:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BE0C34115;
        Fri, 15 Jul 2022 15:03:28 +0000 (UTC)
Message-ID: <7b7eb926-9600-0116-b983-bc18613e7674@xs4all.nl>
Date:   Fri, 15 Jul 2022 17:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] v3: hantro/cedrus/vb2 updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR sits on top of the stateless HEVC uAPI series:

https://patchwork.linuxtv.org/project/linux-media/patch/8409c576-e2f3-489a-23df-dc16386aac13@xs4all.nl/

This series adds hantro 10 bit encoding, various cedrus fixes,
and the series replacing vb2_find_timestamp with vb2_find_buffer.

Changes since v2: dropped "cedrus: Use vb2_find_buffer" and
"videobuf2: Remove vb2_find_timestamp()" since the first cedrus patch introduced
a regression. This can be added later.

Changes since v1: added the last three patches of the cedrus series
(https://patchwork.linuxtv.org/project/linux-media/list/?series=8237) after
Ezequiel reviewed those as well.

Regards,

	Hans

The following changes since commit bb0b9dfa3ba6b403d2f8ce39a024668e6b6e63c7:

  media: uapi: move HEVC stateless controls out of staging (2022-07-15 16:49:13 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20j

for you to fetch changes up to 185b34bc5169424c65f3e7aa742cb96f955ebe42:

  rkvdec: Use vb2_find_buffer (2022-07-15 16:49:14 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (7):
      media: Add P010 tiled format
      videobuf2: Introduce vb2_find_buffer()
      mediatek: vcodec: Use vb2_find_buffer
      tegra-vde: Use vb2_find_buffer
      vicodec: Use vb2_find_buffer
      hantro: Use vb2_find_buffer
      rkvdec: Use vb2_find_buffer

Jernej Skrabec (13):
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
      media: cedrus: h265: Add a couple of error checks
      media: cedrus: Add helper for determining number of elements
      media: cedrus: h265: Implement support for tiles

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst        |  18 ++++++--
 drivers/media/common/videobuf2/videobuf2-v4l2.c                    |  12 +++++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c |   7 ++-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c      |   7 ++-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  |   8 ++--
 drivers/media/platform/nvidia/tegra-vde/h264.c                     |   9 ++--
 drivers/media/test-drivers/vicodec/vicodec-core.c                  |   8 +---
 drivers/media/v4l2-core/v4l2-common.c                              |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                               |   1 +
 drivers/staging/media/hantro/hantro.h                              |   4 ++
 drivers/staging/media/hantro/hantro_drv.c                          |  29 ++++++++++--
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c                   |  18 +++-----
 drivers/staging/media/hantro/hantro_postproc.c                     |  38 ++++++++++++----
 drivers/staging/media/hantro/hantro_v4l2.c                         |  50 +++++++++++++++++++--
 drivers/staging/media/hantro/hantro_v4l2.h                         |   3 ++
 drivers/staging/media/hantro/sunxi_vpu_hw.c                        |  27 +++++++++++
 drivers/staging/media/rkvdec/rkvdec-h264.c                         |  41 ++++++-----------
 drivers/staging/media/rkvdec/rkvdec-vp9.c                          |  10 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c                        |  28 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h                        |   7 ++-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                    |  27 ++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                   |   5 ++-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                   | 154 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c                  |   4 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h                   |   3 +-
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c                    |   5 ++-
 include/media/videobuf2-v4l2.h                                     |  10 +++++
 include/uapi/linux/videodev2.h                                     |   1 +
 28 files changed, 421 insertions(+), 114 deletions(-)

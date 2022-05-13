Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF90526C4D
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 23:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbiEMV0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 17:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384670AbiEMVZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 17:25:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA71FE3
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 14:25:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AF9E1B831D8
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 21:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1AAC34100;
        Fri, 13 May 2022 21:25:49 +0000 (UTC)
Message-ID: <52f2537f-2151-f2cf-dcf4-949849812f8a@xs4all.nl>
Date:   Fri, 13 May 2022 23:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>, jonas@kwiboo.se
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] H.264 Field Decoding Support for Frame-based
 Decoders
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

This PR is of the v5 patch series "H.264 Field Decoding Support for Frame-based Decoders"

Regards,

	Hans

The following changes since commit 4a18d21649f4f34e79a16c635e5df48cebb82e1f:

  media: h264: Avoid wrapping long_term_frame_idx (2022-05-13 14:59:54 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19f

for you to fetch changes up to fcd1effef6706fd66e2400601ecb52899d5f51e9:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-13 22:57:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jonas Karlman (5):
      media: rkvdec: h264: Fix bit depth wrap in pps packet
      media: rkvdec: h264: Validate and use pic width and height in mbs
      media: rkvdec: h264: Fix reference frame_num wrap for second field
      media: rkvdec: Ensure decoded resolution fit coded resolution
      media: hantro: h264: Make dpb entry management more robust

Nicolas Dufresne (15):
      media: h264: Use v4l2_h264_reference for reflist
      media: h264: Increase reference lists size to 32
      media: h264: Store current picture fields
      media: h264: Store all fields into the unordered list
      media: v4l2: Trace calculated p/b0/b1 initial reflist
      media: h264: Sort p/b reflist using frame_num
      media: v4l2: Reorder field reflist
      media: rkvdec: Stop overclocking the decoder
      media: rkvdec: h264: Fix dpb_valid implementation
      media: rkvdec: Move H264 SPS validation in rkvdec-h264
      media: rkvdec-h264: Add field decoding support
      media: rkvdec: Enable capture buffer holding for H264
      media: hantro: Stop using H.264 parameter pic_num
      media: hantro: Add H.264 field decoding support
      media: hantro: Enable HOLD_CAPTURE_BUF for H.264

 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c   |  21 +++-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h   |  11 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c       |  15 ++-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c |  27 +++--
 drivers/media/platform/nvidia/tegra-vde/h264.c                       |  19 ++--
 drivers/media/v4l2-core/v4l2-h264.c                                  | 271 ++++++++++++++++++++++++++++++++++++--------
 drivers/staging/media/hantro/hantro_g1_h264_dec.c                    |  38 +++----
 drivers/staging/media/hantro/hantro_h264.c                           | 134 ++++++++++++++++++----
 drivers/staging/media/hantro/hantro_hw.h                             |   8 +-
 drivers/staging/media/hantro/hantro_v4l2.c                           |  25 ++++
 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c             |  98 ++++++++--------
 drivers/staging/media/rkvdec/rkvdec-h264.c                           | 157 ++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.c                                |  35 ++----
 drivers/staging/media/rkvdec/rkvdec.h                                |   2 +
 include/media/v4l2-h264.h                                            |  31 ++---
 15 files changed, 646 insertions(+), 246 deletions(-)

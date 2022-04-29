Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7A351422D
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 08:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354414AbiD2GKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Apr 2022 02:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241040AbiD2GKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Apr 2022 02:10:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FF7BF79
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 23:07:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6823161BC5
        for <linux-media@vger.kernel.org>; Fri, 29 Apr 2022 06:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4632FC385A4;
        Fri, 29 Apr 2022 06:07:20 +0000 (UTC)
Message-ID: <5ac6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl>
Date:   Fri, 29 Apr 2022 08:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] H.264 Field Decoding Support for Frame-based
 Decoders
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

This PR contains this Nicolas' v4 patch series:

https://patchwork.linuxtv.org/project/linux-media/patch/20220426125751.108293-2-nicolas.dufresne@collabora.com/

except for patch 03/24 ("media: videobuf2-v4l2: Warn on holding buffers without support")
which needs more work. It's independent of the other patches though, so that can be
done later.

Regards,

	Hans

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19f

for you to fetch changes up to 837f4cd1ceefa0e52631da3df382ed495784c290:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-04-28 10:55:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jonas Karlman (5):
      media: rkvdec: h264: Fix bit depth wrap in pps packet
      media: rkvdec: h264: Validate and use pic width and height in mbs
      media: rkvdec: h264: Fix reference frame_num wrap for second field
      media: rkvdec: Ensure decoded resolution fit coded resolution
      media: hantro: h264: Make dpb entry management more robust

Nicolas Dufresne (18):
      media: doc: Document dual use of H.264 pic_num/frame_num
      media: v4l2-mem2mem: Trace on implicit un-hold
      media: h264: Avoid wrapping long_term_frame_idx
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

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |  10 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c      |  36 +++++--
 drivers/media/platform/nvidia/tegra-vde/h264.c                      |  19 ++--
 drivers/media/v4l2-core/v4l2-h264.c                                 | 275 ++++++++++++++++++++++++++++++++++++++++++---------
 drivers/media/v4l2-core/v4l2-mem2mem.c                              |   1 +
 drivers/staging/media/hantro/hantro_g1_h264_dec.c                   |  38 +++----
 drivers/staging/media/hantro/hantro_h264.c                          | 134 ++++++++++++++++++++-----
 drivers/staging/media/hantro/hantro_hw.h                            |   8 +-
 drivers/staging/media/hantro/hantro_v4l2.c                          |  25 +++++
 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c            |  98 +++++++++---------
 drivers/staging/media/rkvdec/rkvdec-h264.c                          | 157 +++++++++++++++++++++--------
 drivers/staging/media/rkvdec/rkvdec.c                               |  35 +++----
 drivers/staging/media/rkvdec/rkvdec.h                               |   2 +
 include/media/v4l2-h264.h                                           |  31 +++---
 14 files changed, 634 insertions(+), 235 deletions(-)

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056DC525E51
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 11:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378578AbiEMIrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 04:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378582AbiEMIrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 04:47:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F13849F11
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 01:46:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B1F762112
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 08:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB99FC34100;
        Fri, 13 May 2022 08:46:57 +0000 (UTC)
Message-ID: <68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl>
Date:   Fri, 13 May 2022 10:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>, jonas@kwiboo.se
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] v2: H.264 Field Decoding Support for Frame-based
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

This PR contains this Nicolas' v4 patch series:

https://patchwork.linuxtv.org/project/linux-media/patch/20220426125751.108293-2-nicolas.dufresne@collabora.com/

except for patch 03/24 ("media: videobuf2-v4l2: Warn on holding buffers without support")
which needs more work. It's independent of the other patches though, so that can be
done later.

Regards,

	Hans

Changes since v1:

- patch "Use v4l2_h264_reference for reflist" failed to compile: the tegra-vde change used
  a field that was only added 3 patches later ("Store all fields into the unordered list").
  Keep the old field and only update it in the later patch.


The following changes since commit 02970914dbc7152d6de615127261e778ef425a09:

  media: amphion: ensure the buffer count is not less than min_buffer (2022-05-13 10:05:09 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19f

for you to fetch changes up to 57ee62e3da43e55fe7a83115bc941e9c84b2cd1f:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-13 10:42:24 +0200)

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
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c      |  36 ++++--
 drivers/media/platform/nvidia/tegra-vde/h264.c                      |  19 ++--
 drivers/media/v4l2-core/v4l2-h264.c                                 | 275 +++++++++++++++++++++++++++++++++++++--------
 drivers/media/v4l2-core/v4l2-mem2mem.c                              |   1 +
 drivers/staging/media/hantro/hantro_g1_h264_dec.c                   |  38 +++----
 drivers/staging/media/hantro/hantro_h264.c                          | 134 ++++++++++++++++++----
 drivers/staging/media/hantro/hantro_hw.h                            |   8 +-
 drivers/staging/media/hantro/hantro_v4l2.c                          |  25 +++++
 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c            |  98 ++++++++--------
 drivers/staging/media/rkvdec/rkvdec-h264.c                          | 157 +++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.c                               |  35 ++----
 drivers/staging/media/rkvdec/rkvdec.h                               |   2 +
 include/media/v4l2-h264.h                                           |  31 ++---
 14 files changed, 634 insertions(+), 235 deletions(-)

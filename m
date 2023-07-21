Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413BA75C56F
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 13:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjGULIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 07:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjGULHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 07:07:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D5246B2
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 04:04:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD9F360B9B
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 11:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259A3C433CA;
        Fri, 21 Jul 2023 11:04:04 +0000 (UTC)
Message-ID: <540fbe91-5dc4-1c75-379d-1ff89669ba96@xs4all.nl>
Date:   Fri, 21 Jul 2023 13:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Juerg Haefliger <juergh@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Zheng Wang <zyytlz.wz@163.com>,
        Emma Christy <emma.t.christy@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Various codec fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6e

for you to fetch changes up to 9c2d629e7ea3d5c5d5c1203b3aaa9807053d0c7d:

  media: amphion: ensure the bitops don't cross boundaries (2023-07-21 12:27:38 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: rkvdec: increase max supported height for H.264

Chen-Yu Tsai (1):
      media: mtk-jpeg: Set platform driver data earlier

Emma Christy (1):
      media: rkvdec: removed redundant blank line

Juerg Haefliger (1):
      media: meson: vdec: Add MODULE_FIRMWARE macro

Michael Tretter (1):
      media: verisilicon: Fix TRY_FMT on encoder OUTPUT

Ming Qian (8):
      media: amphion: reinit vpu if reqbufs output 0
      media: amphion: add helper function to get id name
      media: amphion: decoder support display delay for all formats
      media: amphion: fix CHECKED_RETURN issues reported by coverity
      media: amphion: fix REVERSE_INULL issues reported by coverity
      media: amphion: fix UNINIT issues reported by coverity
      media: amphion: fix UNUSED_VALUE issue reported by coverity
      media: amphion: ensure the bitops don't cross boundaries

Zheng Wang (1):
      media: mtk-jpeg: Fix use after free bug due to uncanceled work

 drivers/media/platform/amphion/vdec.c                | 41 ++++++++++++++++++++++++---------
 drivers/media/platform/amphion/venc.c                |  6 +++--
 drivers/media/platform/amphion/vpu.h                 |  3 +++
 drivers/media/platform/amphion/vpu_cmds.c            | 16 +++++++------
 drivers/media/platform/amphion/vpu_core.c            |  2 ++
 drivers/media/platform/amphion/vpu_dbg.c             | 17 +++++++++-----
 drivers/media/platform/amphion/vpu_helpers.c         | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_msgs.c            | 14 ++++++------
 drivers/media/platform/amphion/vpu_v4l2.c            |  7 +++++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  5 +++--
 drivers/media/platform/verisilicon/hantro_v4l2.c     |  9 ++++++--
 drivers/staging/media/meson/vdec/vdec_platform.c     |  9 ++++++++
 drivers/staging/media/rkvdec/rkvdec-vp9.c            |  1 -
 drivers/staging/media/rkvdec/rkvdec.c                |  2 +-
 14 files changed, 155 insertions(+), 38 deletions(-)

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F3075EC23
	for <lists+linux-media@lfdr.de>; Mon, 24 Jul 2023 09:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjGXHCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jul 2023 03:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGXHCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jul 2023 03:02:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C28FD
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 00:02:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2FB5B60F53
        for <linux-media@vger.kernel.org>; Mon, 24 Jul 2023 07:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58089C433C7;
        Mon, 24 Jul 2023 07:02:12 +0000 (UTC)
Message-ID: <5ab854c2-456c-e033-b5f4-63669ac6229e@xs4all.nl>
Date:   Mon, 24 Jul 2023 09:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Juerg Haefliger <juergh@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Zheng Wang <zyytlz.wz@163.com>,
        Emma Christy <emma.t.christy@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] v2: Various codec fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:

Dropped Chen-Yu Tsai's patch: that has to go to v6.5 as a fix. A separate PR was posted for that one.

Regards,

	Hans

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6e

for you to fetch changes up to 3db879dc9088d6c6d12db4c44230d0bb3916d7af:

  media: amphion: ensure the bitops don't cross boundaries (2023-07-24 08:54:24 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: rkvdec: increase max supported height for H.264

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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  1 +
 drivers/media/platform/verisilicon/hantro_v4l2.c     |  9 ++++++--
 drivers/staging/media/meson/vdec/vdec_platform.c     |  9 ++++++++
 drivers/staging/media/rkvdec/rkvdec-vp9.c            |  1 -
 drivers/staging/media/rkvdec/rkvdec.c                |  2 +-
 14 files changed, 153 insertions(+), 36 deletions(-)

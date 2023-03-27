Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A56E6C9CB8
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjC0Hsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbjC0Hs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:48:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F1A2D73
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:48:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 45F5EB80E9F
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 07:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A446C43443;
        Mon, 27 Mar 2023 07:48:13 +0000 (UTC)
Message-ID: <27b81968-54ad-0203-9ea5-3f2615dba02e@xs4all.nl>
Date:   Mon, 27 Mar 2023 09:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Moudy Ho <moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] mtk-mdp3: Add support for multiple chips
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4k

for you to fetch changes up to 5ec2eafcda3c60ddf695a988e220e80b57031859:

  media: platform: mtk-mdp3: reconfigure shared memory (2023-03-27 09:28:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Moudy Ho (12):
      media: platform: mtk-mdp3: fix potential frame size overflow in mdp_try_fmt_mplane()
      media: platform: mtk-mdp3: add files for chip configuration
      media: platform: mtk-mdp3: chip config split about component settings
      media: platform: mtk-mdp3: chip config split about subcomponents
      media: platform: mtk-mdp3: chip config split about color format
      media: platform: mtk-mdp3: chip config split about resolution limitations
      media: platform: mtk-mdp3: chip config split about pipe info
      media: platform: mtk-mdp3: extend mdp_color format for compressed mode
      media: platform: mtk-mdp3: dynamically allocate component clocks
      media: platform: mtk-mdp3: Split general definitions used in MDP3
      media: platform: mtk-mdp3: decompose hardware-related information in shared memory
      media: platform: mtk-mdp3: reconfigure shared memory

 drivers/media/platform/mediatek/mdp3/Makefile        |   2 +-
 drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c  | 453 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8183.h | 144 ++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h   | 189 +++---------------------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h  |  20 +++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 148 +++++++++++++------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 539 ++++++++++++++++++++++++++++++++++++++++++++------------------------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h |  24 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c |  48 ++----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  18 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  28 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h  |   1 -
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c | 293 ++++---------------------------------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h | 214 +++++++++++++--------------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h |  53 +++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 193 +++++++++++-------------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h  |  29 +---
 17 files changed, 1429 insertions(+), 967 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8183.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h

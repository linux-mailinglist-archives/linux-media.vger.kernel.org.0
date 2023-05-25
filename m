Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD4B710E8E
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241402AbjEYOtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241137AbjEYOtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:49:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B71101
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:49:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EE0F6463B
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 14:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E8FC433D2;
        Thu, 25 May 2023 14:49:18 +0000 (UTC)
Message-ID: <461a0eca-06b2-12ce-1585-9f7259199241@xs4all.nl>
Date:   Thu, 25 May 2023 16:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Artur Weber <aweber.kernel@gmail.com>,
        "Gustavo A. R. Silva" <garsilva@embeddedor.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.5] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 11aaa0ec9c1848bb68df9c7e6eedab6d5b0a3cca:

  media: sti: c8sectpfe: drop of_match_ptr() to avoid unused variables (2023-05-25 16:21:23 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5g

for you to fetch changes up to 2f9583bf1a127a1267ad6c87999f5c7f3dd32c45:

  media: video-mux: update driver to active state (2023-05-25 16:36:26 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Artur Weber (1):
      media: Revert "media: exynos4-is: Remove dependency on obsolete SoC support"

Gustavo A. R. Silva (1):
      media: pci: cx18-av-vbi: Replace one-element array with flexible-array member

Philipp Zabel (2):
      media: video-mux: fix error paths
      media: video-mux: update driver to active state

Uwe Kleine-König (1):
      media: staging: max96712: Switch i2c driver back to use .probe()

Yunfei Dong (4):
      media: mediatek: vcodec: Avoid unneeded error logging
      media: mediatek: vcodec: using decoder status instead of core work count
      media: mediatek: vcodec: move core context from device to each instance
      media: mediatek: vcodec: using empty lat buffer as the last one

 drivers/media/pci/cx18/cx18-av-vbi.c                                 |   2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c          |   1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    |   2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h              |   2 -
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c |   6 +--
 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c |   4 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c    |   4 +-
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c              | 105 ++++++++++++++++-----------------------
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h              |  28 +++++++++--
 drivers/media/platform/samsung/exynos4-is/Kconfig                    |   2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-core.c                |   2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c                |   2 +-
 drivers/media/platform/video-mux.c                                   | 105 ++++++++++++++++-----------------------
 drivers/staging/media/max96712/max96712.c                            |   2 +-
 14 files changed, 124 insertions(+), 143 deletions(-)

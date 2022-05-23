Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5BF530B7A
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 11:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiEWIPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 04:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiEWIPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 04:15:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180241A061
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 01:15:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAFDE61245
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 08:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B79C385AA;
        Mon, 23 May 2022 08:15:40 +0000 (UTC)
Message-ID: <57e928c0-7ace-1776-4232-14a064fc4be8@xs4all.nl>
Date:   Mon, 23 May 2022 10:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Add support for mt8195 + mt8186 vp9 support
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

The following changes since commit 340ce50f75a6bdfe6d1850ca49ef37a8e2765dd1:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-17 10:11:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20b

for you to fetch changes up to a5fde239bf6b038c1ac2e7a72b7c240c32185589:

  media: mediatek: vcodec: Add to support H264 inner racing mode (2022-05-23 09:48:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Yunfei Dong (8):
      media: mediatek: vcodec: add vp9 decoder driver for mt8186
      dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat soc
      media: mediatek: vcodec: Add to support lat soc hardware
      dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for mt8195
      media: mediatek: vcodec: Adds compatible for mt8195
      media: mediatek: vcodec: Different codec using different capture format
      media: mediatek: vcodec: prevent kernel crash when scp ipi timeout
      media: mediatek: vcodec: Add to support H264 inner racing mode

 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml |  52 ++++++++----
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c                     |  41 +++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c                 |   8 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c                  |  12 ++-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h                  |   2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c                  |  50 +++++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h                     |  12 +++
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c        |  25 ++++--
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c           | 197 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c                        |   2 +-
 drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c                        |   5 ++
 11 files changed, 378 insertions(+), 28 deletions(-)

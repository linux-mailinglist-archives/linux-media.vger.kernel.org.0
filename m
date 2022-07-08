Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF2C56B5ED
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 11:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237734AbiGHJrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 05:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237111AbiGHJrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 05:47:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44477796BB
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 02:47:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2E8EB82567
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 09:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD6DC341C0;
        Fri,  8 Jul 2022 09:47:00 +0000 (UTC)
Message-ID: <eee537a2-86a1-dd81-af2e-9f18e9272f5c@xs4all.nl>
Date:   Fri, 8 Jul 2022 11:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various fixes/enhancements
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

The following changes since commit c0ab2901fc68a274b4e5e6436892806e6785babe:

  media: venus: hfi_platform: Correct supported codecs for sc7280 (2022-07-07 09:21:08 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20i

for you to fetch changes up to 756e3fd847f452897dcd85866050a52d8678c8bd:

  media: amphion: only insert the first sequence startcode for vc1l format (2022-07-08 11:25:11 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Akira Yokosawa (1):
      media: docs: Remove extraneous \endgroup from P010 table

Chen-Yu Tsai (7):
      media: mediatek: vcodec: decoder: Const-ify stepwise_fhd
      media: mediatek: vcodec: decoder: Fix 4K frame size enumeration
      media: mediatek: vcodec: decoder: Skip alignment for default resolution
      media: mediatek: vcodec: decoder: Fix resolution clamping in TRY_FMT
      media: mediatek: vcodec: decoder: Drop max_{width,height} from mtk_vcodec_ctx
      media: mediatek: vcodec: decoder: Embed framesize inside mtk_video_fmt
      media: mediatek: vcodec: Initialize decoder parameters for each instance

Ezequiel Garcia (1):
      hantro: Fix RK3399 H.264 format advertising

Krzysztof Kozlowski (1):
      dt-bindings: media: samsung,s5pv210-jpeg: convert to dtschema

Ming Qian (3):
      media: amphion: defer setting last_buffer_dequeued until resolution changes are processed
      media: amphion: sync buffer status with firmware during abort
      media: amphion: only insert the first sequence startcode for vc1l format

 Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt     |  16 ---------
 Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst       |   3 --
 MAINTAINERS                                                       |   1 +
 drivers/media/platform/amphion/vdec.c                             |  47 +++++++++++++++++--------
 drivers/media/platform/amphion/vpu.h                              |   1 +
 drivers/media/platform/amphion/vpu_malone.c                       |   2 ++
 drivers/media/platform/amphion/vpu_rpc.h                          |   7 +++-
 drivers/media/platform/amphion/vpu_v4l2.c                         |   2 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c           |  54 +++++++++++-----------------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c       |   3 +-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c  |  29 ++++-----------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c |  30 +++++++---------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h           |  20 +----------
 drivers/staging/media/hantro/rockchip_vpu_hw.c                    |  60 +++++++++++++++++++++++++++----
 15 files changed, 262 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml

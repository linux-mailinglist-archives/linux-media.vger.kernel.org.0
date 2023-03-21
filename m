Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD0386C3151
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 13:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbjCUMOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 08:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbjCUMOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 08:14:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E337B44
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 05:14:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6CCCB81646
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 12:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AFFC4339B;
        Tue, 21 Mar 2023 12:14:18 +0000 (UTC)
Message-ID: <98c48690-631d-1086-9b7c-004c61cc8dbb@xs4all.nl>
Date:   Tue, 21 Mar 2023 13:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= 
        <allen-kh.cheng@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Mediatek vcodec fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4e

for you to fetch changes up to 4a8fc66d32a98ea3941fd4a53ec021c3d700e238:

  media: mediatek: vcodec: Force capture queue format to MM21 (2023-03-21 12:52:10 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Allen-KH Cheng (2):
      media: dt-bindings: media: mediatek: Rename child node names for decoder
      media: dt-bindings: media: mediatek: Remove "dma-ranges" property for decoder

Pin-yen Lin (1):
      media: mediatek: vcodec: Use 4K frame size when supported by stateful decoder

Yunfei Dong (4):
      media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms
      media: dt-bindings: media: mediatek: vcodec: Change the max reg value to 2
      media: mediatek: vcodec: Make MM21 the default capture format
      media: mediatek: vcodec: Force capture queue format to MM21

 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml | 113 ++++++++++++++++++++-------------------------------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c                     |  24 ++---------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c            |  12 +++++-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c           |   8 ++--
 4 files changed, 62 insertions(+), 95 deletions(-)

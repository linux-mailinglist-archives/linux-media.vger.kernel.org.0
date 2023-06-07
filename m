Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B98725BB3
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 12:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbjFGKiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 06:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbjFGKiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 06:38:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737161BD8
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 03:38:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 085A3616EB
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D82C433EF;
        Wed,  7 Jun 2023 10:38:10 +0000 (UTC)
Message-ID: <f60325e9-ba54-ba18-602f-b6cfaf849c7b@xs4all.nl>
Date:   Wed, 7 Jun 2023 12:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.5] mediatek: vcodec: Add debugfs file for decode and
 encode
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

The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:

  media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5i

for you to fetch changes up to c5db9c911bf37b1a211911acc51c7413ffb7ff9e:

  media: mediatek: vcodec: Add dbgfs help function (2023-06-07 12:14:17 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Yunfei Dong (8):
      media: mediatek: vcodec: Add debugfs interface to get debug information
      media: mediatek: vcodec: Add debug params to control different log level
      media: mediatek: vcodec: Add a debugfs file to get different useful information
      media: mediatek: vcodec: Get each context resolution information
      media: mediatek: vcodec: Get each instance format type
      media: mediatek: vcodec: Change dbgfs interface to support encode
      media: mediatek: vcodec: Add encode to support dbgfs
      media: mediatek: vcodec: Add dbgfs help function

 drivers/media/platform/mediatek/vcodec/Makefile             |   6 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c   | 215 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h   |  74 ++++++++++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c |   4 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h     |   4 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c |   2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c    |   8 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h    |  26 +++++-
 8 files changed, 336 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

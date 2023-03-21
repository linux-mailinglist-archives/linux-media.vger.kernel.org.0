Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757F46C3056
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 12:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjCULZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 07:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjCULZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 07:25:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9737ABE
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 04:25:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDADD61AEA
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 11:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8653C433EF;
        Tue, 21 Mar 2023 11:25:40 +0000 (UTC)
Message-ID: <3be73ae4-c8a9-9cd8-5918-263462f0896f@xs4all.nl>
Date:   Tue, 21 Mar 2023 12:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     kyrie wu <kyrie.wu@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] mtk-jpeg fixes
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

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4d

for you to fetch changes up to b64df344e0d4720829820f09517ff521fd9a5180:

  media: mtk-jpeg: refactor hw dev initializaiton (2023-03-21 12:24:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
kyrie wu (7):
      media: mtk-jpeg: Fixes jpeghw multi-core judgement
      media: mtk-jpeg: add jpeg single core initial function
      media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow
      media: mtk-jpeg: reconstructs the initialization mode of worker
      media: mtk-jpeg: Remove some unnecessary variables
      media: mtk-jpeg: refactor some variables
      media: mtk-jpeg: refactor hw dev initializaiton

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 130 ++++++++++++++++++++++++++++++++++++++++++++----------------------------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h   |  28 +++++++---------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |  43 ++++++++----------------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |  38 +++++----------------
 4 files changed, 113 insertions(+), 126 deletions(-)

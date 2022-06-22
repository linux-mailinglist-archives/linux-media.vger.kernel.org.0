Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBF6554FA4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 17:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359399AbiFVPmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 11:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353708AbiFVPme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 11:42:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9334536E35
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 08:42:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 211C4B81F91
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 15:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE7AC34114;
        Wed, 22 Jun 2022 15:42:29 +0000 (UTC)
Message-ID: <f45f2dac-3936-f3f1-ebea-ebb3a95688ed@xs4all.nl>
Date:   Wed, 22 Jun 2022 17:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.19] mediatek: vcodec: Drop
 platform_get_resource(IORESOURCE_IRQ)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 945a9a8e448b65bec055d37eba58f711b39f66f0:

  media: pvrusb2: fix memory leak in pvr_probe (2022-06-20 10:30:37 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19a

for you to fetch changes up to 4760ab14bc76c94fe55eea985bf545f068ba8d9a:

  media: mediatek: vcodec: Drop platform_get_resource(IORESOURCE_IRQ) (2022-06-22 16:58:16 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
      media: mediatek: vcodec: Drop platform_get_resource(IORESOURCE_IRQ)

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

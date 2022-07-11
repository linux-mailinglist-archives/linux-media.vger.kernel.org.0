Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FBC56D765
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiGKIHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGKIHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:07:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3888113E36
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 01:07:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5F7560B6F
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59EAC341C0;
        Mon, 11 Jul 2022 08:07:42 +0000 (UTC)
Message-ID: <689df1f7-b562-c4c3-e78b-0350ced2fa71@xs4all.nl>
Date:   Mon, 11 Jul 2022 10:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] mediatek vcodec capability fixes
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>
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

The following changes since commit e670f5d672ef3d00b0b8c69eff09a019e6dd4ef9:

  media: amphion: only insert the first sequence startcode for vc1l format (2022-07-08 18:18:49 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20k

for you to fetch changes up to 5250932a727940e3c005305e0da5c77ed1083fb2:

  media: mediatek: vcodec: Make encoder capability fields fit requirements (2022-07-11 09:54:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chen-Yu Tsai (2):
      media: mediatek: vcodec: Make decoder capability fields fit requirements
      media: mediatek: vcodec: Make encoder capability fields fit requirements

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

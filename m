Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0E470F56B
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjEXLh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXLhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:37:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE0AC5
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:37:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4B361A90
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 11:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2803C433D2;
        Wed, 24 May 2023 11:37:52 +0000 (UTC)
Message-ID: <d4b08420-f7c0-4950-2d20-385d98f3cad9@xs4all.nl>
Date:   Wed, 24 May 2023 13:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Pin-yen Lin <treapking@chromium.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.4] Three regression fixes
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

The following changes since commit 8bc27fa5d7763d376a992a1638475987ed4807e7:

  docs: uapi: media: ignore new DVB-S2X FEC values (2023-05-15 06:46:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4r

for you to fetch changes up to cbb336b761a02b16b6be2216083c69f290b731e9:

  media: mediatek: vcodec: Only apply 4K frame sizes on decoder formats (2023-05-24 13:06:17 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: verisilicon: Additional fix for the crash when opening the driver

Pin-yen Lin (1):
      media: mediatek: vcodec: Only apply 4K frame sizes on decoder formats

Yassine Oudjana (1):
      media: camss: camss-video: Don't zero subdev format again after initialization

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c | 3 +++
 drivers/media/platform/qcom/camss/camss-video.c                  | 1 -
 drivers/media/platform/verisilicon/hantro_v4l2.c                 | 6 ++++--
 3 files changed, 7 insertions(+), 3 deletions(-)

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A88C77A0FC
	for <lists+linux-media@lfdr.de>; Sat, 12 Aug 2023 18:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjHLQQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Aug 2023 12:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjHLQQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Aug 2023 12:16:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0733010EB
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 09:16:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90DB161D7A
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 16:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEE2C433C7;
        Sat, 12 Aug 2023 16:16:55 +0000 (UTC)
Message-ID: <642a98c6-e50c-1bcb-85f1-f5b3aeb606c5@xs4all.nl>
Date:   Sat, 12 Aug 2023 18:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Deborah Brouwer <deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] bttv: convert to vb2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I plan to merge this tomorrow...

Regards,

	Hans

The following changes since commit c816786c3b46ebe42c4887933e50a79b35c0a1c3:

  media: i2c: rdacm21: Fix uninitialized value (2023-08-11 13:36:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6d

for you to fetch changes up to 7aa9c2cd2cdf5e1692ae6a52b1442535c33ed08b:

  media: bttv: convert to vb2 (2023-08-12 10:41:43 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Deborah Brouwer (13):
      media: bttv: use video_drvdata to get bttv
      media: bttv: replace BUG with WARN_ON
      media: bttv: radio use v4l2_fh instead of bttv_fh
      media: bttv: copy vid fmt/width/height from fh
      media: bttv: copy vbi_fmt from bttv_fh
      media: bttv: move do_crop flag out of bttv_fh
      media: bttv: remove format field from bttv_buffer
      media: bttv: remove tvnorm field from bttv_buffer
      media: bttv: remove crop info from bttv_buffer
      media: bttv: move vbi_skip/vbi_count out of buffer
      media: bttv: refactor bttv_set_dma()
      media: bttv: use audio defaults for winfast2000
      media: bttv: convert to vb2

 drivers/media/pci/bt8xx/Kconfig           |    2 +-
 drivers/media/pci/bt8xx/bt848.h           |    8 +
 drivers/media/pci/bt8xx/bttv-audio-hook.c |   10 +-
 drivers/media/pci/bt8xx/bttv-driver.c     | 1022 ++++++++++++++++++++++++++-----------------------------------------------------
 drivers/media/pci/bt8xx/bttv-risc.c       |  411 ++++++++++++++++++--------------
 drivers/media/pci/bt8xx/bttv-vbi.c        |  283 +++++++++-------------
 drivers/media/pci/bt8xx/bttvp.h           |   79 ++++---
 7 files changed, 723 insertions(+), 1092 deletions(-)

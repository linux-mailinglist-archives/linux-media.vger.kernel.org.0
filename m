Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B566B7D70
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 17:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCMQ1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 12:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjCMQ1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 12:27:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CE1591C8
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 09:27:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F3B3DB81188
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 16:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE73C433D2
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 16:27:04 +0000 (UTC)
Message-ID: <4ad446c4-f1eb-bf83-4f97-80ec6d7cb3e8@xs4all.nl>
Date:   Mon, 13 Mar 2023 17:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Various fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4c

for you to fetch changes up to 11d6bec6489199ad826e9a4be27594539b74a52e:

  media: common: btcx-risc.h: drop obsolete header (2023-03-13 16:19:19 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      admin-guide/media/cec.rst: update CEC debugging doc
      media: stm32: dma2d: remove unused fb_buf
      zoran: drop two obsolete prototypes from zoran_device.h
      media: common: btcx-risc.h: drop obsolete header

 Documentation/admin-guide/media/cec.rst       | 70 ++++++++++++++++++++++++++++++++++++----------------------------------
 drivers/media/common/btcx-risc.h              | 29 -----------------------------
 drivers/media/pci/zoran/zoran_device.h        |  2 --
 drivers/media/platform/st/stm32/dma2d/dma2d.h |  2 --
 4 files changed, 36 insertions(+), 67 deletions(-)
 delete mode 100644 drivers/media/common/btcx-risc.h

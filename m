Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A2572B9BC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 10:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbjFLIGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 04:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjFLIFz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 04:05:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB681705
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:05:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 857CD60FD3
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF67EC433EF
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:04:45 +0000 (UTC)
Message-ID: <148a55e2-7cdc-c606-6108-f6a91bcb2a19@xs4all.nl>
Date:   Mon, 12 Jun 2023 10:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.5] Various fixes that need to go into v6.5
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

The following changes since commit d78b9d6671decdaedb539635b1d0a34f8f5934f8:

  media: mediatek: vcodec: Add dbgfs help function (2023-06-09 16:38:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5l

for you to fetch changes up to d6dcf1721c8e16f43fa2d10fa6c19d7d667cefb1:

  media: mediatek: vcodec: fix cancel_work_sync fail with fluster test (2023-06-12 09:59:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander Stein (1):
      media: amphion: use dev_err_probe

Arnd Bergmann (1):
      media: mtk_jpeg_core: avoid unused-variable warning

Dmitry Antipov (1):
      media: pulse8-cec: handle possible ping error

Ming Qian (1):
      media: imx-jpeg: Support to assign slot for encoder/decoder

Nicolas Dufresne (1):
      media: amphion: Fix firmware path to match linux-firmware

Nikolay Burykin (1):
      media: pci: cx23885: fix error handling for cx23885 ATSC boards

Yunfei Dong (1):
      media: mediatek: vcodec: fix cancel_work_sync fail with fluster test

 drivers/media/cec/usb/pulse8/pulse8-cec.c               |   7 ++-
 drivers/media/pci/cx23885/cx23885-dvb.c                 |  12 -----
 drivers/media/platform/amphion/vpu_core.c               |   4 +-
 drivers/media/platform/amphion/vpu_mbox.c               |   9 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c    |   6 +--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |   4 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |   4 +-
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c |   3 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h       |   1 -
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c          | 135 ++++++++++++++++++++++------------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h          |   5 +-
 11 files changed, 84 insertions(+), 106 deletions(-)

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E025AE68C
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 13:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbiIFLZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 07:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbiIFLZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 07:25:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A8BFD2C
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 04:25:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 727ED60C61
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 11:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A436C433D6;
        Tue,  6 Sep 2022 11:25:26 +0000 (UTC)
Message-ID: <fb8fb389-d029-4054-bfbc-3d7ee60b95b2@xs4all.nl>
Date:   Tue, 6 Sep 2022 13:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Enable 10bits bitstream for Hantro/G2 HEVC codec
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

The following changes since commit fbb6c848dd89786fe24856ee6b5e773910ded29c:

  media: destage Hantro VPU driver (2022-08-31 10:23:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1m

for you to fetch changes up to 30d8104febf18fcaa7030513f0206c0ea223e994:

  media: hantro: Allows luma and chroma depth to be different (2022-09-06 13:04:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (7):
      media: hantro: Store HEVC bit depth in context
      media: hantro: HEVC: Fix auxilary buffer size calculation
      media: hantro: HEVC: Fix chroma offset computation
      media: hantro: postproc: Configure output regs to support 10bit
      media: Hantro: HEVC: Allows 10-bit bitstream
      media: hantro: imx8m: Enable 10bit decoding
      media: hantro: Allows luma and chroma depth to be different

 drivers/media/platform/verisilicon/hantro_drv.c         | 14 +++++++++-----
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c |  4 +---
 drivers/media/platform/verisilicon/hantro_hevc.c        |  4 ++--
 drivers/media/platform/verisilicon/hantro_postproc.c    |  7 ++++++-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c       | 27 +++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 11 deletions(-)

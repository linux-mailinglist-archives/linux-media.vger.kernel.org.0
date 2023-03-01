Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F4E6A6BE5
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCALsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCALsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:48:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BD8168BA
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:48:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0039B612AE
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3A8C433D2
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:48:07 +0000 (UTC)
Message-ID: <4a622cc2-0dcc-8162-5b5a-2132ed8d5511@xs4all.nl>
Date:   Wed, 1 Mar 2023 12:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: common: btcx-risc.h: drop obsolete header
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

This header is no longer used, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/btcx-risc.h | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 drivers/media/common/btcx-risc.h

diff --git a/drivers/media/common/btcx-risc.h b/drivers/media/common/btcx-risc.h
deleted file mode 100644
index 76dc16f402b9..000000000000
--- a/drivers/media/common/btcx-risc.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- */
-struct btcx_riscmem {
-	unsigned int   size;
-	__le32         *cpu;
-	__le32         *jmp;
-	dma_addr_t     dma;
-};
-
-struct btcx_skiplist {
-	int start;
-	int end;
-};
-
-int  btcx_riscmem_alloc(struct pci_dev *pci,
-			struct btcx_riscmem *risc,
-			unsigned int size);
-void btcx_riscmem_free(struct pci_dev *pci,
-		       struct btcx_riscmem *risc);
-
-int btcx_screen_clips(int swidth, int sheight, struct v4l2_rect *win,
-		      struct v4l2_clip *clips, unsigned int n);
-int btcx_align(struct v4l2_rect *win, struct v4l2_clip *clips,
-	       unsigned int n, int mask);
-void btcx_sort_clips(struct v4l2_clip *clips, unsigned int nclips);
-void btcx_calc_skips(int line, int width, int *maxy,
-		     struct btcx_skiplist *skips, unsigned int *nskips,
-		     const struct v4l2_clip *clips, unsigned int nclips);
-- 
2.39.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D75906A6B87
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCALOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCALN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:13:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35E6366B3
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:13:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB637B80FF0
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF498C4339B;
        Wed,  1 Mar 2023 11:13:46 +0000 (UTC)
Message-ID: <6f66a0f5-1f0d-b8c5-469b-b211fbe5ab04@xs4all.nl>
Date:   Wed, 1 Mar 2023 12:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hugues Fruchet <hugues.fruchet@foss.st.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: stm32: dma2d: remove unused fb_buf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the unused struct v4l2_framebuffer fb_buf in struct dma2d_ctx.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.h b/drivers/media/platform/st/stm32/dma2d/dma2d.h
index 3f03a7ca9ee3..af12739fc774 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.h
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.h
@@ -90,8 +90,6 @@ struct dma2d_ctx {
 	struct dma2d_frame	cap;
 	struct dma2d_frame	out;
 	struct dma2d_frame	bg;
-	/* fb_buf always point to bg address */
-	struct v4l2_framebuffer	fb_buf;
 	/*
 	 * MODE[17:16] of DMA2D_CR
 	 */
-- 
2.39.1


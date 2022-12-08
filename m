Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC7C6469E4
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 08:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiLHHvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 02:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiLHHvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 02:51:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1ADF43867
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 23:51:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BB0261D3E
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11A6C433C1
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:51:33 +0000 (UTC)
Message-ID: <ca6256f9-09d8-4559-bbe1-6d88a97bd16e@xs4all.nl>
Date:   Thu, 8 Dec 2022 08:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-mem2mem: use vb2_is_streaming()
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

Don't touch q->streaming directly, use the vb2_is_streaming()
function instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index be7fde1ed3ea..0cc30397fbad 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -922,9 +922,9 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 	 * means either in driver already or waiting for driver to claim it
 	 * and start processing.
 	 */
-	if ((!src_q->streaming || src_q->error ||
+	if ((!vb2_is_streaming(src_q) || src_q->error ||
 	     list_empty(&src_q->queued_list)) &&
-	    (!dst_q->streaming || dst_q->error ||
+	    (!vb2_is_streaming(dst_q) || dst_q->error ||
 	     (list_empty(&dst_q->queued_list) && !dst_q->last_buffer_dequeued)))
 		return EPOLLERR;

-- 
2.35.1


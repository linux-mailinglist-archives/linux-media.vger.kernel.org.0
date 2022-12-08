Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F63A6469E3
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 08:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiLHHv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 02:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiLHHvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 02:51:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB883FB8B
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 23:51:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B653BB806A0
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5547C433D6;
        Thu,  8 Dec 2022 07:51:20 +0000 (UTC)
Message-ID: <25f44345-ab97-12be-91c7-5a7b2600890b@xs4all.nl>
Date:   Thu, 8 Dec 2022 08:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: s5p-mfc: use vb2_is_streaming()
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
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index f3e4cdac1ef3..9d2cce124a34 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1021,8 +1021,8 @@ static __poll_t s5p_mfc_poll(struct file *file,
 	 * means either in driver already or waiting for driver to claim it
 	 * and start processing.
 	 */
-	if ((!src_q->streaming || list_empty(&src_q->queued_list))
-		&& (!dst_q->streaming || list_empty(&dst_q->queued_list))) {
+	if ((!vb2_is_streaming(src_q) || list_empty(&src_q->queued_list)) &&
+	    (!vb2_is_streaming(dst_q) || list_empty(&dst_q->queued_list))) {
 		rc = EPOLLERR;
 		goto end;
 	}
-- 
2.35.1


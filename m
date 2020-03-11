Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69CA181248
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 08:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKHrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 03:47:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:50536 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHrI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 03:47:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 45BFEABCF;
        Wed, 11 Mar 2020 07:47:07 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 08:47:06 +0100
Message-Id: <20200311074706.8624-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/rc/nuvoton-cir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 5c2cd8d2d155..48a69bf23236 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -230,10 +230,10 @@ static ssize_t wakeup_data_show(struct device *dev,
 	for (i = 0; i < fifo_len; i++) {
 		duration = nvt_cir_wake_reg_read(nvt, CIR_WAKE_RD_FIFO_ONLY);
 		duration = (duration & BUF_LEN_MASK) * SAMPLE_PERIOD;
-		buf_len += snprintf(buf + buf_len, PAGE_SIZE - buf_len,
+		buf_len += scnprintf(buf + buf_len, PAGE_SIZE - buf_len,
 				    "%d ", duration);
 	}
-	buf_len += snprintf(buf + buf_len, PAGE_SIZE - buf_len, "\n");
+	buf_len += scnprintf(buf + buf_len, PAGE_SIZE - buf_len, "\n");
 
 	spin_unlock_irqrestore(&nvt->lock, flags);
 
-- 
2.16.4


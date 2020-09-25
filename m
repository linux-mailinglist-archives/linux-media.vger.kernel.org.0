Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2A52790BE
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgIYSf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgIYSfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:25 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A8AC0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so4024011pfi.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=POQlelg/xj+ajAaOj4PD03MRs7Bfm1aqs/fM0Ig6DDo=;
        b=HZ7WmaWFu6gyAPyj5NWmh41xDV3/CpkYOtgcB7jszCJa0hm9iic6aPW9CPjTbBxvFd
         WFnAYLrjNrrEpeYp0xOnjPJTjFoAXvtTzy3gwJ7e5rkt5o7JLErPah8H7YyXs5gpkBFj
         +1V554dq4Tfm85SmleMHLQMugHakrEk0tIv7tOsTtfWy91ouqfyE9pbJqHD/AJkZ0xOL
         Ul9H64FMFc2zD+Sg1jgBDK6xPrNO7g9eg/v9RYpmQ8zUuhAKCBd72cUXGjmlP/kuGouD
         5XGO/3H/YczRRGkfziDJr4q1Nr3c2asC7bbgPwiDwe0Urq9HNzx/4D+88Aj/OCENw9Wx
         BNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=POQlelg/xj+ajAaOj4PD03MRs7Bfm1aqs/fM0Ig6DDo=;
        b=mixfZjrsEJ6xoUfAjmZNdWL/Yrn3mMwyhSZROE6PJSZ8k6y/6qW19m+nz6eZ6e5Go/
         F5aGysEraO/qAtmn+QzpZYVagl4XdAhST8AGruVDrYl5nFkEr/lkpGY2T1BTjzGAsG8E
         SaZBe0voPYwcEDMpWGd/L28zLJuWhn9FIUMSW3BwYeHIie0J41oAeKBfGy6Va5uWwxxS
         9mxm/UMKDtMRhX4ZYc7WX6HCYyPawXRFL0PYPfVniPUSzPthq4wPATGwWZEA1J4/sFTQ
         1S5ufG8DZlPOfUMpuDbgvfshi8SF/OXLJxSYsuCKE7K63de6BRa5m3eCQ5yTE7r1JnN4
         Qj3Q==
X-Gm-Message-State: AOAM532u4ne6vDdhTrQz4LP7BM11fE+eGOiRC1I4vuWxrmWf52GBvgg/
        lvorqTO6UhM5DNJVco2TKNLNWg==
X-Google-Smtp-Source: ABdhPJyIbzjFwuqqiH1rwqNSLTpS1uO836zFCs8h9iHlL8QqIvNDD/sKGQOQAttTN5kf1fKKRUkIdw==
X-Received: by 2002:aa7:8e9a:0:b029:13e:d13d:a050 with SMTP id a26-20020aa78e9a0000b029013ed13da050mr587780pfr.22.1601058925212;
        Fri, 25 Sep 2020 11:35:25 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:24 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 42/47] staging: media: zoran: remove test_interrupts
Date:   Fri, 25 Sep 2020 18:30:52 +0000
Message-Id: <1601058657-14042-43-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The test_interrupts function is useless, remove it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  3 ---
 drivers/staging/media/zoran/zoran_card.c   | 27 ----------------------
 drivers/staging/media/zoran/zoran_device.c | 16 -------------
 3 files changed, 46 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 0246635e0eac..fd27d1968e60 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -345,7 +345,6 @@ struct zoran {
 	struct zoran_buffer_col jpg_buffers;	/* MJPEG buffers' info */
 
 	/* Additional stuff for testing */
-	int testing;
 	int jpeg_error;
 	int intr_counter_GIRQ1;
 	int intr_counter_GIRQ0;
@@ -372,8 +371,6 @@ struct zoran {
 	int running;
 	int buf_in_reserve;
 
-	wait_queue_head_t test_q;
-
 	dma_addr_t p_sc;
 	__le32 *stat_comb;
 	dma_addr_t p_scb;
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 28a403257bb9..89fbc114c368 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -858,31 +858,6 @@ void zoran_open_init_params(struct zoran *zr)
 		pci_err(zr->pci_dev, "%s internal error\n", __func__);
 
 	clear_interrupt_counters(zr);
-	zr->testing = 0;
-}
-
-static void test_interrupts(struct zoran *zr)
-{
-	DEFINE_WAIT(wait);
-	int timeout, icr;
-
-	clear_interrupt_counters(zr);
-
-	zr->testing = 1;
-	icr = btread(ZR36057_ICR);
-	btwrite(0x78000000 | ZR36057_ICR_IntPinEn, ZR36057_ICR);
-	prepare_to_wait(&zr->test_q, &wait, TASK_INTERRUPTIBLE);
-	timeout = schedule_timeout(HZ);
-	finish_wait(&zr->test_q, &wait);
-	btwrite(0, ZR36057_ICR);
-	btwrite(0x78000000, ZR36057_ISR);
-	zr->testing = 0;
-	pci_info(zr->pci_dev, "Testing interrupts...\n");
-	if (timeout)
-		pci_info(zr->pci_dev, ": time spent: %d\n", 1 * HZ - timeout);
-	if (zr36067_debug > 1)
-		print_interrupts(zr);
-	btwrite(icr, ZR36057_ICR);
 }
 
 static int zr36057_init(struct zoran *zr)
@@ -896,7 +871,6 @@ static int zr36057_init(struct zoran *zr)
 
 	init_waitqueue_head(&zr->v4l_capq);
 	init_waitqueue_head(&zr->jpg_capq);
-	init_waitqueue_head(&zr->test_q);
 	zr->jpg_buffers.allocated = 0;
 	zr->v4l_buffers.allocated = 0;
 
@@ -977,7 +951,6 @@ static int zr36057_init(struct zoran *zr)
 	zoran_init_hardware(zr);
 	if (zr36067_debug > 2)
 		detect_guest_activity(zr);
-	test_interrupts(zr);
 	if (!pass_through) {
 		decoder_call(zr, video, s_stream, 0);
 		encoder_call(zr, video, s_routing, 2, 0, 0);
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index fb318449d784..c090d7166caa 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -1109,22 +1109,6 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 	struct zoran *zr = dev_id;
 	unsigned long flags;
 
-	if (zr->testing) {
-		/* Testing interrupts */
-		spin_lock_irqsave(&zr->spinlock, flags);
-		while ((stat = count_reset_interrupt(zr))) {
-			if (count++ > 100) {
-				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
-				pci_err(zr->pci_dev, "IRQ lockup while testing, isr=0x%08x, cleared int mask\n",
-					stat);
-				wake_up_interruptible(&zr->test_q);
-			}
-		}
-		zr->last_isr = stat;
-		spin_unlock_irqrestore(&zr->spinlock, flags);
-		return IRQ_HANDLED;
-	}
-
 	spin_lock_irqsave(&zr->spinlock, flags);
 	while (1) {
 		/* get/clear interrupt status bits */
-- 
2.26.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C311521DFF
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242851AbiEJPWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345597AbiEJPUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3934527CC
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92F70B81DF5
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD7FC385C2;
        Tue, 10 May 2022 15:00:25 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/7] cec-pin: disabling the adapter cannot call kthread_stop
Date:   Tue, 10 May 2022 17:00:16 +0200
Message-Id: <20220510150022.1787112-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
References: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the adap_enable callback is called the adap->lock is held.
When disabling the adapter it attempts to stop the kthread that
deals with receiving and transmitting messages. However, kthread_stop
waits for the thread to stop, so all that time adap->lock is held.

Unfortunately, the kernel thread itself can call functions that take
that same lock, so a deadlock can occur.

Change the logic to keep the kernel thread running and instead when
disabling the adapter, just set the pin to high, go to idle and then
to state OFF and disable the interrupt. Only stop the kernel thread
when the adapter is deleted.

This way disabling the adapter will not wait for anything and the
deadlock is avoided.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin.c | 54 +++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 78e4aef623bf..4bd7be4e2edf 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1037,11 +1037,14 @@ static int cec_pin_thread_func(void *_adap)
 
 	for (;;) {
 		wait_event_interruptible(pin->kthread_waitq,
-			kthread_should_stop() ||
-			pin->work_rx_msg.len ||
-			pin->work_tx_status ||
-			atomic_read(&pin->work_irq_change) ||
-			atomic_read(&pin->work_pin_num_events));
+					 kthread_should_stop() ||
+					 pin->work_rx_msg.len ||
+					 pin->work_tx_status ||
+					 atomic_read(&pin->work_irq_change) ||
+					 atomic_read(&pin->work_pin_num_events));
+
+		if (kthread_should_stop())
+			break;
 
 		if (pin->work_rx_msg.len) {
 			struct cec_msg *msg = &pin->work_rx_msg;
@@ -1090,6 +1093,8 @@ static int cec_pin_thread_func(void *_adap)
 				irq_enabled = false;
 			}
 			cec_pin_high(pin);
+			if (pin->state == CEC_ST_OFF)
+				break;
 			cec_pin_to_idle(pin);
 			hrtimer_start(&pin->timer, ns_to_ktime(0),
 				      HRTIMER_MODE_REL);
@@ -1109,15 +1114,7 @@ static int cec_pin_thread_func(void *_adap)
 		default:
 			break;
 		}
-		if (kthread_should_stop())
-			break;
 	}
-	if (irq_enabled)
-		call_void_pin_op(pin, disable_irq);
-	hrtimer_cancel(&pin->timer);
-	cec_pin_read(pin);
-	cec_pin_to_idle(pin);
-	pin->state = CEC_ST_OFF;
 	return 0;
 }
 
@@ -1134,16 +1131,28 @@ static int cec_pin_adap_enable(struct cec_adapter *adap, bool enable)
 		pin->tx_msg.len = 0;
 		pin->timer_ts = ns_to_ktime(0);
 		atomic_set(&pin->work_irq_change, CEC_PIN_IRQ_UNCHANGED);
-		pin->kthread = kthread_run(cec_pin_thread_func, adap,
-					   "cec-pin");
-		if (IS_ERR(pin->kthread)) {
-			pr_err("cec-pin: kernel_thread() failed\n");
-			return PTR_ERR(pin->kthread);
+		if (!pin->kthread) {
+			pin->kthread = kthread_run(cec_pin_thread_func, adap,
+						   "cec-pin");
+			if (IS_ERR(pin->kthread)) {
+				int err = PTR_ERR(pin->kthread);
+
+				pr_err("cec-pin: kernel_thread() failed\n");
+				pin->kthread = NULL;
+				return err;
+			}
 		}
 		hrtimer_start(&pin->timer, ns_to_ktime(0),
 			      HRTIMER_MODE_REL);
-	} else {
-		kthread_stop(pin->kthread);
+	} else if (pin->kthread) {
+		hrtimer_cancel(&pin->timer);
+		cec_pin_high(pin);
+		cec_pin_to_idle(pin);
+		pin->state = CEC_ST_OFF;
+		pin->work_tx_status = 0;
+		atomic_set(&pin->work_pin_num_events, 0);
+		atomic_set(&pin->work_irq_change, CEC_PIN_IRQ_DISABLE);
+		wake_up_interruptible(&pin->kthread_waitq);
 	}
 	return 0;
 }
@@ -1276,7 +1285,10 @@ static void cec_pin_adap_free(struct cec_adapter *adap)
 {
 	struct cec_pin *pin = adap->pin;
 
-	if (pin && pin->ops->free)
+	if (pin->kthread)
+		kthread_stop(pin->kthread);
+	pin->kthread = NULL;
+	if (pin->ops->free)
 		pin->ops->free(adap);
 	adap->pin = NULL;
 	kfree(pin);
-- 
2.34.1


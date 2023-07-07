Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C1E74AFB6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 13:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjGGL1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 07:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjGGL0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 07:26:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFC01FF6
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 04:26:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8F5D6195F
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88566C433C8;
        Fri,  7 Jul 2023 11:26:45 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/4] cec-pin: improve interrupt handling
Date:   Fri,  7 Jul 2023 13:26:39 +0200
Message-Id: <20230707112641.338232-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707112641.338232-1-hverkuil-cisco@xs4all.nl>
References: <20230707112641.338232-1-hverkuil-cisco@xs4all.nl>
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

The CEC pin framework needs a bit more control over the interrupt
handling: make sure that the disable_irq op is called even if the
device node is unregistered, log the state of the interrupt in
debugfs, and disable the interrupt when the kernel thread is stopped.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin-priv.h |  1 +
 drivers/media/cec/core/cec-pin.c      | 28 +++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
index 8eb5819e6ccb..156a9f81be94 100644
--- a/drivers/media/cec/core/cec-pin-priv.h
+++ b/drivers/media/cec/core/cec-pin-priv.h
@@ -183,6 +183,7 @@ struct cec_pin {
 	u16				la_mask;
 	bool				monitor_all;
 	bool				rx_eom;
+	bool				enabled_irq;
 	bool				enable_irq_failed;
 	enum cec_pin_state		state;
 	struct cec_msg			tx_msg;
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 68353c5dc501..8a3921fc9c99 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1033,8 +1033,9 @@ static int cec_pin_thread_func(void *_adap)
 {
 	struct cec_adapter *adap = _adap;
 	struct cec_pin *pin = adap->pin;
-	bool irq_enabled = false;
 
+	pin->enabled_irq = false;
+	pin->enable_irq_failed = false;
 	for (;;) {
 		wait_event_interruptible(pin->kthread_waitq,
 					 kthread_should_stop() ||
@@ -1088,9 +1089,10 @@ static int cec_pin_thread_func(void *_adap)
 		switch (atomic_xchg(&pin->work_irq_change,
 				    CEC_PIN_IRQ_UNCHANGED)) {
 		case CEC_PIN_IRQ_DISABLE:
-			if (irq_enabled) {
-				call_void_pin_op(pin, disable_irq);
-				irq_enabled = false;
+			if (pin->enabled_irq) {
+				pin->ops->disable_irq(adap);
+				pin->enabled_irq = false;
+				pin->enable_irq_failed = false;
 			}
 			cec_pin_high(pin);
 			if (pin->state == CEC_ST_OFF)
@@ -1100,21 +1102,29 @@ static int cec_pin_thread_func(void *_adap)
 				      HRTIMER_MODE_REL);
 			break;
 		case CEC_PIN_IRQ_ENABLE:
-			if (irq_enabled)
+			if (pin->enabled_irq || !pin->ops->enable_irq ||
+			    pin->adap->devnode.unregistered)
 				break;
-			pin->enable_irq_failed = !call_pin_op(pin, enable_irq);
+			pin->enable_irq_failed = !pin->ops->enable_irq(adap);
 			if (pin->enable_irq_failed) {
 				cec_pin_to_idle(pin);
 				hrtimer_start(&pin->timer, ns_to_ktime(0),
 					      HRTIMER_MODE_REL);
 			} else {
-				irq_enabled = true;
+				pin->enabled_irq = true;
 			}
 			break;
 		default:
 			break;
 		}
 	}
+
+	if (pin->enabled_irq) {
+		pin->ops->disable_irq(pin->adap);
+		pin->enabled_irq = false;
+		pin->enable_irq_failed = false;
+		cec_pin_high(pin);
+	}
 	return 0;
 }
 
@@ -1215,7 +1225,9 @@ static void cec_pin_adap_status(struct cec_adapter *adap,
 	seq_printf(file, "cec pin: %d\n", call_pin_op(pin, read));
 	seq_printf(file, "cec pin events dropped: %u\n",
 		   pin->work_pin_events_dropped_cnt);
-	seq_printf(file, "irq failed: %d\n", pin->enable_irq_failed);
+	if (pin->ops->enable_irq)
+		seq_printf(file, "irq %s\n", pin->enabled_irq ? "enabled" :
+			   (pin->enable_irq_failed ? "failed" : "disabled"));
 	if (pin->timer_100us_overruns) {
 		seq_printf(file, "timer overruns > 100us: %u of %u\n",
 			   pin->timer_100us_overruns, pin->timer_cnt);
-- 
2.39.2


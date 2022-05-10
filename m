Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B80521E05
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345121AbiEJPWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345601AbiEJPUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F264259335
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3A19619EC
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD237C385CA;
        Tue, 10 May 2022 15:00:31 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/7] cec-adap: drop activate_cnt, use state info instead
Date:   Tue, 10 May 2022 17:00:22 +0200
Message-Id: <20220510150022.1787112-8-hverkuil-cisco@xs4all.nl>
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

Using an activation counter to decide when the enable or disable the
cec adapter is not the best approach and can lead to race conditions.

Change this to determining the current status of the adapter, and
enable or disable the adapter accordingly.

It now only needs to be called whenever there is a chance that the
state changes, and it can handle enabling/disabling monitoring as
well if needed.

This simplifies the code and it should be a more robust approach as well.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 152 ++++++++++++------------------
 include/media/cec.h               |   4 +-
 2 files changed, 61 insertions(+), 95 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 38c43a37133d..8bf91b5a7d0e 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1574,47 +1574,59 @@ static void cec_claim_log_addrs(struct cec_adapter *adap, bool block)
 }
 
 /*
- * Helper functions to enable/disable the CEC adapter.
+ * Helper function to enable/disable the CEC adapter.
  *
- * These functions are called with adap->lock held.
+ * This function is called with adap->lock held.
  */
-static int cec_activate_cnt_inc(struct cec_adapter *adap)
+static int cec_adap_enable(struct cec_adapter *adap)
 {
-	int ret;
+	bool enable;
+	int ret = 0;
+
+	enable = adap->monitor_all_cnt || adap->monitor_pin_cnt ||
+		 adap->log_addrs.num_log_addrs;
+	if (adap->needs_hpd)
+		enable = enable && adap->phys_addr != CEC_PHYS_ADDR_INVALID;
 
-	if (adap->activate_cnt++)
+	if (enable == adap->is_enabled)
 		return 0;
 
 	/* serialize adap_enable */
 	mutex_lock(&adap->devnode.lock);
-	adap->last_initiator = 0xff;
-	adap->transmit_in_progress = false;
-	ret = call_op(adap, adap_enable, true);
-	if (ret)
-		adap->activate_cnt--;
+	if (enable) {
+		adap->last_initiator = 0xff;
+		adap->transmit_in_progress = false;
+		ret = adap->ops->adap_enable(adap, true);
+		if (!ret) {
+			/*
+			 * Enable monitor-all/pin modes if needed. We warn, but
+			 * continue if this fails as this is not a critical error.
+			 */
+			if (adap->monitor_all_cnt)
+				WARN_ON(call_op(adap, adap_monitor_all_enable, true));
+			if (adap->monitor_pin_cnt)
+				WARN_ON(call_op(adap, adap_monitor_pin_enable, true));
+		}
+	} else {
+		/* Disable monitor-all/pin modes if needed (needs_hpd == 1) */
+		if (adap->monitor_all_cnt)
+			WARN_ON(call_op(adap, adap_monitor_all_enable, false));
+		if (adap->monitor_pin_cnt)
+			WARN_ON(call_op(adap, adap_monitor_pin_enable, false));
+		WARN_ON(adap->ops->adap_enable(adap, false));
+		adap->last_initiator = 0xff;
+		adap->transmit_in_progress = false;
+		adap->transmit_in_progress_aborted = false;
+		if (adap->transmitting)
+			cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED, 0);
+	}
+	if (!ret)
+		adap->is_enabled = enable;
+	wake_up_interruptible(&adap->kthread_waitq);
 	mutex_unlock(&adap->devnode.lock);
 	return ret;
 }
 
-static void cec_activate_cnt_dec(struct cec_adapter *adap)
-{
-	if (WARN_ON(!adap->activate_cnt))
-		return;
-
-	if (--adap->activate_cnt)
-		return;
-
-	/* serialize adap_enable */
-	mutex_lock(&adap->devnode.lock);
-	WARN_ON(call_op(adap, adap_enable, false));
-	adap->last_initiator = 0xff;
-	adap->transmit_in_progress = false;
-	adap->transmit_in_progress_aborted = false;
-	if (adap->transmitting)
-		cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED, 0);
-	mutex_unlock(&adap->devnode.lock);
-}
-
 /* Set a new physical address and send an event notifying userspace of this.
  *
  * This function is called with adap->lock held.
@@ -1635,33 +1647,16 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 		adap->phys_addr = CEC_PHYS_ADDR_INVALID;
 		cec_post_state_event(adap);
 		cec_adap_unconfigure(adap);
-		if (becomes_invalid && adap->needs_hpd) {
-			/* Disable monitor-all/pin modes if needed */
-			if (adap->monitor_all_cnt)
-				WARN_ON(call_op(adap, adap_monitor_all_enable, false));
-			if (adap->monitor_pin_cnt)
-				WARN_ON(call_op(adap, adap_monitor_pin_enable, false));
-			cec_activate_cnt_dec(adap);
-			wake_up_interruptible(&adap->kthread_waitq);
-		}
-		if (becomes_invalid)
+		if (becomes_invalid) {
+			cec_adap_enable(adap);
 			return;
-	}
-
-	if (is_invalid && adap->needs_hpd) {
-		if (cec_activate_cnt_inc(adap))
-			return;
-		/*
-		 * Re-enable monitor-all/pin modes if needed. We warn, but
-		 * continue if this fails as this is not a critical error.
-		 */
-		if (adap->monitor_all_cnt)
-			WARN_ON(call_op(adap, adap_monitor_all_enable, true));
-		if (adap->monitor_pin_cnt)
-			WARN_ON(call_op(adap, adap_monitor_pin_enable, true));
+		}
 	}
 
 	adap->phys_addr = phys_addr;
+	if (is_invalid)
+		cec_adap_enable(adap);
+
 	cec_post_state_event(adap);
 	if (!adap->log_addrs.num_log_addrs)
 		return;
@@ -1722,6 +1717,7 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		      struct cec_log_addrs *log_addrs, bool block)
 {
 	u16 type_mask = 0;
+	int err;
 	int i;
 
 	if (adap->devnode.unregistered)
@@ -1738,8 +1734,7 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		adap->log_addrs.osd_name[0] = '\0';
 		adap->log_addrs.vendor_id = CEC_VENDOR_ID_NONE;
 		adap->log_addrs.cec_version = CEC_OP_CEC_VERSION_2_0;
-		if (!adap->needs_hpd)
-			cec_activate_cnt_dec(adap);
+		cec_adap_enable(adap);
 		return 0;
 	}
 
@@ -1873,17 +1868,12 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		       sizeof(log_addrs->features[i]));
 	}
 
-	if (!adap->needs_hpd && !adap->is_configuring && !adap->is_configured) {
-		int ret = cec_activate_cnt_inc(adap);
-
-		if (ret)
-			return ret;
-	}
 	log_addrs->log_addr_mask = adap->log_addrs.log_addr_mask;
 	adap->log_addrs = *log_addrs;
-	if (adap->phys_addr != CEC_PHYS_ADDR_INVALID)
+	err = cec_adap_enable(adap);
+	if (!err && adap->phys_addr != CEC_PHYS_ADDR_INVALID)
 		cec_claim_log_addrs(adap, block);
-	return 0;
+	return err;
 }
 
 int cec_s_log_addrs(struct cec_adapter *adap,
@@ -2186,20 +2176,9 @@ int cec_monitor_all_cnt_inc(struct cec_adapter *adap)
 	if (adap->monitor_all_cnt++)
 		return 0;
 
-	if (!adap->needs_hpd) {
-		ret = cec_activate_cnt_inc(adap);
-		if (ret) {
-			adap->monitor_all_cnt--;
-			return ret;
-		}
-	}
-
-	ret = call_op(adap, adap_monitor_all_enable, true);
-	if (ret) {
+	ret = cec_adap_enable(adap);
+	if (ret)
 		adap->monitor_all_cnt--;
-		if (!adap->needs_hpd)
-			cec_activate_cnt_dec(adap);
-	}
 	return ret;
 }
 
@@ -2210,8 +2189,7 @@ void cec_monitor_all_cnt_dec(struct cec_adapter *adap)
 	if (--adap->monitor_all_cnt)
 		return;
 	WARN_ON(call_op(adap, adap_monitor_all_enable, false));
-	if (!adap->needs_hpd)
-		cec_activate_cnt_dec(adap);
+	cec_adap_enable(adap);
 }
 
 /*
@@ -2226,20 +2204,9 @@ int cec_monitor_pin_cnt_inc(struct cec_adapter *adap)
 	if (adap->monitor_pin_cnt++)
 		return 0;
 
-	if (!adap->needs_hpd) {
-		ret = cec_activate_cnt_inc(adap);
-		if (ret) {
-			adap->monitor_pin_cnt--;
-			return ret;
-		}
-	}
-
-	ret = call_op(adap, adap_monitor_pin_enable, true);
-	if (ret) {
+	ret = cec_adap_enable(adap);
+	if (ret)
 		adap->monitor_pin_cnt--;
-		if (!adap->needs_hpd)
-			cec_activate_cnt_dec(adap);
-	}
 	return ret;
 }
 
@@ -2250,8 +2217,7 @@ void cec_monitor_pin_cnt_dec(struct cec_adapter *adap)
 	if (--adap->monitor_pin_cnt)
 		return;
 	WARN_ON(call_op(adap, adap_monitor_pin_enable, false));
-	if (!adap->needs_hpd)
-		cec_activate_cnt_dec(adap);
+	cec_adap_enable(adap);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -2265,7 +2231,7 @@ int cec_adap_status(struct seq_file *file, void *priv)
 	struct cec_data *data;
 
 	mutex_lock(&adap->lock);
-	seq_printf(file, "activation count: %u\n", adap->activate_cnt);
+	seq_printf(file, "enabled: %d\n", adap->is_enabled);
 	seq_printf(file, "configured: %d\n", adap->is_configured);
 	seq_printf(file, "configuring: %d\n", adap->is_configuring);
 	seq_printf(file, "phys_addr: %x.%x.%x.%x\n",
diff --git a/include/media/cec.h b/include/media/cec.h
index 6c9b41fe9802..abee41ae02d0 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -183,6 +183,7 @@ struct cec_adap_ops {
  * @needs_hpd:		if true, then the HDMI HotPlug Detect pin must be high
  *	in order to transmit or receive CEC messages. This is usually a HW
  *	limitation.
+ * @is_enabled:		the CEC adapter is enabled
  * @is_configuring:	the CEC adapter is configuring (i.e. claiming LAs)
  * @must_reconfigure:	while configuring, the PA changed, so reclaim LAs
  * @is_configured:	the CEC adapter is configured (i.e. has claimed LAs)
@@ -194,7 +195,6 @@ struct cec_adap_ops {
  *	Drivers that need this can set this field to true after the
  *	cec_allocate_adapter() call.
  * @last_initiator:	the initiator of the last transmitted message.
- * @activate_cnt:	number of times that CEC is activated
  * @monitor_all_cnt:	number of filehandles monitoring all msgs
  * @monitor_pin_cnt:	number of filehandles monitoring pin changes
  * @follower_cnt:	number of filehandles in follower mode
@@ -243,13 +243,13 @@ struct cec_adapter {
 
 	u16 phys_addr;
 	bool needs_hpd;
+	bool is_enabled;
 	bool is_configuring;
 	bool must_reconfigure;
 	bool is_configured;
 	bool cec_pin_is_high;
 	bool adap_controls_phys_addr;
 	u8 last_initiator;
-	u32 activate_cnt;
 	u32 monitor_all_cnt;
 	u32 monitor_pin_cnt;
 	u32 follower_cnt;
-- 
2.34.1


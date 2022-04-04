Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF764F12F9
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 12:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356962AbiDDKUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 06:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356971AbiDDKUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 06:20:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEFA3C715
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 03:18:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D02BB8101B
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E9BC34111;
        Mon,  4 Apr 2022 10:18:15 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 2/7] cec: abort if the current transmit was canceled
Date:   Mon,  4 Apr 2022 12:18:06 +0200
Message-Id: <20220404101811.3359944-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404101811.3359944-1-hverkuil-cisco@xs4all.nl>
References: <20220404101811.3359944-1-hverkuil-cisco@xs4all.nl>
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

If a transmit-in-progress was canceled, then, once the transmit
is done, mark it as aborted and refrain from retrying the transmit.

To signal this situation the new transmit_in_progress_aborted field is
set to true.

The old implementation would just set adap->transmitting to NULL and
set adap->transmit_in_progress to false, but on the hardware level
the transmit was still ongoing. However, the framework would think
the transmit was aborted, and if a new transmit was issued, then
it could overwrite the HW buffer containing the old transmit with the
new transmit, leading to garbled data on the CEC bus.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 14 +++++++++++---
 include/media/cec.h               |  6 ++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 1a095308f3ab..b7ca429604ed 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -421,7 +421,7 @@ static void cec_flush(struct cec_adapter *adap)
 		cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
 	}
 	if (adap->transmitting)
-		cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED);
+		adap->transmit_in_progress_aborted = true;
 
 	/* Cancel the pending timeout work. */
 	list_for_each_entry_safe(data, n, &adap->wait_queue, list) {
@@ -572,6 +572,7 @@ int cec_thread_func(void *_adap)
 		if (data->attempts == 0)
 			data->attempts = attempts;
 
+		adap->transmit_in_progress_aborted = false;
 		/* Tell the adapter to transmit, cancel on error */
 		if (adap->ops->adap_transmit(adap, data->attempts,
 					     signal_free_time, &data->msg))
@@ -599,6 +600,8 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 	struct cec_msg *msg;
 	unsigned int attempts_made = arb_lost_cnt + nack_cnt +
 				     low_drive_cnt + error_cnt;
+	bool done = status & (CEC_TX_STATUS_MAX_RETRIES | CEC_TX_STATUS_OK);
+	bool aborted = adap->transmit_in_progress_aborted;
 
 	dprintk(2, "%s: status 0x%02x\n", __func__, status);
 	if (attempts_made < 1)
@@ -619,6 +622,7 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 		goto wake_thread;
 	}
 	adap->transmit_in_progress = false;
+	adap->transmit_in_progress_aborted = false;
 
 	msg = &data->msg;
 
@@ -639,8 +643,7 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 	 * the hardware didn't signal that it retried itself (by setting
 	 * CEC_TX_STATUS_MAX_RETRIES), then we will retry ourselves.
 	 */
-	if (data->attempts > attempts_made &&
-	    !(status & (CEC_TX_STATUS_MAX_RETRIES | CEC_TX_STATUS_OK))) {
+	if (!aborted && data->attempts > attempts_made && !done) {
 		/* Retry this message */
 		data->attempts -= attempts_made;
 		if (msg->timeout)
@@ -655,6 +658,8 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 		goto wake_thread;
 	}
 
+	if (aborted && !done)
+		status |= CEC_TX_STATUS_ABORTED;
 	data->attempts = 0;
 
 	/* Always set CEC_TX_STATUS_MAX_RETRIES on error */
@@ -1596,6 +1601,9 @@ static void cec_activate_cnt_dec(struct cec_adapter *adap)
 	WARN_ON(adap->ops->adap_enable(adap, false));
 	adap->last_initiator = 0xff;
 	adap->transmit_in_progress = false;
+	adap->transmit_in_progress_aborted = false;
+	if (adap->transmitting)
+		cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED);
 	mutex_unlock(&adap->devnode.lock);
 }
 
diff --git a/include/media/cec.h b/include/media/cec.h
index 97c5f5bfcbd0..31d704f36707 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -163,6 +163,11 @@ struct cec_adap_ops {
  * @wait_queue:		queue of transmits waiting for a reply
  * @transmitting:	CEC messages currently being transmitted
  * @transmit_in_progress: true if a transmit is in progress
+ * @transmit_in_progress_aborted: true if a transmit is in progress is to be
+ *			aborted. This happens if the logical address is
+ *			invalidated while the transmit is ongoing. In that
+ *			case the transmit will finish, but will not retransmit
+ *			and be marked as ABORTED.
  * @kthread_config:	kthread used to configure a CEC adapter
  * @config_completion:	used to signal completion of the config kthread
  * @kthread:		main CEC processing thread
@@ -218,6 +223,7 @@ struct cec_adapter {
 	struct list_head wait_queue;
 	struct cec_data *transmitting;
 	bool transmit_in_progress;
+	bool transmit_in_progress_aborted;
 
 	struct task_struct *kthread_config;
 	struct completion config_completion;
-- 
2.34.1


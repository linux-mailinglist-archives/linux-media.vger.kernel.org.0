Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE8C4F12F7
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357013AbiDDKUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 06:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356925AbiDDKUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 06:20:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B123C716
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 03:18:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76CD960F1D
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534F3C2BBE4;
        Mon,  4 Apr 2022 10:18:16 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 3/7] cec: correctly pass on reply results
Date:   Mon,  4 Apr 2022 12:18:07 +0200
Message-Id: <20220404101811.3359944-4-hverkuil-cisco@xs4all.nl>
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

The results of non-blocking transmits were not correctly communicated
to userspace.

Specifically:

1) if a non-blocking transmit was canceled, then rx_status wasn't set to 0
   as it should.
2) if the non-blocking transmit succeeded, but the corresponding reply
   never arrived (aborted or timed out), then tx_status wasn't set to 0
   as it should, and rx_status was hardcoded to ABORTED instead of the
   actual reason, such as TIMEOUT. In addition, adap->ops->received() was
   never called, so drivers that want to do message processing themselves
   would not be informed of the failed reply.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 48 +++++++++++++++++++------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index b7ca429604ed..11fddb012d98 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -366,38 +366,48 @@ static void cec_data_completed(struct cec_data *data)
 /*
  * A pending CEC transmit needs to be cancelled, either because the CEC
  * adapter is disabled or the transmit takes an impossibly long time to
- * finish.
+ * finish, or the reply timed out.
  *
  * This function is called with adap->lock held.
  */
-static void cec_data_cancel(struct cec_data *data, u8 tx_status)
+static void cec_data_cancel(struct cec_data *data, u8 tx_status, u8 rx_status)
 {
+	struct cec_adapter *adap = data->adap;
+
 	/*
 	 * It's either the current transmit, or it is a pending
 	 * transmit. Take the appropriate action to clear it.
 	 */
-	if (data->adap->transmitting == data) {
-		data->adap->transmitting = NULL;
+	if (adap->transmitting == data) {
+		adap->transmitting = NULL;
 	} else {
 		list_del_init(&data->list);
 		if (!(data->msg.tx_status & CEC_TX_STATUS_OK))
-			if (!WARN_ON(!data->adap->transmit_queue_sz))
-				data->adap->transmit_queue_sz--;
+			if (!WARN_ON(!adap->transmit_queue_sz))
+				adap->transmit_queue_sz--;
 	}
 
 	if (data->msg.tx_status & CEC_TX_STATUS_OK) {
 		data->msg.rx_ts = ktime_get_ns();
-		data->msg.rx_status = CEC_RX_STATUS_ABORTED;
+		data->msg.rx_status = rx_status;
+		if (!data->blocking)
+			data->msg.tx_status = 0;
 	} else {
 		data->msg.tx_ts = ktime_get_ns();
 		data->msg.tx_status |= tx_status |
 				       CEC_TX_STATUS_MAX_RETRIES;
 		data->msg.tx_error_cnt++;
 		data->attempts = 0;
+		if (!data->blocking)
+			data->msg.rx_status = 0;
 	}
 
 	/* Queue transmitted message for monitoring purposes */
-	cec_queue_msg_monitor(data->adap, &data->msg, 1);
+	cec_queue_msg_monitor(adap, &data->msg, 1);
+
+	if (!data->blocking && data->msg.sequence && adap->ops->received)
+		/* Allow drivers to process the message first */
+		adap->ops->received(adap, &data->msg);
 
 	cec_data_completed(data);
 }
@@ -418,7 +428,7 @@ static void cec_flush(struct cec_adapter *adap)
 	while (!list_empty(&adap->transmit_queue)) {
 		data = list_first_entry(&adap->transmit_queue,
 					struct cec_data, list);
-		cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
+		cec_data_cancel(data, CEC_TX_STATUS_ABORTED, 0);
 	}
 	if (adap->transmitting)
 		adap->transmit_in_progress_aborted = true;
@@ -426,7 +436,7 @@ static void cec_flush(struct cec_adapter *adap)
 	/* Cancel the pending timeout work. */
 	list_for_each_entry_safe(data, n, &adap->wait_queue, list) {
 		if (cancel_delayed_work(&data->work))
-			cec_data_cancel(data, CEC_TX_STATUS_OK);
+			cec_data_cancel(data, CEC_TX_STATUS_OK, CEC_RX_STATUS_ABORTED);
 		/*
 		 * If cancel_delayed_work returned false, then
 		 * the cec_wait_timeout function is running,
@@ -516,7 +526,7 @@ int cec_thread_func(void *_adap)
 					adap->transmitting->msg.msg);
 				/* Just give up on this. */
 				cec_data_cancel(adap->transmitting,
-						CEC_TX_STATUS_TIMEOUT);
+						CEC_TX_STATUS_TIMEOUT, 0);
 			} else {
 				pr_warn("cec-%s: transmit timed out\n", adap->name);
 			}
@@ -576,7 +586,7 @@ int cec_thread_func(void *_adap)
 		/* Tell the adapter to transmit, cancel on error */
 		if (adap->ops->adap_transmit(adap, data->attempts,
 					     signal_free_time, &data->msg))
-			cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
+			cec_data_cancel(data, CEC_TX_STATUS_ABORTED, 0);
 		else
 			adap->transmit_in_progress = true;
 
@@ -738,9 +748,7 @@ static void cec_wait_timeout(struct work_struct *work)
 
 	/* Mark the message as timed out */
 	list_del_init(&data->list);
-	data->msg.rx_ts = ktime_get_ns();
-	data->msg.rx_status = CEC_RX_STATUS_TIMEOUT;
-	cec_data_completed(data);
+	cec_data_cancel(data, CEC_TX_STATUS_OK, CEC_RX_STATUS_TIMEOUT);
 unlock:
 	mutex_unlock(&adap->lock);
 }
@@ -926,8 +934,12 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	mutex_lock(&adap->lock);
 
 	/* Cancel the transmit if it was interrupted */
-	if (!data->completed)
-		cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
+	if (!data->completed) {
+		if (data->msg.tx_status & CEC_TX_STATUS_OK)
+			cec_data_cancel(data, CEC_TX_STATUS_OK, CEC_RX_STATUS_ABORTED);
+		else
+			cec_data_cancel(data, CEC_TX_STATUS_ABORTED, 0);
+	}
 
 	/* The transmit completed (possibly with an error) */
 	*msg = data->msg;
@@ -1603,7 +1615,7 @@ static void cec_activate_cnt_dec(struct cec_adapter *adap)
 	adap->transmit_in_progress = false;
 	adap->transmit_in_progress_aborted = false;
 	if (adap->transmitting)
-		cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED);
+		cec_data_cancel(adap->transmitting, CEC_TX_STATUS_ABORTED, 0);
 	mutex_unlock(&adap->devnode.lock);
 }
 
-- 
2.34.1


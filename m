Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050657CA01B
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 09:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjJPHJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 03:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJPHJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 03:09:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DC397
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 00:09:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039E2C433C8
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 07:09:04 +0000 (UTC)
Message-ID: <1d437648-3774-467f-8c72-e6f0bbf69211@xs4all.nl>
Date:   Mon, 16 Oct 2023 09:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4] media: cec: core: count low-drive, error and arb-lost,
 conditions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Count how many Low Drive, Error and Arbitration Lost transmit
status errors occurred, and expose that in debugfs.

Also log the first 8 transmits that result in Low Drive or Error
conditions. That really should not happen with well-behaved CEC devices
and good HDMI cables.

This is useful to detect and debug HDMI cable issues.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v3:
- Document new fields in kerneldoc
Changes since v2:
- Fix spaces instead of TAB issue in two lines.
Changes since v1:
- Log the first 8 transmits that resulted in a Low Drive or Error status.
---
 drivers/media/cec/core/cec-adap.c | 54 ++++++++++++++++++++++++++++---
 include/media/cec.h               | 14 ++++++--
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 09ca83c23329..b9a2753e0846 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -511,7 +511,7 @@ int cec_thread_func(void *_adap)
 				pr_warn("cec-%s: transmit timed out\n", adap->name);
 			}
 			adap->transmit_in_progress = false;
-			adap->tx_timeouts++;
+			adap->tx_timeout_cnt++;
 			goto unlock;
 		}

@@ -625,6 +625,33 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 	msg->tx_low_drive_cnt += low_drive_cnt;
 	msg->tx_error_cnt += error_cnt;

+	adap->tx_arb_lost_cnt += arb_lost_cnt;
+	adap->tx_low_drive_cnt += low_drive_cnt;
+	adap->tx_error_cnt += error_cnt;
+
+	/*
+	 * Low Drive transmission errors should really not happen for
+	 * well-behaved CEC devices and proper HDMI cables.
+	 *
+	 * Ditto for the 'Error' status.
+	 *
+	 * For the first few times that this happens, log this.
+	 * Stop logging after that, since that will not add any more
+	 * useful information and instead it will just flood the kernel log.
+	 */
+	if (done && adap->tx_low_drive_log_cnt < 8 && msg->tx_low_drive_cnt) {
+		adap->tx_low_drive_log_cnt++;
+		dprintk(0, "low drive counter: %u (seq %u: %*ph)\n",
+			msg->tx_low_drive_cnt, msg->sequence,
+			msg->len, msg->msg);
+	}
+	if (done && adap->tx_error_log_cnt < 8 && msg->tx_error_cnt) {
+		adap->tx_error_log_cnt++;
+		dprintk(0, "error counter: %u (seq %u: %*ph)\n",
+			msg->tx_error_cnt, msg->sequence,
+			msg->len, msg->msg);
+	}
+
 	/* Mark that we're done with this transmit */
 	adap->transmitting = NULL;

@@ -1607,6 +1634,8 @@ int cec_adap_enable(struct cec_adapter *adap)
 	if (enable) {
 		adap->last_initiator = 0xff;
 		adap->transmit_in_progress = false;
+		adap->tx_low_drive_log_cnt = 0;
+		adap->tx_error_log_cnt = 0;
 		ret = adap->ops->adap_enable(adap, true);
 		if (!ret) {
 			/*
@@ -2260,10 +2289,25 @@ int cec_adap_status(struct seq_file *file, void *priv)
 	if (adap->monitor_pin_cnt)
 		seq_printf(file, "file handles in Monitor Pin mode: %u\n",
 			   adap->monitor_pin_cnt);
-	if (adap->tx_timeouts) {
-		seq_printf(file, "transmit timeouts: %u\n",
-			   adap->tx_timeouts);
-		adap->tx_timeouts = 0;
+	if (adap->tx_timeout_cnt) {
+		seq_printf(file, "transmit timeout count: %u\n",
+			   adap->tx_timeout_cnt);
+		adap->tx_timeout_cnt = 0;
+	}
+	if (adap->tx_low_drive_cnt) {
+		seq_printf(file, "transmit low drive count: %u\n",
+			   adap->tx_low_drive_cnt);
+		adap->tx_low_drive_cnt = 0;
+	}
+	if (adap->tx_arb_lost_cnt) {
+		seq_printf(file, "transmit arbitration lost count: %u\n",
+			   adap->tx_arb_lost_cnt);
+		adap->tx_arb_lost_cnt = 0;
+	}
+	if (adap->tx_error_cnt) {
+		seq_printf(file, "transmit error count: %u\n",
+			   adap->tx_error_cnt);
+		adap->tx_error_cnt = 0;
 	}
 	data = adap->transmitting;
 	if (data)
diff --git a/include/media/cec.h b/include/media/cec.h
index 53e4b2eb2b26..57b630f1931e 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -207,7 +207,12 @@ struct cec_adap_ops {
  *	passthrough mode.
  * @log_addrs:		current logical addresses
  * @conn_info:		current connector info
- * @tx_timeouts:	number of transmit timeouts
+ * @tx_timeout_cnt:	number of Time Out transmits
+ * @tx_low_drive_cnt:	number of Low Drive transmits
+ * @tx_error_cnt:	number of Error transmits
+ * @tx_arb_lost_cnt:	number of Arbitration Lost transmits
+ * @tx_low_drive_log_cnt: number of logged Low Drive transmits
+ * @tx_error_log_cnt:	number of logged Error transmits
  * @notifier:		CEC notifier
  * @pin:		CEC pin status struct
  * @cec_dir:		debugfs cec directory
@@ -262,7 +267,12 @@ struct cec_adapter {
 	struct cec_log_addrs log_addrs;
 	struct cec_connector_info conn_info;

-	u32 tx_timeouts;
+	u32 tx_timeout_cnt;
+	u32 tx_low_drive_cnt;
+	u32 tx_error_cnt;
+	u32 tx_arb_lost_cnt;
+	u32 tx_low_drive_log_cnt;
+	u32 tx_error_log_cnt;

 #ifdef CONFIG_CEC_NOTIFIER
 	struct cec_notifier *notifier;
-- 
2.42.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7607C4CE6
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 10:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjJKISF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 04:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjJKISE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 04:18:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2688392
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 01:18:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DCDC433C9
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 08:18:01 +0000 (UTC)
Message-ID: <e9b8cfa1-0993-4225-ac79-93807b7f6dbf@xs4all.nl>
Date:   Wed, 11 Oct 2023 10:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv3] media: cec: core: count low-drive, error and arb-lost
 conditions
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Changes since v2:
- Fix spaces instead of TAB issue in two lines.
Changes since v1:
- Log the first 8 transmits that resulted in a Low Drive or Error status.
---
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 09ca83c23329..f8f7ac61fe55 100644
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
index 53e4b2eb2b26..0b77ce9f2e65 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -262,7 +262,12 @@ struct cec_adapter {
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

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBC17BFE54
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 15:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjJJNri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 09:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjJJNr1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 09:47:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB58CD55
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 06:47:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B62CC433C7
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 13:47:23 +0000 (UTC)
Message-ID: <658f107c-551e-49d8-aec9-54592a8690ef@xs4all.nl>
Date:   Tue, 10 Oct 2023 15:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: cec: core: count low-drive, error and arb-lost
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

Useful to debug HDMI cable issues.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 09ca83c23329..ab24fc043f60 100644
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

@@ -625,6 +625,10 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 	msg->tx_low_drive_cnt += low_drive_cnt;
 	msg->tx_error_cnt += error_cnt;

+	adap->tx_arb_lost_cnt += arb_lost_cnt;
+	adap->tx_low_drive_cnt += low_drive_cnt;
+	adap->tx_error_cnt += error_cnt;
+
 	/* Mark that we're done with this transmit */
 	adap->transmitting = NULL;

@@ -2260,10 +2264,25 @@ int cec_adap_status(struct seq_file *file, void *priv)
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
index 53e4b2eb2b26..2e5da283cc09 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -262,7 +262,10 @@ struct cec_adapter {
 	struct cec_log_addrs log_addrs;
 	struct cec_connector_info conn_info;

-	u32 tx_timeouts;
+	u32 tx_timeout_cnt;
+	u32 tx_low_drive_cnt;
+	u32 tx_error_cnt;
+	u32 tx_arb_lost_cnt;

 #ifdef CONFIG_CEC_NOTIFIER
 	struct cec_notifier *notifier;

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A494DC6D9
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 13:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbiCQM4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 08:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbiCQMzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 08:55:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3309AABF58
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 05:53:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CA361B81E5C
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 12:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6C7C36AE7;
        Thu, 17 Mar 2022 12:53:53 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 6/7] cec: add xfer_timeout_ms field
Date:   Thu, 17 Mar 2022 13:53:45 +0100
Message-Id: <20220317125346.145105-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317125346.145105-1-hverkuil-cisco@xs4all.nl>
References: <20220317125346.145105-1-hverkuil-cisco@xs4all.nl>
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

Allow drivers to change the transmit timeout value, i.e. after how
long should a transmit be considered 'lost', i.e. the corresponding
cec_transmit_done_ts was never called.

Some CEC devices have their own timeout, and so this timeout value must be
longer than that hardware timeout value. If it is shorter then the
framework would consider the transmit lost, even though it is effectively
still in progress at the hardware level.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 17 +++--------------
 drivers/media/cec/core/cec-core.c | 14 ++++++++++++++
 include/media/cec.h               |  3 +++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index d4fefd67ffe8..d359c9972d06 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -27,18 +27,6 @@ static void cec_fill_msg_report_features(struct cec_adapter *adap,
 					 struct cec_msg *msg,
 					 unsigned int la_idx);
 
-/*
- * 400 ms is the time it takes for one 16 byte message to be
- * transferred and 5 is the maximum number of retries. Add
- * another 100 ms as a margin. So if the transmit doesn't
- * finish before that time something is really wrong and we
- * have to time out.
- *
- * This is a sign that something it really wrong and a warning
- * will be issued.
- */
-#define CEC_XFER_TIMEOUT_MS (5 * 400 + 100)
-
 static int cec_log_addr2idx(const struct cec_adapter *adap, u8 log_addr)
 {
 	int i;
@@ -483,7 +471,7 @@ int cec_thread_func(void *_adap)
 				kthread_should_stop() ||
 				(!adap->transmit_in_progress &&
 				 !list_empty(&adap->transmit_queue)),
-				msecs_to_jiffies(CEC_XFER_TIMEOUT_MS));
+				msecs_to_jiffies(adap->xfer_timeout_ms));
 			timeout = err == 0;
 		} else {
 			/* Otherwise we just wait for something to happen. */
@@ -509,7 +497,8 @@ int cec_thread_func(void *_adap)
 			 * adapter driver, or the CEC bus is in some weird
 			 * state. On rare occasions it can happen if there is
 			 * so much traffic on the bus that the adapter was
-			 * unable to transmit for CEC_XFER_TIMEOUT_MS (2.1s).
+			 * unable to transmit for xfer_timeout_ms (2.1s by
+			 * default).
 			 */
 			if (adap->transmitting) {
 				pr_warn("cec-%s: message %*ph timed out\n", adap->name,
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 6038be40b448..af358e901b5f 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -20,6 +20,18 @@
 #define CEC_NUM_DEVICES	256
 #define CEC_NAME	"cec"
 
+/*
+ * 400 ms is the time it takes for one 16 byte message to be
+ * transferred and 5 is the maximum number of retries. Add
+ * another 100 ms as a margin. So if the transmit doesn't
+ * finish before that time something is really wrong and we
+ * have to time out.
+ *
+ * This is a sign that something it really wrong and a warning
+ * will be issued.
+ */
+#define CEC_XFER_TIMEOUT_MS (5 * 400 + 100)
+
 int cec_debug;
 module_param_named(debug, cec_debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");
@@ -331,6 +343,8 @@ int cec_register_adapter(struct cec_adapter *adap,
 
 	adap->owner = parent->driver->owner;
 	adap->devnode.dev.parent = parent;
+	if (!adap->xfer_timeout_ms)
+		adap->xfer_timeout_ms = CEC_XFER_TIMEOUT_MS;
 
 #ifdef CONFIG_MEDIA_CEC_RC
 	if (adap->capabilities & CEC_CAP_RC) {
diff --git a/include/media/cec.h b/include/media/cec.h
index 31d704f36707..80340c9eb0f2 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -168,6 +168,8 @@ struct cec_adap_ops {
  *			invalidated while the transmit is ongoing. In that
  *			case the transmit will finish, but will not retransmit
  *			and be marked as ABORTED.
+ * @xfer_timeout_ms:	the transfer timeout in ms.
+ *			If 0, then timeout after 2.1 ms.
  * @kthread_config:	kthread used to configure a CEC adapter
  * @config_completion:	used to signal completion of the config kthread
  * @kthread:		main CEC processing thread
@@ -224,6 +226,7 @@ struct cec_adapter {
 	struct cec_data *transmitting;
 	bool transmit_in_progress;
 	bool transmit_in_progress_aborted;
+	unsigned int xfer_timeout_ms;
 
 	struct task_struct *kthread_config;
 	struct completion config_completion;
-- 
2.34.1


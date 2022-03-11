Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297D64D5F6D
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243466AbiCKK0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344232AbiCKK0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:26:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E29C5D5F0
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 02:25:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2AF80B82B22
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 10:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21967C340EC;
        Fri, 11 Mar 2022 10:25:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 6/6] cec: add optional adap_configured callback
Date:   Fri, 11 Mar 2022 11:25:22 +0100
Message-Id: <20220311102522.1991113-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311102522.1991113-1-hverkuil-cisco@xs4all.nl>
References: <20220311102522.1991113-1-hverkuil-cisco@xs4all.nl>
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

This new optional callback is called when the adapter is fully configured
or fully unconfigured. Some drivers may have to take action when this
happens.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/cec-core.rst | 13 ++++++++++++-
 drivers/media/cec/core/cec-adap.c           |  4 ++++
 include/media/cec.h                         |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index c6194ee81c41..ae0d20798edc 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -109,6 +109,7 @@ your driver:
 		int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);
 		int (*adap_monitor_pin_enable)(struct cec_adapter *adap, bool enable);
 		int (*adap_log_addr)(struct cec_adapter *adap, u8 logical_addr);
+		void (*adap_configured)(struct cec_adapter *adap, bool configured);
 		int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg);
 		void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
@@ -117,7 +118,7 @@ your driver:
 		/* Error injection callbacks */
 		...
 
-		/* High-level callbacks */
+		/* High-level callback */
 		...
 	};
 
@@ -178,6 +179,16 @@ can receive directed messages to that address.
 Note that adap_log_addr must return 0 if logical_addr is CEC_LOG_ADDR_INVALID.
 
 
+Called when the adapter is fully configured or unconfigured::
+
+	void (*adap_configured)(struct cec_adapter *adap, bool configured);
+
+If configured == true, then the adapter is fully configured, i.e. all logical
+addresses have been successfully claimed. If configured == false, then the
+adapter is unconfigured. If the driver has to take specific actions after
+(un)configuration, then that can be done through this optional callback.
+
+
 To transmit a new message::
 
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index fae677d8a091..62e2c732567d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1346,6 +1346,8 @@ static void cec_adap_unconfigure(struct cec_adapter *adap)
 	cec_flush(adap);
 	wake_up_interruptible(&adap->kthread_waitq);
 	cec_post_state_event(adap);
+	if (adap->ops->adap_configured)
+		adap->ops->adap_configured(adap, false);
 }
 
 /*
@@ -1527,6 +1529,8 @@ static int cec_config_thread_func(void *arg)
 	adap->kthread_config = NULL;
 	complete(&adap->config_completion);
 	mutex_unlock(&adap->lock);
+	if (adap->ops->adap_configured)
+		adap->ops->adap_configured(adap, true);
 	return 0;
 
 unconfigure:
diff --git a/include/media/cec.h b/include/media/cec.h
index 80340c9eb0f2..6f13b0222aa3 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -118,6 +118,7 @@ struct cec_adap_ops {
 	int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);
 	int (*adap_monitor_pin_enable)(struct cec_adapter *adap, bool enable);
 	int (*adap_log_addr)(struct cec_adapter *adap, u8 logical_addr);
+	void (*adap_configured)(struct cec_adapter *adap, bool configured);
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 			     u32 signal_free_time, struct cec_msg *msg);
 	void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
-- 
2.34.1


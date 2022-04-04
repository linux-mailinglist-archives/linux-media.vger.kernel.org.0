Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7824F12FB
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357114AbiDDKUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 06:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357109AbiDDKUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 06:20:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C2D3C717
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 03:18:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77FED614E5
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5135DC340EE;
        Mon,  4 Apr 2022 10:18:20 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 7/7] cec: add optional adap_configured callback
Date:   Mon,  4 Apr 2022 12:18:11 +0200
Message-Id: <20220404101811.3359944-8-hverkuil-cisco@xs4all.nl>
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

This new optional callback is called when the adapter is fully configured
or fully unconfigured. Some drivers may have to take action when this
happens.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/cec-core.rst | 13 ++++++++++++-
 drivers/media/cec/core/cec-adap.c           |  2 ++
 include/media/cec.h                         |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

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
index 2425cb4c6a9a..e789aec7455c 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1336,6 +1336,7 @@ static void cec_adap_unconfigure(struct cec_adapter *adap)
 	cec_flush(adap);
 	wake_up_interruptible(&adap->kthread_waitq);
 	cec_post_state_event(adap);
+	call_void_op(adap, adap_configured, false);
 }
 
 /*
@@ -1517,6 +1518,7 @@ static int cec_config_thread_func(void *arg)
 	adap->kthread_config = NULL;
 	complete(&adap->config_completion);
 	mutex_unlock(&adap->lock);
+	call_void_op(adap, adap_configured, true);
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


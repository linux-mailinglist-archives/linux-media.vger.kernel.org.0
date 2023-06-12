Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DBF72C6C1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 16:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjFLOAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 10:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjFLN7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 09:59:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935AA170E
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:59:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E845A62985
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 13:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E12C433EF;
        Mon, 12 Jun 2023 13:58:44 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Zheng Zhang <zheng.zhang@email.ucr.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] Documentation: media: cec: describe new callbacks
Date:   Mon, 12 Jun 2023 15:58:39 +0200
Message-Id: <20230612135839.254935-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612135839.254935-1-hverkuil-cisco@xs4all.nl>
References: <20230612135839.254935-1-hverkuil-cisco@xs4all.nl>
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

Describe the new callbacks and clarify when the adap->lock
mutex is held or not.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/cec-core.rst | 44 ++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index ae0d20798edc..f1ffdec388f3 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -109,9 +109,11 @@ your driver:
 		int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);
 		int (*adap_monitor_pin_enable)(struct cec_adapter *adap, bool enable);
 		int (*adap_log_addr)(struct cec_adapter *adap, u8 logical_addr);
-		void (*adap_configured)(struct cec_adapter *adap, bool configured);
+		void (*adap_unconfigured)(struct cec_adapter *adap);
 		int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg);
+		void (*adap_nb_transmit_canceled)(struct cec_adapter *adap,
+						  const struct cec_msg *msg);
 		void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
 		void (*adap_free)(struct cec_adapter *adap);
 
@@ -122,8 +124,8 @@ your driver:
 		...
 	};
 
-The seven low-level ops deal with various aspects of controlling the CEC adapter
-hardware:
+These low-level ops deal with various aspects of controlling the CEC adapter
+hardware. They are all called with the mutex adap->lock held.
 
 
 To enable/disable the hardware::
@@ -179,14 +181,12 @@ can receive directed messages to that address.
 Note that adap_log_addr must return 0 if logical_addr is CEC_LOG_ADDR_INVALID.
 
 
-Called when the adapter is fully configured or unconfigured::
+Called when the adapter is unconfigured::
 
-	void (*adap_configured)(struct cec_adapter *adap, bool configured);
+	void (*adap_unconfigured)(struct cec_adapter *adap);
 
-If configured == true, then the adapter is fully configured, i.e. all logical
-addresses have been successfully claimed. If configured == false, then the
-adapter is unconfigured. If the driver has to take specific actions after
-(un)configuration, then that can be done through this optional callback.
+The adapter is unconfigured. If the driver has to take specific actions after
+unconfiguration, then that can be done through this optional callback.
 
 
 To transmit a new message::
@@ -207,6 +207,19 @@ The CEC_FREE_TIME_TO_USEC macro can be used to convert signal_free_time to
 microseconds (one data bit period is 2.4 ms).
 
 
+To pass on the result of a canceled non-blocking transmit::
+
+	void (*adap_nb_transmit_canceled)(struct cec_adapter *adap,
+					  const struct cec_msg *msg);
+
+This optional callback can be used to obtain the result of a canceled
+non-blocking transmit with sequence number msg->sequence. This is
+called if the transmit was aborted, the transmit timed out (i.e. the
+hardware never signaled that the transmit finished), or the transmit
+was successful, but the wait for the expected reply was either aborted
+or it timed out.
+
+
 To log the current CEC hardware status::
 
 	void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
@@ -372,7 +385,8 @@ Implementing the High-Level CEC Adapter
 ---------------------------------------
 
 The low-level operations drive the hardware, the high-level operations are
-CEC protocol driven. The following high-level callbacks are available:
+CEC protocol driven. The high-level callbacks are called without the adap->lock
+mutex being held. The following high-level callbacks are available:
 
 .. code-block:: none
 
@@ -384,9 +398,19 @@ CEC protocol driven. The following high-level callbacks are available:
 		...
 
 		/* High-level CEC message callback */
+		void (*configured)(struct cec_adapter *adap);
 		int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 	};
 
+Called when the adapter is configured::
+
+	void (*configured)(struct cec_adapter *adap);
+
+The adapter is fully configured, i.e. all logical addresses have been
+successfully claimed. If the driver has to take specific actions after
+configuration, then that can be done through this optional callback.
+
+
 The received() callback allows the driver to optionally handle a newly
 received CEC message::
 
-- 
2.39.2


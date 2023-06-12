Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DCD72C6BE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjFLN7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 09:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbjFLN7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 09:59:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B443170B
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:59:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9882F62987
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 13:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A78C4339B;
        Mon, 12 Jun 2023 13:58:42 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Zheng Zhang <zheng.zhang@email.ucr.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] media: cec: core: add adap_nb_transmit_canceled() callback
Date:   Mon, 12 Jun 2023 15:58:37 +0200
Message-Id: <20230612135839.254935-2-hverkuil-cisco@xs4all.nl>
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

A potential deadlock was found by Zheng Zhang with a local syzkaller
instance.

The problem is that when a non-blocking CEC transmit is canceled by calling
cec_data_cancel, that in turn can call the high-level received() driver
callback, which can call cec_transmit_msg() to transmit a new message.

The cec_data_cancel() function is called with the adap->lock mutex held,
and cec_transmit_msg() tries to take that same lock.

The root cause is that the received() callback can either be used to pass
on a received message (and then adap->lock is not held), or to report a
canceled transmit (and then adap->lock is held).

This is confusing, so create a new low-level adap_nb_transmit_canceled
callback that reports back that a non-blocking transmit was canceled.

And the received() callback is only called when a message is received,
as was the case before commit f9d0ecbf56f4 ("media: cec: correctly pass
on reply results") complicated matters.

Reported-by: Zheng Zhang <zheng.zhang@email.ucr.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: f9d0ecbf56f4 ("media: cec: correctly pass on reply results")
---
 drivers/media/cec/core/cec-adap.c | 4 ++--
 include/media/cec.h               | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..f8cb8542e5e9 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -385,8 +385,8 @@ static void cec_data_cancel(struct cec_data *data, u8 tx_status, u8 rx_status)
 	cec_queue_msg_monitor(adap, &data->msg, 1);
 
 	if (!data->blocking && data->msg.sequence)
-		/* Allow drivers to process the message first */
-		call_op(adap, received, &data->msg);
+		/* Allow drivers to react to a canceled transmit */
+		call_op(adap, adap_nb_transmit_canceled, &data->msg);
 
 	cec_data_completed(data);
 }
diff --git a/include/media/cec.h b/include/media/cec.h
index abee41ae02d0..6556cc161dc0 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -121,14 +121,16 @@ struct cec_adap_ops {
 	void (*adap_configured)(struct cec_adapter *adap, bool configured);
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 			     u32 signal_free_time, struct cec_msg *msg);
+	void (*adap_nb_transmit_canceled)(struct cec_adapter *adap,
+					  const struct cec_msg *msg);
 	void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
 	void (*adap_free)(struct cec_adapter *adap);
 
-	/* Error injection callbacks */
+	/* Error injection callbacks, called without adap->lock held */
 	int (*error_inj_show)(struct cec_adapter *adap, struct seq_file *sf);
 	bool (*error_inj_parse_line)(struct cec_adapter *adap, char *line);
 
-	/* High-level CEC message callback */
+	/* High-level CEC message callback, called without adap->lock held */
 	int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 };
 
-- 
2.39.2


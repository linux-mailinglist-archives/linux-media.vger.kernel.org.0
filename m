Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9D572C6B7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 15:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjFLN70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 09:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjFLN7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 09:59:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B841B19AF
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:58:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C178962983
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 13:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E9C433D2;
        Mon, 12 Jun 2023 13:58:43 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Zheng Zhang <zheng.zhang@email.ucr.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] media: cec: core: add adap_unconfigured() callback
Date:   Mon, 12 Jun 2023 15:58:38 +0200
Message-Id: <20230612135839.254935-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612135839.254935-1-hverkuil-cisco@xs4all.nl>
References: <20230612135839.254935-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The adap_configured() callback was called with the adap->lock mutex
held if the 'configured' argument was false, and without the adap->lock
mutex held if that argument was true.

That was very confusing, and so split this up in a adap_unconfigured()
callback and a high-level configured() callback.

This also makes it easier to understand when the mutex is held: all
low-level adap_* callbacks are called with the mutex held. All other
callbacks are called without that mutex held.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: f1b57164305d ("media: cec: add optional adap_configured callback")
---
 drivers/media/cec/core/cec-adap.c | 4 ++--
 include/media/cec.h               | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index f8cb8542e5e9..17f780740e2b 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1348,7 +1348,7 @@ static void cec_adap_unconfigure(struct cec_adapter *adap)
 	cec_flush(adap);
 	wake_up_interruptible(&adap->kthread_waitq);
 	cec_post_state_event(adap);
-	call_void_op(adap, adap_configured, false);
+	call_void_op(adap, adap_unconfigured);
 }
 
 /*
@@ -1539,7 +1539,7 @@ static int cec_config_thread_func(void *arg)
 	adap->kthread_config = NULL;
 	complete(&adap->config_completion);
 	mutex_unlock(&adap->lock);
-	call_void_op(adap, adap_configured, true);
+	call_void_op(adap, configured);
 	return 0;
 
 unconfigure:
diff --git a/include/media/cec.h b/include/media/cec.h
index 6556cc161dc0..9c007f83569a 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -113,12 +113,12 @@ struct cec_fh {
 #define CEC_FREE_TIME_TO_USEC(ft)		((ft) * 2400)
 
 struct cec_adap_ops {
-	/* Low-level callbacks */
+	/* Low-level callbacks, called with adap->lock held */
 	int (*adap_enable)(struct cec_adapter *adap, bool enable);
 	int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);
 	int (*adap_monitor_pin_enable)(struct cec_adapter *adap, bool enable);
 	int (*adap_log_addr)(struct cec_adapter *adap, u8 logical_addr);
-	void (*adap_configured)(struct cec_adapter *adap, bool configured);
+	void (*adap_unconfigured)(struct cec_adapter *adap);
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 			     u32 signal_free_time, struct cec_msg *msg);
 	void (*adap_nb_transmit_canceled)(struct cec_adapter *adap,
@@ -131,6 +131,7 @@ struct cec_adap_ops {
 	bool (*error_inj_parse_line)(struct cec_adapter *adap, char *line);
 
 	/* High-level CEC message callback, called without adap->lock held */
+	void (*configured)(struct cec_adapter *adap);
 	int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 };
 
-- 
2.39.2


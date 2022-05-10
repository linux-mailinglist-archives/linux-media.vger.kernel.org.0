Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE543521E03
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241723AbiEJPWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345604AbiEJPUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F2D57B23
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC96F619EC
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B234AC385A6;
        Tue, 10 May 2022 15:00:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/7] cec-adap.c: fix is_configuring state
Date:   Tue, 10 May 2022 17:00:20 +0200
Message-Id: <20220510150022.1787112-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
References: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
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

If an adapter is trying to claim a free logical address then it is
in the 'is_configuring' state. If during that process the cable is
disconnected (HPD goes low, which in turn invalidates the physical
address), then cec_adap_unconfigure() is called, and that set the
is_configuring boolean to false, even though the thread that's
trying to claim an LA is still running.

Don't touch the is_configuring bool in cec_adap_unconfigure(), it
will eventually be cleared by the thread. By making that change
the cec_config_log_addr() function also had to change: it was
aborting if is_configuring became false (since that is what
cec_adap_unconfigure() did), but that no longer works. Instead
check if the physical address is invalid. That is a much
more appropriate check anyway.

This fixes a bug where the the adapter could be disabled even
though the device was still configuring. This could cause POLL
transmits to time out.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 004121e3582a..6c235503dd92 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1275,7 +1275,7 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 		 * While trying to poll the physical address was reset
 		 * and the adapter was unconfigured, so bail out.
 		 */
-		if (!adap->is_configuring)
+		if (adap->phys_addr == CEC_PHYS_ADDR_INVALID)
 			return -EINTR;
 
 		if (err)
@@ -1332,7 +1332,6 @@ static void cec_adap_unconfigure(struct cec_adapter *adap)
 	if (!adap->needs_hpd || adap->phys_addr != CEC_PHYS_ADDR_INVALID)
 		WARN_ON(call_op(adap, adap_log_addr, CEC_LOG_ADDR_INVALID));
 	adap->log_addrs.log_addr_mask = 0;
-	adap->is_configuring = false;
 	adap->is_configured = false;
 	cec_flush(adap);
 	wake_up_interruptible(&adap->kthread_waitq);
@@ -1526,9 +1525,10 @@ static int cec_config_thread_func(void *arg)
 	for (i = 0; i < las->num_log_addrs; i++)
 		las->log_addr[i] = CEC_LOG_ADDR_INVALID;
 	cec_adap_unconfigure(adap);
+	adap->is_configuring = false;
 	adap->kthread_config = NULL;
-	mutex_unlock(&adap->lock);
 	complete(&adap->config_completion);
+	mutex_unlock(&adap->lock);
 	return 0;
 }
 
-- 
2.34.1


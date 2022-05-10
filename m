Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0EEA521E06
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345565AbiEJPWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345603AbiEJPUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451F9546AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D5E0C61998
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBB8C385C2;
        Tue, 10 May 2022 15:00:30 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/7] cec-adap.c: reconfigure if the PA changes during configuration
Date:   Tue, 10 May 2022 17:00:21 +0200
Message-Id: <20220510150022.1787112-7-hverkuil-cisco@xs4all.nl>
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

If the physical address changes (i.e. becomes invalid, then valid again)
while the adapter is still claiming free logical addresses, then trigger
a reconfiguration since any claimed LAs may now be stale.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 20 +++++++++++++++++++-
 include/media/cec.h               |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 6c235503dd92..38c43a37133d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1278,6 +1278,10 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 		if (adap->phys_addr == CEC_PHYS_ADDR_INVALID)
 			return -EINTR;
 
+		/* Also bail out if the PA changed while configuring. */
+		if (adap->must_reconfigure)
+			return -EINTR;
+
 		if (err)
 			return err;
 
@@ -1405,6 +1409,7 @@ static int cec_config_thread_func(void *arg)
 	if (las->log_addr_type[0] == CEC_LOG_ADDR_TYPE_UNREGISTERED)
 		goto configured;
 
+reconfigure:
 	for (i = 0; i < las->num_log_addrs; i++) {
 		unsigned int type = las->log_addr_type[i];
 		const u8 *la_list;
@@ -1427,6 +1432,13 @@ static int cec_config_thread_func(void *arg)
 			last_la = la_list[0];
 
 		err = cec_config_log_addr(adap, i, last_la);
+
+		if (adap->must_reconfigure) {
+			adap->must_reconfigure = false;
+			las->log_addr_mask = 0;
+			goto reconfigure;
+		}
+
 		if (err > 0) /* Reused last LA */
 			continue;
 
@@ -1472,6 +1484,7 @@ static int cec_config_thread_func(void *arg)
 		las->log_addr[i] = CEC_LOG_ADDR_INVALID;
 	adap->is_configured = true;
 	adap->is_configuring = false;
+	adap->must_reconfigure = false;
 	cec_post_state_event(adap);
 
 	/*
@@ -1526,6 +1539,7 @@ static int cec_config_thread_func(void *arg)
 		las->log_addr[i] = CEC_LOG_ADDR_INVALID;
 	cec_adap_unconfigure(adap);
 	adap->is_configuring = false;
+	adap->must_reconfigure = false;
 	adap->kthread_config = NULL;
 	complete(&adap->config_completion);
 	mutex_unlock(&adap->lock);
@@ -1649,7 +1663,11 @@ void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 
 	adap->phys_addr = phys_addr;
 	cec_post_state_event(adap);
-	if (adap->log_addrs.num_log_addrs)
+	if (!adap->log_addrs.num_log_addrs)
+		return;
+	if (adap->is_configuring)
+		adap->must_reconfigure = true;
+	else
 		cec_claim_log_addrs(adap, block);
 }
 
diff --git a/include/media/cec.h b/include/media/cec.h
index 6f13b0222aa3..6c9b41fe9802 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -184,6 +184,7 @@ struct cec_adap_ops {
  *	in order to transmit or receive CEC messages. This is usually a HW
  *	limitation.
  * @is_configuring:	the CEC adapter is configuring (i.e. claiming LAs)
+ * @must_reconfigure:	while configuring, the PA changed, so reclaim LAs
  * @is_configured:	the CEC adapter is configured (i.e. has claimed LAs)
  * @cec_pin_is_high:	if true then the CEC pin is high. Only used with the
  *	CEC pin framework.
@@ -243,6 +244,7 @@ struct cec_adapter {
 	u16 phys_addr;
 	bool needs_hpd;
 	bool is_configuring;
+	bool must_reconfigure;
 	bool is_configured;
 	bool cec_pin_is_high;
 	bool adap_controls_phys_addr;
-- 
2.34.1


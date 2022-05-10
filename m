Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9862521E0A
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345603AbiEJPWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345596AbiEJPUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC4D54F93
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD373619EC
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B584BC385C9;
        Tue, 10 May 2022 15:00:27 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/7] cec-adap.c: don't unconfigure if already unconfigured
Date:   Tue, 10 May 2022 17:00:18 +0200
Message-Id: <20220510150022.1787112-4-hverkuil-cisco@xs4all.nl>
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

The __cec_s_log_addrs() function can configure or unconfigure the
adapter. The ioctl handler in cec-api.c will prevent it from being
called to configure the adapter if it was already configured (or in
the process of configuring). But it can still be called to unconfigure
an already unconfigured adapter, and it didn't check for that.

This can cause cec_activate_cnt_dec() to be called too often, causing
a WARN_ON.

Instead first check if adap->log_addrs.num_log_addrs == 0 and return
since in that case the adapter is already unconfigured.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index e789aec7455c..b47280fa3b87 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1709,9 +1709,10 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		return -ENODEV;
 
 	if (!log_addrs || log_addrs->num_log_addrs == 0) {
-		if (!adap->is_configuring && !adap->is_configured)
+		if (!adap->log_addrs.num_log_addrs)
 			return 0;
-		cec_adap_unconfigure(adap);
+		if (adap->is_configuring || adap->is_configured)
+			cec_adap_unconfigure(adap);
 		adap->log_addrs.num_log_addrs = 0;
 		for (i = 0; i < CEC_MAX_LOG_ADDRS; i++)
 			adap->log_addrs.log_addr[i] = CEC_LOG_ADDR_INVALID;
-- 
2.34.1


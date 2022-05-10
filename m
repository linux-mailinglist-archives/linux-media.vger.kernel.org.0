Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58F0521E10
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345639AbiEJPWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345406AbiEJPUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521772FFF6
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF827619EF
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A09C385DB;
        Tue, 10 May 2022 15:00:28 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/7] cec-adap.c: stop trying LAs on CEC_TX_STATUS_TIMEOUT
Date:   Tue, 10 May 2022 17:00:19 +0200
Message-Id: <20220510150022.1787112-5-hverkuil-cisco@xs4all.nl>
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

If, while trying to claim a free logical address, a POLL message
times out, then abort this process. A CEC_TX_STATUS_TIMEOUT
should be handled the same as a CEC_TX_STATUS_ABORTED.

This avoids a situation where transmits time out due to a
driver or hardware bug and it takes ages before the attempt
to find available free logical addresses finishes.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index b47280fa3b87..004121e3582a 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1282,10 +1282,11 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 			return err;
 
 		/*
-		 * The message was aborted due to a disconnect or
+		 * The message was aborted or timed out due to a disconnect or
 		 * unconfigure, just bail out.
 		 */
-		if (msg.tx_status & CEC_TX_STATUS_ABORTED)
+		if (msg.tx_status &
+		    (CEC_TX_STATUS_ABORTED | CEC_TX_STATUS_TIMEOUT))
 			return -EINTR;
 		if (msg.tx_status & CEC_TX_STATUS_OK)
 			return 0;
-- 
2.34.1


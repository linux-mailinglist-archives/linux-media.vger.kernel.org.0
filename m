Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D814DC6DE
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 13:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbiCQM4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 08:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbiCQMzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 08:55:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FE1A27C0
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 05:53:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EA557B81DA1
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 12:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AFBC340F4;
        Thu, 17 Mar 2022 12:53:51 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 4/7] cec.h: add cec_msg_recv_is_rx/tx_result helpers
Date:   Thu, 17 Mar 2022 13:53:43 +0100
Message-Id: <20220317125346.145105-5-hverkuil-cisco@xs4all.nl>
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

These two helper functions return true if the received message
contains the result of a previous non-blocking transmit. Either
the tx_status result (cec_msg_recv_is_tx_result) of the transmit,
or the rx_status result (cec_msg_recv_is_rx_result) of the reply
to the original transmit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/cec.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index de936f5e446d..1d48da926216 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -142,6 +142,26 @@ static inline void cec_msg_set_reply_to(struct cec_msg *msg,
 	msg->reply = msg->timeout = 0;
 }
 
+/**
+ * cec_msg_recv_is_tx_result - return true if this message contains the
+ *			       result of an earlier non-blocking transmit
+ * @msg:	the message structure from CEC_RECEIVE
+ */
+static inline int cec_msg_recv_is_tx_result(const struct cec_msg *msg)
+{
+	return msg->sequence && msg->tx_status && !msg->rx_status;
+}
+
+/**
+ * cec_msg_recv_is_rx_result - return true if this message contains the
+ *			       reply of an earlier non-blocking transmit
+ * @msg:	the message structure from CEC_RECEIVE
+ */
+static inline int cec_msg_recv_is_rx_result(const struct cec_msg *msg)
+{
+	return msg->sequence && !msg->tx_status && msg->rx_status;
+}
+
 /* cec_msg flags field */
 #define CEC_MSG_FL_REPLY_TO_FOLLOWERS	(1 << 0)
 #define CEC_MSG_FL_RAW			(1 << 1)
-- 
2.34.1


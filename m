Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E544F12FC
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 12:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357150AbiDDKUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356990AbiDDKUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 06:20:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA583C723
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 03:18:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A918614E5
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53066C340EE;
        Mon,  4 Apr 2022 10:18:17 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 4/7] cec.h: add cec_msg_recv_is_rx/tx_result helpers
Date:   Mon,  4 Apr 2022 12:18:08 +0200
Message-Id: <20220404101811.3359944-5-hverkuil-cisco@xs4all.nl>
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


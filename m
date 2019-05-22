Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E54260DC
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbfEVJ4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:56:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40907 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728987AbfEVJz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:56 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyUhvAl2; Wed, 22 May 2019 11:55:54 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 5/7] cec: support CEC_MSG_FL_RAW
Date:   Wed, 22 May 2019 11:55:48 +0200
Message-Id: <20190522095550.22026-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
References: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIcmtYl3UQfYh3G38ZQhSQHa7SHIksiZYZ/LbMIZTD+JaNvxnbX3RctSzWq1T1sKc/uxgP3mJBuLjkC2CiOkYwnQeRjkp+ZuseeCDJmDkhA/e7cEx1pq
 YcIDzDOhaSgvkrsz+y3G1lwccmnoAq0OCR9GVM/u04X5KLNpaP1nyFc8Po6mAOmZFAh4X5R5FqerSCwxbbN+drK16b2hkEFtkWpuhQDedAh8eZTeqp7brV9F
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If this flag is set, then check for root permissions and skip
all message checks expect for the core checks (i.e. validate the
length etc.).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 107 ++++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 5b9232b6e663..9a1ec9299aca 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -720,6 +720,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 			struct cec_fh *fh, bool block)
 {
 	struct cec_data *data;
+	bool is_raw = msg_is_raw(msg);
 
 	msg->rx_ts = 0;
 	msg->tx_ts = 0;
@@ -735,10 +736,10 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		/* Make sure the timeout isn't 0. */
 		msg->timeout = 1000;
 	}
-	if (msg->timeout)
-		msg->flags &= CEC_MSG_FL_REPLY_TO_FOLLOWERS;
-	else
-		msg->flags = 0;
+	msg->flags &= CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW;
+
+	if (!msg->timeout)
+		msg->flags &= ~CEC_MSG_FL_REPLY_TO_FOLLOWERS;
 
 	/* Sanity checks */
 	if (msg->len == 0 || msg->len > CEC_MAX_MSG_SIZE) {
@@ -761,54 +762,70 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		return -EINVAL;
 	}
 
-	/* A CDC-Only device can only send CDC messages */
-	if ((adap->log_addrs.flags & CEC_LOG_ADDRS_FL_CDC_ONLY) &&
-	    (msg->len == 1 || msg->msg[1] != CEC_MSG_CDC_MESSAGE))
-		return -EINVAL;
+	if (is_raw) {
+		if (!capable(CAP_SYS_RAWIO))
+			return -EPERM;
+	} else {
+		/* A CDC-Only device can only send CDC messages */
+		if ((adap->log_addrs.flags & CEC_LOG_ADDRS_FL_CDC_ONLY) &&
+		    (msg->len == 1 || msg->msg[1] != CEC_MSG_CDC_MESSAGE)) {
+			dprintk(1, "%s: not a CDC message\n", __func__);
+			return -EINVAL;
+		}
 
-	if (msg->len >= 4 && msg->msg[1] == CEC_MSG_CDC_MESSAGE) {
-		msg->msg[2] = adap->phys_addr >> 8;
-		msg->msg[3] = adap->phys_addr & 0xff;
-	}
+		if (msg->len >= 4 && msg->msg[1] == CEC_MSG_CDC_MESSAGE) {
+			msg->msg[2] = adap->phys_addr >> 8;
+			msg->msg[3] = adap->phys_addr & 0xff;
+		}
 
-	if (msg->len == 1) {
-		if (cec_msg_destination(msg) == 0xf) {
-			dprintk(1, "%s: invalid poll message\n", __func__);
+		if (msg->len == 1) {
+			if (cec_msg_destination(msg) == 0xf) {
+				dprintk(1, "%s: invalid poll message\n",
+					__func__);
+				return -EINVAL;
+			}
+			if (cec_has_log_addr(adap, cec_msg_destination(msg))) {
+				/*
+				 * If the destination is a logical address our
+				 * adapter has already claimed, then just NACK
+				 * this. It depends on the hardware what it will
+				 * do with a POLL to itself (some OK this), so
+				 * it is just as easy to handle it here so the
+				 * behavior will be consistent.
+				 */
+				msg->tx_ts = ktime_get_ns();
+				msg->tx_status = CEC_TX_STATUS_NACK |
+					CEC_TX_STATUS_MAX_RETRIES;
+				msg->tx_nack_cnt = 1;
+				msg->sequence = ++adap->sequence;
+				if (!msg->sequence)
+					msg->sequence = ++adap->sequence;
+				return 0;
+			}
+		}
+		if (msg->len > 1 && !cec_msg_is_broadcast(msg) &&
+		    cec_has_log_addr(adap, cec_msg_destination(msg))) {
+			dprintk(1, "%s: destination is the adapter itself\n",
+				__func__);
 			return -EINVAL;
 		}
-		if (cec_has_log_addr(adap, cec_msg_destination(msg))) {
-			/*
-			 * If the destination is a logical address our adapter
-			 * has already claimed, then just NACK this.
-			 * It depends on the hardware what it will do with a
-			 * POLL to itself (some OK this), so it is just as
-			 * easy to handle it here so the behavior will be
-			 * consistent.
-			 */
-			msg->tx_ts = ktime_get_ns();
-			msg->tx_status = CEC_TX_STATUS_NACK |
-					 CEC_TX_STATUS_MAX_RETRIES;
-			msg->tx_nack_cnt = 1;
-			msg->sequence = ++adap->sequence;
-			if (!msg->sequence)
-				msg->sequence = ++adap->sequence;
-			return 0;
+		if (msg->len > 1 && adap->is_configured &&
+		    !cec_has_log_addr(adap, cec_msg_initiator(msg))) {
+			dprintk(1, "%s: initiator has unknown logical address %d\n",
+				__func__, cec_msg_initiator(msg));
+			return -EINVAL;
+		}
+		if (!adap->is_configured && !adap->is_configuring &&
+		    msg->msg[0] != 0xf0) {
+			dprintk(1, "%s: adapter is unconfigured\n", __func__);
+			return -ENONET;
 		}
 	}
-	if (msg->len > 1 && !cec_msg_is_broadcast(msg) &&
-	    cec_has_log_addr(adap, cec_msg_destination(msg))) {
-		dprintk(1, "%s: destination is the adapter itself\n", __func__);
-		return -EINVAL;
-	}
-	if (msg->len > 1 && adap->is_configured &&
-	    !cec_has_log_addr(adap, cec_msg_initiator(msg))) {
-		dprintk(1, "%s: initiator has unknown logical address %d\n",
-			__func__, cec_msg_initiator(msg));
-		return -EINVAL;
-	}
+
 	if (!adap->is_configured && !adap->is_configuring) {
-		if (adap->needs_hpd || msg->msg[0] != 0xf0) {
-			dprintk(1, "%s: adapter is unconfigured\n", __func__);
+		if (adap->needs_hpd) {
+			dprintk(1, "%s: adapter is unconfigured and needs HPD\n",
+				__func__);
 			return -ENONET;
 		}
 		if (msg->reply) {
-- 
2.20.1


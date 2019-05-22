Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8D2260D5
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbfEVJzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:55:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40731 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728802AbfEVJzz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:55 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyThvAka; Wed, 22 May 2019 11:55:54 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 1/7] cec: cec_transmit_msg_fh: do sanity checks first
Date:   Wed, 22 May 2019 11:55:44 +0200
Message-Id: <20190522095550.22026-2-hverkuil-cisco@xs4all.nl>
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

The code that fills in the CEC_MSG_CDC_MESSAGE physical address
is now done after the sanity checks. It also only does this if the
message length is >= 4 (i.e. there is room for the physical address).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index f1261cc2b6fa..b6102510e203 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -740,11 +740,6 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	else
 		msg->flags = 0;
 
-	if (msg->len > 1 && msg->msg[1] == CEC_MSG_CDC_MESSAGE) {
-		msg->msg[2] = adap->phys_addr >> 8;
-		msg->msg[3] = adap->phys_addr & 0xff;
-	}
-
 	/* Sanity checks */
 	if (msg->len == 0 || msg->len > CEC_MAX_MSG_SIZE) {
 		dprintk(1, "%s: invalid length %d\n", __func__, msg->len);
@@ -765,6 +760,12 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		dprintk(1, "%s: can't reply to poll msg\n", __func__);
 		return -EINVAL;
 	}
+
+	if (msg->len >= 4 && msg->msg[1] == CEC_MSG_CDC_MESSAGE) {
+		msg->msg[2] = adap->phys_addr >> 8;
+		msg->msg[3] = adap->phys_addr & 0xff;
+	}
+
 	if (msg->len == 1) {
 		if (cec_msg_destination(msg) == 0xf) {
 			dprintk(1, "%s: invalid poll message\n", __func__);
-- 
2.20.1


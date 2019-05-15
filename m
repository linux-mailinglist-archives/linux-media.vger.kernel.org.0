Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD491E9A0
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfEOH6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:58:33 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43371 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725941AbfEOH6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:58:32 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QonyhZzGqsDWyQoo2hrxaj; Wed, 15 May 2019 09:58:30 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/6] cec: move check from cec_transmit to cec_transmit_msg_fh
Date:   Wed, 15 May 2019 09:58:22 +0200
Message-Id: <20190515075826.18073-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
References: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfODe+GFDI/2Xjp3U8qugp5DdvyZTCgABHgdc17PVFeMJnr0zXVY/rKYZDalZltvlHLzNMWhsGcRlAesbzQBirxfhP8gvJmj3JQIoUFCIDJ156vTwUc8K
 zLYYy0GHqKEFYeb1lxv7Y7BMZpJ5vXNOoWoyFaiP1ongiGiVVHh34613VYuzfVxnQp6ql00B7x8Dr0PbzNapszwKPy6/hZM9+c8+qOAYXbImVQ0BTzxxHg9e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This ensures all the cec_msg checks are done in the same place.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 5 +++++
 drivers/media/cec/cec-api.c  | 8 --------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index b6102510e203..5b9232b6e663 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -761,6 +761,11 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		return -EINVAL;
 	}
 
+	/* A CDC-Only device can only send CDC messages */
+	if ((adap->log_addrs.flags & CEC_LOG_ADDRS_FL_CDC_ONLY) &&
+	    (msg->len == 1 || msg->msg[1] != CEC_MSG_CDC_MESSAGE))
+		return -EINVAL;
+
 	if (msg->len >= 4 && msg->msg[1] == CEC_MSG_CDC_MESSAGE) {
 		msg->msg[2] = adap->phys_addr >> 8;
 		msg->msg[3] = adap->phys_addr & 0xff;
diff --git a/drivers/media/cec/cec-api.c b/drivers/media/cec/cec-api.c
index 156a0d76ab2a..12d676484472 100644
--- a/drivers/media/cec/cec-api.c
+++ b/drivers/media/cec/cec-api.c
@@ -198,19 +198,11 @@ static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
 	if (copy_from_user(&msg, parg, sizeof(msg)))
 		return -EFAULT;
 
-	/* A CDC-Only device can only send CDC messages */
-	if ((adap->log_addrs.flags & CEC_LOG_ADDRS_FL_CDC_ONLY) &&
-	    (msg.len == 1 || msg.msg[1] != CEC_MSG_CDC_MESSAGE))
-		return -EINVAL;
-
 	mutex_lock(&adap->lock);
 	if (adap->log_addrs.num_log_addrs == 0)
 		err = -EPERM;
 	else if (adap->is_configuring)
 		err = -ENONET;
-	else if (!adap->is_configured &&
-		 (adap->needs_hpd || msg.msg[0] != 0xf0))
-		err = -ENONET;
 	else if (cec_is_busy(adap, fh))
 		err = -EBUSY;
 	else
-- 
2.20.1


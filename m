Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B78991E9A2
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfEOH6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:58:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41217 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726261AbfEOH6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:58:33 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QonyhZzGqsDWyQoo3hrxbE; Wed, 15 May 2019 09:58:31 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/6] cec: allow any initiator for Ping and Image/Text View On
Date:   Wed, 15 May 2019 09:58:26 +0200
Message-Id: <20190515075826.18073-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
References: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHvU08rlOlfI+4yXHa9eIkWzhTzHgE2Vy3ixP5KxUg1+m8zLtXYg1z74SKVLg9qBpVLbeqOoVBhfaZIo8OPjswgHFzpsQa+4B2Ngr9g8QyHtrfYLbF19
 E8zs6xwnYaPm8zEImaJyz6nICkOFF6brtGx1e/Rup2corSDC6kHAQEFw15Wg/X5RVpkicRP4abZC87DQcJrN7MlC9RZCi4dsAIHsz9wUiEsl53+hHRqYnXWo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some displays pull down the HPD when in standby, but CEC is still
active and the display can be woken up by sending an Image View On
or Text View On CEC command. The CEC specification doesn't tell you
what the initiator should be for such a command (without a HPD it's
unclear if the CEC adapter can claim a logical address).

This patch allows any initiator value when there is no HPD for the
Image/Text View On commands and for the Ping command.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 20f4d4b12ee4..2870baa206bb 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -809,14 +809,23 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 				__func__);
 			return -EINVAL;
 		}
-		if (msg->len > 1 && adap->is_configured &&
+		if (adap->is_configured &&
 		    !cec_has_log_addr(adap, cec_msg_initiator(msg))) {
 			dprintk(1, "%s: initiator has unknown logical address %d\n",
 				__func__, cec_msg_initiator(msg));
 			return -EINVAL;
 		}
+		/*
+		 * Special case: allow Ping and IMAGE/TEXT_VIEW_ON to be
+		 * transmitted to a TV, even if the adapter is unconfigured.
+		 * This makes it possible to detect or wake up displays that
+		 * pull down the HPD when in standby.
+		 */
 		if (!adap->is_configured && !adap->is_configuring &&
-		    msg->msg[0] != 0xf0) {
+		    (msg->len > 2 ||
+		     cec_msg_destination(msg) != CEC_LOG_ADDR_TV ||
+		     (msg->len == 2 && msg->msg[1] != CEC_MSG_IMAGE_VIEW_ON &&
+		      msg->msg[1] != CEC_MSG_TEXT_VIEW_ON))) {
 			dprintk(1, "%s: adapter is unconfigured\n", __func__);
 			return -ENONET;
 		}
-- 
2.20.1


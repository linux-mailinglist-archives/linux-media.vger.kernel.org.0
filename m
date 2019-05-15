Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 588971E99F
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfEOH6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:58:33 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38801 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfEOH6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:58:32 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QonyhZzGqsDWyQoo3hrxb1; Wed, 15 May 2019 09:58:31 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/6] cec: add CEC_MSG_FL_RAW flag and msg_is_raw helper function
Date:   Wed, 15 May 2019 09:58:24 +0200
Message-Id: <20190515075826.18073-5-hverkuil-cisco@xs4all.nl>
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

This adds the userspace API to send raw unchecked CEC messages.
This will require root permissions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-priv.h | 5 +++++
 include/uapi/linux/cec.h     | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/cec/cec-priv.h b/drivers/media/cec/cec-priv.h
index 804e38f849c7..7bdf855aaecd 100644
--- a/drivers/media/cec/cec-priv.h
+++ b/drivers/media/cec/cec-priv.h
@@ -20,6 +20,11 @@
 /* devnode to cec_adapter */
 #define to_cec_adapter(node) container_of(node, struct cec_adapter, devnode)
 
+static inline bool msg_is_raw(const struct cec_msg *msg)
+{
+	return msg->flags & CEC_MSG_FL_RAW;
+}
+
 /* cec-core.c */
 extern int cec_debug;
 int cec_get_device(struct cec_devnode *devnode);
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 3094af68b6e7..5704fa0292b5 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -144,6 +144,7 @@ static inline void cec_msg_set_reply_to(struct cec_msg *msg,
 
 /* cec_msg flags field */
 #define CEC_MSG_FL_REPLY_TO_FOLLOWERS	(1 << 0)
+#define CEC_MSG_FL_RAW			(1 << 1)
 
 /* cec_msg tx/rx_status field */
 #define CEC_TX_STATUS_OK		(1 << 0)
-- 
2.20.1


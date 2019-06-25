Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609AD55251
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbfFYOpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:16 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55205 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730925AbfFYOpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:16 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmh8hHoyn; Tue, 25 Jun 2019 16:45:14 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 01/13] cec-notifier: rename variables, check kstrdup and n->conn_name
Date:   Tue, 25 Jun 2019 16:44:58 +0200
Message-Id: <20190625144510.122214-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGotbewLqH47JURfpvjZTkncnARHewLy1oqUHYbwzqPtDPvONf3dtrG/IOF9QxJbcyVMhjJt0KGFoWLRBz8EwpyYk6Keyz/Fctqw4aQqOJHQ/TYw8FAZ
 q/JNFcyfuc4wW5+tsoG3t6uUODtH0DZ2Xi/TiHi1fivntsucHa1iEnys/uQpPQ/stBXYqgiICCeRH97g+cTXQn7vCCn2JDdbJ3lqx3i2e8CEI9JiHTQ73L8j
 UhvWGYzzEM2rJ3kbHLDBD0rmnc+jObwYRTPRw2ZWAYoGSJGYECk2wACzZ8jGgK66nAQzyN2IMCEMLGcpjhz1kZmEv44S2SELBDSYSLno5KDCTUJvEcuKVIlm
 VZZDhHwUBqYb+rYoInNBCGsprC+wmhF2rkQXHvZ7c9mBt8p0HLxl5lQcml6eeFcDcUEYjSDM
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dev -> hdmi_dev
conn -> conn_name

Check if n->conn_name is not NULL before calling strcmp.
Check the result of kstrdup, and clean up on error.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 9598c7778871..f72b19c351dd 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -21,8 +21,8 @@ struct cec_notifier {
 	struct mutex lock;
 	struct list_head head;
 	struct kref kref;
-	struct device *dev;
-	const char *conn;
+	struct device *hdmi_dev;
+	const char *conn_name;
 	struct cec_adapter *cec_adap;
 	void (*callback)(struct cec_adapter *adap, u16 pa);
 
@@ -32,14 +32,16 @@ struct cec_notifier {
 static LIST_HEAD(cec_notifiers);
 static DEFINE_MUTEX(cec_notifiers_lock);
 
-struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
+struct cec_notifier *
+cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
 {
 	struct cec_notifier *n;
 
 	mutex_lock(&cec_notifiers_lock);
 	list_for_each_entry(n, &cec_notifiers, head) {
-		if (n->dev == dev &&
-		    (!conn || !strcmp(n->conn, conn))) {
+		if (n->hdmi_dev == hdmi_dev &&
+		    (!conn_name ||
+		     (n->conn_name && !strcmp(n->conn_name, conn_name)))) {
 			kref_get(&n->kref);
 			mutex_unlock(&cec_notifiers_lock);
 			return n;
@@ -48,10 +50,17 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
 	n = kzalloc(sizeof(*n), GFP_KERNEL);
 	if (!n)
 		goto unlock;
-	n->dev = dev;
-	if (conn)
-		n->conn = kstrdup(conn, GFP_KERNEL);
+	n->hdmi_dev = hdmi_dev;
+	if (conn_name) {
+		n->conn_name = kstrdup(conn_name, GFP_KERNEL);
+		if (!n->conn_name) {
+			kfree(n);
+			n = NULL;
+			goto unlock;
+		}
+	}
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+
 	mutex_init(&n->lock);
 	kref_init(&n->kref);
 	list_add_tail(&n->head, &cec_notifiers);
@@ -67,7 +76,7 @@ static void cec_notifier_release(struct kref *kref)
 		container_of(kref, struct cec_notifier, kref);
 
 	list_del(&n->head);
-	kfree(n->conn);
+	kfree(n->conn_name);
 	kfree(n);
 }
 
-- 
2.20.1


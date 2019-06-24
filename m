Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEF2517E5
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbfFXQDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:38 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43491 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729496AbfFXQDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:38 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRQhZaa6; Mon, 24 Jun 2019 18:03:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 01/13] cec-notifier: rename variable, check kstrdup
Date:   Mon, 24 Jun 2019 18:03:18 +0200
Message-Id: <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM5cfxY3qb1mJIOEfAgwxyzmneGu3DOIaGPtL1rXLfi9ZKPJS+IAvic+bCsU2HYwU9mQ1Jj1vHvFgU1ggcDsS/Y2kgf9iITUsRBXY3PD2phToQDCc7VC
 D9qy5VUksdVPfDlhsMqkQ4ta3+MCDxaWUKQ6XF5uM0Pgj8Uzc7q7Z4+g7+bpnB84Bzr3ImR4/G2lpXfhExjbQs/zQ97F56agQHKYWaPCoJmGfuiZ99gNPSLK
 xMJH1wmKXksLI0BBia8s4T9UWN9fi3EdUobR/y8KiTA3A0PzNCZXkjLgBIpfyRqz/hqiWNfSRoqggyZF2UVHrUoIBaIJIgyVr8uN0djZrO4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dev -> hdmi_dev
conn -> conn_name

Also check the result of kstrdup, and clean up on error.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 9598c7778871..ce10dfd400bb 100644
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
 
@@ -32,14 +32,15 @@ struct cec_notifier {
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
+		    (!conn_name || !strcmp(n->conn_name, conn_name))) {
 			kref_get(&n->kref);
 			mutex_unlock(&cec_notifiers_lock);
 			return n;
@@ -48,10 +49,17 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
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
@@ -67,7 +75,7 @@ static void cec_notifier_release(struct kref *kref)
 		container_of(kref, struct cec_notifier, kref);
 
 	list_del(&n->head);
-	kfree(n->conn);
+	kfree(n->conn_name);
 	kfree(n);
 }
 
-- 
2.20.1


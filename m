Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B48F523FA
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 09:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfFYHHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 03:07:49 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46299 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbfFYHHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 03:07:49 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ffYOhO6AvF85OffYRhchmM; Tue, 25 Jun 2019 09:07:47 +0200
Subject: [PATCHv8.1 01/13] cec-notifier: rename variables, check kstrdup and
 n->conn_name
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bb646980-1370-305f-4713-de3ce9a66f11@xs4all.nl>
Date:   Tue, 25 Jun 2019 09:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA1P0iasV3W6n3T4DHGY+SoAt8ggAAuDAuGnrH1xR4BJh/OIid1tz3Q+Ub7MdLY/3eaPrZtaunghFYQMSWw0+uzpxAcGt6d3zryKNUVpqIO9msWihqjy
 0giwO0Q1HI0LSu9q4/A+28l+jjcs+jfwVctambJGemvIbt7UNiFMpOj8NrIl8AxPHSHmTBAhig7oA+32nAlbrdPvBZBc+5BepKFvTxWWdVcpvt1dpiROuR69
 xtWalsBOk1u0tBuYVJugf6Aex3rKnbVosteRzRLI8ekzLswOJ9mZRx0SRbd6URhG
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
Changes since v8:

- check n->conn_name before calling strcmp to make the code more robust
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



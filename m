Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B621867FC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgCPJgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:36:55 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47571 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730231AbgCPJgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:36:55 -0400
Received: from tschai.fritz.box ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DmAyjwybrEE3qDmB2jdJxQ; Mon, 16 Mar 2020 10:36:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584351412; bh=46F9Lj5wmPhexO7fmzCYsAVQWXVVPFeCVZGe3wuEKcc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=eRyuWEtuTpc0oiPaDQwjoR/YoFPafzyLmg7+04fI+G7IYU6h/RPuWWT1G40fYEcY5
         R6AyAW2hqxX3KYRjtDQaxqTI8SP67fO0rU5kALyg8vL/fLrFmNIEdV+cXk8kMhmteL
         7oj8rYOORviCrcJOLFJebbf1AuBvYiGPaX4vNSfd4CPvRQQEQok00W1abCCLv45gZZ
         TlfC2OAMg2Fh/T/GJkafNvL/I1ToIhkVDTR2A5fSGVbNNvGTszgq7TYLNef+wNxCnl
         E2f8ypP3Fi/ngFckPFv/zjPXKXrS6bip04oC5GgRapO/756RY51cArURNPKQUm18xb
         wr/LN1q3V+fjw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] cec-notifier: rename conn_name to port_name
Date:   Mon, 16 Mar 2020 10:36:47 +0100
Message-Id: <20200316093648.1280689-2-hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316093648.1280689-1-hverkuil@xs4all.nl>
References: <20200316093648.1280689-1-hverkuil@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDaWk2F5em+x6HoDQRYP3KxlNC1sxz+oA7cj9QxTZRkXoC4KlafAsvkM1Os4fmzA27PVWvbqw7Acev1PcxDrSoMZOSZ1b02rpmn69xQFJLwQrm0idzkO
 LRox19YTfD6qAzeGNCYYEZqt8R/s9WZQCBMPiFivrUcSd8e61StoV/5L/1TityNE0SJNJJ5AlbHGltd4IGLnk6JAuWZtmUYAc9VovS3WJ5YkZGErjMRRmTuI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This argument refers to a stable name for an HDMI port, mostly i915
(ACPI) specific. Since we'll be introducing a more generic 'name' argument
as well later, rename this now to avoid confusion.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 24 ++++++++++++------------
 include/media/cec-notifier.h     | 16 ++++++++--------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 4a841bee5cc2..32a0828fbfe0 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -23,7 +23,7 @@ struct cec_notifier {
 	struct kref kref;
 	struct device *hdmi_dev;
 	struct cec_connector_info conn_info;
-	const char *conn_name;
+	const char *port_name;
 	struct cec_adapter *cec_adap;
 
 	u16 phys_addr;
@@ -33,15 +33,15 @@ static LIST_HEAD(cec_notifiers);
 static DEFINE_MUTEX(cec_notifiers_lock);
 
 struct cec_notifier *
-cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
+cec_notifier_get_conn(struct device *hdmi_dev, const char *port_name)
 {
 	struct cec_notifier *n;
 
 	mutex_lock(&cec_notifiers_lock);
 	list_for_each_entry(n, &cec_notifiers, head) {
 		if (n->hdmi_dev == hdmi_dev &&
-		    (!conn_name ||
-		     (n->conn_name && !strcmp(n->conn_name, conn_name)))) {
+		    (!port_name ||
+		     (n->port_name && !strcmp(n->port_name, port_name)))) {
 			kref_get(&n->kref);
 			mutex_unlock(&cec_notifiers_lock);
 			return n;
@@ -51,9 +51,9 @@ cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
 	if (!n)
 		goto unlock;
 	n->hdmi_dev = hdmi_dev;
-	if (conn_name) {
-		n->conn_name = kstrdup(conn_name, GFP_KERNEL);
-		if (!n->conn_name) {
+	if (port_name) {
+		n->port_name = kstrdup(port_name, GFP_KERNEL);
+		if (!n->port_name) {
 			kfree(n);
 			n = NULL;
 			goto unlock;
@@ -76,7 +76,7 @@ static void cec_notifier_release(struct kref *kref)
 		container_of(kref, struct cec_notifier, kref);
 
 	list_del(&n->head);
-	kfree(n->conn_name);
+	kfree(n->port_name);
 	kfree(n);
 }
 
@@ -88,10 +88,10 @@ static void cec_notifier_put(struct cec_notifier *n)
 }
 
 struct cec_notifier *
-cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 			   const struct cec_connector_info *conn_info)
 {
-	struct cec_notifier *n = cec_notifier_get_conn(hdmi_dev, conn_name);
+	struct cec_notifier *n = cec_notifier_get_conn(hdmi_dev, port_name);
 
 	if (!n)
 		return n;
@@ -129,7 +129,7 @@ void cec_notifier_conn_unregister(struct cec_notifier *n)
 EXPORT_SYMBOL_GPL(cec_notifier_conn_unregister);
 
 struct cec_notifier *
-cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 			       struct cec_adapter *adap)
 {
 	struct cec_notifier *n;
@@ -137,7 +137,7 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
 	if (WARN_ON(!adap))
 		return NULL;
 
-	n = cec_notifier_get_conn(hdmi_dev, conn_name);
+	n = cec_notifier_get_conn(hdmi_dev, port_name);
 	if (!n)
 		return n;
 
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 139e93be13b0..c4a7624c5f83 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -40,11 +40,11 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev,
  * cec_notifier_conn_register - find or create a new cec_notifier for the given
  * HDMI device and connector tuple.
  * @hdmi_dev: HDMI device that sends the events.
- * @conn_name: the connector name from which the event occurs. May be NULL
+ * @port_name: the connector name from which the event occurs. May be NULL
  * if there is always only one HDMI connector created by the HDMI device.
  * @conn_info: the connector info from which the event occurs (may be NULL)
  *
- * If a notifier for device @dev and connector @conn_name already exists, then
+ * If a notifier for device @dev and connector @port_name already exists, then
  * increase the refcount and return that notifier.
  *
  * If it doesn't exist, then allocate a new notifier struct and return a
@@ -53,7 +53,7 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev,
  * Return NULL if the memory could not be allocated.
  */
 struct cec_notifier *
-cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 			   const struct cec_connector_info *conn_info);
 
 /**
@@ -67,11 +67,11 @@ void cec_notifier_conn_unregister(struct cec_notifier *n);
  * cec_notifier_cec_adap_register - find or create a new cec_notifier for the
  * given device.
  * @hdmi_dev: HDMI device that sends the events.
- * @conn_name: the connector name from which the event occurs. May be NULL
+ * @port_name: the connector name from which the event occurs. May be NULL
  * if there is always only one HDMI connector created by the HDMI device.
  * @adap: the cec adapter that registered this notifier.
  *
- * If a notifier for device @dev and connector @conn_name already exists, then
+ * If a notifier for device @dev and connector @port_name already exists, then
  * increase the refcount and return that notifier.
  *
  * If it doesn't exist, then allocate a new notifier struct and return a
@@ -80,7 +80,7 @@ void cec_notifier_conn_unregister(struct cec_notifier *n);
  * Return NULL if the memory could not be allocated.
  */
 struct cec_notifier *
-cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 			       struct cec_adapter *adap);
 
 /**
@@ -133,7 +133,7 @@ static inline struct cec_notifier *cec_notifier_get_conn(struct device *dev,
 }
 
 static inline struct cec_notifier *
-cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 			   const struct cec_connector_info *conn_info)
 {
 	/* A non-NULL pointer is expected on success */
@@ -145,7 +145,7 @@ static inline void cec_notifier_conn_unregister(struct cec_notifier *n)
 }
 
 static inline struct cec_notifier *
-cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 			       struct cec_adapter *adap)
 {
 	/* A non-NULL pointer is expected on success */
-- 
2.25.1


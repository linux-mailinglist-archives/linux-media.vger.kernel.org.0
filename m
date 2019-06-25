Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A167055253
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731118AbfFYOpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:17 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:37353 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730929AbfFYOpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:17 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmh9hHoz3; Tue, 25 Jun 2019 16:45:15 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 03/13] cec-notifier: add new notifier functions
Date:   Tue, 25 Jun 2019 16:45:00 +0200
Message-Id: <20190625144510.122214-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfP1HhDxx2e9wZi4i8ZcXqQoOcGzGa4fKsVYmXt9nU2Qj4AfFWNVk981GzYRX2gTsiwoddBMxxk9pAfFLdRuwSfgw3OyGvtsf7R4z2nAEEOyGswU0fivE
 zpDhTah8gmvrYb0YMjoatUiNjw8ZeD0NX379atdhV7WvGob3Ew6MQjgSwOl/3sNJiSEjdbOjUPr+3726GIRsagXsQ0q1H5KiU61mYu+oX0tfGWwicj4v8W2u
 243st8beky4IVsDjWavuHOalUhsiprIqQETnT8hTXMS8DrVnlg3pG/5oDak7UwLY7UHLmQgLDkJySgJKlnvoVlFd3yR1yGwh3t8504AMXgQC2cfVN334lDN0
 qXWYSSsRGr4Qi5RkGtg3G6TBfBoqlvlOZ1KCRfGRQMkDqaI2GuWUb6xCGUOMi+ON/h6FVZyW
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support multiple CEC devices for an HDMI connector,
and to support cec_connector_info, drivers should use either a
cec_notifier_conn_(un)register pair of functions (HDMI drivers)
or a cec_notifier_cec_adap_(un)register pair (CEC adapter drivers).

This replaces cec_notifier_get_conn/cec_notifier_put.

For CEC adapters it is also no longer needed to call cec_notifier_register,
cec_register_cec_notifier and cec_notifier_unregister. This is now
all handled internally by the new functions.

The 'called_cec_notifier_register' bool is needed to handle the case where
a CEC adapter driver calls the old cec_notifier_register() function
instead of cec_notifier_cec_adap_unregister().

Once those old functions are removed in the future, that bool can also
be removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 85 ++++++++++++++++++++++++++++++++
 include/media/cec-notifier.h     | 78 +++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index f72b19c351dd..52a867bde15f 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -22,6 +22,7 @@ struct cec_notifier {
 	struct list_head head;
 	struct kref kref;
 	struct device *hdmi_dev;
+	struct cec_connector_info conn_info;
 	const char *conn_name;
 	struct cec_adapter *cec_adap;
 	void (*callback)(struct cec_adapter *adap, u16 pa);
@@ -88,6 +89,84 @@ void cec_notifier_put(struct cec_notifier *n)
 }
 EXPORT_SYMBOL_GPL(cec_notifier_put);
 
+struct cec_notifier *
+cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+			   const struct cec_connector_info *conn_info)
+{
+	struct cec_notifier *n = cec_notifier_get_conn(hdmi_dev, conn_name);
+
+	if (!n)
+		return n;
+
+	mutex_lock(&n->lock);
+	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	if (conn_info)
+		n->conn_info = *conn_info;
+	else
+		memset(&n->conn_info, 0, sizeof(n->conn_info));
+	if (n->cec_adap) {
+		cec_phys_addr_invalidate(n->cec_adap);
+		cec_s_conn_info(n->cec_adap, conn_info);
+	}
+	mutex_unlock(&n->lock);
+	return n;
+}
+EXPORT_SYMBOL_GPL(cec_notifier_conn_register);
+
+void cec_notifier_conn_unregister(struct cec_notifier *n)
+{
+	if (!n)
+		return;
+
+	mutex_lock(&n->lock);
+	memset(&n->conn_info, 0, sizeof(n->conn_info));
+	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	if (n->cec_adap) {
+		cec_phys_addr_invalidate(n->cec_adap);
+		cec_s_conn_info(n->cec_adap, NULL);
+	}
+	mutex_unlock(&n->lock);
+	cec_notifier_put(n);
+}
+EXPORT_SYMBOL_GPL(cec_notifier_conn_unregister);
+
+struct cec_notifier *
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+			       struct cec_adapter *adap)
+{
+	struct cec_notifier *n;
+
+	if (WARN_ON(!adap))
+		return NULL;
+
+	n = cec_notifier_get_conn(hdmi_dev, conn_name);
+	if (!n)
+		return n;
+
+	mutex_lock(&n->lock);
+	n->cec_adap = adap;
+	adap->conn_info = n->conn_info;
+	adap->notifier = n;
+	cec_s_phys_addr(adap, n->phys_addr, false);
+	mutex_unlock(&n->lock);
+	return n;
+}
+EXPORT_SYMBOL_GPL(cec_notifier_cec_adap_register);
+
+void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
+{
+	if (!n)
+		return;
+
+	mutex_lock(&n->lock);
+	n->cec_adap->notifier = NULL;
+	n->cec_adap = NULL;
+	n->callback = NULL;
+	mutex_unlock(&n->lock);
+	cec_notifier_put(n);
+}
+EXPORT_SYMBOL_GPL(cec_notifier_cec_adap_unregister);
+
 void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 {
 	if (n == NULL)
@@ -97,6 +176,8 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 	n->phys_addr = pa;
 	if (n->callback)
 		n->callback(n->cec_adap, n->phys_addr);
+	else if (n->cec_adap)
+		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
@@ -131,6 +212,10 @@ EXPORT_SYMBOL_GPL(cec_notifier_register);
 
 void cec_notifier_unregister(struct cec_notifier *n)
 {
+	/* Do nothing unless cec_notifier_register was called first */
+	if (!n->callback)
+		return;
+
 	mutex_lock(&n->lock);
 	n->callback = NULL;
 	mutex_unlock(&n->lock);
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 0e3bd3415724..e8a677c90f6f 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -42,6 +42,60 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev,
  */
 void cec_notifier_put(struct cec_notifier *n);
 
+/**
+ * cec_notifier_conn_register - find or create a new cec_notifier for the given
+ * HDMI device and connector tuple.
+ * @hdmi_dev: HDMI device that sends the events.
+ * @conn_name: the connector name from which the event occurs. May be NULL
+ * if there is always only one HDMI connector created by the HDMI device.
+ * @conn_info: the connector info from which the event occurs (may be NULL)
+ *
+ * If a notifier for device @dev and connector @conn_name already exists, then
+ * increase the refcount and return that notifier.
+ *
+ * If it doesn't exist, then allocate a new notifier struct and return a
+ * pointer to that new struct.
+ *
+ * Return NULL if the memory could not be allocated.
+ */
+struct cec_notifier *
+cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+			   const struct cec_connector_info *conn_info);
+
+/**
+ * cec_notifier_conn_unregister - decrease refcount and delete when the
+ * refcount reaches 0.
+ * @n: notifier
+ */
+void cec_notifier_conn_unregister(struct cec_notifier *n);
+
+/**
+ * cec_notifier_cec_adap_register - find or create a new cec_notifier for the
+ * given device.
+ * @hdmi_dev: HDMI device that sends the events.
+ * @conn_name: the connector name from which the event occurs. May be NULL
+ * if there is always only one HDMI connector created by the HDMI device.
+ * @adap: the cec adapter that registered this notifier.
+ *
+ * If a notifier for device @dev and connector @conn_name already exists, then
+ * increase the refcount and return that notifier.
+ *
+ * If it doesn't exist, then allocate a new notifier struct and return a
+ * pointer to that new struct.
+ *
+ * Return NULL if the memory could not be allocated.
+ */
+struct cec_notifier *
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+			       struct cec_adapter *adap);
+
+/**
+ * cec_notifier_cec_adap_unregister - decrease refcount and delete when the
+ * refcount reaches 0.
+ * @n: notifier
+ */
+void cec_notifier_cec_adap_unregister(struct cec_notifier *n);
+
 /**
  * cec_notifier_set_phys_addr - set a new physical address.
  * @n: the CEC notifier
@@ -86,6 +140,30 @@ static inline void cec_notifier_put(struct cec_notifier *n)
 {
 }
 
+static inline struct cec_notifier *
+cec_notifier_conn_register(struct device *hdmi_dev, const char *conn_name,
+			   const struct cec_connector_info *conn_info)
+{
+	/* A non-NULL pointer is expected on success */
+	return (struct cec_notifier *)0xdeadfeed;
+}
+
+static inline void cec_notifier_conn_unregister(struct cec_notifier *n)
+{
+}
+
+static inline struct cec_notifier *
+cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
+			       struct cec_adapter *adap)
+{
+	/* A non-NULL pointer is expected on success */
+	return (struct cec_notifier *)0xdeadfeed;
+}
+
+static inline void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
+{
+}
+
 static inline void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 {
 }
-- 
2.20.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE13517E7
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731478AbfFXQDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:40 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53963 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729544AbfFXQDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:39 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRRhZaaO; Mon, 24 Jun 2019 18:03:37 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 03/13] cec: add new notifier functions
Date:   Mon, 24 Jun 2019 18:03:20 +0200
Message-Id: <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJPtxEILZeyd+1hNNapPJTUzULx9a7NHOdTyj2m18gP87rd/mmxdyMQ8FWKPReSZu2PhQGFPr5jEyOckfq5Kdxy48pKA3FrrG22rMHJtAn0YtJbbeSAv
 PCnI/TzWTMFlcxjljSbYg2HJ7mAsT/ZahZKUd98hr69uz09ADn8pp5HZcGlpaOM2CsglFciI74P57QQYTAnvNOH8k/24tACJRenT1jCHGJn76DV35bR6XR4r
 ZaAZqsobnXxYWbbLyHZdacWBRVM80BAXhghXnTN4evGUZqdz6N+1f0yLsjkkJw2K2q/3awIKwVO8oXgZagG25XadOo7KtxMaYhmYEFc97xA=
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

The called_cec_notifier_register bool is needed to handle the case where
a CEC adapter driver called the old cec_notifier_register() function
instead of cec_notifier_cec_adap_unregister().

Once those old functions are removed in the future, that bool can also
be removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 89 ++++++++++++++++++++++++++++++++
 include/media/cec-notifier.h     | 78 ++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index ce10dfd400bb..49d6ec198d38 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -22,9 +22,11 @@ struct cec_notifier {
 	struct list_head head;
 	struct kref kref;
 	struct device *hdmi_dev;
+	struct cec_connector_info conn_info;
 	const char *conn_name;
 	struct cec_adapter *cec_adap;
 	void (*callback)(struct cec_adapter *adap, u16 pa);
+	bool called_cec_notifier_register;
 
 	u16 phys_addr;
 };
@@ -87,6 +89,85 @@ void cec_notifier_put(struct cec_notifier *n)
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
+	memset(&n->cec_adap->conn_info, 0, sizeof(n->cec_adap->conn_info));
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
@@ -96,6 +177,8 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 	n->phys_addr = pa;
 	if (n->callback)
 		n->callback(n->cec_adap, n->phys_addr);
+	else if (n->cec_adap)
+		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
@@ -121,6 +204,7 @@ void cec_notifier_register(struct cec_notifier *n,
 {
 	kref_get(&n->kref);
 	mutex_lock(&n->lock);
+	n->called_cec_notifier_register = true;
 	n->cec_adap = adap;
 	n->callback = callback;
 	n->callback(adap, n->phys_addr);
@@ -130,8 +214,13 @@ EXPORT_SYMBOL_GPL(cec_notifier_register);
 
 void cec_notifier_unregister(struct cec_notifier *n)
 {
+	/* Do nothing unless cec_notifier_register was called first */
+	if (!n->called_cec_notifier_register)
+		return;
+
 	mutex_lock(&n->lock);
 	n->callback = NULL;
+	n->called_cec_notifier_register = false;
 	mutex_unlock(&n->lock);
 	cec_notifier_put(n);
 }
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 57b3a9f6ea1d..313b6905c203 100644
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
@@ -110,6 +164,30 @@ static inline void cec_notifier_put(struct cec_notifier *n)
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


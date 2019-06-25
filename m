Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1596455254
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731160AbfFYOpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:18 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59381 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730928AbfFYOpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:17 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmh8hHoyu; Tue, 25 Jun 2019 16:45:15 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 02/13] cec: add struct cec_connector_info support
Date:   Tue, 25 Jun 2019 16:44:59 +0200
Message-Id: <20190625144510.122214-3-hverkuil-cisco@xs4all.nl>
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

From: Dariusz Marcinkiewicz <darekm@google.com>

Define struct cec_connector_info in media/cec.h and define
CEC_CAP_CONNECTOR_INFO. In a later patch this will be moved to
uapi/linux/cec.h.

Due to these changes the seco-cec driver was changed as well: it
should include cec-notifier.h, not cec.h.

The CEC_CAP_CONNECTOR_INFO capability can be set by drivers, but
cec_allocate_adapter() will remove it again until the public API
for this can be enabled once all drm drivers wire this up correctly.

Also add the cec_fill_conn_info_from_drm and cec_s_conn_info functions,
which are needed by drm drivers to fill in the cec_connector info
based on a drm_connector.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c               | 29 +++++++
 drivers/media/cec/cec-core.c               |  5 ++
 drivers/media/platform/seco-cec/seco-cec.c |  2 +-
 include/media/cec-notifier.h               | 39 ---------
 include/media/cec.h                        | 98 +++++++++++++++++++++-
 5 files changed, 132 insertions(+), 41 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index ac3683a7b2ab..451c61bde4d4 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -16,7 +16,10 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_file.h>
 
 #include "cec-priv.h"
 
@@ -75,6 +78,16 @@ u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 }
 EXPORT_SYMBOL_GPL(cec_get_edid_phys_addr);
 
+void cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
+				 const struct drm_connector *connector)
+{
+	memset(conn_info, 0, sizeof(*conn_info));
+	conn_info->type = CEC_CONNECTOR_TYPE_DRM;
+	conn_info->drm.card_no = connector->dev->primary->index;
+	conn_info->drm.connector_id = connector->base.id;
+}
+EXPORT_SYMBOL_GPL(cec_fill_conn_info_from_drm);
+
 /*
  * Queue a new event for this filehandle. If ts == 0, then set it
  * to the current time.
@@ -1598,6 +1611,22 @@ void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr_from_edid);
 
+void cec_s_conn_info(struct cec_adapter *adap,
+		     const struct cec_connector_info *conn_info)
+{
+	if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
+		return;
+
+	mutex_lock(&adap->lock);
+	if (conn_info)
+		adap->conn_info = *conn_info;
+	else
+		memset(&adap->conn_info, 0, sizeof(adap->conn_info));
+	cec_post_state_event(adap);
+	mutex_unlock(&adap->lock);
+}
+EXPORT_SYMBOL_GPL(cec_s_conn_info);
+
 /*
  * Called from either the ioctl or a driver to set the logical addresses.
  *
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index db7adffcdc76..9c610e1e99b8 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -257,6 +257,11 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	struct cec_adapter *adap;
 	int res;
 
+	/*
+	 * Disable this capability until the connector info public API
+	 * is ready.
+	 */
+	caps &= ~CEC_CAP_CONNECTOR_INFO;
 #ifndef CONFIG_MEDIA_CEC_RC
 	caps &= ~CEC_CAP_RC;
 #endif
diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/platform/seco-cec/seco-cec.c
index e5080d6f5b2d..1d0133f01e00 100644
--- a/drivers/media/platform/seco-cec/seco-cec.c
+++ b/drivers/media/platform/seco-cec/seco-cec.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 
 /* CEC Framework */
-#include <media/cec.h>
+#include <media/cec-notifier.h>
 
 #include "seco-cec.h"
 
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 57b3a9f6ea1d..0e3bd3415724 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -63,30 +63,6 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa);
 void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 					  const struct edid *edid);
 
-/**
- * cec_notifier_register - register a callback with the notifier
- * @n: the CEC notifier
- * @adap: the CEC adapter, passed as argument to the callback function
- * @callback: the callback function
- */
-void cec_notifier_register(struct cec_notifier *n,
-			   struct cec_adapter *adap,
-			   void (*callback)(struct cec_adapter *adap, u16 pa));
-
-/**
- * cec_notifier_unregister - unregister the callback from the notifier.
- * @n: the CEC notifier
- */
-void cec_notifier_unregister(struct cec_notifier *n);
-
-/**
- * cec_register_cec_notifier - register the notifier with the cec adapter.
- * @adap: the CEC adapter
- * @notifier: the CEC notifier
- */
-void cec_register_cec_notifier(struct cec_adapter *adap,
-			       struct cec_notifier *notifier);
-
 /**
  * cec_notifier_parse_hdmi_phandle - find the hdmi device from "hdmi-phandle"
  * @dev: the device with the "hdmi-phandle" device tree property
@@ -119,21 +95,6 @@ static inline void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 {
 }
 
-static inline void cec_notifier_register(struct cec_notifier *n,
-			 struct cec_adapter *adap,
-			 void (*callback)(struct cec_adapter *adap, u16 pa))
-{
-}
-
-static inline void cec_notifier_unregister(struct cec_notifier *n)
-{
-}
-
-static inline void cec_register_cec_notifier(struct cec_adapter *adap,
-					     struct cec_notifier *notifier)
-{
-}
-
 static inline struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 {
 	return ERR_PTR(-ENODEV);
diff --git a/include/media/cec.h b/include/media/cec.h
index 707411ef8ba2..4d59387bc61b 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -17,7 +17,9 @@
 #include <linux/timer.h>
 #include <linux/cec-funcs.h>
 #include <media/rc-core.h>
-#include <media/cec-notifier.h>
+
+/* CEC_ADAP_G_CONNECTOR_INFO is available */
+#define CEC_CAP_CONNECTOR_INFO	(1 << 8)
 
 #define CEC_CAP_DEFAULTS (CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT | \
 			  CEC_CAP_PASSTHROUGH | CEC_CAP_RC)
@@ -53,6 +55,7 @@ struct cec_devnode {
 struct cec_adapter;
 struct cec_data;
 struct cec_pin;
+struct cec_notifier;
 
 struct cec_data {
 	struct list_head list;
@@ -144,6 +147,34 @@ struct cec_adap_ops {
  */
 #define CEC_MAX_MSG_TX_QUEUE_SZ		(18 * 1)
 
+/**
+ * struct cec_drm_connector_info - tells which drm connector is
+ * associated with the CEC adapter.
+ * @card_no: drm card number
+ * @connector_id: drm connector ID
+ */
+struct cec_drm_connector_info {
+	__u32 card_no;
+	__u32 connector_id;
+};
+
+#define CEC_CONNECTOR_TYPE_NO_CONNECTOR	0
+#define CEC_CONNECTOR_TYPE_DRM		1
+
+/**
+ * struct cec_connector_info - tells if and which connector is
+ * associated with the CEC adapter.
+ * @type: connector type (if any)
+ * @drm: drm connector info
+ */
+struct cec_connector_info {
+	__u32 type;
+	union {
+		struct cec_drm_connector_info drm;
+		__u32 raw[16];
+	};
+};
+
 struct cec_adapter {
 	struct module *owner;
 	char name[32];
@@ -182,6 +213,7 @@ struct cec_adapter {
 	struct cec_fh *cec_initiator;
 	bool passthrough;
 	struct cec_log_addrs log_addrs;
+	struct cec_connector_info conn_info;
 
 	u32 tx_timeouts;
 
@@ -233,6 +265,7 @@ static inline bool cec_is_registered(const struct cec_adapter *adap)
 	((pa) >> 12), ((pa) >> 8) & 0xf, ((pa) >> 4) & 0xf, (pa) & 0xf
 
 struct edid;
+struct drm_connector;
 
 #if IS_REACHABLE(CONFIG_CEC_CORE)
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
@@ -247,6 +280,8 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr,
 		     bool block);
 void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 			       const struct edid *edid);
+void cec_s_conn_info(struct cec_adapter *adap,
+		     const struct cec_connector_info *conn_info);
 int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg,
 		     bool block);
 
@@ -331,6 +366,9 @@ void cec_queue_pin_5v_event(struct cec_adapter *adap, bool is_high, ktime_t ts);
 u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 			   unsigned int *offset);
 
+void cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
+				 const struct drm_connector *connector);
+
 #else
 
 static inline int cec_register_adapter(struct cec_adapter *adap,
@@ -365,6 +403,64 @@ static inline u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 	return CEC_PHYS_ADDR_INVALID;
 }
 
+static inline void cec_s_conn_info(struct cec_adapter *adap,
+				   const struct cec_connector_info *conn_info)
+{
+}
+
+static inline void
+cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
+			    const struct drm_connector *connector)
+{
+	memset(conn_info, 0, sizeof(*conn_info));
+}
+
+#endif
+
+#if IS_REACHABLE(CONFIG_CEC_CORE) && IS_ENABLED(CONFIG_CEC_NOTIFIER)
+
+/**
+ * cec_notifier_register - register a callback with the notifier
+ * @n: the CEC notifier
+ * @adap: the CEC adapter, passed as argument to the callback function
+ * @callback: the callback function
+ */
+void cec_notifier_register(struct cec_notifier *n,
+			   struct cec_adapter *adap,
+			   void (*callback)(struct cec_adapter *adap, u16 pa));
+
+/**
+ * cec_notifier_unregister - unregister the callback from the notifier.
+ * @n: the CEC notifier
+ */
+void cec_notifier_unregister(struct cec_notifier *n);
+
+/**
+ * cec_register_cec_notifier - register the notifier with the cec adapter.
+ * @adap: the CEC adapter
+ * @notifier: the CEC notifier
+ */
+void cec_register_cec_notifier(struct cec_adapter *adap,
+			       struct cec_notifier *notifier);
+
+#else
+
+static inline void
+cec_notifier_register(struct cec_notifier *n,
+		      struct cec_adapter *adap,
+		      void (*callback)(struct cec_adapter *adap, u16 pa))
+{
+}
+
+static inline void cec_notifier_unregister(struct cec_notifier *n)
+{
+}
+
+static inline void cec_register_cec_notifier(struct cec_adapter *adap,
+					     struct cec_notifier *notifier)
+{
+}
+
 #endif
 
 /**
-- 
2.20.1


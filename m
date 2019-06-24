Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D681E517E6
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731439AbfFXQDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46059 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729518AbfFXQDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:39 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRQhZaaF; Mon, 24 Jun 2019 18:03:37 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 02/13] cec: add struct cec_connector_info support
Date:   Mon, 24 Jun 2019 18:03:19 +0200
Message-Id: <20190624160330.38048-3-hverkuil-cisco@xs4all.nl>
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

From: Dariusz Marcinkiewicz <darekm@google.com>

Define struct cec_connector_info in media/cec.h and define
CEC_CAP_CONNECTOR_INFO. In a later patch this will be moved to
uapi/linux/cec.h.

For now just define this together with the cec_fill_conn_info_from_drm
and cec_s_conn_info functions: this allows both drm and media to make
use of this without requiring cross-subsystem changes.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 29 +++++++++++++++++++++++
 drivers/media/cec/cec-core.c |  5 ++++
 include/media/cec.h          | 45 +++++++++++++++++++++++++++++++++++-
 3 files changed, 78 insertions(+), 1 deletion(-)

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
index db7adffcdc76..e45b792d26fb 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -189,6 +189,11 @@ static void cec_cec_notify(struct cec_adapter *adap, u16 pa)
 	cec_s_phys_addr(adap, pa, false);
 }
 
+void cec_notifier_register(struct cec_notifier *n,
+			   struct cec_adapter *adap,
+			   void (*callback)(struct cec_adapter *adap, u16 pa));
+void cec_notifier_unregister(struct cec_notifier *n);
+
 void cec_register_cec_notifier(struct cec_adapter *adap,
 			       struct cec_notifier *notifier)
 {
diff --git a/include/media/cec.h b/include/media/cec.h
index 707411ef8ba2..45f2c98ed75b 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -17,7 +17,9 @@
 #include <linux/timer.h>
 #include <linux/cec-funcs.h>
 #include <media/rc-core.h>
-#include <media/cec-notifier.h>
+
+/* CEC_ADAP_G_CONNECTOR_INFO is available */
+#define CEC_CAP_CONNECTOR_INFO	0
 
 #define CEC_CAP_DEFAULTS (CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT | \
 			  CEC_CAP_PASSTHROUGH | CEC_CAP_RC)
@@ -53,6 +55,7 @@ struct cec_devnode {
 struct cec_adapter;
 struct cec_data;
 struct cec_pin;
+struct cec_notifier;
 
 struct cec_data {
 	struct list_head list;
@@ -144,6 +147,27 @@ struct cec_adap_ops {
  */
 #define CEC_MAX_MSG_TX_QUEUE_SZ		(18 * 1)
 
+/**
+ * struct cec_event_connector - tells if and which connector is associated
+ * with the CEC adapter.
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
@@ -182,6 +206,7 @@ struct cec_adapter {
 	struct cec_fh *cec_initiator;
 	bool passthrough;
 	struct cec_log_addrs log_addrs;
+	struct cec_connector_info conn_info;
 
 	u32 tx_timeouts;
 
@@ -233,6 +258,7 @@ static inline bool cec_is_registered(const struct cec_adapter *adap)
 	((pa) >> 12), ((pa) >> 8) & 0xf, ((pa) >> 4) & 0xf, (pa) & 0xf
 
 struct edid;
+struct drm_connector;
 
 #if IS_REACHABLE(CONFIG_CEC_CORE)
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
@@ -247,6 +273,8 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr,
 		     bool block);
 void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 			       const struct edid *edid);
+void cec_s_conn_info(struct cec_adapter *adap,
+		     const struct cec_connector_info *conn_info);
 int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg,
 		     bool block);
 
@@ -331,6 +359,9 @@ void cec_queue_pin_5v_event(struct cec_adapter *adap, bool is_high, ktime_t ts);
 u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 			   unsigned int *offset);
 
+void cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
+				 const struct drm_connector *connector);
+
 #else
 
 static inline int cec_register_adapter(struct cec_adapter *adap,
@@ -365,6 +396,18 @@ static inline u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 	return CEC_PHYS_ADDR_INVALID;
 }
 
+static inline void cec_s_conn_info(struct cec_adapter *adap,
+				   const struct cec_connector_info *conn_info)
+{
+}
+
+static inline void
+cec_fill_conn_info_from_drm(const struct drm_connector *connector,
+			    struct cec_connector_info *conn_info)
+{
+	memset(conn_info, 0, sizeof(*conn_info));
+}
+
 #endif
 
 /**
-- 
2.20.1


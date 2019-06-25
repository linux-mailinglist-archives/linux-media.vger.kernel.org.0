Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A76655252
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbfFYOpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:17 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51745 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730939AbfFYOpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:17 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmh9hHozE; Tue, 25 Jun 2019 16:45:15 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 04/13] cec: expose the new connector info API
Date:   Tue, 25 Jun 2019 16:45:01 +0200
Message-Id: <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
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

Until now the connector info API was a kernel-internal API only.
This moves it to the public API and adds the new ioctl to retrieve
this information.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c |  2 ++
 drivers/media/cec/cec-api.c  | 20 ++++++++++++++++++
 drivers/media/cec/cec-core.c |  5 -----
 include/media/cec.h          | 31 ----------------------------
 include/uapi/linux/cec.h     | 40 ++++++++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 451c61bde4d4..059c83525024 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -319,6 +319,8 @@ static void cec_post_state_event(struct cec_adapter *adap)
 
 	ev.state_change.phys_addr = adap->phys_addr;
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
+	ev.state_change.have_conn_info =
+		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
 	cec_queue_event(adap, &ev);
 }
 
diff --git a/drivers/media/cec/cec-api.c b/drivers/media/cec/cec-api.c
index 12d676484472..17d1cb2e5f97 100644
--- a/drivers/media/cec/cec-api.c
+++ b/drivers/media/cec/cec-api.c
@@ -187,6 +187,21 @@ static long cec_adap_s_log_addrs(struct cec_adapter *adap, struct cec_fh *fh,
 	return 0;
 }
 
+static long cec_adap_g_connector_info(struct cec_adapter *adap,
+				      struct cec_log_addrs __user *parg)
+{
+	int ret = 0;
+
+	if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
+		return -ENOTTY;
+
+	mutex_lock(&adap->lock);
+	if (copy_to_user(parg, &adap->conn_info, sizeof(adap->conn_info)))
+		ret = -EFAULT;
+	mutex_unlock(&adap->lock);
+	return ret;
+}
+
 static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
 			 bool block, struct cec_msg __user *parg)
 {
@@ -506,6 +521,9 @@ static long cec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case CEC_ADAP_S_LOG_ADDRS:
 		return cec_adap_s_log_addrs(adap, fh, block, parg);
 
+	case CEC_ADAP_G_CONNECTOR_INFO:
+		return cec_adap_g_connector_info(adap, parg);
+
 	case CEC_TRANSMIT:
 		return cec_transmit(adap, fh, block, parg);
 
@@ -578,6 +596,8 @@ static int cec_open(struct inode *inode, struct file *filp)
 	/* Queue up initial state events */
 	ev.state_change.phys_addr = adap->phys_addr;
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
+	ev.state_change.have_conn_info =
+		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
 	cec_queue_event_fh(fh, &ev, 0);
 #ifdef CONFIG_CEC_PIN
 	if (adap->pin && adap->pin->ops->read_hpd) {
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index 9c610e1e99b8..db7adffcdc76 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -257,11 +257,6 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	struct cec_adapter *adap;
 	int res;
 
-	/*
-	 * Disable this capability until the connector info public API
-	 * is ready.
-	 */
-	caps &= ~CEC_CAP_CONNECTOR_INFO;
 #ifndef CONFIG_MEDIA_CEC_RC
 	caps &= ~CEC_CAP_RC;
 #endif
diff --git a/include/media/cec.h b/include/media/cec.h
index 4d59387bc61b..0a4f69cc9dd4 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -18,9 +18,6 @@
 #include <linux/cec-funcs.h>
 #include <media/rc-core.h>
 
-/* CEC_ADAP_G_CONNECTOR_INFO is available */
-#define CEC_CAP_CONNECTOR_INFO	(1 << 8)
-
 #define CEC_CAP_DEFAULTS (CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT | \
 			  CEC_CAP_PASSTHROUGH | CEC_CAP_RC)
 
@@ -147,34 +144,6 @@ struct cec_adap_ops {
  */
 #define CEC_MAX_MSG_TX_QUEUE_SZ		(18 * 1)
 
-/**
- * struct cec_drm_connector_info - tells which drm connector is
- * associated with the CEC adapter.
- * @card_no: drm card number
- * @connector_id: drm connector ID
- */
-struct cec_drm_connector_info {
-	__u32 card_no;
-	__u32 connector_id;
-};
-
-#define CEC_CONNECTOR_TYPE_NO_CONNECTOR	0
-#define CEC_CONNECTOR_TYPE_DRM		1
-
-/**
- * struct cec_connector_info - tells if and which connector is
- * associated with the CEC adapter.
- * @type: connector type (if any)
- * @drm: drm connector info
- */
-struct cec_connector_info {
-	__u32 type;
-	union {
-		struct cec_drm_connector_info drm;
-		__u32 raw[16];
-	};
-};
-
 struct cec_adapter {
 	struct module *owner;
 	char name[32];
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 5704fa0292b5..0115c5aa0d36 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -317,6 +317,8 @@ static inline int cec_is_unconfigured(__u16 log_addr_mask)
 #define CEC_CAP_NEEDS_HPD	(1 << 6)
 /* Hardware can monitor CEC pin transitions */
 #define CEC_CAP_MONITOR_PIN	(1 << 7)
+/* CEC_ADAP_G_CONNECTOR_INFO is available */
+#define CEC_CAP_CONNECTOR_INFO	(1 << 8)
 
 /**
  * struct cec_caps - CEC capabilities structure.
@@ -375,6 +377,34 @@ struct cec_log_addrs {
 /* CDC-Only device: supports only CDC messages */
 #define CEC_LOG_ADDRS_FL_CDC_ONLY		(1 << 2)
 
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
 /* Events */
 
 /* Event that occurs when the adapter state changes */
@@ -398,10 +428,17 @@ struct cec_log_addrs {
  * struct cec_event_state_change - used when the CEC adapter changes state.
  * @phys_addr: the current physical address
  * @log_addr_mask: the current logical address mask
+ * @have_conn_info: if non-zero, then HDMI connector information is available.
+ *	This field is only valid if CEC_CAP_CONNECTOR_INFO is set. If that
+ *	capability is set and @have_conn_info is zero, then that indicates
+ *	that the HDMI connector device is not instantiated, either because
+ *	the HDMI driver is still configuring the device or because the HDMI
+ *	device was unbound.
  */
 struct cec_event_state_change {
 	__u16 phys_addr;
 	__u16 log_addr_mask;
+	__u16 have_conn_info;
 };
 
 /**
@@ -476,6 +513,9 @@ struct cec_event {
 #define CEC_G_MODE		_IOR('a',  8, __u32)
 #define CEC_S_MODE		_IOW('a',  9, __u32)
 
+/* Get the connector info */
+#define CEC_ADAP_G_CONNECTOR_INFO _IOR('a',  10, struct cec_connector_info)
+
 /*
  * The remainder of this header defines all CEC messages and operands.
  * The format matters since it the cec-ctl utility parses it to generate
-- 
2.20.1


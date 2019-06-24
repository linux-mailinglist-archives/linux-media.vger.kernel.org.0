Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4AE517E9
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731486AbfFXQDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:41 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42787 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729567AbfFXQDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:40 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRRhZaaq; Mon, 24 Jun 2019 18:03:38 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 04/13] cec: expose the new connector info API
Date:   Mon, 24 Jun 2019 18:03:21 +0200
Message-Id: <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJHC8gnzmC6VsiHnhAT8Mnidw5ZU62gn3HZHqKNX7UVaXyuhfnr8nar7qUT3qlGmLsDkHKBOJjxOpQkAxPvSMU3uLSYaB+Wh29+IGNwTHaGSotCleMaH
 jydz2acYQRgsFtg5uESRnzo2+IhsZuls1iSK2+Qfkk2rRICKaq20ln8sxj5KvqE5TGegRK8uzBLdcF1HlbC6OaX8lMJjgnGzWc0jjfkuWs4X7YDCfmEum+4X
 EcZCyIsFh8k2xFRLcU5Gc0W61YkPGvB1b8ApD3uhy0omGT08+E7McH1Hf2S5Ig/VzyXS/OrQ4ZvogWElIONKW9fR0hITkbJmUhYwMOL6l1o=
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
 drivers/media/cec/cec-api.c  | 16 ++++++++++++++++
 drivers/media/cec/cec-core.c |  5 -----
 include/media/cec.h          | 26 +-------------------------
 include/uapi/linux/cec.h     | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+), 30 deletions(-)

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
index 12d676484472..cba0099beab2 100644
--- a/drivers/media/cec/cec-api.c
+++ b/drivers/media/cec/cec-api.c
@@ -187,6 +187,17 @@ static long cec_adap_s_log_addrs(struct cec_adapter *adap, struct cec_fh *fh,
 	return 0;
 }
 
+static long cec_adap_g_connector_info(struct cec_adapter *adap,
+				      struct cec_log_addrs __user *parg)
+{
+	if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
+		return -ENOTTY;
+	if (copy_to_user(parg, &adap->conn_info,
+			 sizeof(adap->conn_info)))
+		return -EFAULT;
+	return 0;
+}
+
 static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
 			 bool block, struct cec_msg __user *parg)
 {
@@ -506,6 +517,9 @@ static long cec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case CEC_ADAP_S_LOG_ADDRS:
 		return cec_adap_s_log_addrs(adap, fh, block, parg);
 
+	case CEC_ADAP_G_CONNECTOR_INFO:
+		return cec_adap_g_connector_info(adap, parg);
+
 	case CEC_TRANSMIT:
 		return cec_transmit(adap, fh, block, parg);
 
@@ -578,6 +592,8 @@ static int cec_open(struct inode *inode, struct file *filp)
 	/* Queue up initial state events */
 	ev.state_change.phys_addr = adap->phys_addr;
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
+	ev.state_change.have_conn_info =
+		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
 	cec_queue_event_fh(fh, &ev, 0);
 #ifdef CONFIG_CEC_PIN
 	if (adap->pin && adap->pin->ops->read_hpd) {
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index e45b792d26fb..db7adffcdc76 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -189,11 +189,6 @@ static void cec_cec_notify(struct cec_adapter *adap, u16 pa)
 	cec_s_phys_addr(adap, pa, false);
 }
 
-void cec_notifier_register(struct cec_notifier *n,
-			   struct cec_adapter *adap,
-			   void (*callback)(struct cec_adapter *adap, u16 pa));
-void cec_notifier_unregister(struct cec_notifier *n);
-
 void cec_register_cec_notifier(struct cec_adapter *adap,
 			       struct cec_notifier *notifier)
 {
diff --git a/include/media/cec.h b/include/media/cec.h
index 45f2c98ed75b..2c30df40e2ce 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -17,9 +17,7 @@
 #include <linux/timer.h>
 #include <linux/cec-funcs.h>
 #include <media/rc-core.h>
-
-/* CEC_ADAP_G_CONNECTOR_INFO is available */
-#define CEC_CAP_CONNECTOR_INFO	0
+#include <media/cec-notifier.h>
 
 #define CEC_CAP_DEFAULTS (CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT | \
 			  CEC_CAP_PASSTHROUGH | CEC_CAP_RC)
@@ -55,7 +53,6 @@ struct cec_devnode {
 struct cec_adapter;
 struct cec_data;
 struct cec_pin;
-struct cec_notifier;
 
 struct cec_data {
 	struct list_head list;
@@ -147,27 +144,6 @@ struct cec_adap_ops {
  */
 #define CEC_MAX_MSG_TX_QUEUE_SZ		(18 * 1)
 
-/**
- * struct cec_event_connector - tells if and which connector is associated
- * with the CEC adapter.
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
index 5704fa0292b5..414df75c0ab8 100644
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
@@ -398,10 +400,17 @@ struct cec_log_addrs {
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
@@ -412,6 +421,27 @@ struct cec_event_lost_msgs {
 	__u32 lost_msgs;
 };
 
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
 /**
  * struct cec_event - CEC event structure
  * @ts: the timestamp of when the event was sent.
@@ -476,6 +506,9 @@ struct cec_event {
 #define CEC_G_MODE		_IOR('a',  8, __u32)
 #define CEC_S_MODE		_IOW('a',  9, __u32)
 
+/* Gets the connector info */
+#define CEC_ADAP_G_CONNECTOR_INFO _IOR('a',  10, struct cec_connector_info)
+
 /*
  * The remainder of this header defines all CEC messages and operands.
  * The format matters since it the cec-ctl utility parses it to generate
-- 
2.20.1


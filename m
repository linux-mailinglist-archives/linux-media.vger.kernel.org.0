Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 611EEA4B72
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 21:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfIATpu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 15:45:50 -0400
Received: from mail-oln040092069063.outbound.protection.outlook.com ([40.92.69.63]:49476
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727517AbfIATpt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 15:45:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1Elgu7k0/oBR/M8IOrURjqGIFu/3Ad4WJ+4jvRaBcOK9+DHvCnw0OMRbJMDgjZlSFwQHLKYtbnL33YARkw/g9LoDyvSLtTLaZ9S4vPOfsYaFy7CD2u6/6XzPuIzVhDkdWVadMrqKQdn9ngqNgjpBL1Yv13kBLviLt8P5mTVTzIWtJpKuSlxwYTU4atYp22NecSbTyGbTWz3eeejqkfNzkFZrSY9ixbdcZKRK4PFbrtzGvuANcpkDSe6VIwmwgF/Z+r5c4j+h5cZvnVAoAUOmFMpjXmgivDrR/2v5FjLLZnHX31x8wFNHOYQ7Fz1drfSHvUfKUr2KbgS2+WHRIfeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy+h9dGgpqBZDdNXfiew8pXgljbeqEKgQUFSHCbJuKs=;
 b=QimhlmSrF0nnHwv7MnH+Dztf9xQGAlRL+mZeFEVCWV0dF+HcUXDR0BdY8HwEgon2IzOYB7eu31CG8hKQHlVW7NcYl0y1sm6MhIESBq/nK6xkDt/mRKgFWH0Kx9rZD+djalB5adqWaxYYgNMSR1iwStGpw1GF98QE/zd5vEs+D/U8kNyiC4icjY61WFmKEz9PQ0S93m0lbrWDXXB6fD2a2CmERAIewc9H2ijb67pXxOg71lAJlv5DA0WoP4JtiYwKL0dB0w6YetO61UN4VAcXhWF444kUOyennKQ4CKsdvMui8fYnk3cXpKIxRa+CPjKcPksEWieBoI8Eod8Ej0tYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT064.eop-EUR02.prod.protection.outlook.com
 (10.152.10.52) by HE1EUR02HT181.eop-EUR02.prod.protection.outlook.com
 (10.152.11.168) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 19:45:44 +0000
Received: from DB6PR06MB4007.eurprd06.prod.outlook.com (10.152.10.56) by
 HE1EUR02FT064.mail.protection.outlook.com (10.152.11.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 19:45:44 +0000
Received: from DB6PR06MB4007.eurprd06.prod.outlook.com
 ([fe80::ed3f:186c:c80e:a861]) by DB6PR06MB4007.eurprd06.prod.outlook.com
 ([fe80::ed3f:186c:c80e:a861%6]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 19:45:38 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] media: cec-notifier: debounce reporing of invalid phys addr
Thread-Topic: [PATCH] media: cec-notifier: debounce reporing of invalid phys
 addr
Thread-Index: AQHVYP3UbaEdlTgPCkCkJn46bctZzQ==
Date:   Sun, 1 Sep 2019 19:45:38 +0000
Message-ID: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0182.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::30) To DB6PR06MB4007.eurprd06.prod.outlook.com
 (2603:10a6:6:4e::32)
x-incomingtopheadermarker: OriginalChecksum:7D3D6E5167D2AAF743DE7054CE3304A050C3D2299F610E0C4D70CF771E4CD177;UpperCasedChecksum:25398339B97843CC48445190B866DC93DD792A6AAEF8C4A424316E7967345795;SizeAsReceived:7433;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [Cu5Pcf39T3hnZn1jQVLXN3RsjGTNpELd]
x-microsoft-original-message-id: <20190901194524.7071-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR02HT181;
x-ms-traffictypediagnostic: HE1EUR02HT181:
x-microsoft-antispam-message-info: Hkpp38fj0ynMQDUMcQzkTiPXRvh9Zg0Dwl3wrb0XEQMiKj+Xxc6szMn4+vXYqZT67/kNuZ3+8uAllziKLNTqxM8KpZA+UPyt/y40Pgw8N7S4B6nH8E/h3RXSWSxkPLSCDAGxj6s4gdRffdAR0O8fVMj2QlAQXFeMc7PD6jySD2Bz/pdXr+p0J2MAtdWMhREg
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d9b19b-b679-4078-7a96-08d72f14f6c4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 19:45:38.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT181
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When EDID is refreshed, HDMI cable is unplugged/replugged or
an AVR is power cycled the CEC phys addr gets invalidated.

This can cause some disruption of CEC communication when
adapter is being reconfigured.

Add a debounce option that can be used to debounce setting
an invalid phys addr.

Power off AVR (debounce = 0):
[  101.536866] cec-dw_hdmi: new physical address f.f.f.f
[  102.495686] cec-dw_hdmi: new physical address 2.1.0.0
[  102.495913] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
[  102.628574] cec-dw_hdmi: config: la 1 pa 2.1.0.0
[  105.130115] cec-dw_hdmi: new physical address f.f.f.f
[  106.979705] cec-dw_hdmi: new physical address 2.1.0.0
[  106.979872] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
[  107.112399] cec-dw_hdmi: config: la 1 pa 2.1.0.0
[  108.979408] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
[  109.205386] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11

Power on AVR (debounce = 0):
[  158.398447] cec-dw_hdmi: new physical address f.f.f.f
[  161.977714] cec-dw_hdmi: new physical address 2.1.0.0
[  161.978766] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
[  162.115624] cec-dw_hdmi: config: la 1 pa 2.1.0.0
[  162.402750] cec-dw_hdmi: new physical address f.f.f.f
[  162.403389] cec-dw_hdmi: cec_transmit_msg_fh: adapter is unconfigured
[  162.886757] cec-dw_hdmi: new physical address 2.1.0.0
[  162.886964] cec-dw_hdmi: physical address: 2.1.0.0, claim 1 logical addresses
[  163.510725] cec-dw_hdmi: config: la 1 pa 2.1.0.0
[  173.034200] cec-dw_hdmi: message 10 89 02 05 timed out

Power off AVR (debounce = 5000):
[  251.720471] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
[  251.922432] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11

Power on AVR (debounce = 5000):
[  291.154262] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
[  291.296199] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11

Using a debounce of 5000 ms reconfiguring can be avoided.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/media/cec/cec-core.c     |  4 ++++
 drivers/media/cec/cec-notifier.c | 23 ++++++++++++++++++++++-
 drivers/media/cec/cec-priv.h     |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index 9c610e1e99b8..c5094fd9b664 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -28,6 +28,10 @@ static bool debug_phys_addr;
 module_param(debug_phys_addr, bool, 0644);
 MODULE_PARM_DESC(debug_phys_addr, "add CEC_CAP_PHYS_ADDR if set");
 
+int cec_debounce;
+module_param_named(debounce, cec_debounce, int, 0644);
+MODULE_PARM_DESC(debounce, "debounce invalid phys addr");
+
 static dev_t cec_dev_t;
 
 /* Active devices */
diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 4d82a5522072..0157d468cfe4 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -12,11 +12,14 @@
 #include <linux/list.h>
 #include <linux/kref.h>
 #include <linux/of_platform.h>
+#include <linux/workqueue.h>
 
 #include <media/cec.h>
 #include <media/cec-notifier.h>
 #include <drm/drm_edid.h>
 
+#include "cec-priv.h"
+
 struct cec_notifier {
 	struct mutex lock;
 	struct list_head head;
@@ -28,11 +31,25 @@ struct cec_notifier {
 	void (*callback)(struct cec_adapter *adap, u16 pa);
 
 	u16 phys_addr;
+	struct delayed_work work;
 };
 
 static LIST_HEAD(cec_notifiers);
 static DEFINE_MUTEX(cec_notifiers_lock);
 
+static void cec_notifier_delayed_work(struct work_struct *work)
+{
+	struct cec_notifier *n =
+		container_of(to_delayed_work(work), struct cec_notifier, work);
+
+	mutex_lock(&n->lock);
+	if (n->callback)
+		n->callback(n->cec_adap, n->phys_addr);
+	else if (n->cec_adap)
+		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
+	mutex_unlock(&n->lock);
+}
+
 struct cec_notifier *
 cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
 {
@@ -62,6 +79,7 @@ cec_notifier_get_conn(struct device *hdmi_dev, const char *conn_name)
 	}
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
 
+	INIT_DELAYED_WORK(&n->work, cec_notifier_delayed_work);
 	mutex_init(&n->lock);
 	kref_init(&n->kref);
 	list_add_tail(&n->head, &cec_notifiers);
@@ -172,9 +190,12 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 	if (n == NULL)
 		return;
 
+	cancel_delayed_work_sync(&n->work);
 	mutex_lock(&n->lock);
 	n->phys_addr = pa;
-	if (n->callback)
+	if (cec_debounce > 0 && pa == CEC_PHYS_ADDR_INVALID)
+		schedule_delayed_work(&n->work, msecs_to_jiffies(cec_debounce));
+	else if (n->callback)
 		n->callback(n->cec_adap, n->phys_addr);
 	else if (n->cec_adap)
 		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
diff --git a/drivers/media/cec/cec-priv.h b/drivers/media/cec/cec-priv.h
index 7bdf855aaecd..65176294fcf0 100644
--- a/drivers/media/cec/cec-priv.h
+++ b/drivers/media/cec/cec-priv.h
@@ -27,6 +27,7 @@ static inline bool msg_is_raw(const struct cec_msg *msg)
 
 /* cec-core.c */
 extern int cec_debug;
+extern int cec_debounce;
 int cec_get_device(struct cec_devnode *devnode);
 void cec_put_device(struct cec_devnode *devnode);
 
-- 
2.17.1


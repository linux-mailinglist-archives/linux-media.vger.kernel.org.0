Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03AADC4207
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 22:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfJAUws convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 1 Oct 2019 16:52:48 -0400
Received: from mail-oln040092068032.outbound.protection.outlook.com ([40.92.68.32]:38566
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbfJAUwq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 16:52:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGhnbkjjQ44YBgYzZnROIAr8G5tJknbU8NQEFCfg9X9VNvx3oPNy7k9uCXLftiHRCqhpcWocwhkiH//9V5XHkehk5UHQJQjxIk5sZekxH86bT83qupANyaQd8BO/2Yp8bfyxVRbO4Cmbxc2mrQu/lc/E4XzV5siZ55rCigjD78eVU0Q8ITbe2L7gYD11eHa1qHAMq958eEgfH3os7ipzX6rrl8kOyCy8ARAJHbz6uSxO9O8ib5N80WwpZ9N6YViG4XJSN/dDYGTW76RrwbGD2gFV1p6kbwIpiJu7FxbanvSBi8TzBrVwuK6B1x1ZBJam+jc3L/Rr4FeKRirpbHhhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feSTXV2LiziatkAmEMB1ulvnCfz0dgiakQglA3PONYE=;
 b=VRYuEIzVPCw+4wneoeUowiReLqRSM55wiovob2P2jDPoHOFlXORJEN0Q/AG4bPrlh3ks+P9GWsO2YQFfN0K/F8p/TNGT0AmW2Ido1zDqW5tdyNHQrYeQecNaSu8/vDwh9Xj9m898VCnJScEJezSL4E3CpFGM5aKJf3l5fLYuW4+1xgSI93I4AjlAWzUhYVnCnywG0yXxaAadlklaSD/0hTRU4N6wOA2m7DhAS+uJ2P9CnM+apyQDfu7FmCzBqXDT0/IlNIEOQIQ4LopL74/GQMzpHVN1TS2juMEmytRuKr6ZRP1S5hdLfiMmRd6/voylXDNBCOdnurUymoBxzW+Qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
 (10.152.12.54) by VE1EUR02HT200.eop-EUR02.prod.protection.outlook.com
 (10.152.13.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Tue, 1 Oct
 2019 20:52:42 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.59) by
 VE1EUR02FT042.mail.protection.outlook.com (10.152.13.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 20:52:42 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 20:52:42 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2] media: cec-adap: add debounce support when setting an
 invalid phys addr
Thread-Topic: [PATCH v2] media: cec-adap: add debounce support when setting an
 invalid phys addr
Thread-Index: AQHVeJorOWR3GOL/vkuOvt24BUD4NA==
Date:   Tue, 1 Oct 2019 20:52:42 +0000
Message-ID: <HE1PR06MB40115700084D1D875673D60EAC9D0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
In-Reply-To: <DB6PR06MB400724D0DD41B208D405F44FACBF0@DB6PR06MB4007.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::14) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:EE59096AA093B5CA05B72EF20189F8E34DA098225D93FA60505D705784EF4C4D;UpperCasedChecksum:030DB4CF085FED8A9F07859DC057F2423095B0BD6C6D62F403D64E46E6B29484;SizeAsReceived:7782;Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [nztQeHmZsoLmwZZ1nLJwQuA/KET5rMbj]
x-microsoft-original-message-id: <20191001205224.8404-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR02HT200:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z+ReXYyxJronZZihARiYMtrqMOXBWHbKD4c66IgbF7UYUqJ8p/R1tKIjZN18Tpt97ZVpWXudzAbieqIo043mfbM9IU79lkG73MYcj5yLBkIt80AKYG37HV9lb6xUY3J5+AKpIbdyy//hgfhhoyw4WyJHvfKnH/0qpxDGqxiNEkjTmkbMcdkAPYREvNWfkdF2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c48ea76a-147e-4e27-e01b-08d746b14d8d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 20:52:42.6850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT200
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When EDID is refreshed, HDMI cable is unplugged/replugged or
an AVR is power cycled the CEC phys addr gets invalidated.

This can cause some disruption of CEC communication when
adapter is being reconfigured.

Add a debounce module option that can be used to debounce setting
an invalid phys addr. Default is not to use debouncing.

Using a configured debounce of e.g. 5000 ms, cec reconfiguring
could be avoided when AVR was power cycled on my setup.

Power off AVR (default cec.debounce=0):
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

Power on AVR (default cec.debounce=0):
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

Power off AVR (cec.debounce=5000):
[  251.720471] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
[  251.922432] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11

Power on AVR (cec.debounce=5000):
[  291.154262] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 5
[  291.296199] cec-dw_hdmi: reported physical address 2.0.0.0 for logical address 11

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/media/cec/cec-adap.c |  9 ++++++++-
 drivers/media/cec/cec-core.c | 18 ++++++++++++++++++
 drivers/media/cec/cec-priv.h |  1 +
 include/media/cec.h          |  2 ++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 5ef7daeb8cbd..4c94f6da526b 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1593,8 +1593,15 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 	if (IS_ERR_OR_NULL(adap))
 		return;
 
+	cancel_delayed_work_sync(&adap->debounce_work);
+
 	mutex_lock(&adap->lock);
-	__cec_s_phys_addr(adap, phys_addr, block);
+	if (cec_debounce > 0 && !block && phys_addr == CEC_PHYS_ADDR_INVALID &&
+	    adap->phys_addr != phys_addr)
+		schedule_delayed_work(&adap->debounce_work,
+				      msecs_to_jiffies(cec_debounce));
+	else
+		__cec_s_phys_addr(adap, phys_addr, block);
 	mutex_unlock(&adap->lock);
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr);
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index 9c610e1e99b8..fa93a724d7aa 100644
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
@@ -174,6 +178,8 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	devnode->unregistered = true;
 	mutex_unlock(&devnode->lock);
 
+	cancel_delayed_work_sync(&adap->debounce_work);
+
 	mutex_lock(&adap->lock);
 	__cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
 	__cec_s_log_addrs(adap, NULL, false);
@@ -250,6 +256,17 @@ static const struct file_operations cec_error_inj_fops = {
 };
 #endif
 
+static void cec_s_phys_addr_debounce(struct work_struct *work)
+{
+	struct delayed_work *delayed_work = to_delayed_work(work);
+	struct cec_adapter *adap =
+		container_of(delayed_work, struct cec_adapter, debounce_work);
+
+	mutex_lock(&adap->lock);
+	__cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
+	mutex_unlock(&adap->lock);
+}
+
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 					 void *priv, const char *name, u32 caps,
 					 u8 available_las)
@@ -293,6 +310,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	INIT_LIST_HEAD(&adap->transmit_queue);
 	INIT_LIST_HEAD(&adap->wait_queue);
 	init_waitqueue_head(&adap->kthread_waitq);
+	INIT_DELAYED_WORK(&adap->debounce_work, cec_s_phys_addr_debounce);
 
 	/* adap->devnode initialization */
 	INIT_LIST_HEAD(&adap->devnode.fhs);
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
 
diff --git a/include/media/cec.h b/include/media/cec.h
index 4d59387bc61b..4d96ece01ba2 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -195,6 +195,8 @@ struct cec_adapter {
 	wait_queue_head_t kthread_waitq;
 	wait_queue_head_t waitq;
 
+	struct delayed_work debounce_work;
+
 	const struct cec_adap_ops *ops;
 	void *priv;
 	u32 capabilities;
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97DD31488
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 20:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfEaST7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 14:19:59 -0400
Received: from goldenrod.birch.relay.mailchannels.net ([23.83.209.74]:64796
        "EHLO goldenrod.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726869AbfEaST7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 14:19:59 -0400
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id EA6CB5014CA;
        Fri, 31 May 2019 18:19:56 +0000 (UTC)
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (100-96-38-146.trex.outbound.svc.cluster.local [100.96.38.146])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 36422501CC3;
        Fri, 31 May 2019 18:19:54 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a61.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Fri, 31 May 2019 18:19:56 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Print-Trail: 12cc68c835403cd6_1559326796748_3404931389
X-MC-Loop-Signature: 1559326796748:2851347670
X-MC-Ingress-Time: 1559326796748
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTP id B8B9180194;
        Fri, 31 May 2019 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references; s=
        nextdimension.cc; bh=ZHpe8mB8lgYCtH9lw9gZ4tqT6Y4=; b=clAQ/UMCQl+
        KcNb4FPvJtVvkVGlEXKv1UVgHKTXcOg5NAnM3CF4TA6oqmifnfgJQxNgTjT+4OKL
        AMr7f4oB78ADwY2S0QBQjCA8gPStiNZJdiIP0pOP0zcbk+QvDDgBBY6bjvn9/XQZ
        46lkWZBMt1YmrodFQBYkMufIwrnY9NF0=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTPSA id 0BAC080196;
        Fri, 31 May 2019 11:19:50 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a61
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v6 2/4] pvrusb2: Add multiple dvb frontend support
Date:   Fri, 31 May 2019 13:19:43 -0500
Message-Id: <1559326785-26574-3-git-send-email-brad@nextdimension.cc>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559326785-26574-1-git-send-email-brad@nextdimension.cc>
References: <1559326785-26574-1-git-send-email-brad@nextdimension.cc>
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefuddguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvufffkffojghfsedttdertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgephe
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All changes are equivalent and backwards compatible.
All current devices have been changed to use fe[0]
Code has been added to dvb init to support cleanup after failure.

Multiple frontends are required by Hauppauge HVR-1975, which is in a
later commit.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v5:
- no changes
Since v4:
- checkpatch strict fixes
- commit message expansion

 drivers/media/usb/pvrusb2/pvrusb2-devattr.c | 46 ++++++++---------
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c     | 77 ++++++++++++++++++++++-------
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h     |  2 +-
 3 files changed, 82 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
index 06de1c8..a4a27e0 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
@@ -188,10 +188,10 @@ static struct lgdt330x_config pvr2_lgdt3303_config = {
 
 static int pvr2_lgdt3303_attach(struct pvr2_dvb_adapter *adap)
 {
-	adap->fe = dvb_attach(lgdt330x_attach, &pvr2_lgdt3303_config,
-			      0x0e,
-			      &adap->channel.hdw->i2c_adap);
-	if (adap->fe)
+	adap->fe[0] = dvb_attach(lgdt330x_attach, &pvr2_lgdt3303_config,
+				 0x0e,
+				 &adap->channel.hdw->i2c_adap);
+	if (adap->fe[0])
 		return 0;
 
 	return -EIO;
@@ -199,7 +199,7 @@ static int pvr2_lgdt3303_attach(struct pvr2_dvb_adapter *adap)
 
 static int pvr2_lgh06xf_attach(struct pvr2_dvb_adapter *adap)
 {
-	dvb_attach(simple_tuner_attach, adap->fe,
+	dvb_attach(simple_tuner_attach, adap->fe[0],
 		   &adap->channel.hdw->i2c_adap, 0x61,
 		   TUNER_LG_TDVS_H06XF);
 
@@ -248,10 +248,10 @@ static struct lgdt330x_config pvr2_lgdt3302_config = {
 
 static int pvr2_lgdt3302_attach(struct pvr2_dvb_adapter *adap)
 {
-	adap->fe = dvb_attach(lgdt330x_attach, &pvr2_lgdt3302_config,
-			      0x0e,
-			      &adap->channel.hdw->i2c_adap);
-	if (adap->fe)
+	adap->fe[0] = dvb_attach(lgdt330x_attach, &pvr2_lgdt3302_config,
+				 0x0e,
+				 &adap->channel.hdw->i2c_adap);
+	if (adap->fe[0])
 		return 0;
 
 	return -EIO;
@@ -259,7 +259,7 @@ static int pvr2_lgdt3302_attach(struct pvr2_dvb_adapter *adap)
 
 static int pvr2_fcv1236d_attach(struct pvr2_dvb_adapter *adap)
 {
-	dvb_attach(simple_tuner_attach, adap->fe,
+	dvb_attach(simple_tuner_attach, adap->fe[0],
 		   &adap->channel.hdw->i2c_adap, 0x61,
 		   TUNER_PHILIPS_FCV1236D);
 
@@ -335,9 +335,9 @@ static struct tda18271_config hauppauge_tda18271_dvb_config = {
 
 static int pvr2_tda10048_attach(struct pvr2_dvb_adapter *adap)
 {
-	adap->fe = dvb_attach(tda10048_attach, &hauppauge_tda10048_config,
-			      &adap->channel.hdw->i2c_adap);
-	if (adap->fe)
+	adap->fe[0] = dvb_attach(tda10048_attach, &hauppauge_tda10048_config,
+				 &adap->channel.hdw->i2c_adap);
+	if (adap->fe[0])
 		return 0;
 
 	return -EIO;
@@ -345,10 +345,10 @@ static int pvr2_tda10048_attach(struct pvr2_dvb_adapter *adap)
 
 static int pvr2_73xxx_tda18271_8295_attach(struct pvr2_dvb_adapter *adap)
 {
-	dvb_attach(tda829x_attach, adap->fe,
+	dvb_attach(tda829x_attach, adap->fe[0],
 		   &adap->channel.hdw->i2c_adap, 0x42,
 		   &tda829x_no_probe);
-	dvb_attach(tda18271_attach, adap->fe, 0x60,
+	dvb_attach(tda18271_attach, adap->fe[0], 0x60,
 		   &adap->channel.hdw->i2c_adap,
 		   &hauppauge_tda18271_dvb_config);
 
@@ -433,9 +433,9 @@ static struct tda18271_config hauppauge_tda18271_config = {
 
 static int pvr2_s5h1409_attach(struct pvr2_dvb_adapter *adap)
 {
-	adap->fe = dvb_attach(s5h1409_attach, &pvr2_s5h1409_config,
-			      &adap->channel.hdw->i2c_adap);
-	if (adap->fe)
+	adap->fe[0] = dvb_attach(s5h1409_attach, &pvr2_s5h1409_config,
+				 &adap->channel.hdw->i2c_adap);
+	if (adap->fe[0])
 		return 0;
 
 	return -EIO;
@@ -443,9 +443,9 @@ static int pvr2_s5h1409_attach(struct pvr2_dvb_adapter *adap)
 
 static int pvr2_s5h1411_attach(struct pvr2_dvb_adapter *adap)
 {
-	adap->fe = dvb_attach(s5h1411_attach, &pvr2_s5h1411_config,
-			      &adap->channel.hdw->i2c_adap);
-	if (adap->fe)
+	adap->fe[0] = dvb_attach(s5h1411_attach, &pvr2_s5h1411_config,
+				 &adap->channel.hdw->i2c_adap);
+	if (adap->fe[0])
 		return 0;
 
 	return -EIO;
@@ -453,10 +453,10 @@ static int pvr2_s5h1411_attach(struct pvr2_dvb_adapter *adap)
 
 static int pvr2_tda18271_8295_attach(struct pvr2_dvb_adapter *adap)
 {
-	dvb_attach(tda829x_attach, adap->fe,
+	dvb_attach(tda829x_attach, adap->fe[0],
 		   &adap->channel.hdw->i2c_adap, 0x42,
 		   &tda829x_no_probe);
-	dvb_attach(tda18271_attach, adap->fe, 0x60,
+	dvb_attach(tda18271_attach, adap->fe[0], 0x60,
 		   &adap->channel.hdw->i2c_adap,
 		   &hauppauge_tda18271_config);
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 4b32b21..f302f1e 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -343,26 +343,19 @@ static int pvr2_dvb_frontend_init(struct pvr2_dvb_adapter *adap)
 		goto done;
 	}
 
-	if ((dvb_props->frontend_attach(adap) == 0) && (adap->fe)) {
-
-		if (dvb_register_frontend(&adap->dvb_adap, adap->fe)) {
+	if (dvb_props->frontend_attach(adap) == 0 && adap->fe[0]) {
+		if (dvb_register_frontend(&adap->dvb_adap, adap->fe[0])) {
 			pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 				   "frontend registration failed!");
-			dvb_frontend_detach(adap->fe);
-			adap->fe = NULL;
 			ret = -ENODEV;
-			goto done;
+			goto fail_frontend0;
 		}
+		if (adap->fe[0]->ops.analog_ops.standby)
+			adap->fe[0]->ops.analog_ops.standby(adap->fe[0]);
 
-		if (dvb_props->tuner_attach)
-			dvb_props->tuner_attach(adap);
-
-		if (adap->fe->ops.analog_ops.standby)
-			adap->fe->ops.analog_ops.standby(adap->fe);
-
-		/* Ensure all frontends negotiate bus access */
-		adap->fe->ops.ts_bus_ctrl = pvr2_dvb_bus_ctrl;
-
+		pvr2_trace(PVR2_TRACE_INFO, "transferring fe[%d] ts_bus_ctrl() to pvr2_dvb_bus_ctrl()",
+			   adap->fe[0]->id);
+		adap->fe[0]->ops.ts_bus_ctrl = pvr2_dvb_bus_ctrl;
 	} else {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 			   "no frontend was attached!");
@@ -370,16 +363,62 @@ static int pvr2_dvb_frontend_init(struct pvr2_dvb_adapter *adap)
 		return ret;
 	}
 
- done:
+	if (dvb_props->tuner_attach && dvb_props->tuner_attach(adap)) {
+		pvr2_trace(PVR2_TRACE_ERROR_LEGS, "tuner attach failed");
+		ret = -ENODEV;
+		goto fail_tuner;
+	}
+
+	if (adap->fe[1]) {
+		adap->fe[1]->id = 1;
+		adap->fe[1]->tuner_priv = adap->fe[0]->tuner_priv;
+		memcpy(&adap->fe[1]->ops.tuner_ops,
+		       &adap->fe[0]->ops.tuner_ops,
+		       sizeof(struct dvb_tuner_ops));
+
+		if (dvb_register_frontend(&adap->dvb_adap, adap->fe[1])) {
+			pvr2_trace(PVR2_TRACE_ERROR_LEGS,
+				   "frontend registration failed!");
+			ret = -ENODEV;
+			goto fail_frontend1;
+		}
+		/* MFE lock */
+		adap->dvb_adap.mfe_shared = 1;
+
+		if (adap->fe[1]->ops.analog_ops.standby)
+			adap->fe[1]->ops.analog_ops.standby(adap->fe[1]);
+
+		pvr2_trace(PVR2_TRACE_INFO, "transferring fe[%d] ts_bus_ctrl() to pvr2_dvb_bus_ctrl()",
+			   adap->fe[1]->id);
+		adap->fe[1]->ops.ts_bus_ctrl = pvr2_dvb_bus_ctrl;
+	}
+done:
 	pvr2_channel_limit_inputs(&adap->channel, 0);
 	return ret;
+
+fail_frontend1:
+	dvb_frontend_detach(adap->fe[1]);
+	adap->fe[1] = NULL;
+fail_tuner:
+	dvb_unregister_frontend(adap->fe[0]);
+fail_frontend0:
+	dvb_frontend_detach(adap->fe[0]);
+	adap->fe[0] = NULL;
+
+	return ret;
 }
 
 static int pvr2_dvb_frontend_exit(struct pvr2_dvb_adapter *adap)
 {
-	if (adap->fe != NULL) {
-		dvb_unregister_frontend(adap->fe);
-		dvb_frontend_detach(adap->fe);
+	if (adap->fe[1]) {
+		dvb_unregister_frontend(adap->fe[1]);
+		dvb_frontend_detach(adap->fe[1]);
+		adap->fe[1] = NULL;
+	}
+	if (adap->fe[0]) {
+		dvb_unregister_frontend(adap->fe[0]);
+		dvb_frontend_detach(adap->fe[0]);
+		adap->fe[0] = NULL;
 	}
 	return 0;
 }
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
index e7f71fb..91bff57 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
@@ -18,7 +18,7 @@ struct pvr2_dvb_adapter {
 	struct dmxdev		dmxdev;
 	struct dvb_demux	demux;
 	struct dvb_net		dvb_net;
-	struct dvb_frontend	*fe;
+	struct dvb_frontend	*fe[2];
 
 	int			feedcount;
 	int			max_feed_count;
-- 
2.7.4


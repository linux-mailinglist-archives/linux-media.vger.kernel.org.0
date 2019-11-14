Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04F2FFCF16
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfKNUE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:27 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:56397
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbfKNUE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:26 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 3E65D501322;
        Thu, 14 Nov 2019 20:04:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-196-8.trex.outbound.svc.cluster.local [100.96.196.8])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id B0A88501730;
        Thu, 14 Nov 2019 20:04:24 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:25 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Continue-Obese: 308721f140c31d83_1573761865056_121080468
X-MC-Loop-Signature: 1573761865056:1339585238
X-MC-Ingress-Time: 1573761865055
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 5BC6F82611;
        Thu, 14 Nov 2019 12:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        +MC3ZeXyfMfmEOoIKLdzKQnr01w=; b=CDVanNzKNL3Gr7iFhnKJMG9Pzxi9Fxb5
        EXoCei+PePl9sRgYV/uz1mN1l8P6dxtUjQfJiSuCTIA+4/zn12za6iIqpo2jJ1UT
        d+iTTe1Uudn9wVGz3IQIius6QsZsVcv0AsjWL8mjAPehJjwPT13p/O833iulHFrc
        X/RXL4q3p4Y=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id E6C5082601;
        Thu, 14 Nov 2019 12:04:18 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 06/14] si2157: module debug option to wait on signal lock
Date:   Thu, 14 Nov 2019 14:04:00 -0600
Message-Id: <20191114200408.28883-7-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some debugging cases it is useful to know how long it took
signal lock to happen after tuning. This can help diagnose
line issues.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Split into two parts, tune completion and signal lock

 drivers/media/tuners/si2157.c | 46 ++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index cac4870017f5..16d7169f46fb 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -9,6 +9,10 @@
=20
 static const struct dvb_tuner_ops si2157_ops;
=20
+static int tuner_lock_debug;
+module_param(tuner_lock_debug, int, 0644);
+MODULE_PARM_DESC(tuner_lock_debug, "if set, signal lock is briefly waite=
d on after setting params");
+
 /* execute firmware command */
 static int si2157_cmd_execute(struct i2c_client *client, struct si2157_c=
md *cmd)
 {
@@ -301,14 +305,22 @@ static int si2157_sleep(struct dvb_frontend *fe)
 	return ret;
 }
=20
-static int si2157_tune_wait(struct i2c_client *client)
+static int si2157_tune_wait(struct i2c_client *client, u8 is_digital)
 {
 #define TUN_TIMEOUT 40
+#define DIG_TIMEOUT 30
+#define ANALOG_TIMEOUT 150
 	struct si2157_dev *dev =3D i2c_get_clientdata(client);
 	int ret;
 	unsigned long timeout;
 	unsigned long start_time;
 	u8 wait_status;
+	u8  tune_lock_mask;
+
+	if (is_digital)
+		tune_lock_mask =3D 0x04;
+	else
+		tune_lock_mask =3D 0x02;
=20
 	mutex_lock(&dev->i2c_mutex);
=20
@@ -335,6 +347,34 @@ static int si2157_tune_wait(struct i2c_client *clien=
t)
 		jiffies_to_msecs(jiffies) - jiffies_to_msecs(start_time),
 		wait_status);
=20
+	/* if we tuned ok, wait a bit for tuner lock */
+	if (tuner_lock_debug && (wait_status & 0x81) =3D=3D 0x81) {
+		if (is_digital)
+			timeout =3D jiffies + msecs_to_jiffies(DIG_TIMEOUT);
+		else
+			timeout =3D jiffies + msecs_to_jiffies(ANALOG_TIMEOUT);
+
+		while (!time_after(jiffies, timeout)) {
+			ret =3D i2c_master_recv(client, &wait_status,
+					      sizeof(wait_status));
+			if (ret < 0) {
+				goto err_mutex_unlock;
+			} else if (ret !=3D sizeof(wait_status)) {
+				ret =3D -EREMOTEIO;
+				goto err_mutex_unlock;
+			}
+
+			/* tuner locked? */
+			if (wait_status & tune_lock_mask)
+				break;
+			usleep_range(5000, 10000);
+		}
+
+		dev_dbg(&client->dev, "tuning+lock took %d ms, status=3D0x%x\n",
+			jiffies_to_msecs(jiffies) - jiffies_to_msecs(start_time),
+			wait_status);
+	}
+
 	if ((wait_status & 0xc0) !=3D 0x80) {
 		ret =3D -ETIMEDOUT;
 		goto err_mutex_unlock;
@@ -448,7 +488,7 @@ static int si2157_set_params(struct dvb_frontend *fe)
 	dev->bandwidth =3D bandwidth;
 	dev->frequency =3D c->frequency;
=20
-	si2157_tune_wait(client); /* wait to complete, ignore any errors */
+	si2157_tune_wait(client, 1); /* wait to complete, ignore any errors */
=20
 	return 0;
 err:
@@ -644,7 +684,7 @@ static int si2157_set_analog_params(struct dvb_fronte=
nd *fe,
=20
 	dev->bandwidth =3D bandwidth;
=20
-	si2157_tune_wait(client); /* wait to complete, ignore any errors */
+	si2157_tune_wait(client, 0); /* wait to complete, ignore any errors */
=20
 	return 0;
 err:
--=20
2.23.0


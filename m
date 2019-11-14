Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 124D6FCF14
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfKNUEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:25 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:30363 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfKNUEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:25 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 7F84E500EA8;
        Thu, 14 Nov 2019 20:04:24 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 0957B5017C3;
        Thu, 14 Nov 2019 20:04:24 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:24 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Eight-Desert: 025e1c6a6a2e0a3d_1573761864330_1186899233
X-MC-Loop-Signature: 1573761864330:3064566603
X-MC-Ingress-Time: 1573761864330
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id C47098260A;
        Thu, 14 Nov 2019 12:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        4tyyZct1UyTiFlOMHzwbz8k0keI=; b=JC4657V+cRgRrvUNKNJfInhTdF997Baq
        q0i+Kf4aFSsiYzQ3zvZZ4TRmbD0WJhqo2HjGpPppiNkCWmYE3cZDBvNmH3nZunIE
        0ioG4QGtgBrxqEl7hXhnP/+kJcI7Oiqg+KjMqqy0zr2L2m3b9jqbvYlFT6N/p+oW
        XEKmOWCSbxg=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 660338259B;
        Thu, 14 Nov 2019 12:04:18 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 05/14] si2157: Briefly wait for tuning operation to complete
Date:   Thu, 14 Nov 2019 14:03:59 -0600
Message-Id: <20191114200408.28883-6-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To detect errors in the tuning operation, this waits up 40ms for operatio=
n
completion status. This allows for error detection and prevents issuing
additional commands to the tuner before it is finished.

Tuning typically completes in 20-30ms.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Split into two patches, tune completion and signal lock

 drivers/media/tuners/si2157.c | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index 78a855df30da..cac4870017f5 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -301,6 +301,54 @@ static int si2157_sleep(struct dvb_frontend *fe)
 	return ret;
 }
=20
+static int si2157_tune_wait(struct i2c_client *client)
+{
+#define TUN_TIMEOUT 40
+	struct si2157_dev *dev =3D i2c_get_clientdata(client);
+	int ret;
+	unsigned long timeout;
+	unsigned long start_time;
+	u8 wait_status;
+
+	mutex_lock(&dev->i2c_mutex);
+
+	/* wait tuner command complete */
+	start_time =3D jiffies;
+	timeout =3D start_time + msecs_to_jiffies(TUN_TIMEOUT);
+	while (!time_after(jiffies, timeout)) {
+		ret =3D i2c_master_recv(client, &wait_status,
+				      sizeof(wait_status));
+		if (ret < 0) {
+			goto err_mutex_unlock;
+		} else if (ret !=3D sizeof(wait_status)) {
+			ret =3D -EREMOTEIO;
+			goto err_mutex_unlock;
+		}
+
+		/* tuner done? */
+		if ((wait_status & 0x81) =3D=3D 0x81)
+			break;
+		usleep_range(5000, 10000);
+	}
+
+	dev_dbg(&client->dev, "tuning took %d ms, status=3D0x%x\n",
+		jiffies_to_msecs(jiffies) - jiffies_to_msecs(start_time),
+		wait_status);
+
+	if ((wait_status & 0xc0) !=3D 0x80) {
+		ret =3D -ETIMEDOUT;
+		goto err_mutex_unlock;
+	}
+
+	mutex_unlock(&dev->i2c_mutex);
+	return 0;
+
+err_mutex_unlock:
+	mutex_unlock(&dev->i2c_mutex);
+	dev_err(&client->dev, "failed=3D%d\n", ret);
+	return ret;
+}
+
 static int si2157_set_params(struct dvb_frontend *fe)
 {
 	struct i2c_client *client =3D fe->tuner_priv;
@@ -400,6 +448,8 @@ static int si2157_set_params(struct dvb_frontend *fe)
 	dev->bandwidth =3D bandwidth;
 	dev->frequency =3D c->frequency;
=20
+	si2157_tune_wait(client); /* wait to complete, ignore any errors */
+
 	return 0;
 err:
 	dev->bandwidth =3D 0;
@@ -594,6 +644,8 @@ static int si2157_set_analog_params(struct dvb_fronte=
nd *fe,
=20
 	dev->bandwidth =3D bandwidth;
=20
+	si2157_tune_wait(client); /* wait to complete, ignore any errors */
+
 	return 0;
 err:
 	dev->bandwidth =3D 0;
--=20
2.23.0


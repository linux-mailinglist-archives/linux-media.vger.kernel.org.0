Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAADFCF1A
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKNUE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:29 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:48107 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbfKNUE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:27 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 1819234212C;
        Thu, 14 Nov 2019 20:04:27 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 99C773416E0;
        Thu, 14 Nov 2019 20:04:26 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:27 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Belong-Fumbling: 5dc050050229cb66_1573761866904_4024260111
X-MC-Loop-Signature: 1573761866904:3021660062
X-MC-Ingress-Time: 1573761866904
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id AD3D082601;
        Thu, 14 Nov 2019 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        PtVCjVnM9sEZsymmeV4zCJLWKII=; b=Jg90j3z0I58BR8hjCirz0BxTxGQeEAdD
        qaf+FOAvxSgCRv+r+OWKf3U0QfIMfeJH61jEuBGWGa1NzcmyYrm1jcCBTh0hsGxs
        0G2O3Uuj5VpV1sVV85JTgQHKkd9/CdH544e44LcE+zTHorpG1vd9RIm5vPqzwgjh
        ur68+FeYkJE=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 57C598260C;
        Thu, 14 Nov 2019 12:04:22 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 12/14] si2157: add on-demand rf strength func
Date:   Thu, 14 Nov 2019 14:04:06 -0600
Message-Id: <20191114200408.28883-13-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add get_rf_strength callback to get RSSI from the tuner. DVBv5
stat cache is updated. get_rf_strength is called by tuner_core
for analog tuners and is also used by some bridge drivers to
obtain RSSI directly from the tuner.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Changes since v1:
- simplify normalization of signal strength calculation
- use clamp and add description of operation
- remove __func__ from dev_dbg macro

 drivers/media/tuners/si2157.c | 40 ++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index 16d7169f46fb..aaf223b9b781 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -725,6 +725,42 @@ static int si2157_get_if_frequency(struct dvb_fronte=
nd *fe, u32 *frequency)
 	return 0;
 }
=20
+static int si2157_get_rf_strength(struct dvb_frontend *fe, u16 *rssi)
+{
+	struct i2c_client *client =3D fe->tuner_priv;
+	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
+	struct si2157_cmd cmd;
+	int ret;
+	int strength;
+
+	dev_dbg(&client->dev, "\n");
+
+	memcpy(cmd.args, "\x42\x00", 2);
+	cmd.wlen =3D 2;
+	cmd.rlen =3D 12;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	c->strength.stat[0].scale =3D FE_SCALE_DECIBEL;
+	c->strength.stat[0].svalue =3D (s8)cmd.args[3] * 1000;
+
+	/* normalize values based on Silicon Labs reference
+	 * add 100, then anything > 80 is 100% signal
+	 */
+	strength =3D (s8)cmd.args[3] + 100;
+	strength =3D clamp_val(strength, 0, 80);
+	*rssi =3D (u16)(strength * 0xffff / 80);
+
+	dev_dbg(&client->dev, "strength=3D%d rssi=3D%u\n",
+		(s8)cmd.args[3], *rssi);
+
+	return 0;
+err:
+	dev_dbg(&client->dev, "failed=3D%d\n", ret);
+	return ret;
+}
+
 static const struct dvb_tuner_ops si2157_ops =3D {
 	.info =3D {
 		.name             =3D "Silicon Labs Si2141/Si2146/2147/2148/2157/2158"=
,
@@ -738,7 +774,9 @@ static const struct dvb_tuner_ops si2157_ops =3D {
 	.set_analog_params =3D si2157_set_analog_params,
 	.get_frequency     =3D si2157_get_frequency,
 	.get_bandwidth     =3D si2157_get_bandwidth,
-	.get_if_frequency =3D si2157_get_if_frequency,
+	.get_if_frequency  =3D si2157_get_if_frequency,
+
+	.get_rf_strength   =3D si2157_get_rf_strength,
 };
=20
 static void si2157_stat_work(struct work_struct *work)
--=20
2.23.0


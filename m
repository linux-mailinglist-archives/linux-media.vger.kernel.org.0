Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB82FCF64
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfKNUOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:14:06 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:61903 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfKNUOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:14:05 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id D49E25A0C08;
        Thu, 14 Nov 2019 20:04:17 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-169-194.trex.outbound.svc.cluster.local [100.96.169.194])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 41E8C5A0BB0;
        Thu, 14 Nov 2019 20:04:17 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:17 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Irritate-Well-Made: 52dad08903b63cd1_1573761857678_3190511212
X-MC-Loop-Signature: 1573761857678:2154668290
X-MC-Ingress-Time: 1573761857678
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 8501382601;
        Thu, 14 Nov 2019 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        E3HWcMxER6eIiAN637UUeUKFu9U=; b=UKQv9Vx46UYiooeiFGYvVyT7Qnt4t//x
        XkJbxSemJsuIV1GYTC/jqSkj/uAop7W12nPUvpblhg7yz2/jSQZ+1TG9/9CrYOyW
        ONjDGCX3Qr0ozJR1BFdJvw0XlOTdGAHsYoU0QM04z93kqKGOQ1Aryd+IrvnHFB/g
        LvcDyLbNfOo=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 23B978260C;
        Thu, 14 Nov 2019 12:04:16 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 01/14] si2157: Enable tuner status flags
Date:   Thu, 14 Nov 2019 14:03:55 -0600
Message-Id: <20191114200408.28883-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable flags to get status of commands sent to the tuner.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
No changes

 drivers/media/tuners/si2157.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index 898e0f9f8b70..12f88304ac0f 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -230,6 +230,28 @@ static int si2157_init(struct dvb_frontend *fe)
=20
 	dev_info(&client->dev, "firmware version: %c.%c.%d\n",
 			cmd.args[6], cmd.args[7], cmd.args[8]);
+
+	/* enable tuner status flags */
+	memcpy(cmd.args, "\x14\x00\x01\x05\x01\x00", 6);
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 1;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	memcpy(cmd.args, "\x14\x00\x01\x06\x01\x00", 6);
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 1;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	memcpy(cmd.args, "\x14\x00\x01\x07\x01\x00", 6);
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 1;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
 warm:
 	/* init statistics in order signal app which are supported */
 	c->strength.len =3D 1;
--=20
2.23.0


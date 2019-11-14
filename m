Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDD5FCF12
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfKNUEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:23 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:21771
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726852AbfKNUEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:22 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id F422B5A0C97;
        Thu, 14 Nov 2019 20:04:21 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 315C75A07A6;
        Thu, 14 Nov 2019 20:04:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:21 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Whistle-Invention: 58ba2f7e13a43b63_1573761861717_3123050381
X-MC-Loop-Signature: 1573761861717:4251075625
X-MC-Ingress-Time: 1573761861717
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 175E88260C;
        Thu, 14 Nov 2019 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        RbnvllfS2p8GEkG9mYK7b1yWqSM=; b=q2jtdxeQqNDU8heb4Efztu6FjAqV6JeC
        O6j4ENjJ1JNooUw2Eakb/hMIssUMpTVJKzQukcZC+YgEbrDeeOznBvKchtsxBVTD
        n8Dq9/tvxsP6uBHL4BHkjv6hATxQxOJzlD5eB4gJGcgh8patdYqX1oLhP60FKubs
        vK1DQ2FVn2U=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id AC89D8259B;
        Thu, 14 Nov 2019 12:04:16 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 02/14] si2157: Check error status bit on cmd execute
Date:   Thu, 14 Nov 2019 14:03:56 -0600
Message-Id: <20191114200408.28883-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check error status bit on command execute, if error bit is
set return -EAGAIN. Ignore -EAGAIN in probe during device check.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Fix -EAGAIN returned by si2141 in si2157_init

 drivers/media/tuners/si2157.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index 12f88304ac0f..69c625eaee25 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -47,14 +47,20 @@ static int si2157_cmd_execute(struct i2c_client *clie=
nt, struct si2157_cmd *cmd)
 				break;
 		}
=20
-		dev_dbg(&client->dev, "cmd execution took %d ms\n",
-				jiffies_to_msecs(jiffies) -
-				(jiffies_to_msecs(timeout) - TIMEOUT));
+		dev_dbg(&client->dev, "cmd execution took %d ms, status=3D%x\n",
+			jiffies_to_msecs(jiffies) -
+			(jiffies_to_msecs(timeout) - TIMEOUT),
+			cmd->args[0]);
=20
 		if (!((cmd->args[0] >> 7) & 0x01)) {
 			ret =3D -ETIMEDOUT;
 			goto err_mutex_unlock;
 		}
+		/* check error status bit */
+		if (cmd->args[0] & 0x40) {
+			ret =3D -EAGAIN;
+			goto err_mutex_unlock;
+		}
 	}
=20
 	mutex_unlock(&dev->i2c_mutex);
@@ -106,7 +112,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	}
 	cmd.rlen =3D 1;
 	ret =3D si2157_cmd_execute(client, &cmd);
-	if (ret)
+	if (ret && (dev->chiptype !=3D SI2157_CHIPTYPE_SI2141 || ret !=3D -EAGA=
IN))
 		goto err;
=20
 	/* Si2141 needs a second command before it answers the revision query *=
/
@@ -478,7 +484,7 @@ static int si2157_probe(struct i2c_client *client,
 	cmd.wlen =3D 0;
 	cmd.rlen =3D 1;
 	ret =3D si2157_cmd_execute(client, &cmd);
-	if (ret)
+	if (ret && ret !=3D -EAGAIN)
 		goto err_kfree;
=20
 	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
--=20
2.23.0


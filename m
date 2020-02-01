Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258E414FAC2
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgBAVsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:48:39 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:31942
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726598AbgBAVsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Feb 2020 16:48:39 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id B9289E0387;
        Sat,  1 Feb 2020 21:48:37 +0000 (UTC)
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (100-96-10-8.trex.outbound.svc.cluster.local [100.96.10.8])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 18714E11C2;
        Sat,  1 Feb 2020 21:48:37 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a33.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 01 Feb 2020 21:48:37 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Hysterical-Trouble: 549dda0f6fd12d73_1580593717540_3725960199
X-MC-Loop-Signature: 1580593717540:1130563288
X-MC-Ingress-Time: 1580593717540
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTP id F18467FE24;
        Sat,  1 Feb 2020 13:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        NOqxRTY7QAmc7/Yu+PQHtaM0JDU=; b=t7tyC6VKDXp7IudIePfvL7AYE1TKswJ9
        OqvlN/yphommRIKFKaZaCBCuYV1qjbYkAinY7iJ/qeSiPXXzb6pTZMSxASrOMOfo
        E+M6Zkt64iBJQ78b/9ua5x7V1jTu1+Mftoi4pbqcNGmV3pUCfwlNrzisB0xeA5p5
        8KPP+sF8tPg=
Received: from localhost.localdomain (66-90-181-52.dyn.grandenetworks.net [66.90.181.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTPSA id 2126C7FE2C;
        Sat,  1 Feb 2020 13:48:32 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a33
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>,
        Michael Bunk <micha@freedict.org>
Subject: [PATCH 3/3] dw2102: probe for demodulator i2c address
Date:   Sat,  1 Feb 2020 15:48:26 -0600
Message-Id: <20200201214826.22873-4-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200201214826.22873-1-brad@nextdimension.cc>
References: <20200201214826.22873-1-brad@nextdimension.cc>
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -85
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgedvgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludehmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucfkphepieeirdeltddrudekuddrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeeiiedrledtrddukedurdehvddprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehmihgthhgrsehfrhgvvgguihgtthdrohhrgh
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is required to support the Terratec S2 USB Box Revision 4, which
reused usb vid:pid, but has a different demodulator (m88ds3103b) at
i2c address 0x6a.

Signed-off-by: Michael Bunk <micha@freedict.org>
[fixed checkpatch issues]
Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/dvb-usb/dw2102.c | 45 ++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-u=
sb/dw2102.c
index 8b584507dd59..1007366a295b 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1524,6 +1524,29 @@ static int m88rs2000_frontend_attach(struct dvb_us=
b_adapter *adap)
 	return -EIO;
 }
=20
+static int tt_s2_4600_frontend_attach_probe_demod(struct dvb_usb_device =
*d,
+						  const int probe_addr)
+{
+	struct dw2102_state *state =3D d->priv;
+
+	state->data[0] =3D 0x9;
+	state->data[1] =3D 0x1;
+	state->data[2] =3D 0x1;
+	state->data[3] =3D probe_addr;
+	state->data[4] =3D 0x0;
+
+	if (dvb_usb_generic_rw(d, state->data, 5, state->data, 2, 0) < 0) {
+		err("i2c probe for address 0x%x failed.", probe_addr);
+		return 0;
+	}
+
+	if (state->data[0] !=3D 8) /* fail(7) or error, no device at address */
+		return 0;
+
+	/* probing successful */
+	return 1;
+}
+
 static int tt_s2_4600_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct dvb_usb_device *d =3D adap->dev;
@@ -1533,6 +1556,7 @@ static int tt_s2_4600_frontend_attach(struct dvb_us=
b_adapter *adap)
 	struct i2c_board_info board_info;
 	struct m88ds3103_platform_data m88ds3103_pdata =3D {};
 	struct ts2020_config ts2020_config =3D {};
+	int demod_addr;
=20
 	mutex_lock(&d->data_mutex);
=20
@@ -1570,8 +1594,22 @@ static int tt_s2_4600_frontend_attach(struct dvb_u=
sb_adapter *adap)
 	if (dvb_usb_generic_rw(d, state->data, 1, state->data, 1, 0) < 0)
 		err("command 0x51 transfer failed.");
=20
+	/* probe for demodulator i2c address */
+	demod_addr =3D -1;
+	if (tt_s2_4600_frontend_attach_probe_demod(d, 0x68))
+		demod_addr =3D 0x68;
+	else if (tt_s2_4600_frontend_attach_probe_demod(d, 0x69))
+		demod_addr =3D 0x69;
+	else if (tt_s2_4600_frontend_attach_probe_demod(d, 0x6a))
+		demod_addr =3D 0x6a;
+
 	mutex_unlock(&d->data_mutex);
=20
+	if (demod_addr < 0) {
+		err("probing for demodulator failed. Is the external power switched on=
?");
+		return -ENODEV;
+	}
+
 	/* attach demod */
 	m88ds3103_pdata.clk =3D 27000000;
 	m88ds3103_pdata.i2c_wr_max =3D 33;
@@ -1586,8 +1624,11 @@ static int tt_s2_4600_frontend_attach(struct dvb_u=
sb_adapter *adap)
 	m88ds3103_pdata.lnb_hv_pol =3D 1;
 	m88ds3103_pdata.lnb_en_pol =3D 0;
 	memset(&board_info, 0, sizeof(board_info));
-	strscpy(board_info.type, "m88ds3103", I2C_NAME_SIZE);
-	board_info.addr =3D 0x68;
+	if (demod_addr =3D=3D 0x6a)
+		strscpy(board_info.type, "m88ds3103b", I2C_NAME_SIZE);
+	else
+		strscpy(board_info.type, "m88ds3103", I2C_NAME_SIZE);
+	board_info.addr =3D demod_addr;
 	board_info.platform_data =3D &m88ds3103_pdata;
 	request_module("m88ds3103");
 	client =3D i2c_new_client_device(&d->i2c_adap, &board_info);
--=20
2.23.0


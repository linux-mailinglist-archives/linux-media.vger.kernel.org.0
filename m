Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FCD465830
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 22:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343959AbhLAVOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 16:14:24 -0500
Received: from mout.gmx.net ([212.227.17.20]:42833 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343850AbhLAVOV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Dec 2021 16:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638393058;
        bh=G/m4pUXesMteg/dAQMb8zecjWGGkgArN7Jlr3i5PTKs=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=O3DSoCkLBY0W6fQwhfFtHTpNbwjD+mEWU2Af1DwodEVrZdTge5SQrGLna5k/ijoIu
         goh2KMcqB/eJ1K82/p/K3GtEWm/aIP4aFmg13m+BlvihCCe4HnpZ+Snm1U9FgfJ/o4
         nxkkIAm/JkJ9yjCAprMrrikAKcpOl8RfOKb/pLfk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Wed, 1 Dec 2021
 22:10:58 +0100
MIME-Version: 1.0
Message-ID: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: si2157: Add optional firmware download
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 1 Dec 2021 22:10:58 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:VB9J1qPdsZ7zEpwolO9YZwaPicpo/G9+QzvJhLMFPfZdqQytdsyXwpzUQui7iEesuMnVz
 P39ZkOnW2s3/G4S4a2qemBbq1JGCaUHcsDeWohmQTkvqglkbWAV9dS/7B9qkf8zJTOYOAq5zGYaR
 JIve7nT98PqkYkuAKK4wFMnpfXi9ibrjzzgK+JBtGEjjHMPdOuDKrzEwyykNO9mx8iOSWZiqGJgH
 ltH7K76IxW9lcdJwA3Wxi+8S4RijHEEHsuGr/Dl2FEiOzryq6SRGhgL3I0VnXAYHpcV5CnAsGtjs
 hU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cv8qIS31eEc=:H5MmPmdGCg3yhCa1qBFPEt
 /NLHtvisGPTLefb48hS+VKlXrII5axSXcQHoCR76RLH+h7Zc/7VccSyC0vwqMsF8NRKQVnc0k
 tkmbPqHELzT/sTrQW+WEVdyGeifPDf5yqoU+D5PNfQrknCO56xvRWTMyiRaVnxqukDLj9i84s
 aikCi1uxhWl7p2V+ixupy6dKFrL4B350uPAgVNsptCnoKxH3pu3oPCtG4P5vGtlhQniCVa7YT
 dSppjm5k+Xva4Tav5Kb/L/nPjGDYMLtbcnwn55iRDGeA0Ml6PbdlbRRVFhopq1xL/fizxUWaA
 dTXFKTbgfESg/AP3g/Ok8J4u4g4men2DPb46DI/rT2f4TOdzX4PlsEW/n6LGUe/xgFLYgrl7q
 iGTz/XjesNcQSEUzeuHkx0stw+BcJPxtA/zUUxF1lm9iBr2kp2MJckeNWRhnUCNbOpX3DI3jM
 6NQysjSUvPxndbxo+xmkoDjtIsowF581i68ZDvV9T4bDmlsqqOAVYEkL22H/UvwHHijv21bBg
 WgJWgGzEg9x2HV01I/XQ2is5p5oPAvFNYzYycc5/5NnlZ7nou3ZykOSorom2dM2asbX5Rdrh3
 OqOAIzXxJ88MgJg375UvqkIO21PoLZR/yT6icv+8dCIiJUEHsUgAcxREBORVMsNCjvwCwBtrC
 mv+w/31SXAsy0iX3HHUn3JtVZbZyiGkl5jaG2tu8j7/zm8s1QT/kdlPStWJZoY+9pzOqvE5fo
 QonbYN8FJf7C4wxixcXs6jR51zlv44yAfG6KXL0sN0/B6bBhXVItryz1WNNgTU0l6ei/CJb+L
 sHwTXbN
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Si2157 (A30) is functional with the ROM firmware 3.0.5, but can also
be patched at runtime, e.g. to firmware 3.1.3. However, although a
firmware filename for its firmware patch exists, that has only been used
for the Si2177 (A30) so far (which indeed takes the binary identical
firmware patch).

Add support for downloading firmware patches into the Si2157 (A30), but
make it optional, so that initialization can succeed with and without a
firmware patch being available. Keep the use of request_firmware() for
this purpose rather than firmware_request_nowarn(), so that the warning
in the log makes users aware that it is possible to provide a firmware
for this tuner.

The firmware patch is probably also optional for other (if not all)
tuners supported by the driver, but since I do not have the others
available to test, they are kept mandatory for now to avoid regressions.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/tuners/si2157.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 75ddf7ed1faf..757b27d1605a 100644
=2D-- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -85,6 +85,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	struct si2157_cmd cmd;
 	const struct firmware *fw;
 	const char *fw_name;
+	unsigned int fw_required;
 	unsigned int chip_id, xtal_trim;

 	dev_dbg(&client->dev, "\n");
@@ -151,6 +152,10 @@ static int si2157_init(struct dvb_frontend *fe)
 	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
 	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)

+	/* assume firmware is required, unless verified not to be */
+	/* only the SI2157_A30 has been verified not to yet */
+	fw_required =3D true;
+
 	switch (chip_id) {
 	case SI2158_A20:
 	case SI2148_A20:
@@ -159,10 +164,13 @@ static int si2157_init(struct dvb_frontend *fe)
 	case SI2141_A10:
 		fw_name =3D SI2141_A10_FIRMWARE;
 		break;
+	case SI2157_A30:
+		fw_name =3D SI2157_A30_FIRMWARE;
+		fw_required =3D false;
+		break;
 	case SI2177_A30:
 		fw_name =3D SI2157_A30_FIRMWARE;
 		break;
-	case SI2157_A30:
 	case SI2147_A30:
 	case SI2146_A10:
 		fw_name =3D NULL;
@@ -184,6 +192,9 @@ static int si2157_init(struct dvb_frontend *fe)
 	/* request the firmware, this will block and timeout */
 	ret =3D request_firmware(&fw, fw_name, &client->dev);
 	if (ret) {
+		if (!fw_required)
+			goto skip_fw_download;
+
 		dev_err(&client->dev, "firmware file '%s' not found\n",
 				fw_name);
 		goto err;
=2D-
2.17.1


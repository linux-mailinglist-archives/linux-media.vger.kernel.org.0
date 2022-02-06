Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA134AAFB5
	for <lists+linux-media@lfdr.de>; Sun,  6 Feb 2022 14:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241123AbiBFN6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Feb 2022 08:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241532AbiBFN63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Feb 2022 08:58:29 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BD8C0401E6
        for <linux-media@vger.kernel.org>; Sun,  6 Feb 2022 05:58:26 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q198-20020a1ca7cf000000b0037bb52545c6so2113848wme.1
        for <linux-media@vger.kernel.org>; Sun, 06 Feb 2022 05:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l07T+icJ6+m1sX9ZM3yCRdniE4b3eNnSCXutGbtVJ28=;
        b=caTguOUagZ4ti6dW06DhGrRbtIeSqqMTDWsYMsvbwIjrnI4IwbAfaSW8goDIT2+Am8
         RVLRePRuq+1BPlXkr+pQeObrqIlgoR78ppVbmgN8vsrNbwIAwBryLa9rSJ8hJr+ul+v5
         qFGTU+WcCOceE5qSjsgL0JLS8bBTHs42BBQaobOUoZqNDClFIi4hSCyru/1RWVnEN3/W
         sZW061iJ7CkmMlZXonCR8sxF9TrsITuo45B+nbGcvhqsXqNXLkY5S99Ij6GLZF6uyPgA
         cr6Sy79ls+gqa35kP60p19Gw76A6awyvUgtQKpMiIODfEcBztqAURObV4HzVzONEy0ss
         PhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l07T+icJ6+m1sX9ZM3yCRdniE4b3eNnSCXutGbtVJ28=;
        b=Of1F5UEK6MS+H+dfakVGxTydVyiQlYqTUB2Fm4LmPB6Gd/+xS0dyIVsRdqk0obFOIh
         rfcEnH8miEoYxZSXjpiEB8O0GF0pURW6SRNZYuFnl71wYKZKgtQZm0Kmd99f09lfvu82
         9lHpCsJ+vfRhiytM8EaGIf0oniNmDuMBW5WLCBlBEKko60lVt942AIkwc8GO3xjyEz8/
         VCJ7aLg4ApeXTkLTCglwleRY5mi3yowvJ1R8fUaQ1hBuDqX+D5+J9Ramhh0bCtSYQ6As
         rLNHeM7Q9+jUd1DhpSgX41rHxJLq2DfD+o2p+8cvzsmsf7EHYPWmC3OQkmmc4t5Z4kXg
         jElA==
X-Gm-Message-State: AOAM5307asizpjMjIBjcqZzEvn76qSeV+htdjejB97l2Ltu+9zPV8FuO
        jr2N+WypgOIzFvBqjM7NnMp4LxGhA5g=
X-Google-Smtp-Source: ABdhPJzfqiVLqc1FdhRm4+VnbiDFf1HNWyuewLXpZOIEstTUpVCCsvZ1us7nkhtVmStLEJM3IF6ZvA==
X-Received: by 2002:a05:600c:4186:: with SMTP id p6mr7124990wmh.12.1644155905076;
        Sun, 06 Feb 2022 05:58:25 -0800 (PST)
Received: from tool.localnet (static-64-238-230-77.ipcom.comunitel.net. [77.230.238.64])
        by smtp.gmail.com with ESMTPSA id n13sm15491804wms.8.2022.02.06.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:24 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: media: cx88: add IR remote support for NotOnlyTV LV3H
Date:   Sun, 06 Feb 2022 14:53:52 +0100
Message-ID: <3429315.iIbC2pHGDl@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PCI hybrid card NotOnlyTV LV3H has a built-in IR receiver connected
via I2C bus, currently not supported. This receiver is probably present
in more Geniatech cards. It has no capability for repeating when a key is
hold down.

Add support for this built-in IR receiver. Use the existing Total Media
In Hand_02 remote keytable (Geniatech Mygica X8507) which matches exactly
the LV3H remote.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
Signed-off-by: Marek Kidawski <mark_kiddy@wp.pl>
=2D--
 drivers/media/i2c/ir-kbd-i2c.c      | 49 +++++++++++++++++++++++++++++
 drivers/media/pci/cx88/cx88-input.c |  2 +-
 drivers/media/pci/cx88/cx88-video.c |  1 +
 include/media/i2c/ir-kbd-i2c.h      |  1 +
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 566741735..0f698d92c 100644
=2D-- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -238,6 +238,45 @@ static int get_key_knc1(struct IR_i2c *ir, enum rc_pro=
to *protocol,
 	return 1;
 }
=20
+static int get_key_geniatech(struct IR_i2c *ir, enum rc_proto *protocol,
+			     u32 *scancode, u8 *ptoggle)
+{
+	unsigned char b;
+	int code, i, rc, toggle;
+
+	/* poll IR chip */
+	for (i =3D 0; i < 4; i++) {
+		rc =3D i2c_master_recv(ir->c, &b, 1);
+		if (rc =3D=3D 1)
+			break;
+		msleep(1);
+	}
+	if (rc !=3D 1) {
+		dev_dbg(&ir->rc->dev, "read error\n");
+		if (rc < 0)
+			return rc;
+		return -EIO;
+	}
+
+	toggle =3D b >> 7;
+
+	/* don't repeat the key */
+	if (ir->old =3D=3D toggle)
+		return 0;
+	ir->old =3D toggle;
+
+	/* decode to RC5 */
+	code =3D b & 0x7f;
+	code =3D (code - 1) / 2;
+
+	dev_dbg(&ir->rc->dev, "key %02x\n", code);
+
+	*protocol =3D RC_PROTO_RC5;
+	*scancode =3D code;
+	*ptoggle =3D toggle;
+	return 1;
+}
+
 static int get_key_avermedia_cardbus(struct IR_i2c *ir, enum rc_proto *pro=
tocol,
 				     u32 *scancode, u8 *toggle)
 {
@@ -766,6 +805,13 @@ static int ir_probe(struct i2c_client *client, const s=
truct i2c_device_id *id)
 		rc_proto    =3D RC_PROTO_BIT_OTHER;
 		ir_codes    =3D RC_MAP_EMPTY;
 		break;
+	case 0x33:
+		name        =3D "Geniatech";
+		ir->get_key =3D get_key_geniatech;
+		rc_proto    =3D RC_PROTO_BIT_RC5;
+		ir_codes    =3D RC_MAP_TOTAL_MEDIA_IN_HAND_02;
+		ir->old     =3D 1;
+		break;
 	case 0x6b:
 		name        =3D "FusionHDTV";
 		ir->get_key =3D get_key_fusionhdtv;
@@ -825,6 +871,9 @@ static int ir_probe(struct i2c_client *client, const st=
ruct i2c_device_id *id)
 		case IR_KBD_GET_KEY_KNC1:
 			ir->get_key =3D get_key_knc1;
 			break;
+		case IR_KBD_GET_KEY_GENIATECH:
+			ir->get_key =3D get_key_geniatech;
+			break;
 		case IR_KBD_GET_KEY_FUSIONHDTV:
 			ir->get_key =3D get_key_fusionhdtv;
 			break;
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/c=
x88-input.c
index ce0ef0b81..a04a1d33f 100644
=2D-- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -586,7 +586,7 @@ void cx88_i2c_init_ir(struct cx88_core *core)
 {
 	struct i2c_board_info info;
 	static const unsigned short default_addr_list[] =3D {
=2D		0x18, 0x6b, 0x71,
+		0x18, 0x33, 0x6b, 0x71,
 		I2C_CLIENT_END
 	};
 	static const unsigned short pvr2000_addr_list[] =3D {
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/c=
x88-video.c
index c17ad9f7d..4d78acf66 100644
=2D-- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1388,6 +1388,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 	}
 		fallthrough;
 	case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
+	case CX88_BOARD_NOTONLYTV_LV3H:
 		request_module("ir-kbd-i2c");
 	}
=20
diff --git a/include/media/i2c/ir-kbd-i2c.h b/include/media/i2c/ir-kbd-i2c.h
index 9f47d6a48..0b58f8b9e 100644
=2D-- a/include/media/i2c/ir-kbd-i2c.h
+++ b/include/media/i2c/ir-kbd-i2c.h
@@ -35,6 +35,7 @@ enum ir_kbd_get_key_fn {
 	IR_KBD_GET_KEY_PIXELVIEW,
 	IR_KBD_GET_KEY_HAUP,
 	IR_KBD_GET_KEY_KNC1,
+	IR_KBD_GET_KEY_GENIATECH,
 	IR_KBD_GET_KEY_FUSIONHDTV,
 	IR_KBD_GET_KEY_HAUP_XVR,
 	IR_KBD_GET_KEY_AVERMEDIA_CARDBUS,
=2D-=20
2.35.1





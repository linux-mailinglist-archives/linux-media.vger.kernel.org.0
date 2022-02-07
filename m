Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31974AC247
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235998AbiBGPAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243004AbiBGOxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 09:53:05 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED47AC0401C2
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 06:53:03 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i15so2878021wrb.3
        for <linux-media@vger.kernel.org>; Mon, 07 Feb 2022 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXTwf6uG89msPdeDLZpitDJpye2izk7xRi+r1MbFFeM=;
        b=bDxx0KPdk8oFITsJ4RGUSojRHP0VSx4UqLA86o+Wu7i0r6d0m79AsW0CPf27AWZZcU
         ds51ekFkcuBr/weBxJ/ElxcLGdlv1wgHtXIJ9xFvczf2Y9W44Miw/g8ISxkokE+tWKax
         9I92WGzbsdheD46NV35DsGlQ3qtP1yfZ9IvueSinxAoAgIZNQDRjqrsjFp6qiVMiIIYm
         vEvGhsvVouN5CA3ENZfpsPsh5yzmGVyBXNB4O05KY3v+S92nGPwZhPP2r717X9o+P74u
         EcVcQf4IlL7vgTl9wbqXM9wCo/RsKbgwgJhzD95hsP2wbd/u+Li8c88wVRfrw/szo+dJ
         9X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXTwf6uG89msPdeDLZpitDJpye2izk7xRi+r1MbFFeM=;
        b=yLfDb+hT81MWjx7fivBGUKIAuPxqyQaYwsXrUOjEuR29PxLh+d49Mk2SVxxgtxGg7o
         zeIkXojXx7wYsfOT25iUkNq786vWsrDwPvbA3O0L6ftV28V59DRvgUb6VTTnqhf9T1xC
         K/CphIS73sBzvIMAewBJHJhEmnP0SqkHnAiYoJMGgZlzJcDLU0g3PZx9sNbYNftmc17R
         4ugNjhUUmt5G+kLuHxe/vW2U8izk/yNyfOLwE6VXmzyC4pKUgza32mRzP5wWbwzVBSrx
         JLmtvl7g/sIC6e6zgPyBSiuHK0Zv6RZVKZ4uSsAhvwE1KT+H5MAtWJgJpGZB/br0298G
         dUOA==
X-Gm-Message-State: AOAM533zGq6ieePZD0ZRJdYcBJ5vKNQ2e6Qje+Py5Ryw1M4SNZWG+BWZ
        grY+vS9c2unuU7heaQBkQkisTnnXBN0=
X-Google-Smtp-Source: ABdhPJxMPSWtIbF/02dqZz6Jideu/ZEAnVYNRL61Gy6tAxroP7mKtu+YrxmBKyReyHt0mAtUq4VJ+w==
X-Received: by 2002:a05:6000:1a85:: with SMTP id f5mr9748089wry.709.1644245582244;
        Mon, 07 Feb 2022 06:53:02 -0800 (PST)
Received: from tool.localnet (static-64-238-230-77.ipcom.comunitel.net. [77.230.238.64])
        by smtp.gmail.com with ESMTPSA id d4sm11303871wri.39.2022.02.07.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 06:53:01 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2] media: cx88: add IR remote support for NotOnlyTV LV3H
Date:   Mon, 07 Feb 2022 15:51:41 +0100
Message-ID: <4386345.LvFx2qVVIh@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
held down.

Add support for this built-in IR receiver. Use the existing Total Media
In Hand_02 remote keytable (Geniatech Mygica X8507) which matches exactly
the LV3H remote.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
Signed-off-by: Marek Kidawski <mark_kiddy@wp.pl>
=2D--
changes in v2:
 - Save a bitwise operation when no key is pressed
 - Simplify the code

 drivers/media/i2c/ir-kbd-i2c.c      | 47 +++++++++++++++++++++++++++++
 drivers/media/pci/cx88/cx88-input.c |  2 +-
 drivers/media/pci/cx88/cx88-video.c |  1 +
 include/media/i2c/ir-kbd-i2c.h      |  1 +
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 566741735..145abfd13 100644
=2D-- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -238,6 +238,43 @@ static int get_key_knc1(struct IR_i2c *ir, enum rc_pro=
to *protocol,
 	return 1;
 }
=20
+static int get_key_geniatech(struct IR_i2c *ir, enum rc_proto *protocol,
+			     u32 *scancode, u8 *toggle)
+{
+	int i, rc;
+	unsigned char b;
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
+	/* don't repeat the key */
+	if (ir->old =3D=3D b)
+		return 0;
+	ir->old =3D b;
+
+	/* decode to RC5 */
+	b &=3D 0x7f;
+	b =3D (b - 1) / 2;
+
+	dev_dbg(&ir->rc->dev, "key %02x\n", b);
+
+	*protocol =3D RC_PROTO_RC5;
+	*scancode =3D b;
+	*toggle =3D ir->old >> 7;
+	return 1;
+}
+
 static int get_key_avermedia_cardbus(struct IR_i2c *ir, enum rc_proto *pro=
tocol,
 				     u32 *scancode, u8 *toggle)
 {
@@ -766,6 +803,13 @@ static int ir_probe(struct i2c_client *client, const s=
truct i2c_device_id *id)
 		rc_proto    =3D RC_PROTO_BIT_OTHER;
 		ir_codes    =3D RC_MAP_EMPTY;
 		break;
+	case 0x33:
+		name        =3D "Geniatech";
+		ir->get_key =3D get_key_geniatech;
+		rc_proto    =3D RC_PROTO_BIT_RC5;
+		ir_codes    =3D RC_MAP_TOTAL_MEDIA_IN_HAND_02;
+		ir->old     =3D 0xfc;
+		break;
 	case 0x6b:
 		name        =3D "FusionHDTV";
 		ir->get_key =3D get_key_fusionhdtv;
@@ -825,6 +869,9 @@ static int ir_probe(struct i2c_client *client, const st=
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





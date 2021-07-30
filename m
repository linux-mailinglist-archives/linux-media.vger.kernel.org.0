Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642123DB421
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 08:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237598AbhG3G70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 02:59:26 -0400
Received: from ni.piap.pl ([195.187.100.5]:36172 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230040AbhG3G7Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 02:59:25 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id F18B4C369544;
        Fri, 30 Jul 2021 08:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl F18B4C369544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627628360; bh=EvNhfYWKLymJayuYfVc/qIYv9daUfJfLGMVFt9At18I=;
        h=From:To:Cc:Subject:Date:From;
        b=Lk7gigju05tzNJ4igJ/BcjTcaco8QgNnrl/4ZSJM+oA3FJtli54vGvPCuMJymbRGh
         ervdOCqnhyPCFfcDCVYocTed5s+xfIqFObrKjbjcjSznNEfyJjE0kvSQGfI9Gc50SM
         5LKiXO1whWthF0OLAhH/gRDSzEwvr4//dPFflQD4=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] TDA1997x: fix tda1997x_remove()
Sender: khalasa@piap.pl
Date:   Fri, 30 Jul 2021 08:59:19 +0200
Message-ID: <m3tukc9tiw.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165318 [Jul 30 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, piap.pl:7.1.1;127.0.0.199:7.1.2;t19.piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/30 05:50:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/30 04:15:00 #16998356
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TDA1997x driver tried to hold two values in a single variable:
device's "client data" pointer was first set to "sd" in
v4l2_i2c_subdev_init(), then it was overwritten explicitly
using dev_set_drvdata() with "state". This caused
tda1997x_remove() to fail badly.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 17be95c0dcb3..fb37918b7fb5 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2490,7 +2490,8 @@ static const struct media_entity_operations tda1997x_=
media_ops =3D {
 static int tda1997x_pcm_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct tda1997x_state *state =3D snd_soc_dai_get_drvdata(dai);
+	struct v4l2_subdev *sd =3D snd_soc_dai_get_drvdata(dai);
+	struct tda1997x_state *state =3D to_state(sd);
 	struct snd_soc_component *component =3D dai->component;
 	struct snd_pcm_runtime *rtd =3D substream->runtime;
 	int rate, err;
@@ -2799,7 +2800,6 @@ static int tda1997x_probe(struct i2c_client *client,
 			dev_err(&client->dev, "register audio codec failed\n");
 			goto err_free_media;
 		}
-		dev_set_drvdata(&state->client->dev, state);
 		v4l_info(state->client, "registered audio codec\n");
 	}
=20

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

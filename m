Return-Path: <linux-media+bounces-1904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC44809227
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 21:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7B61F21289
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 20:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353FE50267;
	Thu,  7 Dec 2023 20:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VZSPcQ9Y"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Dec 2023 12:18:33 PST
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B167170F
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 12:18:33 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id BKi4rWEPVrKXzBKi4rMu75; Thu, 07 Dec 2023 21:11:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701979861;
	bh=lrqiH8yVpgT6zM5oRkE6GFJPks/LuoT9ILt/fdADS18=;
	h=From:To:Cc:Subject:Date;
	b=VZSPcQ9YfoGsXgnmIKwNY2isHZdBmuBhN9Bl8vEIAFMUqL1O15e1YjavF1euIk1zS
	 4A0GXrQhsoupjVxjO8I3pyyGagDU4Ga03RrLDbc2N2mM2wYyqcQB60YFrzpOU8RTZS
	 s5BJ0ryxAYDsANJb0IRoZzIYFX8Forzk1vnJvyLB7GIutwow89eM0hA9sC7iHIvMB6
	 i89qbwBxrvEyL9a8k+3PtnzgKpDLf1uv1CnQM9cmnGotx3CoJTdc88CgV3L2eKAAzL
	 0yvqEprB95WoIP2q1NJTijsBhck/lq0yc7vUBAMQ9cfA4CPiUioBfdiNcvwdhORo5L
	 2fImSgAiB6nmA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 07 Dec 2023 21:11:01 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Antti Palosaari <crope@iki.fi>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Brad Love <brad@nextdimension.cc>,
	Sean Young <sean@mess.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: m88ds3103: Fix an error handling path in m88ds3103_probe()
Date: Thu,  7 Dec 2023 21:10:56 +0100
Message-Id: <32237b89eef582a89f64c4f6213e27d99245bafd.1701979842.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful i2c_mux_add_adapter(),
i2c_mux_del_adapters() should be called to avoid a some leaks, as already
done in the .remove() function.

Add the missing call.

Fixes: e6089feca460 ("media: m88ds3103: Add support for ds3103b demod")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/dvb-frontends/m88ds3103.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index 26c67ef05d13..e0272054fca5 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1894,7 +1894,7 @@ static int m88ds3103_probe(struct i2c_client *client)
 		/* get frontend address */
 		ret = regmap_read(dev->regmap, 0x29, &utmp);
 		if (ret)
-			goto err_kfree;
+			goto err_del_adapters;
 		dev->dt_addr = ((utmp & 0x80) == 0) ? 0x42 >> 1 : 0x40 >> 1;
 		dev_dbg(&client->dev, "dt addr is 0x%02x\n", dev->dt_addr);
 
@@ -1902,11 +1902,14 @@ static int m88ds3103_probe(struct i2c_client *client)
 						      dev->dt_addr);
 		if (IS_ERR(dev->dt_client)) {
 			ret = PTR_ERR(dev->dt_client);
-			goto err_kfree;
+			goto err_del_adapters;
 		}
 	}
 
 	return 0;
+
+err_del_adapters:
+	i2c_mux_del_adapters(dev->muxc);
 err_kfree:
 	kfree(dev);
 err:
-- 
2.34.1



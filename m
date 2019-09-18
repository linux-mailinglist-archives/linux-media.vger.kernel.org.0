Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F4DB6184
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 12:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfIRKhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 06:37:53 -0400
Received: from mout.web.de ([212.227.15.14]:58825 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727485AbfIRKhx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 06:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568803049;
        bh=b3O0yMTTsIZ+i4p2aAFUvGvyGvIEojHRsscDgbuJQus=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=i0ZniXnb8AYutTGYY+GnfoKhty0VBPt/uIihJKVCAZGa1oUd03x4m+bfalUd/yfMC
         P2VtzDzsytN8BeoZvHZU9OxoxeqVPP95O2OwSAzckezhHuMnTRbClrzFHabInyC6qb
         glfSxsT5laY/iQkEQ2n8W7Mxs6xBLRZjaWbuYdQ8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MGlGr-1iO3zd3Rmz-00DZ0t; Wed, 18
 Sep 2019 12:37:29 +0200
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mans Rullgard <mans@mansr.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: rc: Use devm_platform_ioremap_resource() in
 tango_ir_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Message-ID: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de>
Date:   Wed, 18 Sep 2019 12:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lYeXFCIDnIOkpaY5BhkcUA9s+DwytISpyo/Mg86UyX/WuQDRDKm
 G2Bgbkz+N2Iw4H6Yy0EYCbzw3B1zqikfr1CkMA1YMpaUZquGW3OOCxTCZ3PZuW+RgbUCnSX
 wlT3x+cTQ9hTQ7ZgkPEwwvuG800j9lwSIOhvpzk5w4CTZNFdJG5GD+IN6mu3cuERTjkldT1
 VFxKfo6mli52o7ghLYVSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1x9XVEsbl0Q=:KUl/xEwPQvHctmYCaZkSNG
 gaMPsWD9bU4x5HMK6PwEw5QOdyBTrQIopRjmarRhJgBj74KAogcWxyF3GWZFLg3+639+FFM/E
 Uv0r5w2gVg0B8xhrIIogQcnNdhWvAQ1c3xV1kBY3jy4bkzX1MBZxag3Fvfr1RVoqptjeDBv4v
 ZNwBWAqSytWcpbK5U97opdQNRyBVFA4drOkkkJmLe25x1kKTPE3+P3ZfIfxORfqAeKQEMKNfi
 c1CznMHU6g8SlkC7KLNkpAYvXce0cTW2KA+AwWccLcf04x29mPo3095g26LKKkNoz+TJM7SCW
 QqKZTu+W1oKYRnx0i52nI8edTUPg2ndD9btRQE1Q3R4nWwLEF4Q9D44jszwhi5+lqV0OMA9C2
 9gAAntW0DBG+sv612QdEPTD17JGpy8BJ1O646vRt3cJjNKaamqxBRdm+B1oR1k05xqQrYDYrB
 yz7FJeHa/APPQaHckZnUxXCbRkfzzO6LYclUleUFVcOqcrn5XhQW1o2vQDJNGMW8fLiqOCXjV
 jlWuXxoAMvPM37uZcaj8zBSBFahTOCYxMuX0W0cErRbVdoTbvNaq66prhpkHYMb8NusvqphHp
 +AVYr7g5lqZcMdYsrMDm7ZbnwBg47w4q0c3irx24v3auLg8VIsgZ5EjK95kj0VnEi14xXYEWv
 8in0HfoFRltD+mJedgk4OLgZH5wj5/JsJRajlMFU9V3NH9xDcvGOo3LOrkGhBD+fQxNGGMOwX
 rtxQO+OQFQjTfa9KN8Ob+L/9CyzMur3j5GhKFZRe2vrWPTltZ+iJMtZYBNGT6+3t2bPM4el4G
 BlRWed6nUSkdLEOCIjr1Jn5F+GXRBgpkA8QQw8bd0kCRfZLud5U9x2m6EjtVCD7lXhX+A5dTe
 V7z76hevSdlSG0cJ0jBjvWCkgGSpZXcpOZBOgEh2DPfFAQzsXE1j7V7ACG6RFRkaFiZ9fZ89t
 N/U4F4CTWVYIrjQJ4B4rEwBhuimN/zFJoCTPFx7jfq8q+RAvLB4BW44qSujxXq/yVx4SbjVqi
 MQrF+1S92LqyigubAISPK8UXX3Zs8iSdS/LEYecoTGv382lLxCkl9eytx9AMNx098iq/nvPS+
 XsVYHupBFqYjEn6gkxpVYpQCUL8Znq1ZKe8PrTi48Qr2F9Xc4EPFJtd4nadQm7DYZG5pbqSsR
 TkUpWjM0nDlscNTtRuwKfwSBCtKjR1EESl2OdWZz2d8wMKVZTEq2VrighHZwEP8VNLI7fcj4P
 g+3Z9DStAVHhAOryY1JAMZakEpe8BzjqhLXMdcm3hTaUuETsmQMRgYPY9W34=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 12:30:18 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/rc/tango-ir.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/tango-ir.c b/drivers/media/rc/tango-ir.c
index 451ec4e9dcfa..b8eb5bc4d9be 100644
=2D-- a/drivers/media/rc/tango-ir.c
+++ b/drivers/media/rc/tango-ir.c
@@ -157,20 +157,10 @@ static int tango_ir_probe(struct platform_device *pd=
ev)
 	struct device *dev =3D &pdev->dev;
 	struct rc_dev *rc;
 	struct tango_ir *ir;
-	struct resource *rc5_res;
-	struct resource *rc6_res;
 	u64 clkrate, clkdiv;
 	int irq, err;
 	u32 val;

-	rc5_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!rc5_res)
-		return -EINVAL;
-
-	rc6_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!rc6_res)
-		return -EINVAL;
-
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq <=3D 0)
 		return -EINVAL;
@@ -179,11 +169,11 @@ static int tango_ir_probe(struct platform_device *pd=
ev)
 	if (!ir)
 		return -ENOMEM;

-	ir->rc5_base =3D devm_ioremap_resource(dev, rc5_res);
+	ir->rc5_base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ir->rc5_base))
 		return PTR_ERR(ir->rc5_base);

-	ir->rc6_base =3D devm_ioremap_resource(dev, rc6_res);
+	ir->rc6_base =3D devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(ir->rc6_base))
 		return PTR_ERR(ir->rc6_base);

=2D-
2.23.0


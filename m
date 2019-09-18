Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5092B6063
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 11:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730986AbfIRJa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 05:30:59 -0400
Received: from mout.web.de ([212.227.15.3]:45143 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729307AbfIRJa5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 05:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568799034;
        bh=o++p9693E2UvDPwPrIcg8d+RdqZWpYbuZSCZtdvZT5A=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=iDw0YSXB1pmMdVnnBrlRYyPHuVVCX0msHTn+VlCc/AJ7A84YgQxUkeU/4U5Kegjl3
         KHsb6fKo0HYKabLccl4357VYGzyvTHE3cxxdHkWlkHWy9JPjyLMxEb31crnfh3POAQ
         Ct+WpoemuRkxuoXPE6SRcmQPSnQdvy8a3rYc7BlY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MS1tK-1idYgt3Kby-00TGlb; Wed, 18
 Sep 2019 11:30:33 +0200
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Tiffany Lin <tiffany.lin@mediatek.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: platform: Use devm_platform_ioremap_resource() in two
 functions
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Message-ID: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
Date:   Wed, 18 Sep 2019 11:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WWd+vOer71vAV+x2YMZX0l/l4cPFXevJQvHBjh8biXp3aZE+URz
 89oXRc95GDOBlwi24LkdiTxMGtO73uYzJDbry9HLygvcdSA7XLaAELfKbaj9e9Xs0EcuVUQ
 A8+CQ5EN20icOGdKf2azkRVVd7IH4ykVEjH+D+NfTnHqtUW2R5u65eI7ml66UlCGS4pPp4r
 w7M+1UjKZiV0ILC6UIPcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qnbIG1ZWk68=:Nlg56Kn/36Lq3zdU29JAcd
 F6oeMg4CRTGKtZZlrSTdtlq5dP/wrOEi1jPscJPUM5dZ8QIESnKllvonqhBZfCYFhrTHLMdXl
 b8K4dipvY26ZqPEg/ZMAu4eX+OOXoIukJETrrP8yt3FOSzsBtcLmmeIXkTYray70Lf0T2ScpB
 KDDuoLgZLtBTDYA1hlUySyoYxHFqF4o9l1hkhuyQi0RR6+JFfhjBR22roRGMtV3SgqPBYGATj
 rjF7X2yf7Rw8NsDVk2ixKIS6BemBTVcJrvO5jUvdvdV7tq6bsJPEChK/kPgo+LFdHsBbPIIQw
 U8WxIOFcGk3M45N95LAakC9Bfg+/DubWP2xT7PTWGPrsw9b7dl+Mi2ftxVfAe+gJXAywQUch5
 SPSzwaQuZfkHeImJmmHEwvX0MrXJeXzzZ/RywPRDLsDCldlxN0sqjn/z63t0eugvwHeWufygr
 Wktb7nPCdFuWCZka8kp+RZYpgiSrfZRUmaBoG+Mxg06GD6/ef/PaLc/E9skJ0LU5H1/WRyHgv
 msEMBNI0hFPw865tWeqpGdaa2ry+8wI/yhKZJ6l+JPel2WodXfL+jiBHrAVLPQkVM8IqoBnPC
 4poqvQJDPTBitTJilXG8gfg3/kpzSHAr750wpQ7GgP6Q4NyznnCpr7HM9OnY54muLQYi9Zika
 rB2heB2b1fDItcjnBWtj+pzgo10qd+tyRJJ6ykLNtWfRh9vgqd75nsjHazAK/IoLyaySVITSg
 wZNVa8h0jXPOeLW6OXhKAgaDqDzTxIylh8vFCdEJM7M/i8IzubRIe/oS3+wy57ncbwC1vd4ul
 SWH4XS5vEDellmKkdmkwevVzei4eWA8n8DnYw+mkvyzB75/VAhX6TCWvrL7x3GsMCuHJN/zzj
 5tGAFq+pJ/mDA00wUYQgle4JFRLNvTcW1iFJTXRDb9LvNANGdJnEXLgsIlUL48jqYoP5r4Y89
 sXSKDYQqVPuAN2rwbjTCbjgSLuW0Md62guUpNPtsfwuXc1BNAkM9M67PxW4jbR0Lct2nnMv+1
 iIkH+u7F8iPGmKUBHCojHruyI+Q1ur0J1EOPx22KMXW00ifmlmh9uSsAbvcEziyLtdPRr/ax3
 i6zUr7E0hktjPOUZb2T9pd7VeL6JZtgW5Y2CDQyhvy9FG/UTzzCMV8iYowoIbK/rjYjFpWiKb
 aOa30QniK2jdFXb6WVuWWhNI5MQeTW4FIBDTIscFE2/YRRZtvi0zCRuHrofWASO9zmk+tACXy
 LCXFqkkIHkZUKN6ecksIw8N+Lsu9rgjfR+wAcOvNd2zSre7k2xgmrqdMHAd0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 11:20:48 +0200

Simplify these function implementations by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 +-------
 drivers/media/platform/rcar-vin/rcar-core.c            | 7 +------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/driv=
ers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 00d090df11bb..944771ee5f5c 100644
=2D-- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -253,13 +253,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
 	}

 	for (i =3D 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
-		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (res =3D=3D NULL) {
-			dev_err(&pdev->dev, "get memory resource failed.");
-			ret =3D -ENXIO;
-			goto err_res;
-		}
-		dev->reg_base[i] =3D devm_ioremap_resource(&pdev->dev, res);
+		dev->reg_base[i] =3D devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR((__force void *)dev->reg_base[i])) {
 			ret =3D PTR_ERR((__force void *)dev->reg_base[i]);
 			goto err_res;
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/p=
latform/rcar-vin/rcar-core.c
index 6993484ff0f3..334c62805959 100644
=2D-- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1282,7 +1282,6 @@ static int rcar_vin_probe(struct platform_device *pd=
ev)
 {
 	const struct soc_device_attribute *attr;
 	struct rvin_dev *vin;
-	struct resource *mem;
 	int irq, ret;

 	vin =3D devm_kzalloc(&pdev->dev, sizeof(*vin), GFP_KERNEL);
@@ -1301,11 +1300,7 @@ static int rcar_vin_probe(struct platform_device *p=
dev)
 	if (attr)
 		vin->info =3D attr->data;

-	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mem =3D=3D NULL)
-		return -EINVAL;
-
-	vin->base =3D devm_ioremap_resource(vin->dev, mem);
+	vin->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vin->base))
 		return PTR_ERR(vin->base);

=2D-
2.23.0


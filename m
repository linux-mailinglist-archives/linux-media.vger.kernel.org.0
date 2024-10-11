Return-Path: <linux-media+bounces-19391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FC999C55
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238EC1F24805
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1091F942E;
	Fri, 11 Oct 2024 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MhbaWpfV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB01F4705
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728626161; cv=none; b=YUEXWsBSxCcBOPOICOdYbH3+POe6zIWOPNDdjl1ehPHtCtF0VkZVJapOZ1eLRfwB9bto1l12qGf6MjD58a5DGP1gfB6FoQ5sB6LllwI9lQw5J4vba2xdzBijaE6gBE3XP/soUQF4fh6cWT/ZDEt9O2g17gBc2OOddNleCqCtdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728626161; c=relaxed/simple;
	bh=LeWzSZEeZjlm/S6LcUfN9/Bv1NriOHcYq2cOKsOY8vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oojaj1J0BLJn7PnUDJN2Qp4WPBShplVIpv5r2grDEoF8Yv6ISYmYdjJOyULqGdvUXMPKJVm+nCfkbCqgYXgarCYBh6cdDUuuRKvnbKqJKMFDwl+a6C4m3qh/D5dpXQSD5BDgyUUBm58Q0V/D5eXPeDLjQLUfRSqHV6DL34DYncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MhbaWpfV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9944c4d5d4so234655866b.0
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728626156; x=1729230956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcbXWctLpVp7P2qmHeK8dg5RdflNt+vzsJAGCrHjVZw=;
        b=MhbaWpfVw9Bi/QBWAAZmRIMtG1ovQ6+JjTbKWRN6yQ/EMifc/RpxKb53NEelJ+hcCD
         k3kfSztZaLio7gIlIx1ejNGY4J/N1pj+35xwynQqgTYeZRXRh4dl+B8ISdPSJvLEJ3+4
         LqkV7sp7HNa+rZT/dDTbJX2AF/SarslB3X1g8ROErgGySpehuGKM5EsWkRXny3a3tltE
         Nzws5kB3E3+59JC3eBMrKsDRdmE7Y2pe8R8uvki79F/tDd9E8HwUmDkYvl3Gb6sDvZGF
         BhacPh/u7IYK30qzCgL7YQSX9pQNKQPGCCZBqqRkTP8d39i7W7a4tEmOWUbqJS7dmRlR
         q8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728626156; x=1729230956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcbXWctLpVp7P2qmHeK8dg5RdflNt+vzsJAGCrHjVZw=;
        b=ShUP7U3o++jHHvwmR1Es/t9ujNwS/YMVGy538upYoK0bvtUhCxKWH+7NspRGOOqNT8
         AHrG5APmHyh2/GDucAfs2rQLWdDVnQyzfWucDSEAibfmKeEMvOrnMhHs4CPjh+XjPRJq
         QI4ulOCxhPwOERfkd2N7ItLFPmvE3bSJ8z9Lp91yAemvUsrbYz8Ksr2bpWDD7ZnECWTY
         Og7ZjP3ys6NDdKMq6a+4X5N+Nsr51qgJ9qgHf5Qeq1FUvrE70XWEnS2yd52f1tN2fTMb
         NDZoxLunKAz4rIQib2AG8X5eJX7qlq8ZonOsN5A9u6Bsjwj+0OSq2a1kI2R+nyBiTuGY
         tIEg==
X-Forwarded-Encrypted: i=1; AJvYcCUTmWsy1mYGdp7LVUlFedpRifSO93OikhfD9IXJps7LNIc8JVPCAfgk+yfuMuK7tO3DGBbp9q2R3xXesw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgkmMGXQgqY1+zby8yrr8Dv5EKIM99CTO3yTnCdQLMtbfTkBl
	c3TvUJUy8OaWViHb3JS0icpABiUrgYoIW2PLsWXGEKWXEdwvKYhmTQHP6OZIoWdNfy036Cb1lF5
	B
X-Google-Smtp-Source: AGHT+IGrPFWRL3tN9YvrGFAVq+cmFKNBfuT1nuPH/ScAc+J+3wG1/9R1MW09wB1vmQ6XZelh2lxoug==
X-Received: by 2002:a17:907:948b:b0:a99:8378:b939 with SMTP id a640c23a62f3a-a99b931457amr121623466b.2.1728626155914;
        Thu, 10 Oct 2024 22:55:55 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:fe55:1e35:8b9:5043])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec54c1sm175208566b.10.2024.10.10.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:55:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: Switch back to struct platform_driver::remove()
Date: Fri, 11 Oct 2024 07:55:39 +0200
Message-ID: <20241011055540.844629-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9475; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=LeWzSZEeZjlm/S6LcUfN9/Bv1NriOHcYq2cOKsOY8vE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnCL3dbiP3vm/112Se/kMZPmr/iMAQZfI+jfaZl A2KXnhdipyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwi93QAKCRCPgPtYfRL+ TiPbB/9SWwMMg8rdaNO8yMi6/vyQuxU1GQP24e/Tz92Gi479gzO3dbMhSPVrNeqgCKBvb2E+jba PwPB37AhIQTZukGfdluxJWXrZhRp9SQfFSs4DjDriuQrEKmgn4yoy6alWQfZCtjAjAY/R8G25M8 4gJXeyqU/smt97DGmROPIM1XfOKsIdwi4HxA53mJbht8w1dUMRlYdVCo9uVRlsBh+bcYBcwdSfL hID24NiG5/AXJ93+ok2UuUUEq28+Y7dobYYgKaLQ9Db3ptc04c5plRM47Pry0wQ37Jy0CWXf4V3 uRI2ooWU6C+nCI0BODqOdgVLsvu35PEhy7xgIRJiPS5fUSE6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/staging/media/ to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on yesterdays's next, feel free to drop changes that result
in a conflict when you come around to apply this. I'll care for the
fallout at a later time then. (Having said that, if you use b4 am -3 and
git am -3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe


 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 2 +-
 drivers/staging/media/imx/imx-media-csi.c                  | 2 +-
 drivers/staging/media/imx/imx-media-dev.c                  | 2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c                 | 2 +-
 drivers/staging/media/meson/vdec/vdec.c                    | 2 +-
 drivers/staging/media/omap4iss/iss.c                       | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c                      | 2 +-
 drivers/staging/media/starfive/camss/stf-camss.c           | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c          | 2 +-
 drivers/staging/media/tegra-video/csi.c                    | 2 +-
 drivers/staging/media/tegra-video/vi.c                     | 2 +-
 drivers/staging/media/tegra-video/vip.c                    | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 712f916f0935..bc360875516c 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -629,7 +629,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
 
 static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
-	.remove_new = atmel_isc_remove,
+	.remove	= atmel_isc_remove,
 	.driver	= {
 		.name		= "atmel-sama5d2-isc",
 		.pm		= &atmel_isc_dev_pm_ops,
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 9485167d5b7d..c62985e502e4 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -592,7 +592,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove_new = microchip_xisc_remove,
+	.remove	= microchip_xisc_remove,
 	.driver	= {
 		.name		= "microchip-sama7g5-xisc",
 		.pm		= &microchip_xisc_dev_pm_ops,
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 785aac881922..3edbc57be2ca 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2076,7 +2076,7 @@ MODULE_DEVICE_TABLE(platform, imx_csi_ids);
 
 static struct platform_driver imx_csi_driver = {
 	.probe = imx_csi_probe,
-	.remove_new = imx_csi_remove,
+	.remove = imx_csi_remove,
 	.id_table = imx_csi_ids,
 	.driver = {
 		.name = "imx-ipuv3-csi",
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index be54dca11465..a08389b99d14 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -129,7 +129,7 @@ MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
 
 static struct platform_driver imx_media_pdrv = {
 	.probe		= imx_media_probe,
-	.remove_new	= imx_media_remove,
+	.remove		= imx_media_remove,
 	.driver		= {
 		.name	= "imx-media",
 		.of_match_table	= imx_media_dt_ids,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 0d8b42061623..dd8c7b3233bc 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -836,7 +836,7 @@ static struct platform_driver csi2_driver = {
 		.of_match_table = csi2_dt_ids,
 	},
 	.probe = csi2_probe,
-	.remove_new = csi2_remove,
+	.remove = csi2_remove,
 };
 
 module_platform_driver(csi2_driver);
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5e5b296f93ba..6bf7ade0c6a1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1119,7 +1119,7 @@ static void vdec_remove(struct platform_device *pdev)
 
 static struct platform_driver meson_vdec_driver = {
 	.probe = vdec_probe,
-	.remove_new = vdec_remove,
+	.remove = vdec_remove,
 	.driver = {
 		.name = "meson-vdec",
 		.of_match_table = vdec_dt_match,
diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index 0c4283bb48ad..61cea89c042b 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -1340,7 +1340,7 @@ MODULE_DEVICE_TABLE(platform, omap4iss_id_table);
 
 static struct platform_driver iss_driver = {
 	.probe		= iss_probe,
-	.remove_new	= iss_remove,
+	.remove		= iss_remove,
 	.id_table	= omap4iss_id_table,
 	.driver = {
 		.name	= "omap4iss",
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index ac398b5a9736..433df4778c95 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1103,7 +1103,7 @@ static const struct dev_pm_ops rkvdec_pm_ops = {
 
 static struct platform_driver rkvdec_driver = {
 	.probe = rkvdec_probe,
-	.remove_new = rkvdec_remove,
+	.remove = rkvdec_remove,
 	.driver = {
 		   .name = "rkvdec",
 		   .of_match_table = of_rkvdec_match,
diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index b6d34145bc19..259aaad010d2 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -422,7 +422,7 @@ static const struct dev_pm_ops stfcamss_pm_ops = {
 
 static struct platform_driver stfcamss_driver = {
 	.probe = stfcamss_probe,
-	.remove_new = stfcamss_remove,
+	.remove = stfcamss_remove,
 	.driver = {
 		.name = "starfive-camss",
 		.pm = &stfcamss_pm_ops,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index f52df6836045..52a9588462ce 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -705,7 +705,7 @@ static const struct dev_pm_ops cedrus_dev_pm_ops = {
 
 static struct platform_driver cedrus_driver = {
 	.probe		= cedrus_probe,
-	.remove_new	= cedrus_remove,
+	.remove		= cedrus_remove,
 	.driver		= {
 		.name		= CEDRUS_NAME,
 		.of_match_table	= cedrus_dt_match,
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 58f8ae92320d..f087643ea2cb 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
 
 static struct platform_driver sun6i_isp_platform_driver = {
 	.probe	= sun6i_isp_probe,
-	.remove_new = sun6i_isp_remove,
+	.remove	= sun6i_isp_remove,
 	.driver	= {
 		.name		= SUN6I_ISP_NAME,
 		.of_match_table	= sun6i_isp_of_match,
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 255cccd0c5fd..604185c00a1a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -858,5 +858,5 @@ struct platform_driver tegra_csi_driver = {
 		.pm		= &tegra_csi_pm_ops,
 	},
 	.probe			= tegra_csi_probe,
-	.remove_new		= tegra_csi_remove,
+	.remove			= tegra_csi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 57a856a21e90..c068dfedd97a 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1979,5 +1979,5 @@ struct platform_driver tegra_vi_driver = {
 		.pm = &tegra_vi_pm_ops,
 	},
 	.probe = tegra_vi_probe,
-	.remove_new = tegra_vi_remove,
+	.remove = tegra_vi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 8504b9ea9cea..5ec717f3afd5 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -281,5 +281,5 @@ struct platform_driver tegra_vip_driver = {
 		.of_match_table	= tegra_vip_of_id_table,
 	},
 	.probe			= tegra_vip_probe,
-	.remove_new		= tegra_vip_remove,
+	.remove			= tegra_vip_remove,
 };

base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
-- 
2.45.2



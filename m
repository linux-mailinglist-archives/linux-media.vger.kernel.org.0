Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AA9105029
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 11:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfKUKOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 05:14:37 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36216 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUKOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 05:14:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so3655445wru.3
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Uj/OJizfCMV+pm8Bm80+o6nYf9xOidEjQZOmhbw7Tk=;
        b=sgQbSuyRaTjHtb50b5Ns8I+KWD74RpH72vWeYkSEw5qOkc4dTlhWmfpSKp2d9KBo1R
         5lIpurfOlRUpmLLsGEbbwEH1Mklf7Attq2+b3KkSJqZvwIqOlmMMLkYyjIEDmZuvb5a5
         c3N2ZchOyTXhU0rCSD39k31tKb46cpMWRTA8jLS57lpw0qa8LfujBe6PdpfodQxamnrQ
         6AnHGvfUWPCcAmK3kW/k+9GMZnS9UB/l0sUWlAfICUGyq33D5M2xt2DenAamLzr7FEt1
         qPEt1mN5TLHesyMZQMrVEWsR5UqUt0efpdBbkyH9i/awhCWFxMaAlnIQWbF5r+iFPauy
         zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Uj/OJizfCMV+pm8Bm80+o6nYf9xOidEjQZOmhbw7Tk=;
        b=PlK/7W0sX2scKmg1DnhwCRG73ZyE3tZCjR0R2tmmIr3ZwZrZUUsntItstJElab/ZI6
         GrMzAX8IHHKTWsc6GvG8hIzFO7+/v0phDcVRC4Bf8cBtjJjDW49A8A8ZTq4y+nfJ5ox9
         vLSoIMET6q71dtagaHTX8h+LrLegFMheSrOXxIcDEoudenGkHRmQPUS4uT1N2uxbVCgG
         av6ze7elQGIOtVti5KMgjrX2nHMc746Luoi3QUynlTdgNT27m5r7mAPlkW9yVx5bTJJp
         tNDwE+4LbYNfUmvhuU6TAtbcXK2YOW5RcNNeW6Tqv4jE58wYcDSM9eBdX0oaWtXO8At3
         SUig==
X-Gm-Message-State: APjAAAULADHwfe8N57913pZohQYHK3vIbGG3z9SjD8aO5KeA7nivQGxT
        XtF/gdBbM1Jtm0Xwt11qHEEF7w==
X-Google-Smtp-Source: APXvYqyH/ovyemEL/zz1cttC+sZ2PiFUJwPCumuv2fNDV5bChB+c10N4Ys6A9Lzh7HcYx+2s+N1h5g==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr9942497wrr.105.1574331272916;
        Thu, 21 Nov 2019 02:14:32 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:14:32 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: meson: vdec: add sm1 platform
Date:   Thu, 21 Nov 2019 11:14:28 +0100
Message-Id: <20191121101429.23831-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191121101429.23831-1-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the Amlogic SM1 platform for the current MPEG1 & MPEG2
support.

The SM1 family, very close to the G12A SoCs, has a slighly different power
management control, thus needing a separate compatible and family id.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c       |  5 +++-
 drivers/staging/media/meson/vdec/vdec_1.c     | 29 ++++++++++++++----
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 4 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 875a12be9c9e..a8a4c380ccc9 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -958,6 +958,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxl },
 	{ .compatible = "amlogic,g12a-vdec",
 	  .data = &vdec_platform_g12a },
+	{ .compatible = "amlogic,sm1-vdec",
+	  .data = &vdec_platform_sm1 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, vdec_dt_match);
@@ -1008,7 +1010,8 @@ static int vdec_probe(struct platform_device *pdev)
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-	if (core->platform->revision == VDEC_REVISION_G12A) {
+	if (core->platform->revision == VDEC_REVISION_G12A ||
+	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
 			return -EPROBE_DEFER;
diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3a15c6fc0567..3fe2de0c9331 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -18,6 +18,7 @@
 #define AO_RTI_GEN_PWR_SLEEP0	0xe8
 #define AO_RTI_GEN_PWR_ISO0	0xec
 	#define GEN_PWR_VDEC_1 (BIT(3) | BIT(2))
+	#define GEN_PWR_VDEC_1_SM1 (BIT(1))
 
 #define MC_SIZE			(4096 * 4)
 
@@ -142,12 +143,20 @@ static int vdec_1_stop(struct amvdec_session *sess)
 	amvdec_read_dos(core, DOS_SW_RESET0);
 
 	/* enable vdec1 isolation */
-	regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0xc0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+				   GEN_PWR_VDEC_1_SM1, GEN_PWR_VDEC_1_SM1);
+	else
+		regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0xc0);
 	/* power off vdec1 memories */
 	amvdec_write_dos(core, DOS_MEM_PD_VDEC, 0xffffffff);
 	/* power off vdec1 */
-	regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
-			   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1_SM1, GEN_PWR_VDEC_1_SM1);
+	else
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
 
 	clk_disable_unprepare(core->vdec_1_clk);
 
@@ -170,8 +179,12 @@ static int vdec_1_start(struct amvdec_session *sess)
 		return ret;
 
 	/* Enable power for VDEC_1 */
-	regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
-			   GEN_PWR_VDEC_1, 0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1_SM1, 0);
+	else
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+				   GEN_PWR_VDEC_1, 0);
 	usleep_range(10, 20);
 
 	/* Reset VDEC1 */
@@ -183,7 +196,11 @@ static int vdec_1_start(struct amvdec_session *sess)
 	/* enable VDEC Memories */
 	amvdec_write_dos(core, DOS_MEM_PD_VDEC, 0);
 	/* Remove VDEC1 Isolation */
-	regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0);
+	if (core->platform->revision == VDEC_REVISION_SM1)
+		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+				   GEN_PWR_VDEC_1_SM1, 0);
+	else
+		regmap_write(core->regmap_ao, AO_RTI_GEN_PWR_ISO0, 0);
 	/* Reset DOS top registers */
 	amvdec_write_dos(core, DOS_VDEC_MCRCC_STALL_CTRL, 0);
 
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 7845a889ce24..ea39f8209ec7 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -106,6 +106,30 @@ static const struct amvdec_format vdec_formats_g12a[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_sm1[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_MPEG1,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+	},
+};
+
 const struct vdec_platform vdec_platform_gxbb = {
 	.formats = vdec_formats_gxbb,
 	.num_formats = ARRAY_SIZE(vdec_formats_gxbb),
@@ -129,3 +153,9 @@ const struct vdec_platform vdec_platform_g12a = {
 	.num_formats = ARRAY_SIZE(vdec_formats_g12a),
 	.revision = VDEC_REVISION_G12A,
 };
+
+const struct vdec_platform vdec_platform_sm1 = {
+	.formats = vdec_formats_sm1,
+	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
+	.revision = VDEC_REVISION_SM1,
+};
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index 7c61b941b39f..731877a771f4 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -16,6 +16,7 @@ enum vdec_revision {
 	VDEC_REVISION_GXL,
 	VDEC_REVISION_GXM,
 	VDEC_REVISION_G12A,
+	VDEC_REVISION_SM1,
 };
 
 struct vdec_platform {
@@ -28,5 +29,6 @@ extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
 extern const struct vdec_platform vdec_platform_g12a;
+extern const struct vdec_platform vdec_platform_sm1;
 
 #endif
-- 
2.22.0


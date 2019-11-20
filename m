Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F0710385F
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfKTLOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:14:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35194 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbfKTLOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:14:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id s5so27677622wrw.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
        b=TiQtiHkg0RMZ4S1Hs+toam+n7rYmoAgGqr2fC0USfYF5jbHTN26ImCnqI+q6vBmfWC
         DPjb+lCTY9oewXNbiW/iLqfrdOhTSyLYUfZFtalDNjXTBp7qe544NZwVvg3nUPeVP36Y
         Zb6xGy99sZg42k9nanEDwH0/H43gZBKK1FekzfDRXJpGAPGWUVbdSx+AK/IhzMZXDCbn
         vlO+4HhsJgJLHcdWQVLJPXN3SLHR6K1YQQxyqQEiKc6A7VXWuXV5STmD1U0BhbFtO350
         9lOT0q2m+fPKelLaCjuzXVltIzPrdVOa2Ep1VUqmtYSyn4Zbah6jGKlEwzh75/ePaHuO
         21iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UaaaJx+p0JcZMcJnhGqWQZjIziF6Ba/MI0EsQk5V9qA=;
        b=QFsmRwWmY7q6SBcjUuJSIRo5cNcWbniXzbLXD1oGCqIN/u0E3Mqx8NXwIkLGJPTo/T
         ptwOBgALBKoijRYbTUaIYdea8ZXpoWCNqYvJ8caZG0/TQ1XktrUbVxOa4OIaWlKLkPg8
         s7nFhQPHy5QA7u1fesXRot8FGrGa1fBKy/JSOm9gT6xeeeS/0GU0M30EMQqu6h+LuUkA
         EO2m2KM76fy178Mfl0Ob4n8iLe3yhfvf8dpRPN8c3XsbDw/EVloTSZpQn+ALE9c5K2Qr
         E68Re7+3M4g0+k9NuxLExoXpvsBwk9WBP6vdMRHzowp+RFpYJpXrAW6oujW5tCQX5ONP
         7BNw==
X-Gm-Message-State: APjAAAUxh5J5N1+7tS+WX3+S1zH7s6uuNGjw1PukWXetNKxUCGfpgLQk
        TjYHK5EVnjEiyB2uUrIDaaC6zA==
X-Google-Smtp-Source: APXvYqwLPjL06Kr41Bjy6DnwXl4SgLoNVUW1i3UYwiHotB5RWxvZ4emQVFEOMzeVHlniyLpXWeeRww==
X-Received: by 2002:adf:e312:: with SMTP id b18mr2650458wrj.203.1574248476778;
        Wed, 20 Nov 2019 03:14:36 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:14:36 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/4] media: meson: vdec: add g12a platform
Date:   Wed, 20 Nov 2019 12:14:29 +0100
Message-Id: <20191120111430.29552-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add support for the G12A platform by:
- adding the G12A codec support, here MPEG1 & MPEG2
- getting the new hevcf clock for the upcoming HEVC/VP9 decoding support

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c       | 13 ++++++--
 drivers/staging/media/meson/vdec/vdec.h       |  1 +
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13..875a12be9c9e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -956,6 +956,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxm },
 	{ .compatible = "amlogic,gxl-vdec",
 	  .data = &vdec_platform_gxl },
+	{ .compatible = "amlogic,g12a-vdec",
+	  .data = &vdec_platform_g12a },
 	{}
 };
 MODULE_DEVICE_TABLE(of, vdec_dt_match);
@@ -1003,6 +1005,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	of_id = of_match_node(vdec_dt_match, dev->of_node);
+	core->platform = of_id->data;
+
+	if (core->platform->revision == VDEC_REVISION_G12A) {
+		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
+		if (IS_ERR(core->vdec_hevcf_clk))
+			return -EPROBE_DEFER;
+	}
+
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
 		return -EPROBE_DEFER;
@@ -1045,8 +1056,6 @@ static int vdec_probe(struct platform_device *pdev)
 		goto err_vdev_release;
 	}
 
-	of_id = of_match_node(vdec_dt_match, dev->of_node);
-	core->platform = of_id->data;
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 	mutex_init(&core->lock);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index d811e7976519..0faa1ec4858e 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -74,6 +74,7 @@ struct amvdec_core {
 	struct clk *dos_clk;
 	struct clk *vdec_1_clk;
 	struct clk *vdec_hevc_clk;
+	struct clk *vdec_hevcf_clk;
 
 	struct reset_control *esparser_reset;
 
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 824dbc7f46f5..7845a889ce24 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -82,6 +82,30 @@ static const struct amvdec_format vdec_formats_gxm[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_g12a[] = {
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
@@ -99,3 +123,9 @@ const struct vdec_platform vdec_platform_gxm = {
 	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
 	.revision = VDEC_REVISION_GXM,
 };
+
+const struct vdec_platform vdec_platform_g12a = {
+	.formats = vdec_formats_g12a,
+	.num_formats = ARRAY_SIZE(vdec_formats_g12a),
+	.revision = VDEC_REVISION_G12A,
+};
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index f6025326db1d..7c61b941b39f 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -15,6 +15,7 @@ enum vdec_revision {
 	VDEC_REVISION_GXBB,
 	VDEC_REVISION_GXL,
 	VDEC_REVISION_GXM,
+	VDEC_REVISION_G12A,
 };
 
 struct vdec_platform {
@@ -26,5 +27,6 @@ struct vdec_platform {
 extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
+extern const struct vdec_platform vdec_platform_g12a;
 
 #endif
-- 
2.22.0


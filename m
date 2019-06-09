Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB8A3A66C
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfFIOi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44709 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728628AbfFIOi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so6582686wrq.11
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMRVP7C/IdJ8PZCV/MlCO/BDw6sh0m9vXzahS116MSs=;
        b=atWxPP4kELwL4yZgzLbyJLp3x659utUHJmna+2V4oZY1n0Nm++gR+oRFWlEP6QnEux
         Ix2MmAhUN3dKzIx9aFXnJ7AoUGbXXFmJAJuHz1OlsJfAyXR+SLfH8BW5ZznAs6Q63df7
         1g55Nb85VeVs7jQsUEsPwSlS55mtU3WGCp1PtwdnhANFK66R1V8z2sOoQfQFuTre6j5s
         P+riUZGmTRkq9tRMSNpLoRcU4nmzMiTzs/nq8Q7wLMtRGINg14PeU1POT1Al+00mNqrm
         V+ahAIL5b4lHnImrZoaBA9EPXS01sytbiCzeuPBb3yLGS9HK7DUlaLLsxmf7mz2Z33Dn
         4CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMRVP7C/IdJ8PZCV/MlCO/BDw6sh0m9vXzahS116MSs=;
        b=n+9M7MBx31FamUJqoBqT1QmlFNscpL5YS0H+E3OjZN1vPr1Hmlw9yVjngEuWrjYo7r
         TMzNPK9XmtuXheyORMQrnvOawCGwKgbXlBKMTwfeM0SCNIc02Z6kq7fdOrp0MjjFgqho
         7kNrhR56nJyfnDKdGTgsxzVR9KcPxC+OaPUsgYIpAa9AXP2p1aT6kx1+3wWlw2rEIZFS
         B8bYkF+YKiQqrNiqI1sCpHL7AL6Z6juOEjBdzkEAdzUOLeufBQ+qvJ93RI2Utb9vUQDc
         WJ86TYmGeXXzB2hZO3HGpU0Xga9N7qkUaUZQ/03tlukWNur6xNfAao/sp+WnIjkGpzv4
         moPQ==
X-Gm-Message-State: APjAAAXJAO4DW6WnbflwSLomBdg5GgTVe08U0XgzeiyT9rCjKI4O810F
        iWM6rpAfJILp7ypt3KmP3ZzSVw==
X-Google-Smtp-Source: APXvYqxQHwKbI9iBfoXhJCIlVBx0GsDju4gY8jXwjkQ+Ec2HwAZ4L/Gx58bk55XaOY+hRS74pE2kqQ==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr39530296wrr.252.1560091107003;
        Sun, 09 Jun 2019 07:38:27 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:26 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 4/5] media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Sun,  9 Jun 2019 16:38:19 +0200
Message-Id: <20190609143820.4662-5-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tag all the coded formats where the mtk-vcodec decoder supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index aee1ddc35de4..0a7e75de56cd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -24,16 +24,19 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP8,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_MT21C,
@@ -943,6 +946,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
 
 	fmt = &mtk_video_formats[i];
 	f->pixelformat = fmt->fourcc;
+	f->flags = fmt->flags;
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 7306aeabe229..e9b5322973e1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -94,6 +94,7 @@ struct mtk_video_fmt {
 	u32	fourcc;
 	enum mtk_fmt_type	type;
 	u32	num_planes;
+	u32	flags;
 };
 
 /**
-- 
2.21.0


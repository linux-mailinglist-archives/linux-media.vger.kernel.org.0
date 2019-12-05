Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DA4113DCD
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbfLEJZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:25:01 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36716 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbfLEJZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 04:25:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2811941wma.1
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=tP66xRoBmBGI/tMKDtGfs0UrFlQXywBHuH8Gm6UbBRUGdWZHbAepRHCsCIUWUbf61t
         PeAKi5xnpO20UTAZNoW985568KpI0/H9vnpy9txrTpa4yD+WA2523ZhlFwhxrJ6GIi78
         TE1jSfYZX7p/Vd1idYyt5Xr3ylxedwKcX4iBVqRJ54vr7T+V/ObdMli0rpTZdyzCFIWP
         AxzUbnpSVIDxRjpO25I5UrjegOFTXC416HJb/9B0BuVl03vqgYMV4nJQ1Xq89hXJ2/yg
         JDdZZHauMJY/iEPM3Wgcla+xFymbyHoq2hzd5edjCp/f+qE1C6YSODgeJ1x/zfV51nsQ
         GlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=tKIwdebwf1A3T88Nrn352UJ+EqbwTvDblWyTd2dYWSBTMpYU3ORT2doJx92+2KE4xZ
         SNPuuRJKz2sargsX5icfU7ekITcMLAtZFxRnGDr8XBctQ6IDWCM9AQc44nxXqMOsXPZp
         GaGh4zpfVLjAXlQWC/d2+iCFeTTqZUKJbBct3SrSm0FdxEC2brFr7FNDbi3eV6hwm3OA
         jWLm9RIvLPSJZqgMiW4u1A1w9M5oDY0JN4svYUGlb5L7weKepAcUhEDe07H4bXsr7+bu
         ml9Y2CIJDg3tDGVKymgdONIdhIvdTDYMe9LPdOzOefkgLJrGCHiI8PjYgzLvxbwADru0
         1KGQ==
X-Gm-Message-State: APjAAAV7b2Yz3r1RvzXiWKppUjxw3WxlqTOEl9oZrGf/iWQDc/JedxSi
        L67vrMfU8g5ZG6hCXElMcu7ikg==
X-Google-Smtp-Source: APXvYqwulhvDDmJy/RLd4opW6/BtxntvVuxWuvAOUb7r2tGTe46LVWtACGWsXPDDBsbvTQipeo6wow==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr4234912wme.50.1575537899000;
        Thu, 05 Dec 2019 01:24:59 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id t5sm11642620wrr.35.2019.12.05.01.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 01:24:58 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Thu,  5 Dec 2019 10:24:51 +0100
Message-Id: <20191205092454.26075-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205092454.26075-1-narmstrong@baylibre.com>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add helpers to support the lossless framebuffer compression format that
will be used in HEVC & VP9 decoders when decoding 10bit content for
downsampling to 8bit NV12 and later proper compressed buffer support.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../staging/media/meson/vdec/vdec_helpers.c   | 27 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_helpers.h   |  4 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index fc59d8801643..818064b6b4d0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -50,6 +50,33 @@ void amvdec_write_parser(struct amvdec_core *core, u32 reg, u32 val)
 }
 EXPORT_SYMBOL_GPL(amvdec_write_parser);
 
+/* 4 KiB per 64x32 block */
+u32 amvdec_am21c_body_size(u32 width, u32 height)
+{
+	u32 width_64 = ALIGN(width, 64) / 64;
+	u32 height_32 = ALIGN(height, 32) / 32;
+
+	return SZ_4K * width_64 * height_32;
+}
+EXPORT_SYMBOL_GPL(amvdec_am21c_body_size);
+
+/* 32 bytes per 128x64 block */
+u32 amvdec_am21c_head_size(u32 width, u32 height)
+{
+	u32 width_128 = ALIGN(width, 128) / 128;
+	u32 height_64 = ALIGN(height, 64) / 64;
+
+	return 32 * width_128 * height_64;
+}
+EXPORT_SYMBOL_GPL(amvdec_am21c_head_size);
+
+u32 amvdec_am21c_size(u32 width, u32 height)
+{
+	return ALIGN(amvdec_am21c_body_size(width, height) +
+		     amvdec_am21c_head_size(width, height), SZ_64K);
+}
+EXPORT_SYMBOL_GPL(amvdec_am21c_size);
+
 static int canvas_alloc(struct amvdec_session *sess, u8 *canvas_id)
 {
 	int ret;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index 165e6293ffba..cfaed52ab526 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -27,6 +27,10 @@ void amvdec_clear_dos_bits(struct amvdec_core *core, u32 reg, u32 val);
 u32 amvdec_read_parser(struct amvdec_core *core, u32 reg);
 void amvdec_write_parser(struct amvdec_core *core, u32 reg, u32 val);
 
+u32 amvdec_am21c_body_size(u32 width, u32 height);
+u32 amvdec_am21c_head_size(u32 width, u32 height);
+u32 amvdec_am21c_size(u32 width, u32 height);
+
 /**
  * amvdec_dst_buf_done_idx() - Signal that a buffer is done decoding
  *
-- 
2.22.0


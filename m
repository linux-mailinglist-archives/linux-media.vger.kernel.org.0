Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DD21229B7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 12:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfLQLTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 06:19:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46607 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfLQLTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 06:19:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so10818406wrl.13
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 03:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=r4xyi05Z0qWvrnPsw0oetund2ec5x63QF9JMKUGqjuGRCPP/hY6McWKa3X6zDdvono
         ZWjSxLQQtLNkGZ+ct4x843+eT4sxgb1QgwdLMX83Mzmuh4Xj98lX0BggikOBpFwk9leQ
         hlfSzXTvzpWzz0+tIdxtafXKJfZa4eFa/QcamwaFxVwiKyFGNsGJarDxJlQ1Yt5TTUHk
         d/+0KjrBaBVa0RnEr/gLOYSf6d9tdfI2a3tSnwNvUd6kvjrtuRRIFEvagiv/vWp6BXnm
         KB2YAAZrb67IoP6B8X4o1DlZQhrEQv+3AARAsdM1SXwmhWsCJzKXQbBhoOuyo4qNDmhy
         0rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=qLWBJSIoooDDPMNc+0JPDbII7DnAE3wl7EO6lSCiQoPSLOjyS4imQ85yfOB/h/ujhA
         v6jL7lS6uv9aKuys05Lr9YoEw1GE2qkuB2nTDOD29ha3xUf0Evs5QsMgkoMWck5NJ+5T
         0MY9aK1UOzBsM6xLN0PII2opVEYuDJUMEKJXDLi2BMicwjUEFDV5W3QJICogzXVWeRqn
         QolWWc32llUKt6P5dphuzINIRLZRE5lUPUtKMFo4h1e4zZ/Y2qY+3m2kWpnWE43zsjbH
         hUnsM3xN1ki8NFy5zJ0X9Ii5Xp1cbKeiwRGlb9TfVkUn//MaSQqcHChz3QUbuCQ8nOrj
         faCg==
X-Gm-Message-State: APjAAAWyhykyiHFCYu192GraJD5WT1ETuXPsmezxRB10JbcxQns6nb4j
        5X6lLvbsdFvOZDi/spJz7eL4hw==
X-Google-Smtp-Source: APXvYqzANxopZZDEUqRVRjmMrW4GDF1rSth1AhKzw2hBAkcpYmorJqw3yZKxPiKlZofK2y8ICgKTQA==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr34832312wrs.217.1576581583518;
        Tue, 17 Dec 2019 03:19:43 -0800 (PST)
Received: from bender.baylibre.local (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id a184sm2713113wmf.29.2019.12.17.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 03:19:43 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Tue, 17 Dec 2019 12:19:36 +0100
Message-Id: <20191217111939.10387-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191217111939.10387-1-narmstrong@baylibre.com>
References: <20191217111939.10387-1-narmstrong@baylibre.com>
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


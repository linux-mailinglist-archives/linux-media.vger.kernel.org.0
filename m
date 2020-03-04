Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC68178DB2
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 10:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387626AbgCDJqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 04:46:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52837 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbgCDJqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 04:46:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so1224046wmc.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIQVieVu7UoENPR4ohx8RO9hyM5Q2LpZgT/s7fhmTzY=;
        b=IkPXgpK4xQ3HN1/lwVgetOzEh4UKm3I+9vyeCcCPhYG1sgxmm/ZFGWaEZKCICJssig
         w3q97QiB8Uqqxfw515+wbeZRdtgSkKczNxTt5VK260CBa/OIyFD5LgXhPlbWMHlkSaxp
         zH3P9zMqOTvIe35eja5Mr64XZgKTgp1EC7Kph8B6J6PMWq19RaTgiFzMKEe+fBdepN4E
         bUmZay3pi3XOLqH6dM8Esz+Of29D57PB93+lRseLxicDlW4Tdberxde1nVkX+qLwEBKv
         oeCeoI5RyPCWOgbD5aazF7HM5AC4Q+y0MfZxEoTTdO5mnsYsI6jQKoVdemXxk0mKXcSZ
         9jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIQVieVu7UoENPR4ohx8RO9hyM5Q2LpZgT/s7fhmTzY=;
        b=t/YAtwBkVci46lHSCAqBj4v/vVoy3QlwKIwGTZUhnrnxk96c56GMABiizLSPF80Yol
         sCQsKY7uMKnhr1F/kfbnUsgI/5ZCeyv7RPbkrym+KuwOzVgxkE9alFq6D7wdLFLM24y/
         B6unW8uG3N3J9fR6vMldO0U+ydaCbZpY0+RVk8Z4uNLXccRMBetvw2qYbjWysWc/bzkA
         sPWKOdYkzIRii7VmLeO/6RzeT3fxfeQFt04pQ1u12rMi431hrJ1vC1euudg9a2EHKg+z
         gJJV9oNWw7t8NlZWu+giVn1pKmse9MuAQQT1ETTJ5NwrRN/eerRXOIOEJcUE3wqfg00I
         XgHA==
X-Gm-Message-State: ANhLgQ2pgYgbVoEnoedtkEe+8yT5y5XLBc1hoWNq6ekuQrQwp8qjjRvI
        yfcvd8dd06Rbbb+XVNXSVNP2Ag==
X-Google-Smtp-Source: ADFU+vtiBXyp3FrhG2ndaye+3pwo2YmBsb9/Ig1njs7KOUzdF8wkPe/vUfOi1SiSTAHUZP5TDGVuSQ==
X-Received: by 2002:a05:600c:2241:: with SMTP id a1mr2786991wmm.59.1583315194019;
        Wed, 04 Mar 2020 01:46:34 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b10sm38696107wrw.61.2020.03.04.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 01:46:33 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v7 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Wed,  4 Mar 2020 10:46:22 +0100
Message-Id: <20200304094625.2257-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304094625.2257-1-narmstrong@baylibre.com>
References: <20200304094625.2257-1-narmstrong@baylibre.com>
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
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
 .../staging/media/meson/vdec/vdec_helpers.c   | 27 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_helpers.h   |  4 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 3f7929c54dc6..caec0fb60338 100644
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


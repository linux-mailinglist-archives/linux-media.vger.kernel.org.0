Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209FE13DC22
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 14:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgAPNes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 08:34:48 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52185 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgAPNer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 08:34:47 -0500
Received: by mail-wm1-f68.google.com with SMTP id d73so3799030wmd.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2020 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=DXOpnld9G92rlbb4WX6Ogbj05H6RMFuh45/3B4eW+DhQ6n/E7vudJGO9Mzz7wI0Qy4
         Ws99bkrP1sbWkkwivnamc4ZnUdvI8vvdvw7/kfQDgdF6DfEAvFCVoGlhKAPTBNQ5pS7u
         sPPFON+8inKDqJbghOuAjbdbzKCFhGYX1C6lJqr1uR92e+rxZrsH3LekPu74e+sRVAmx
         6VhaEQieIAPvIF9U+jJyq3qy7on9vjY/pIfHA+KWUfOJh+3w7quYDKliX/uOvJNkUz9m
         PeD0GkUyk2+ZMFQZlWQBYDf2w8q9CqXe6TVyg0DCUiqhezBTPUjh1Jl3IZ5K+UYnT03r
         xCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8VsecRt+zfmEiQATRM3jixSlKuyuB/bDX0OonY2El4=;
        b=iAgReMEl4VMkte9wx8FE7+g80ucYDHpw1Bwr9pUKMmGCY/Sc+yZOI5hSH1BQSIw3Dr
         O2wGBPSt6k2D9lUK6qMvrDNy1cgBAy+PTyyiC0MKZ2ytcb4Wfqfciph6HfhCXVwtprBT
         nKvlp7q/fu9isoRULlmeRGPv54NEeaHPY+qQjSDc9p6R/MhGMTvLrt/eEJ30PIpBneEL
         kUce5dE30ibxjA5MSRBit8uUvjDij/doegjNxKqORaW6Y9FxYdffFyOtsFipbmjv395r
         Ci2EyIr0ih8rn6DCxZJVLK+Y6gWsNykSuKirm/TnFLzBhbmB0bFZzyrpBRD5B49s7cci
         XUGQ==
X-Gm-Message-State: APjAAAUtXUoUU2sbKhPGvp7LekDktf2/IHrT1VdJsHp7VHWgf93YdLWV
        /HvYFQRKyd3x0EGtJc4W+1UJmg==
X-Google-Smtp-Source: APXvYqyb1R+yJT7XgcRexsIrP8eW6i1OtzANNUy3R7MFWcGtdeAFDZbW/yA6D3OLL37hhBv843ua2A==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr6244365wma.24.1579181684167;
        Thu, 16 Jan 2020 05:34:44 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x14sm162559wmj.42.2020.01.16.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:34:43 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Thu, 16 Jan 2020 14:34:34 +0100
Message-Id: <20200116133437.2443-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200116133437.2443-1-narmstrong@baylibre.com>
References: <20200116133437.2443-1-narmstrong@baylibre.com>
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


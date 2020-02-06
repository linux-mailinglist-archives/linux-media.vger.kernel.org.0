Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2234E154079
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 09:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgBFImA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 03:42:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42759 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgBFImA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 03:42:00 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so6043553wrd.9
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WxgSke1xqqIbUm6aWbWsjJ4dv5wN++i4U64IM8ckXcg=;
        b=j+ac5GUsSJeMY/OOO6WKioMdvPzDHAK7Sst7e7SM62udReqc3+qm8W7/AS/Y6j7Msy
         KbdrwcRRRj0zMRpvvPFf/hmM7mg96Rfdf0VhoEQJcYuIsKEz7gh5J+pIENHYykkH64gK
         VrSQaGwLJQ3Yr+WmJ+DCP0fJB/LnhnX3OKZdAS37B1DlaSX7AnnS4Z47YpdmTUHgDt8r
         Vtfg1kWP0sNYd1HkEhuL+5LzwDgoxLl90wkWrPN2VpeuyLZoSAlisD0Y6q4QBGH35bxt
         X9SlOl/+fZ9JZhcWQH6io9NScUbnAKo6Zj6NRguQeavLFmgL96CPhb4MSIxe9iMiyLUf
         Ep6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WxgSke1xqqIbUm6aWbWsjJ4dv5wN++i4U64IM8ckXcg=;
        b=kdzl7d0uLwQodbwh5ia4UdsVWJ6CslI5hgoFFMT8bK03JZlAVBKlwGeuquW2F929hI
         3RH+/q6Srzq/zY6iWakh7Rfhss0DNbzXuqChY2f3xjbYgj991NoP5+HVeVILTgszLcgv
         IfkUlzxfblCf/HKb70r76h+tkO9T98iZkjjNah9Og0ycPw+OoVnV+CRDP7ApdjSJV36f
         vz2PHNY1r4HtwOhXZLyC/XPhd8qxLVBp4875m8oS44q0Lc1ns/G1VE0kQy616JMLOX12
         5MSzt+xp4ZfNU5bTaVZzBP3by8iVmFPpy0NgzjopCXfGr4zjQA1+/msyqh3Ii2TSx6rk
         Whdg==
X-Gm-Message-State: APjAAAXocDq0u0+uhEbY/sfdaI0kYLlWh3u3OsD0WDdhL5N2y6MRsowZ
        xcr6SAONwHfrz658WDzxF/QhIA==
X-Google-Smtp-Source: APXvYqxIG6LmzTQJJxqzCkbGhckXZWo6a952zpdZN5OJLly594iVnWzcsvf4srp9zXlz5Jbm13mIpQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr2490205wrj.261.1580978517085;
        Thu, 06 Feb 2020 00:41:57 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id r1sm3222760wrx.11.2020.02.06.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 00:41:56 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Thu,  6 Feb 2020 09:41:49 +0100
Message-Id: <20200206084152.7070-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206084152.7070-1-narmstrong@baylibre.com>
References: <20200206084152.7070-1-narmstrong@baylibre.com>
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6A8177930
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 15:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgCCOhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 09:37:37 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37321 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgCCOhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 09:37:37 -0500
Received: by mail-wr1-f66.google.com with SMTP id q8so4650761wrm.4
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIQVieVu7UoENPR4ohx8RO9hyM5Q2LpZgT/s7fhmTzY=;
        b=BrG61wk4/LRRSyrFsuQZ2h3PGNH57U6RMOxCT1ivsgHVIHQWGtD0qd1sEtOgJhNktE
         sDrudfZiczmO6+LIcx+LQH2iEUadTyz2FeG9Nf/wQTYdSXPJxe9+mcTGRsMflfCrdeqa
         Rh7ApqPerAUd6vv2l3k6MztLeJUPUzypS1AgKRhCsI9fgNHk2CAp3bLkNqZCiB59MX4a
         u2xK8TLmk7fyjxzmlYDP+DRfAGgLK0oWk08VPezSPFgELqoXCZzMPq72rtPj3Cr+h8ax
         by0vnBk18YXfajEalDXapkkB18X4tMLwUc1AGl+bBK4B1EssmkUGShkLckdFDEKjUps0
         vB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIQVieVu7UoENPR4ohx8RO9hyM5Q2LpZgT/s7fhmTzY=;
        b=WVr21iNLpqHgmtBSfAEevpQazIqbOGCln+vn7N92KUPQVMAyfQFwnDWoB6r7ApcY3U
         snB25S1KAv3vyMSiSF8IjpG0NMU2Vl0ie2EjOyjLgPxsUAWO1odGz9+P2yZu/26ys/kT
         Y2zGw09dKZI2s3hcw1jo4Ac9iS6TOrz/Pv1Vq7umcX0YHe88/zNJczP3kEnYR8/6Fjib
         wbN5DXuL9etUtnBnguL/9gba63IntEgZVi6B0DAHTMFKgl4aTAQ/sBlM58N9vVEtNTWE
         KTy+P9DQ9v0+hBWLFL66f3kVL9bCxCr5eqN4AOJWZSxIbgghTwmWdjzXWBCbAo77hzG5
         d0/w==
X-Gm-Message-State: ANhLgQ2qjsm/CQtf9liU28HsDfhwNF6aMpCFwSQqs4dmTkwm6AvsPv/N
        lug0xVEe6BwkawYBmB7Fg/Q9uQ==
X-Google-Smtp-Source: ADFU+vuETlevAscf8ZZ+3OxRv6dak3GsmklnTJPNS+JenCaV53y+eTysJj5mSNtHwty6WvRYuJFZHQ==
X-Received: by 2002:adf:df82:: with SMTP id z2mr5571677wrl.46.1583246255956;
        Tue, 03 Mar 2020 06:37:35 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l4sm4652779wmf.38.2020.03.03.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:37:35 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v6 2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
Date:   Tue,  3 Mar 2020 15:37:29 +0100
Message-Id: <20200303143732.762-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303143732.762-1-narmstrong@baylibre.com>
References: <20200303143732.762-1-narmstrong@baylibre.com>
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


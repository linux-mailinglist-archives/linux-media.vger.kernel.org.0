Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6343916467B
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 15:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgBSOKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 09:10:06 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45253 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbgBSOKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 09:10:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id g3so653652wrs.12
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 06:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
        b=SfyZK5owPyqQsSdRWhmTcSJjmleC78ElDcjV+UjXDo+G9awOf67LIinPNyC9+ExkO+
         glEZlTBhGurOG1midLd+rUDFuMKco1SH6LTm1T94IwGLuqBBL/voCT2kEhAfTxMcTIzo
         PCFzdAfkDzPyvUrf6xpyb0WxdDvMpICa7U+etjNUoC5XGdHmD/oUsgFJ9fl+zQqt4cES
         6e5lS7PyZ6dVCsahbh5qwwm5x5lHv6rJq4mdg8pZIt5mWITNWRG03zSCCG4jsszFGvwh
         dp/zMjzvY5nxNsK5ynymDY12dQ9SoO4JNbel4e0RkNIqwa/741tAMGiDtRC551KQ5cVg
         BaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
        b=AArbOrekSFKUxlMhel/UIMPmpXGuy9tBwJn8R9vy/faKD6JjHSWZ+VMv5g/Imrlrwr
         LmBwqjqHgR/kgTP9cbzqXUa4I1o41048IPHHq1eH7rSKl0Dl1TqMbpuguMvkOvmhWbO0
         DuC555PTi+mT1XydeIoh5dTSqkVGBbn0gwXsqxWuf1SgiunjpCyjSqOUpE5OXpHtvg/d
         gLrF38MLzyamhkDlahRmvmUIZRoeKvDMeNrE+QpPlmAym1bkZ4OboMMQ7Q+QQppucWa7
         2qpH9ODijVe6jS5Sy5M9F8u+jx3gtFy5/QA7F1zjEvY1LNcra3E3IG6xnROJiEk/BwrU
         U/8A==
X-Gm-Message-State: APjAAAUmpzLsNn1fBrx2oTi3Erva25sIuOkLG62b57BpfZzPVwlbqu9U
        rnXZMCTd9k94ydwVCkVtgOF4nA==
X-Google-Smtp-Source: APXvYqzG5qEyUqHoQ5AtmHYyezCCrK4QAqFgwDEmQK410ch5CMcSCeiuKt5/7DbqU9uDyqAu/vm2Qw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr34534537wro.28.1582121404144;
        Wed, 19 Feb 2020 06:10:04 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id m68sm3182789wme.48.2020.02.19.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 06:10:03 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Wed, 19 Feb 2020 15:09:54 +0100
Message-Id: <20200219140958.23542-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219140958.23542-1-narmstrong@baylibre.com>
References: <20200219140958.23542-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HEVC/VP9 aligns the plane stride on 32, so align the planes stride
for all codecs to 32 to satisfy HEVC/VP9 decoding using the "HEVC" HW.

This fixes VP9 decoding of streams with following (not limited) widths:
- 264
 -288
- 350
- 352
- 472
- 480
- 528
- 600
- 720
- 800
- 848
- 1440

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c         | 10 +++++-----
 drivers/staging/media/meson/vdec/vdec_helpers.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 92f0258868b1..bfca4c82aa56 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -528,20 +528,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 		memset(pfmt[1].reserved, 0, sizeof(pfmt[1].reserved));
 		if (pixmp->pixelformat == V4L2_PIX_FMT_NV12M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 2;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32);
 			pixmp->num_planes = 2;
 		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 4;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32) / 2;
 
 			pfmt[2].sizeimage = output_size / 2;
-			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
 		}
 	}
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index a4970ec1bf2e..3f7929c54dc6 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -154,8 +154,8 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
-	u32 width = ALIGN(sess->width, 64);
-	u32 height = ALIGN(sess->height, 64);
+	u32 width = ALIGN(sess->width, 32);
+	u32 height = ALIGN(sess->height, 32);
 	u32 reg_cur = reg_base[0];
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
-- 
2.22.0


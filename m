Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35732113DC7
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbfLEJY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:24:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37395 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729131AbfLEJY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 04:24:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so2593813wru.4
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 01:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
        b=I/lfkLkec9xB4Lt64wD0JnmL1JPuqJcyEsa4h0hoXOUU/LWyELsD2B6FcUs8hnngLr
         s+iXCwOz//+2tsj4q3jUPAYlFnr0S97iUKEIVw+bh962MrKywBxIUjTHjF4VGEmEXxVu
         CblxxSfJpk6JGELdeXTC1lPCXGZpZRt1miq63dr0M1xsDi7IUpJfGpOe/EuMDXnbgnJM
         Qc58/qbQsGckCR1Kc1OD/KYg1fDFqt+cCX/Kijan7HudoaA1WfcMQMK+a/xiAv0p67PL
         4/gFjYTNRyxXZCX+yStyq4ucTXOkp3V/Ye3YdM2rquaNhy/4TNzxz3RKEkPx3e6p5Va5
         ok6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
        b=eycNJ3JZMcTX81cLHTphKC07ZDfG4j1IY0ZIFTbg9rY/4DDc59jd3NIIiLAlfxkIQm
         BrsuN1jOlUbjVLd10luxXF381OS0tNYwyq0Ze7gpGQyG8eDQruBuTAsabpXDWXhJ4Y9q
         rYJsy6fGdqVUDdzrgqIBOCDIyvAWdC+wmy7Nf7pUW9Y7CJ2geyMDSW7RxtXPeAfsra95
         yK3DGDMJy8JMtDiai8YU0xHrf1uo5EIYuwpbFmEccxcAb4a/MSTvjSvmHnXzHfXVxFqP
         EYQPD7RKeW9q7JsdYmNYOT3XMYFe8ImMc9DuOYxFJMGzUGP0TJ5iaRuqM+HU3WbdhnON
         IfYA==
X-Gm-Message-State: APjAAAXY0waTyaH7su8zPdwepOHYCVtp8iRfHF1+qqdflVtDRdz1Diey
        N6gOZmTTygl1CaXIuFAM1rNMgrKwYvwK5w==
X-Google-Smtp-Source: APXvYqxM/twH277jtVYnEriu835IS5kknyb1j1etNDY9mX3nYl9pJof1Rjwetb+ekuL3yMja3982dQ==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr8664381wrs.330.1575537897807;
        Thu, 05 Dec 2019 01:24:57 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id t5sm11642620wrr.35.2019.12.05.01.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 01:24:57 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Thu,  5 Dec 2019 10:24:50 +0100
Message-Id: <20191205092454.26075-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205092454.26075-1-narmstrong@baylibre.com>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
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
index f03d9eba6e23..bd59d32b92ae 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -525,20 +525,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
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
index ff4333074197..fc59d8801643 100644
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


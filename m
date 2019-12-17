Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA321229AB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 12:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfLQLTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 06:19:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50612 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfLQLTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 06:19:45 -0500
Received: by mail-wm1-f66.google.com with SMTP id a5so2549493wmb.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
        b=JkP2cBOdB1jizFRg1waiD4qV7ueEblfSlWDYkogvCG9zIEqtulTxydzio6qhq9ONoy
         k4KKwRtj8XYwmjolQg1cgjCxQTWEck5bqRQp9Lv6/VgtqUITpWapRM75azFpkFzQin7m
         rX7hfKpVrVGqQB3t0LtAqV1km8r2HQXp6/DaBhgv13tm/DrkNd/TposlDwEMG395qO+y
         r37a8fSNxAv0dLHEx8kN5nY2XD3C0JgwEp8ESHOzdPFsQ5tTjfnu26uHAZis+lGPNAwH
         7cAFBcKAc3mMk3Wc+I5l1ca0JifPkUqH0XrRjK/HaP//pO6QZnjOq7AqikGQ9Vkqu3oa
         wmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
        b=PWqrrkUQHdu//JDfFkCu0n2ssbq+vaGljUCI9X+aLps/nv4Wta0HOZc7LPsx3OmtvA
         KOyJ28Lwh8QSUDWTMS5xczbHGsmQLn/DOaXPBLkbWHLSrZVfZtal+9FbG3LMInHWTOmM
         /5X/f42V/xfV1txF+DX8v4Pwv9BtcrNhjG3p+rcJd/Zc/8ftvgG0hJG5ryZzpEfmJdcv
         8D5MSEc4PZ5z1HUmaWtumD5ExfIvvvn1lIQ0c+q/vU59EueVN0AYooh+ELSSZdY3Pw+V
         nUFSYyc74ULnypNrJIo4G8PlG/3m0/HwdpM+Eo2GrPe71UoqUr7oXJ28r2rU8nTSnHTb
         gElg==
X-Gm-Message-State: APjAAAWtkr0kPzN1fm3OpOUXHahnQvX7qMmzty6ocCSxKTESwG9HSIZ3
        x/bBnmZg6cDPqFMpSU84g8Lxpw==
X-Google-Smtp-Source: APXvYqy9goZ1j0cNPEceJSpdmJLFMACjHYGJdKCXZXrKYvBR8MdlhGzlXmaLhM56FCaykJyKN3NTxw==
X-Received: by 2002:a1c:9a44:: with SMTP id c65mr5171515wme.30.1576581582745;
        Tue, 17 Dec 2019 03:19:42 -0800 (PST)
Received: from bender.baylibre.local (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id a184sm2713113wmf.29.2019.12.17.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 03:19:42 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Tue, 17 Dec 2019 12:19:35 +0100
Message-Id: <20191217111939.10387-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191217111939.10387-1-narmstrong@baylibre.com>
References: <20191217111939.10387-1-narmstrong@baylibre.com>
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


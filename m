Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA3517792C
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 15:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgCCOhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 09:37:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43725 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbgCCOhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 09:37:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id h9so3670189wrr.10
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
        b=iNrm0CI9XnahfkY1GKdbv7m82hqORspH2rHCweh+wIBudNC2ZqFrcVAnaaXt7uDpCy
         eOWYuWZdiQ8nxSKtcUSXqN5o/NCkO70fo22VX8gYL63tV53T+rWuSE9e6mLiaevS0Ff4
         6M2FGsxXj3GoRVu27Q/2kIYiT4RKTrcngLYpiHQvNDqhyEWatZMzY35QMk8rOBe7Wc4Z
         an2h2ylpm7D3382SDTEw7p7Ia3K2fERXdyabba14Lsi+KMozLek0GLJ2GArlVQm9HUYI
         BeI+g3eiumyugaCfnPNyWzZ/uvi0ouNBGZPILG3gzL59aIjyao9pf6rXzpkOGg4NGTMo
         YqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
        b=mg6ShDvTNw80hfonykAXLgvUffFm5hefuE3/OoFGCtY3RhC6jLJXFgDODH3sbtjbpa
         lqWPdG/5vsGl/ggXP6Yeep9HoqIN7aGTG3x3qC3+7LfcEBIIUopaehDfcaDz0r4oPtPn
         G11YmTct6gisyuKMJaUf7QsjljEKEwPDtHDT3+40qtJz/zuvItstmo3zHVDWOKAXg8C7
         QFuBe4fZB4iXVc48ftEQ2IHAYWa3hzdFM0eLsH/Y037ONU8iPIY/DlVPIV+eFFj9AdoL
         uCkGWN8VWVjWGpGUVtEproOUx42uu5X9cai7LCSf4y/VIA4K3Zgyn7QIagVxrG2ZA70J
         Oj/Q==
X-Gm-Message-State: ANhLgQ0TyP8Cd3YNz8vfd4jy/KnL7tOdcKDONrMpQWmKy6fzs9L6nVEL
        9jham3g+vqIl3vdJXW6/UN9B8w==
X-Google-Smtp-Source: ADFU+vubH5FvBdZxArVu9XQq+51wNWYXHqzexBNcTn8d0oRpiHzqnZXe/qfgWED/LdX7eNM+kJIlAQ==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr5635176wrw.319.1583246254899;
        Tue, 03 Mar 2020 06:37:34 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l4sm4652779wmf.38.2020.03.03.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:37:34 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v6 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Tue,  3 Mar 2020 15:37:28 +0100
Message-Id: <20200303143732.762-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303143732.762-1-narmstrong@baylibre.com>
References: <20200303143732.762-1-narmstrong@baylibre.com>
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
Tested-by: Kevin Hilman <khilman@baylibre.com>
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


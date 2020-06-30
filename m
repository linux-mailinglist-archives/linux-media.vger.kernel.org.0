Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E387720FD0D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 21:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgF3TvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 15:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbgF3TvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 15:51:10 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A0BC061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 12:51:10 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id j4so8901415plk.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 12:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p5f1RM1G3Lr7GaMJ5iGuAFQEEYFL5B+QSi2APysRKNI=;
        b=Z+mB0Q1F0X/OGcwzH/rx1XM1xQHJiapG2y7Fh77n0MrdKeycMd6ovAHpoMkirrDjg1
         40uBA60HSXqmBv75JHaK82z6nG8ggAL/NyJPIEY+qoEpl9qUEKIVFBMXM7k/uf5R57Lr
         Tiexvl8J7Y82wAOL3lvTHWb/kCBC7DTavuCuwe61SS4/q+h1oWs1Ui7q28rOog/Y4rj6
         ijTPr7UTVh5ozVCtL4na9e/5kCulwXmUj3PaFqF/znEU3+dp+xbMYzwRhow//ibKeHxw
         YRZ1P9uLz3+CdbEvCrsJQZBpMm8YRkQRdCz0irUKuVVDFSOCDeCzz7X4pHCrpjUlF5kY
         FX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p5f1RM1G3Lr7GaMJ5iGuAFQEEYFL5B+QSi2APysRKNI=;
        b=Jo+i8HMb515aqComekpDp3v/IV5FCR3Z2JT4OjOymSfmEG1GrhjIqwAukwJAApTNT2
         aXsxvIfObAIRXSEiz/kqmSEsHoptHNj9h1ujPoEr4OT0MhGymBv+x7RcLO0tI4250jub
         TReVjT+xFN+etDAdRTbnsejHEAGfyJDkDK1BxfcRen/zWzifdlq6UW8Eg02Wgm55I5Pz
         6fBl6ZluASDERE0KTZ3YBX5pTzp24pb//ZsA1gu06Pqi9gx0YB08Mx/UZBy+hlyup5pf
         oUA4hthN9cZn86OoYEpeyGVXitI916ELuRj7vGSJfkK6r/w2beywSmKT5YxuMExsBu7d
         s39Q==
X-Gm-Message-State: AOAM530xewNtzC1BZdFoUTrMggvqrXKZCRfnYx42SPFvIC9SpXGNxXfZ
        l0zN1AlcT83dU/MaRsnMcGiFJA==
X-Google-Smtp-Source: ABdhPJzVfQcUEURZ8vo61VuHKKzDbFxPPH/3inYrqJyUh6XZlWFTpkx22p+LN86tiZn+to1NKz7/Nw==
X-Received: by 2002:a17:90a:db8a:: with SMTP id h10mr7868592pjv.197.1593546669603;
        Tue, 30 Jun 2020 12:51:09 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id t1sm3100649pje.55.2020.06.30.12.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 12:51:09 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v8 2/3] media: tpg: Add function to return colors' order of test image
Date:   Wed,  1 Jul 2020 01:20:51 +0530
Message-Id: <20200630195052.23880-3-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630195052.23880-1-kgupta@es.iitr.ac.in>
References: <20200630195052.23880-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently there is no method to know the correct order of the colors for
a test image generated by tpg. Write a function that returns a string of
colors' order given a tpg. It returns a NULL pointer in case of test
patterns which do not have a well defined colors' order. Hence add a
NULL check for text in tpg_gen_text().

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 30 +++++++++++++++++--
 include/media/tpg/v4l2-tpg.h                  |  1 +
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index dde22a4cbd6c..c46ddd902675 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -1959,12 +1959,14 @@ void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 	unsigned step = V4L2_FIELD_HAS_T_OR_B(tpg->field) ? 2 : 1;
 	unsigned div = step;
 	unsigned first = 0;
-	unsigned len = strlen(text);
+	unsigned len;
 	unsigned p;
 
-	if (font8x16 == NULL || basep == NULL)
+	if (font8x16 == NULL || basep == NULL || text == NULL)
 		return;
 
+	len = strlen(text);
+
 	/* Checks if it is possible to show string */
 	if (y + 16 >= tpg->compose.height || x + 8 >= tpg->compose.width)
 		return;
@@ -2006,6 +2008,30 @@ void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 }
 EXPORT_SYMBOL_GPL(tpg_gen_text);
 
+const char *tpg_g_color_order(const struct tpg_data *tpg)
+{
+	switch (tpg->pattern) {
+	case TPG_PAT_75_COLORBAR:
+	case TPG_PAT_100_COLORBAR:
+	case TPG_PAT_CSC_COLORBAR:
+	case TPG_PAT_100_HCOLORBAR:
+		return "white, yellow, cyan, green, magenta, red, blue, black";
+	case TPG_PAT_BLACK:
+		return "Black";
+	case TPG_PAT_WHITE:
+		return "White";
+	case TPG_PAT_RED:
+		return "Red";
+	case TPG_PAT_GREEN:
+		return "Green";
+	case TPG_PAT_BLUE:
+		return "Blue";
+	default:
+		return NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(tpg_g_color_order);
+
 void tpg_update_mv_step(struct tpg_data *tpg)
 {
 	int factor = tpg->mv_hor_mode > TPG_MOVE_NONE ? -1 : 1;
diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index 9749ed409856..0b0ddb87380e 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -252,6 +252,7 @@ void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
 bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
 void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
 		const struct v4l2_rect *compose);
+const char *tpg_g_color_order(const struct tpg_data *tpg);
 
 static inline void tpg_s_pattern(struct tpg_data *tpg, enum tpg_pattern pattern)
 {
-- 
2.17.1


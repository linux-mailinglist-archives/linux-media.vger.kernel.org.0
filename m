Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CF21FFB79
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 21:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgFRTFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 15:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729902AbgFRTFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 15:05:30 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666ADC0613ED
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:05:30 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l24so3338234pgb.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H1wsNmA8Mngd+wHBq55NeILzfWgtbgUC8EqZWS9mmiw=;
        b=LsUufmD3ym6mZjvWAcpJ1LfnDw8Yaw+duReCoBt4aU9VvlIMClQOcjv5kUEK5dYK83
         AXEhbj5sM3DWtaxsTmQQdEnUrY06Hje+K+QKq8nXNkkuRsFmi8U/daKDvdZGlFSDYOpe
         nzcavmYvW0KgEjfdegUerh7uR47EH1c24M1yf/c+L/xuKKyrl6zvb3pWEDm2i7u1jtaA
         N2xjwGFMHnseA2AP6l/gnbQYx54yhKd0+jwnHbzhC2CrDnjZlSRaIgIx0l/Ar58g6MEg
         1z40wJENnC7/xzfYTN0O7QWoyPEoH7p2N9nUPOObuAWwvKqU1bBDe7wLgHjRDhOaH//M
         QaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H1wsNmA8Mngd+wHBq55NeILzfWgtbgUC8EqZWS9mmiw=;
        b=Vv6gPHkh/67ctpuzXFYlvIrvxBmTPXVNQM7k2UIeT1XjDSIkxxioiHHBPTlK90/96v
         bfeFWXWvIcNwAMEPrInUOce3DmlhGmgAinopBeSLgdlnhtwmkCqsOnVLDic5h0/EGgwA
         hV66jkMpu5yKYmVGT3ziLT6I+aPh7PaAMsQngIbX+mdVwemyb9ZIPLTY5mbjyY4bsHyj
         0C58xjB3KKqMK0pQ512C2K+bBERj0TMBIixSa3sEw0iyqFlLfOnWpoHDSVBV4dUIxibm
         uycpgOUO2bctYuEp0IOWoIChTDoecXK42WSH8pPCC/OJw/cjsTTqcoNR9aBWN4d9J4+S
         4lGw==
X-Gm-Message-State: AOAM532g5PyTiZosYP5VZxboh2JAkWM06NqOiUuDOuxSRHOBIVjbAr2u
        zSFIgsIdXUXauVOGNnIuK77uXA==
X-Google-Smtp-Source: ABdhPJwy2i/erjpl98dYx95k+jK9nGDoJv5wDfgHeuvlRZJGSfo42V8kOCiGiwrtv++KH4ecWHqKKA==
X-Received: by 2002:a63:1624:: with SMTP id w36mr58613pgl.144.1592507129761;
        Thu, 18 Jun 2020 12:05:29 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id j36sm3291290pgj.39.2020.06.18.12.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 12:05:29 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 1/2] media: tpg: Add function to return colors' order of test image
Date:   Fri, 19 Jun 2020 00:35:05 +0530
Message-Id: <20200618190506.11892-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618190506.11892-1-kgupta@es.iitr.ac.in>
References: <20200618190506.11892-1-kgupta@es.iitr.ac.in>
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
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 32 +++++++++++++++++--
 include/media/tpg/v4l2-tpg.h                  |  1 +
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 50f1e0b28b25..31e6044a4104 100644
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
@@ -2006,6 +2008,32 @@ void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 }
 EXPORT_SYMBOL_GPL(tpg_gen_text);
 
+char *tpg_g_color_order(const struct tpg_data *tpg)
+{
+	#define COLORBAR(order) #order "white, yellow, cyan, green, magenta, red, blue, black"
+
+	switch (tpg->pattern) {
+	case TPG_PAT_75_COLORBAR:
+	case TPG_PAT_100_COLORBAR:
+	case TPG_PAT_CSC_COLORBAR:
+		return COLORBAR(Left to right:);
+	case TPG_PAT_100_HCOLORBAR:
+		return COLORBAR(Top to bottom:);
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
+
 void tpg_update_mv_step(struct tpg_data *tpg)
 {
 	int factor = tpg->mv_hor_mode > TPG_MOVE_NONE ? -1 : 1;
diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index eb191e85d363..4f79cac87b85 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -252,6 +252,7 @@ void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
 bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
 void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
 		const struct v4l2_rect *compose);
+char *tpg_g_color_order(const struct tpg_data *tpg);
 
 static inline void tpg_s_pattern(struct tpg_data *tpg, enum tpg_pattern pattern)
 {
-- 
2.17.1


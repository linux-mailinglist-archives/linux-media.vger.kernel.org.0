Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C968B214CD9
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 15:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGENxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgGENxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jul 2020 09:53:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FEFC061794
        for <linux-media@vger.kernel.org>; Sun,  5 Jul 2020 06:53:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u18so585287pfk.10
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2020 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4HXkSJihp3Fc8dO1xehGtp3D9ixK4/XcOCc354oqDWM=;
        b=h+bnN+T6CgGsjWS0xqT0n8/gcWS0GjeSAV4LpQanYmXP2CLjXcUNNIVBMgFbFdhKJ9
         BE4z9iLfMln8m3EG6sLCkCFSVgwU+dmFKMLNdK6PhPvpTXo8JPVw2WAwNVRv1TTTENvC
         ZgGWdJlcg3g76ZWJJTx9aLUBkGNOzwEt47xE6/UuI3zkaN0N+S35E97WAPj4bgz0N+LR
         bEDHZVAtNanJGPgtp5Pfvu+n8fxS9U9xdnnKPUTKW0CsGYriSIYNKU4c9Sc5wP1cZ/pU
         cKrztFDmBDhU+/t22cMSlisJmZehDNDFgZHRqzpqD/6TIXZBQCsRW4O14LyMyDouvZ/h
         uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4HXkSJihp3Fc8dO1xehGtp3D9ixK4/XcOCc354oqDWM=;
        b=So12vJukVIr2UoT0vo2VMW4BZdoGTJPkn4gsmiJvWBBo1vE4LTufELzkiQ9bO+ldYP
         kwo02n0+AAeP+5JqifzbI5nLFnj6Y5Pago+IquDCUp3UbsypFN51igCJPKIqpfy170L1
         7KPcUUSmPyvPQcXR/N5c6eR3FIYfcyCPsoD2OAZSj7Qvnmye/95luv9PSFsxfHcqGNo+
         f8i3YJYIZOofkAtVCPKdmZIxycAPgJKSbwEjUVB2hZNJMQVYOLKlrJWC8hyCmobAKnjY
         0w/6qdGYppCJdnTm7T5EuM3AOJSHMKxs4KwN+lh0TVUZCxJSxNqJSR7dkSh5OBvk3qOW
         z/Fg==
X-Gm-Message-State: AOAM530P6I7Kmghu2dsWJIFxIIneBE02EkahLo9mY70bHcWltMNfdigF
        TuWpy/+QRvVsCMv7c7UdkFSQSg==
X-Google-Smtp-Source: ABdhPJx7KVR6varaKQT0qkIgeSgsOzZcQ3rX7lxyjEICKPlgvRTYqruNmeA1Mv+FGoFAzCWghJiGZg==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr34556977pgj.19.1593957216717;
        Sun, 05 Jul 2020 06:53:36 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id j2sm15758039pjf.4.2020.07.05.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:53:36 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v10 2/3] media: tpg: Add function to return colors' order of test image
Date:   Sun,  5 Jul 2020 19:23:05 +0530
Message-Id: <20200705135307.27564-3-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705135307.27564-1-kgupta@es.iitr.ac.in>
References: <20200705135307.27564-1-kgupta@es.iitr.ac.in>
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
Reviewed-by: Helen Koike <helen.koike@collabora.com>
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


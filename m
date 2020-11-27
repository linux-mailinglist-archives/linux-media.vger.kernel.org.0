Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE3B2C6927
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731190AbgK0QKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731163AbgK0QKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:10:01 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4107C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:10:00 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id p12so2506419qvj.13
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=alE21rn+heq/fVPZnCYo21ECd/KkAAhHyZZyizwfMVE=;
        b=f9faVQiSiBN0v5o4Qeu0cyD5BHmtxExwBx9rXaA9JeaPbeFzqtoqvP6mKvwtTT4doC
         outOyGcboGLD7+uMOVSG9fb1hHYiHiLELiJduLszLtfqlzDyFZfbY/Hl8jQUNtYYCcjZ
         exXzxfT6rMQdsKp8aPqlNBwvoqZxaMB3UVJ15ME2Z1Q52PWG+i3LIqMxigmZtK8Im4uL
         yIp+jVBHeIwcH/XrIVs2m08wY09vE7l5mo6iOazkLvaXUWKEfd366Q0hNdry3mNa+PM6
         fvh4e/7pXPXnPcqu05x5j1E6jfsqUPcQAuLSh8z5fGUWYqRSA6jIh0OrRzynW60gwsdR
         9JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=alE21rn+heq/fVPZnCYo21ECd/KkAAhHyZZyizwfMVE=;
        b=s2rxwFAFpH3BXCDuKkuceknSswy0KjGWqwof2x1ioh4bwT0TkAVQXq0TqIV40kU66U
         lTkNc938l0cS4wfNluUGiCp0oXCkBY4GPAoCjJd1yF1Xwer0fVpwh7Ms3oN1JqoHT3sq
         IBEKpAzMFjBoA+FaOVIs82821MeFt9Vsns8uKDzEjCKcA1rcH/uvpmzcM1MrJZqb9uBB
         ZRSq5dYe75nWe2vDbF/ekac86ave+vJu/uYSpohQNguKvGgpndP29lut2A+oB2Cqdfw3
         49S5M6+tKOEu1hK0U67aTt6YCc0d4jFBb5GCO/o9wL4bIDJmFnwrzxORnLKmSM4epsF5
         mUMw==
X-Gm-Message-State: AOAM5305vELyl89GV4ALAYPpwkhmKPHAO0c/0Xqzm+1tnnj5C+S5Hmu/
        mmGL0QG4rKzFDJM6OSfUdjg=
X-Google-Smtp-Source: ABdhPJzHAPzRJNBaMCpXGqG15Hm+2UnDvEA2XUm+XhUx2RenC2cDjw1iy1nRM4Gx5sItJAzPkvBuTQ==
X-Received: by 2002:a0c:fc52:: with SMTP id w18mr9104726qvp.48.1606493399919;
        Fri, 27 Nov 2020 08:09:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id t51sm6934139qtb.11.2020.11.27.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:09:59 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: staging/imx: Increase IMX_MEDIA_EOF_TIMEOUT
Date:   Fri, 27 Nov 2020 13:09:45 -0300
Message-Id: <20201127160945.470-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When trying to capture video on a imx6dl-based board with an ADV7280,
the following timeout error is observed:

v4l2-ctl --stream-mmap -d /dev/video2
[   22.792049] ipu1_csi1: EOF timeout
VIDIOC_DQBUF: failed: Input/output error

Increase the IMX_MEDIA_EOF_TIMEOUT to avoid such problem.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx-media.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f17135158029..c8b6a43d0d7c 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -65,7 +65,7 @@ enum {
 };
 
 /* How long to wait for EOF interrupts in the buffer-capture subdevs */
-#define IMX_MEDIA_EOF_TIMEOUT       1000
+#define IMX_MEDIA_EOF_TIMEOUT       2000
 
 struct imx_media_pixfmt {
 	/* the in-memory FourCC pixel format */
-- 
2.17.1


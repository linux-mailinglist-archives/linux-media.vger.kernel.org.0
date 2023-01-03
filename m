Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF9665C219
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 15:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238021AbjACOhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 09:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237966AbjACOgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 09:36:55 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0BFFD3F
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 06:36:50 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id c34so37443323edf.0
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAHTPeQigGkzAZXe4x+9ro8RmOt+dmg94cg1cPhP7q8=;
        b=lCMlC2H7baya2EyugYe/2t2UaN7sn8tQn32AmADW0/1KCdyNmlv2+0Mekp8k41K5yT
         mvy3hOn4QpdSu3vaAm3MdG3b5/kXSaK26E9zfMW3A8qAxNesfF7NEvvHmxAnkEyxh68t
         9zdzZGfngI+UcZNpOb8nUyddtcMJjx9OCEFE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAHTPeQigGkzAZXe4x+9ro8RmOt+dmg94cg1cPhP7q8=;
        b=XCmbxwAZWvSRk2kfOpDddqcYRaZqvgUyyHuSsourzG5E/5K22SDkhqsmxSJa5M5s94
         Vf4EQ0iJWusCMMdZBa9eV3P0FoB01Tq1YHhU/fbWqlIN6JUOpnziHuZBGOingLzA4H7w
         71j5UduGWarFWeINRxjQqsGJFigK9RB4QyVhNvQsORXHVvw0tN3/61UmFGSiFXepXhgm
         Dev+d03smLnX7+RAHSuQW5/OWD3GXorRbXmFV6cYXvGmsPNAtjkQlnXvMJAedEfA6nAv
         Ws4zfMTYjguIL7bvVSNnLEzmhn+pIi9WNMX7zwPyYTl8NNQEQP6RxeyRSIgxYze26Izw
         THQQ==
X-Gm-Message-State: AFqh2kpbXutBbZgCYADqy8myUr07NJpRe4OevNSIsV/FodCUkhjlaOr1
        3oyAkgs7ADZwBrdxsR+agCefIA==
X-Google-Smtp-Source: AMrXdXtIN8CqG89gterCPYxDiV7mGaPjoYpdJlVvRTWUMCDZhukW4fxIL9Xmzr4HfCa781HO9n+IZQ==
X-Received: by 2002:a05:6402:f04:b0:46d:ca42:2e59 with SMTP id i4-20020a0564020f0400b0046dca422e59mr42519239eda.11.1672756609473;
        Tue, 03 Jan 2023 06:36:49 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:9789:8e2b:74ac:a9a0])
        by smtp.gmail.com with ESMTPSA id p14-20020a05640243ce00b0048ebf8a5736sm877245edc.21.2023.01.03.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:36:49 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 03 Jan 2023 15:36:25 +0100
Subject: [PATCH v3 7/8] media: uvcvideo: Refactor __uvc_ctrl_add_mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-v4l2-compliance-v3-7-598d33a15815@chromium.org>
References: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
In-Reply-To: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=9TceltHofxTy9VGQ6b063wegxNqLkTD5czVh+mkaViU=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjtD12Pm+Pt4NYHp6kgsePzovAUC+g8qNSkc2d44eM
 mgFKrx2JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY7Q9dgAKCRDRN9E+zzrEiNEpEA
 CLEufUPLQ3HTohZFgOdTqMvgKnnLNzS546HhLprD+bwAmbmQyuwqcepai9q5vjvPtbN9fCCjm01jPN
 v+iPwpjQvze6uxrrxJFhXjiyJdouV1Pc9vqF1djm082BwEVPpIzF4ICWKHj7xApvPYjRV+6L4mrDGk
 bcXcKxfyXSmBcWtKdv7g9OoMxRV9/AvwjpUMvMhKu7cIMo1f9pJXkk4CaaJr626OEEvfI42KktXyrs
 7ep14IospObdVV09J1ASUr8i3OGswy3mnNypVG5QiejKZyqmR0aEZJo6sIkIr8GYHMW8GzW6IRQDiI
 VAz6Ewg611KDHSOMz2Sx+WLRHZCg8ZFB/XMumsExn1vH2bJ5T/UZ+HZDeBfZn/bsG72kUCIA94YO0O
 3TwQE2vwjtMiircrGpMAzJbgagjKJZKmsGHl90IBbSY35Kbwe5uvgbr5oU4ipu59Cg6mzTbwcbqI0J
 FFLIITuGx/vAUwY7g5aNxUDZFAJBhrrSKGU6/PkdsXqwZRju6OSXGbkAM/hCrkIQ9ciDcbMT4rH4GS
 v7HtSDIlvsSwGPvjR2LV0ECLiIONo6Qu4VgmaGepFBIueklxEiE8JMsvtOjvKEPZdz3KYpfQf035eV
 P4eQX9l0pg5V5O8hAyJ1QaTNz3u5sJlj0JJnaLpuUUVcHkgTtIrU5//wkGuA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the exit code with a common error tag freeing all the memory.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aa7a668f60a7..4830120e6506 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2296,32 +2296,30 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	unsigned int i;
 
 	/*
-	 * Most mappings come from static kernel data and need to be duplicated.
+	 * Most mappings come from static kernel data, and need to be duplicated.
 	 * Mappings that come from userspace will be unnecessarily duplicated,
 	 * this could be optimized.
 	 */
 	map = kmemdup(mapping, sizeof(*mapping), GFP_KERNEL);
-	if (map == NULL)
+	if (!map)
 		return -ENOMEM;
 
+	map->name = NULL;
+	map->menu_info = NULL;
+
 	/* For UVCIOC_CTRL_MAP custom control */
 	if (mapping->name) {
 		map->name = kstrdup(mapping->name, GFP_KERNEL);
-		if (!map->name) {
-			kfree(map);
-			return -ENOMEM;
-		}
+		if (!map->name)
+			goto nomem;
 	}
 
 	INIT_LIST_HEAD(&map->ev_subs);
 
 	size = sizeof(*mapping->menu_info) * fls(mapping->menu_mask);
 	map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
-	if (map->menu_info == NULL) {
-		kfree(map->name);
-		kfree(map);
-		return -ENOMEM;
-	}
+	if (!map->menu_info)
+		goto nomem;
 
 	if (map->get == NULL)
 		map->get = uvc_get_le_value;
@@ -2342,6 +2340,12 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		ctrl->info.selector);
 
 	return 0;
+
+nomem:
+	kfree(map->menu_info);
+	kfree(map->name);
+	kfree(map);
+	return -ENOMEM;
 }
 
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,

-- 
2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae

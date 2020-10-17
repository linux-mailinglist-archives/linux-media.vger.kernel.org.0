Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C93291269
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 16:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438360AbgJQO3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 10:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438337AbgJQO3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 10:29:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD71C061755;
        Sat, 17 Oct 2020 07:29:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f21so6177283wml.3;
        Sat, 17 Oct 2020 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhTAkXNg8my5roVt3jSaeXHe7VJ9U3uXiwwvjKdguwI=;
        b=u3bVkEeryu4yoyRBIK95E6ZpRNKQMDD3Dpa+7It6UOZs0KJtv1xLfLRcgEgwOHLRA+
         LeyVS5aCQ5QbUuHaJTQHgEKRFq+3AlSq7+XqB8tQoiaVrVZH7v7zbDmSmc/a0kZ2Rf4V
         19G7iMvIhTPaesN2/Obun7YkHweSRY3U6TybzDNz99CD0KvMl1t9AXn/7Lwi2Y+Lm/n4
         RycmodJiDE5PEExd0I/AJqrXP3WMWlPi1pOLplkT+YXKfUkOSn2rL2btGDWG6sqf0qRB
         qhQ+LGMa2LgULoz/3fe2XJ1VVQ10RA2pcDinSjeak0NEyO6g3qiwbM8uHMgoVsNvEeBb
         Lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhTAkXNg8my5roVt3jSaeXHe7VJ9U3uXiwwvjKdguwI=;
        b=rzVvBDNGLA8TY16jZK4sIkHJgh7cge4B5rkXyOggItLuA+3ek6/26GFuStHlQAxqpw
         ViNtdPu6mzhDIhZnNpJa78t0qR7lPPzCP7a/9e7USH3aRZlbB3hct3iBfU+xAnkRwm+T
         JWblOkVtnZI7gIQcdFoAjipZfy9239Ft50a+Oyy6LAe5tAWZrZVlMZiQzBcLbFPqe44b
         hfetYDrHaqxljWpoSd2pgclK7c463Zmn9IsqjqEGMN/WmjlCmy07uP3E205iI6YzrbO9
         yPUXh7eHNwJnREfnQ5nipPi1g8PGpY9p0GTEY1GoNJvvYpEgfPN41T6xneshYG82hOd9
         fCMw==
X-Gm-Message-State: AOAM531y6KRIXfe8EGhrC0xg5jCmy+xS8gGz36VQpvZK7yvl8h/1R5oI
        tF0qQOenSm8AbVEEQiNzilc=
X-Google-Smtp-Source: ABdhPJz7VD1SHo2gupIa60LiZ1qC0cDQgbYIUx7544d4vuszHNvQtgGANWf8aQkMLhtN7iPJI960nw==
X-Received: by 2002:a05:600c:230a:: with SMTP id 10mr9050861wmo.151.1602944974299;
        Sat, 17 Oct 2020 07:29:34 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id n5sm9020860wrm.2.2020.10.17.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:29:33 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: media: atomisp: Remove unnecessary if statement
Date:   Sat, 17 Oct 2020 15:28:02 +0100
Message-Id: <20201017142810.26967-2-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017142810.26967-1-alex.dewar90@gmail.com>
References: <20201017142810.26967-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bodies of the if and else sections are the same, so just remove the
check.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 27 +++++--------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea990d4ca..92ddce409d04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5407,27 +5407,12 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		return -EINVAL;
 	}
 
-	if (asd->continuous_mode->val &&
-	    (configure_pp_input == atomisp_css_preview_configure_pp_input ||
-	     configure_pp_input == atomisp_css_video_configure_pp_input)) {
-		/* for isp 2.2, configure pp input is available for continuous
-		 * mode */
-		ret = configure_pp_input(asd, isp_sink_crop->width,
-					 isp_sink_crop->height);
-		if (ret) {
-			dev_err(isp->dev, "configure_pp_input %ux%u\n",
-				isp_sink_crop->width,
-				isp_sink_crop->height);
-			return -EINVAL;
-		}
-	} else {
-		ret = configure_pp_input(asd, isp_sink_crop->width,
-					 isp_sink_crop->height);
-		if (ret) {
-			dev_err(isp->dev, "configure_pp_input %ux%u\n",
-				isp_sink_crop->width, isp_sink_crop->height);
-			return -EINVAL;
-		}
+	ret = configure_pp_input(asd, isp_sink_crop->width, isp_sink_crop->height);
+	if (ret) {
+		dev_err(isp->dev, "configure_pp_input %ux%u\n",
+			isp_sink_crop->width,
+			isp_sink_crop->height);
+		return -EINVAL;
 	}
 	if (asd->copy_mode)
 		ret = atomisp_css_copy_get_output_frame_info(asd, stream_index,
-- 
2.28.0


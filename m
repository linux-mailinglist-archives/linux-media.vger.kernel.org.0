Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDFF341520
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbhCSFyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbhCSFx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:53:58 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9723C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:57 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m7so2959444pgj.8
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7bBizUYYzN3HQgW0K4Fq8tSkGNuVzaIR04mHPd6N77g=;
        b=H1AC9ucGadxZAm4U2ob93CWFKIDNbUVeNj2XJzkJFYUuj1Z4ACD3uxFvOtxxI9iiQj
         /0LoXpe3/TyU3iML47ghcy6s+vP89mOr3g7B+00iT9U6cuqaZ1PQ4FeMix0pjMYcYlh+
         1kVY6wgcP5Z4p5ofNcb/yXKhRMALZwibVDrj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7bBizUYYzN3HQgW0K4Fq8tSkGNuVzaIR04mHPd6N77g=;
        b=GA7l0rCOewaTaTiFOCMie///kjGySFSEu4unARLWyNpofgCH5G0Q7zqxnJfJuV7Fxs
         eQ454+W5cODc0JwfewLnmuQbModxTb+KjCNgfqdVB9rJRGf/wdkhtG43APwfyoHntuar
         KGuTP/yCKfYBXY2cQiBOgsZpCcw54mM4z/R6+65jFSwSar4keJRn3mbk1c96ZU+WH1di
         eFWZti7gMpTU7i9t2vLGVLBmZE3ZcrW/hZ/TmFGHu31JjJuiBl+8N7yV8rhKkL/foeP8
         jWHXOb/vxswUi/ZA1WDzJSrt7lhn5kYsTi/3GNrW7t9EhwQ8hgc1pLSxi1U6M2OOxIKP
         DY7A==
X-Gm-Message-State: AOAM532QpoKwPFAYVJvLhZkTUIItmWKam5AtkYxEXKAvbYnATqMNdZmY
        7tvMIGe2108nSEbyik9rw2f0hyePcKxeXw==
X-Google-Smtp-Source: ABdhPJyBASKQu5ZuY+1mAh+SW7AT0fIGNRvC2lwEGtw9hTKkG9EH4viLR11DOW0JtTN/FD5erhMhjQ==
X-Received: by 2002:aa7:96cc:0:b029:202:6873:8ab4 with SMTP id h12-20020aa796cc0000b029020268738ab4mr7536566pfq.42.1616133237574;
        Thu, 18 Mar 2021 22:53:57 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:53:57 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 3/6] media: v4l UAPI: add ROI auto-controls flags
Date:   Fri, 19 Mar 2021 14:53:39 +0900
Message-Id: <20210319055342.127308-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 defines the following Region Of Interest auto controls:

D0: Auto Exposure
D1: Auto Iris
D2: Auto White Balance
D3: Auto Focus
D4: Auto Face Detect
D5: Auto Detect and Track
D6: Image Stabilization
D7: Higher Quality
D8 – D15: Reserved, set to zero

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/uapi/linux/v4l2-common.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
index 3651ebb8cb23..34f1c262d6aa 100644
--- a/include/uapi/linux/v4l2-common.h
+++ b/include/uapi/linux/v4l2-common.h
@@ -92,6 +92,16 @@
 #define V4L2_SEL_FLAG_LE		(1 << 1)
 #define V4L2_SEL_FLAG_KEEP_CONFIG	(1 << 2)
 
+/* ROI auto-controls flags */
+#define V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_SEL_FLAG_ROI_AUTO_IRIS			(1 << 1)
+#define V4L2_SEL_FLAG_ROI_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_SEL_FLAG_ROI_AUTO_FOCUS			(1 << 3)
+#define V4L2_SEL_FLAG_ROI_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_SEL_FLAG_ROI_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_SEL_FLAG_ROI_AUTO_IMAGE_STABILIXATION	(1 << 6)
+#define V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY		(1 << 7)
+
 struct v4l2_edid {
 	__u32 pad;
 	__u32 start_block;
-- 
2.31.0.rc2.261.g7f71774620-goog


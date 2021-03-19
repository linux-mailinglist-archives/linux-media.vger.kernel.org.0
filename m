Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D1934151F
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhCSFyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbhCSFyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:54:01 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCA8C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:00 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l1so2955037pgb.5
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jyTPoXC+agDm6WJSaqjfD12BGhd0Fxr1GYMHe0K10zA=;
        b=kxXuWcZJwRjoAmyd5MBMk+3mlZzONtdXDbWaBQUKYaFy6tm4Kao0LVcVdWL6waVb2d
         UZq02baLfySUlSWCn69hYebwohAGySW/ztsDxc3x6C8a/pBGSb8UE3csE9C6ID3kIoaW
         AGoo4IJy/5na8z2ZSDc1FgyqTSeBUsdvqYeqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jyTPoXC+agDm6WJSaqjfD12BGhd0Fxr1GYMHe0K10zA=;
        b=dn34AZ355TEAWc2FGyXT/hUT5t89LMvMOjENCbQTY2HZmTzbDCYbOqjPUv1FrCksFo
         J1KRqZ4ABecQpLjCZnO9IQm1l+Jd42E7DTFi/UUIL3NqgcLoiuWGSjIHb249W3mRPqNN
         HivO0RWr5jvt7VhbPLpYVZiHdvurw39Ac7/jpyl3sMA4QWX63Goy7MlplgmHHw5AY22k
         zkgeAWVAEeWkUwjEdIyzeN8My9BD1gU8LmrP2ZuL/4cqJ39BAqDS4d8KdindTywZQcb1
         gcJVoluRpNfdSd7Wahs42LnJhAUirQRlQE8sZt+ir/6RKNdPI2WtEcTMVycgQW0tb810
         ZqTw==
X-Gm-Message-State: AOAM532Kf9SQnrcE0/NZtRewywXRIXTJyaV8/AoiLBzW+ZiTmXaSzgbm
        jbSawYEAdFaCk+YEOGI/orsZog==
X-Google-Smtp-Source: ABdhPJw9T2zzejTlLx3jjaqPgN9EwMOTRdXXODGEEtSe1op00FIxeX3UZGDXWLURWuLWgQ3wAeTgAw==
X-Received: by 2002:a63:4658:: with SMTP id v24mr9973502pgk.258.1616133240492;
        Thu, 18 Mar 2021 22:54:00 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:54:00 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 4/6] media: v4l UAPI: document ROI auto-controls flags
Date:   Fri, 19 Mar 2021 14:53:40 +0900
Message-Id: <20210319055342.127308-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document ROI auto controls.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/v4l2-selection-flags.rst        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
index 1cb1531c1e52..536d29a6c4a5 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
@@ -48,6 +48,46 @@ Selection flags
 	inside the subdevice to all further processing steps.
       - No
       - Yes
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE``
+      - (1 << 0)
+      - Auto Exposure.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_IRIS``
+      - (1 << 1)
+      - Auto Iris.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_WHITE_BALANCE``
+      - (1 << 2)
+      - Auto White Balance.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_FOCUS``
+      - (1 << 3)
+      - Auto Focus.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_FACE_DETECT``
+      - (1 << 4)
+      - Auto Face Detect.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_DETECT_AND_TRACK``
+      - (1 << 5)
+      - Auto Detect and Track.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_IMAGE_STABILIXATION``
+      - (1 << 6)
+      - Image Stabilization.
+      - Yes
+      - No
+    * - ``V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY``
+      - (1 << 7)
+      - Higher Quality.
+      - Yes
+      - No
 
 .. raw:: latex
 
-- 
2.31.0.rc2.261.g7f71774620-goog


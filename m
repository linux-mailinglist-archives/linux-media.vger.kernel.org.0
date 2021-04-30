Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6095736F93E
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhD3L1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhD3L1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:27:20 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C45C06138F
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:32 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so1564273pju.2
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PgAXsMUjjBGPRGp9xcOay+JzomkodD/BbZ1Wc3R58Q=;
        b=Oz5xbfHqolQ4qkzkrw0OZwnPcDpv2J11ep1PWMTH6smS9/7RjPD6HiO25i03bMDv3f
         pjIB/AjNQINf0U92m1pozzfj1lsg18QwC1NztJ68FLWrdtVeUNsnfCU0V0IIWHe1lXIZ
         +1l4aZ0FOZACFaoXzSqdCHmolD1S4wTjRsO48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PgAXsMUjjBGPRGp9xcOay+JzomkodD/BbZ1Wc3R58Q=;
        b=apYSC4zlI+MEfFJmk4X6GY3fG1+Z9ZMSeeJRpMjK50dasR7yi+Y8HENSeJAevFxeIm
         rKfui9EKxs5auhztJZa34wQajuEuv6cefAdUdDkdNdqs40t0M++aZnWSshml+a4V3elS
         cHiPkEDBQ4vjWdjPyZDBZhJJYVwLkZjWRieNuIMjMf8cis38RPJi1spIiN74/gkjgeUB
         2APp+ffNVegQwM57a4Q/vCDTTQIU9KF2W45OK0rpdHii45ujMxw3TVGqc30e1F4Fwi70
         Mko4wUhepS3QNvqcXvVmeQ0n2f7098qiCpFwI50BIOwCijB1kEdQ/1ajhwHpbd5NesOP
         v7og==
X-Gm-Message-State: AOAM533+sG4fNzU9TSdgmlW2gF5L0A6vOLoKxWk0wID8Yp5OAgCNBCOV
        EUE34KnV02lJGpgGAY8mB3nSdddoGfp7yg==
X-Google-Smtp-Source: ABdhPJxi+PS12sWqFpA9ygfTTwgTQO966ZUsdgGOH8dQByLrvZxvrqvr1CIyZVamW25GKBaB/tuonA==
X-Received: by 2002:a17:902:aa04:b029:ec:f779:3a2b with SMTP id be4-20020a170902aa04b02900ecf7793a2bmr4718095plb.44.1619781991688;
        Fri, 30 Apr 2021 04:26:31 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:2c33:77c9:7bef:267e])
        by smtp.gmail.com with ESMTPSA id l10sm1809457pjy.42.2021.04.30.04.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 04:26:31 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 4/5] media: v4l UAPI: document ROI auto_controls
Date:   Fri, 30 Apr 2021 20:26:10 +0900
Message-Id: <20210430112611.475039-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430112611.475039-1-senozhatsky@chromium.org>
References: <20210430112611.475039-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 defines the following Region of Interest auto_controls

|D0: Auto Exposure
|D1: Auto Iris
|D2: Auto White Balance
|D3: Auto Focus
|D4: Auto Face Detect
|D5: Auto Detect and Track
|D6: Image Stabilization
|D7: Higher Quality
|D8 – D15: Reserved, set to zero

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/ext-ctrls-camera.rst            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 4c5061aa9cd4..ab24930848b6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -217,7 +217,30 @@ enum v4l2_auto_focus_range -
     * - ``V4L2_AUTO_FOCUS_RANGE_INFINITY``
       - The lens is set to focus on an object at infinite distance.
 
+``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
+    This determines which, if any, on board features should track to the
+    Region of Interest.
 
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Auto Exposure.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
+      - Auto Iris.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Auto White Balance.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Auto Focus.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Auto Face Detect.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Auto Detect and Track.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION``
+      - Image Stabilization.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Higher Quality.
 
 ``V4L2_CID_ZOOM_ABSOLUTE (integer)``
     Specify the objective lens focal length as an absolute value. The
-- 
2.31.1.527.g47e6f16901-goog


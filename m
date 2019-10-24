Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0C6E3277
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 14:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439547AbfJXMfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 08:35:32 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:35461 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439084AbfJXMfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 08:35:32 -0400
Received: by mail-lj1-f179.google.com with SMTP id m7so24859651lji.2;
        Thu, 24 Oct 2019 05:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aw4ZEBa48VacAEFN9y8TaPTpBh5oP27JZDCSOArBGuM=;
        b=EXNJOUaXQNeSs+lM3BY9/GJbwMJGSJ/W9Ul5uVqd3069zcB6a0HdIaXEH+Q3PC0z2I
         n+Z0tGAo+g++yAfQEEmPHnSzV4rmRQGpYm8UDHcb+B1It+IN0GyHREKu0S1hwRyHT16H
         dHDkndb3LFPR/k6Huj23pjVab13uSuFH8poWpt0VfH42m5vxoqtM4JrqhKiMZrewPw/k
         nKTX8gnTsZWPXSYyrfz3SNbedOs3Y9ejAySr4Pr3oS1hrqMXzENupA1aSNxFXcs+9uZ1
         2UUsf7a9a07Q5hlTQByHCe4qLbSsZTVM4Bkgm1GGzvWjLUnKPrXOLxX23qu25IgvKRoM
         kfVw==
X-Gm-Message-State: APjAAAX6r9MaQYMTUth1hKChm2hfB/2ZFOrJL7LqaEkN6fCVfTnDw5py
        T5QQg17EDHX15OokAo24LB8Bx3ha/2g=
X-Google-Smtp-Source: APXvYqz6rjQaTekYYaj30WYjhK/X1fIpjVJeXwvVhuTn0AWh1CyIhcwpGIrvjx0Wmp4Orba1LDrXvg==
X-Received: by 2002:a2e:9d8d:: with SMTP id c13mr1274355ljj.220.1571920529803;
        Thu, 24 Oct 2019 05:35:29 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 30sm3063545lju.52.2019.10.24.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 05:35:28 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2] Documentation: media: *_DEFAULT targets for subdevs
Date:   Thu, 24 Oct 2019 14:35:25 +0200
Message-Id: <20191024123526.4778-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some sensors have optical blanking areas, this is, pixels that are
painted and do not account for light, only noise.

These special pixels are very useful for calibrating the sensor, but
should not be displayed on a DEFAULT target.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---

v2: Changes by Sakari Ailus <sakari.ailus@linux.intel.com>

Only change CROP_DEFAULT

 Documentation/media/uapi/v4l/v4l2-selection-targets.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
index f74f239b0510..41c6674ec283 100644
--- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
+++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
@@ -38,8 +38,10 @@ of the two interfaces they are used.
     * - ``V4L2_SEL_TGT_CROP_DEFAULT``
       - 0x0001
       - Suggested cropping rectangle that covers the "whole picture".
+        This includes only active pixels and excludes other non-active
+        pixels such as black pixels.
+      - Yes
       - Yes
-      - No
     * - ``V4L2_SEL_TGT_CROP_BOUNDS``
       - 0x0002
       - Bounds of the crop rectangle. All valid crop rectangles fit inside
@@ -61,7 +63,7 @@ of the two interfaces they are used.
       - 0x0101
       - Suggested composition rectangle that covers the "whole picture".
       - Yes
-      - No
+      - Yes
     * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
       - 0x0102
       - Bounds of the compose rectangle. All valid compose rectangles fit
-- 
2.23.0


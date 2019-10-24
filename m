Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF9BE2C5C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 10:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438285AbfJXIkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 04:40:18 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:39861 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfJXIkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 04:40:18 -0400
Received: by mail-lj1-f177.google.com with SMTP id y3so24075791ljj.6;
        Thu, 24 Oct 2019 01:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Zrn4WWcI5vNrLl1RubErwuUWB46t5F7U/vFToG/fo8=;
        b=rcYpLg11A2994w67Xs/oUumvIcU8+8DIVALk5JOozGrMgW4JKKiTolrwqV49fh2OEV
         WOEFnPvCS9O2/0G+yQwsEi8IOeUVwPSWViTL0niHKriQ5Np04CGBc4bX+lXRLgVbadhv
         7Q274gWtUndFVbT+aR0De6XAdqCYh4L0Tnr6kedkGPtdXbpRbwH8kOgSSrosrE1v4BMC
         5b/+S8FhyK7ZCijDMOhy91uiyEvBDDsNqbh+hFs64c7hyiZQRU1R5hs+Cin4ZSAsNWg5
         mHoEdzBUFEqztbW/WVqaklc2AfD7zKNn3ajFPjsmfYkhtHJaTE7DYxr5JuKJLTLMFRRF
         5cpQ==
X-Gm-Message-State: APjAAAUoI8JJ2XKEB1bBvloIitpWDJyVpT62dtAx+1s/CD5sppjx3Lnz
        p9z20Dlwr0VaqKPuuzx2NSs=
X-Google-Smtp-Source: APXvYqw6RnyoLYWXmsHZUdOtPYu6ONUWxY4yJ8cUt6lIP+cAZOLsmFJAI2OjhhB+bqjAZkBNjxLBtA==
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr24751683ljh.2.1571906416385;
        Thu, 24 Oct 2019 01:40:16 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id e8sm8946440ljf.1.2019.10.24.01.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 01:40:15 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] Documentation: media: *_DEFAULT targets for subdevs
Date:   Thu, 24 Oct 2019 10:40:14 +0200
Message-Id: <20191024084014.22424-1-ribalda@kernel.org>
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
 .../media/uapi/v4l/v4l2-selection-targets.rst | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
index f74f239b0510..4b356f66525e 100644
--- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
+++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
@@ -19,7 +19,7 @@ of the two interfaces they are used.
 
 .. _v4l2-selection-targets-table:
 
-.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p{1.2cm}|p{1.4cm}|
+.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{10.0cm}|
 
 .. flat-table:: Selection target definitions
     :header-rows:  1
@@ -28,49 +28,35 @@ of the two interfaces they are used.
     * - Target name
       - id
       - Definition
-      - Valid for V4L2
-      - Valid for V4L2 subdev
     * - ``V4L2_SEL_TGT_CROP``
       - 0x0000
       - Crop rectangle. Defines the cropped area.
-      - Yes
-      - Yes
     * - ``V4L2_SEL_TGT_CROP_DEFAULT``
       - 0x0001
       - Suggested cropping rectangle that covers the "whole picture".
-      - Yes
-      - No
+        This includes only active pixels and excludes other non-active
+        pixels such as Optical Blanking.
     * - ``V4L2_SEL_TGT_CROP_BOUNDS``
       - 0x0002
       - Bounds of the crop rectangle. All valid crop rectangles fit inside
 	the crop bounds rectangle.
-      - Yes
-      - Yes
     * - ``V4L2_SEL_TGT_NATIVE_SIZE``
       - 0x0003
       - The native size of the device, e.g. a sensor's pixel array.
 	``left`` and ``top`` fields are zero for this target.
-      - Yes
-      - Yes
     * - ``V4L2_SEL_TGT_COMPOSE``
       - 0x0100
       - Compose rectangle. Used to configure scaling and composition.
-      - Yes
-      - Yes
     * - ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
       - 0x0101
       - Suggested composition rectangle that covers the "whole picture".
-      - Yes
-      - No
+        This includes only active pixels and excludes other non-active
+        pixels such as Optical Blanking.
     * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
       - 0x0102
       - Bounds of the compose rectangle. All valid compose rectangles fit
 	inside the compose bounds rectangle.
-      - Yes
-      - Yes
     * - ``V4L2_SEL_TGT_COMPOSE_PADDED``
       - 0x0103
       - The active area and all padding pixels that are inserted or
 	modified by hardware.
-      - Yes
-      - No
-- 
2.23.0


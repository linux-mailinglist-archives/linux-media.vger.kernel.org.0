Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A6B92349
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfHSMR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:17:28 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37411 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbfHSMR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:17:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id f22so1466013edt.4;
        Mon, 19 Aug 2019 05:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RBGVrQg7lODbDWBtsawmxQ4QY4IjEpFAoyu7OAy/io=;
        b=GVtPfk1W6K28lXmCPbPEgQp14s1d67JLD4IpU4RIJybJvSIm0TJIXIa00bbOGTrYdn
         PjES4ITObpOcfjpXqlpxVq4Url+5ZQ+ZCRggamHiyd+7MELdv11TZQ8ghMgknasFs0gv
         UvI93m2RDwEuAAByidvTAwdnpgUoznXMQAp/LP19COk2gJpR8ugOZ6psceVAGJ5NOjqY
         tRKoYiUnOQiBVIqeoGZcYT8BhI1To0vCHyXQ8J2QOsb1pGT4/KHW2/o0kO9BpSFJGO4B
         D/7Vude9pglDWVkDj5eD/YSb+2EyfJYu+DDYjeji2x6sRS5INyPWyftJd+1lMiYqmp+c
         zlHw==
X-Gm-Message-State: APjAAAWyVcXLNBojXbIZcSNkG2BTiw6y2EqsexTWEpbXIS39QeipgF8v
        YRSYXxaiYZeIRNgWPkiLY7M=
X-Google-Smtp-Source: APXvYqzm6xvitSWj6OBDxjx0kHDaIWwA1oLt8w4SCBv2mR44HNwcKoq7XlYOLIhQoVZ1rlZ1Xs5knA==
X-Received: by 2002:a50:ba81:: with SMTP id x1mr24456369ede.257.1566217046233;
        Mon, 19 Aug 2019 05:17:26 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b31sm2753639edf.33.2019.08.19.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 05:17:25 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH 2/3] Documentation: Describe V4L2_CID_PIXEL_SIZE
Date:   Mon, 19 Aug 2019 14:17:19 +0200
Message-Id: <20190819121720.31345-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819121720.31345-1-ribalda@kernel.org>
References: <20190819121720.31345-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New control to pass to userspace the width/height of a pixel. Which is
needed for 3D calibration and lens selection.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index 51c1d5c9eb00..670c57a6f622 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -510,6 +510,12 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.
 
+``V4L2_CID_PIXEL_SIZE (struct)``
+    This control returns the pixel size in nanometres. The struct provides
+    the width and the height in separated fields to take into consideration
+    asymmetric pixels and/or hardware binning.
+    This control is required for automatic calibration of the sensor.
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.23.0.rc1


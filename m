Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EB044F01F
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 00:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhKMABF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhKMABE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:01:04 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CDCC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:58:13 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w1so44105217edd.10
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me3KQ8jToRHLQRwaqhQscq+6NjUmdg6gs+1jh4Ij1Tg=;
        b=jUyKtDR22L2iz+SH043tRJrfW+wF65dHwHd6rYfZ08MTp1bZzWljKzapfQe5X3StnV
         ZBvTGfF0Sq9dI/IxHY5Sha4QmMWULiyauGh2Vvag7uGy44P9Df0sT/XzvXC0hUn9cNW4
         Q7yH7azNjFUPcDflG9LVYa4kJxaj/vzlLgDLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me3KQ8jToRHLQRwaqhQscq+6NjUmdg6gs+1jh4Ij1Tg=;
        b=0S6iM/9ATiskBt/WS3iFWESCXwpKBxNRbevI1/joiIksucik/CAmzVLfk2e0oI4Vt8
         35QfxO1+7JKDnEAEccbqQ5yZhV//9YA34uc4dVb7y2gYJawM9h3x3dvhjx6+soPffHp8
         AKFz8JijcSyMvsifGXlTr8lyrqBWk6Kl4AKkG6h2WK04s9RpRu4ZfnO36SgMdsXkTa6a
         OK5j1qSV7P7W9PAgQxfqltEFi1iBLU2vNR9n4za0Y+T0g33svMwqps20iQr21elqxTUZ
         TvOhqi2bMgUY36D/NMVIGu9C49DfJhLOKgmJNra/rwg0l6+J7WddGMw4VpYmXCZlBrjp
         k8Jg==
X-Gm-Message-State: AOAM533Ix99JN6HRqYo9wsRXj0RRR9f4JEOfHwVdz3MW0F9PnJ35yUAb
        pw7icDbBrSaMx+hLSPRrJFGDDwi02qYE+Tln
X-Google-Smtp-Source: ABdhPJx+a07K8GrEM4Mo9aUo9z8DWUW/t4N/g+pQjxGtakjst7ukQxSkMFA5QdHVGFJn8HMCLF5kYA==
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr23598416ejp.374.1636761491486;
        Fri, 12 Nov 2021 15:58:11 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r22sm3053769ejd.109.2021.11.12.15.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 15:58:11 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        James Hilliard <james.hilliard1@gmail.com>
Cc:     Ricardo Ribalda <ricardo.ribalda@gmail.com>,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH v4] v4l2-compliance: Let uvcvideo return -EACCES
Date:   Sat, 13 Nov 2021 00:58:04 +0100
Message-Id: <20211112235804.339525-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda <ricardo.ribalda@gmail.com>

Setting a control while inactive is meant to work, but it might
not be actually written to the hardware until control becomes active.

v4l2-compliance should allow -EACCES as an error code, but only for
the uvcdriver when an attempt is made to set inactive controls.

The control framework is able to handle this case more elegantly:
it will remember the last set inactive value, and when the control
becomes active it will update the hardware. But that's really hard
to model in uvc.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.h      |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 28 +++++++++++++++-----
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 798c42213f64..4b8723e0ef0f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -84,6 +84,7 @@ bool show_colors;
 bool exit_on_fail;
 bool exit_on_warn;
 bool is_vivid;
+bool is_uvcvideo;
 int media_fd = -1;
 unsigned warnings;
 
@@ -959,6 +960,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	if (node.is_v4l2()) {
 		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
 		driver = reinterpret_cast<const char *>(vcap.driver);
+		is_uvcvideo = driver == "uvcvideo";
 		is_vivid = driver == "vivid";
 		if (is_vivid)
 			node.bus_info = reinterpret_cast<const char *>(vcap.bus_info);
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 419d1498afe4..e73ebdd3ec03 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -54,6 +54,7 @@ extern bool no_progress;
 extern bool exit_on_fail;
 extern bool exit_on_warn;
 extern bool is_vivid; // We're testing the vivid driver
+extern bool is_uvcvideo; // We're testing the uvc driver
 extern int kernel_version;
 extern int media_fd;
 extern unsigned warnings;
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 22e8decc468f..8731c9eb635e 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -485,6 +485,8 @@ int testSimpleControls(struct node *node)
 		} else if (ret == EILSEQ) {
 			warn("s_ctrl returned EILSEQ\n");
 			ret = 0;
+		} else if (ret == EACCES && is_uvcvideo) {
+			ret = 0;
 		} else if (ret) {
 			return fail("s_ctrl returned an error (%d)\n", ret);
 		}
@@ -498,7 +500,8 @@ int testSimpleControls(struct node *node)
 			ctrl.id = qctrl.id;
 			ctrl.value = qctrl.minimum - 1;
 			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
-			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE)
+			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE &&
+			    !(ret == EACCES && is_uvcvideo))
 				return fail("invalid minimum range check\n");
 			if (!ret && checkSimpleCtrl(ctrl, qctrl))
 				return fail("invalid control %08x\n", qctrl.id);
@@ -508,7 +511,8 @@ int testSimpleControls(struct node *node)
 			ctrl.id = qctrl.id;
 			ctrl.value = qctrl.maximum + 1;
 			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
-			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE)
+			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE &&
+			    !(ret == EACCES && is_uvcvideo))
 				return fail("invalid maximum range check\n");
 			if (!ret && checkSimpleCtrl(ctrl, qctrl))
 				return fail("invalid control %08x\n", qctrl.id);
@@ -521,7 +525,8 @@ int testSimpleControls(struct node *node)
 			if (ret == ERANGE)
 				warn("%s: returns ERANGE for in-range, but non-step-multiple value\n",
 						qctrl.name);
-			else if (ret && ret != EIO && ret != EILSEQ)
+			else if (ret && ret != EIO && ret != EILSEQ &&
+				 !(ret == EACCES && is_uvcvideo))
 				return fail("returns error for in-range, but non-step-multiple value\n");
 		}
 
@@ -539,6 +544,8 @@ int testSimpleControls(struct node *node)
 				ctrl.id = qctrl.id;
 				ctrl.value = i;
 				ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
+				if (valid && ret == EACCES && is_uvcvideo)
+					continue;
 				if (valid && ret)
 					return fail("could not set valid menu item %d\n", i);
 				if (!valid && !ret)
@@ -551,15 +558,18 @@ int testSimpleControls(struct node *node)
 			ctrl.id = qctrl.id;
 			ctrl.value = qctrl.minimum;
 			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
-			if (ret && ret != EIO && ret != EILSEQ)
+			if (ret && ret != EIO && ret != EILSEQ &&
+			    !(ret == EACCES && is_uvcvideo))
 				return fail("could not set minimum value\n");
 			ctrl.value = qctrl.maximum;
 			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
-			if (ret && ret != EIO && ret != EILSEQ)
+			if (ret && ret != EIO && ret != EILSEQ &&
+			    !(ret == EACCES && is_uvcvideo))
 				return fail("could not set maximum value\n");
 			ctrl.value = qctrl.default_value;
 			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
-			if (ret && ret != EIO && ret != EILSEQ)
+			if (ret && ret != EIO && ret != EILSEQ &&
+			    !(ret == EACCES && is_uvcvideo))
 				return fail("could not set default value\n");
 		}
 	}
@@ -731,6 +741,8 @@ int testExtendedControls(struct node *node)
 			} else if (ret == EILSEQ) {
 				warn("s_ext_ctrls returned EILSEQ\n");
 				ret = 0;
+			} else if (ret == EACCES && is_uvcvideo) {
+				ret = 0;
 			}
 			if (ret)
 				return fail("s_ext_ctrls returned an error (%d)\n", ret);
@@ -807,6 +819,8 @@ int testExtendedControls(struct node *node)
 	} else if (ret == EILSEQ) {
 		warn("s_ext_ctrls returned EILSEQ\n");
 		ret = 0;
+	} else if (ret == EACCES && is_uvcvideo) {
+		ret = 0;
 	}
 	if (ret)
 		return fail("could not set all controls\n");
@@ -837,7 +851,7 @@ int testExtendedControls(struct node *node)
 		warn("s_ext_ctrls returned EILSEQ\n");
 		ret = 0;
 	}
-	if (ret && !multiple_classes)
+	if (ret && !(ret == EACCES && is_uvcvideo) && !multiple_classes)
 		return fail("could not set all controls of a specific class\n");
 	if (ret != EINVAL && multiple_classes)
 		return fail("should get EINVAL when setting mixed-class controls\n");
-- 
2.34.0.rc1.387.gb447b232ab-goog


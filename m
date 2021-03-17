Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB0C33F2B7
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 15:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhCQOfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 10:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbhCQOe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 10:34:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E1BC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 07:34:57 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r17so2935170ejy.13
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQRsmjMpVdA2mzEFPqun5G5Et06ZHPC3vWQZL13lhaw=;
        b=magiM1QYjKPKzZyjH+rjdcEomIZVS6upibIKCA04AOv17xy/+zS64jidnxkqCDwXxt
         sY3K7X8HYFmnaNOm0/5h4sjxXH/MMXhtiDInw2e2bZAO34/ZarDM4sROkZTXv1qjp2SK
         oP4/BF3bzQmtF1AGqJhm3xSEp72rHdD7be8D/I/qkVXLKn1L3oaB9yAAfxJUry4afDHe
         kora6/A0LzNd4KOyk7w4OeVcmV3s49g9rwZbiqAULH8/Iy8b5ilBI/br82TztU/wl6gb
         RIQIKZQT1VJPsDxDnS9e9DRuF1KKtRu+PvB2Lf17z9fjEEXSJ8h6ToLf/1uOGAEpxw53
         4j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQRsmjMpVdA2mzEFPqun5G5Et06ZHPC3vWQZL13lhaw=;
        b=nKtEpIl7XDRPJILldbr8XEQttXdWb7iViANOsMXGDNo5CodMYLJR6z+lcrge6dxjD4
         nWK7f+Je5BzfsW6+m7cbSYnZEw/JSCwfwbw6c0IdzY7VuXyGR//dtJMVT7h01ueBCB1V
         dlgIe+g9iGsKJ/cCuI/KTY/Yh0iC8iJzRN6hZ8LxyJsAnX7KGLXrHUnTbaiA6nibDLlC
         dmzxYESzzQP7zrpGadYVburtqG9gwh2T+9yUCMptq1yqID4NUAXO1rVLtgzxTLvAD93S
         oMjf2LhXFzd5pqb5T6KlNOhp9tDMV994PwlofQerFOoCuJRSZg9XArea2joLaOOpyeoF
         imBQ==
X-Gm-Message-State: AOAM533k/PWg7B1IUAa3t1WpxF5gAuX7Ynxw98G8Z4mO6cBx81gT8YCy
        xwJUFRXY/QPKlHFRkxi1XOIBGnSar5W5dA==
X-Google-Smtp-Source: ABdhPJyUKZ8S9D4fPv8/yIEFl9KTzXRwJsGjpWBGwMVWzXSDtQcYtdyVvyPy3PdZIiKZlZqEX41sLg==
X-Received: by 2002:a17:906:4c56:: with SMTP id d22mr36839551ejw.426.1615991696100;
        Wed, 17 Mar 2021 07:34:56 -0700 (PDT)
Received: from piling.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t15sm13430196edc.34.2021.03.17.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:34:55 -0700 (PDT)
From:   Ricardo Ribalda <ricardo.ribalda@gmail.com>
X-Google-Original-From: Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH v3] v4l2-compliance: Let uvcvideo return -EACCES
Date:   Wed, 17 Mar 2021 15:34:53 +0100
Message-Id: <20210317143453.483470-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

v2 changelog (Thanks Hans!):

Missed case:
For the 'if (qctrl.step > 1 && qctrl.maximum > qctrl.minimum) {' section an
EACCES check is also needed (it fails there for my Logitech webcam).


 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.h      |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 26 +++++++++++++++-----
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 9f71332c..1c21197b 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -84,6 +84,7 @@ bool show_colors;
 bool exit_on_fail;
 bool exit_on_warn;
 bool is_vivid;
+bool is_uvcvideo;
 int media_fd = -1;
 unsigned warnings;
 
@@ -958,6 +959,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	if (node.is_v4l2()) {
 		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
 		driver = reinterpret_cast<const char *>(vcap.driver);
+		is_uvcvideo = driver == "uvcvideo";
 		is_vivid = driver == "vivid";
 		if (is_vivid)
 			node.bus_info = reinterpret_cast<const char *>(vcap.bus_info);
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4d5c3a5c..db4790a6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -50,6 +50,7 @@ extern bool no_progress;
 extern bool exit_on_fail;
 extern bool exit_on_warn;
 extern bool is_vivid; // We're testing the vivid driver
+extern bool is_uvcvideo; // We're testing the uvc driver
 extern int kernel_version;
 extern int media_fd;
 extern unsigned warnings;
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 4be2f61c..1e8e79c3 100644
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
@@ -806,6 +818,8 @@ int testExtendedControls(struct node *node)
 	} else if (ret == EILSEQ) {
 		warn("s_ext_ctrls returned EILSEQ\n");
 		ret = 0;
+	} else if (ret == EACCES && is_uvcvideo) {
+		ret = 0;
 	}
 	if (ret)
 		return fail("could not set all controls\n");
-- 
2.30.1


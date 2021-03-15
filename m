Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3DC33C413
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhCORZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbhCORZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:25:35 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23775C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:25:35 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w18so18300016edc.0
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+I8QL8C0mxbXQ9Zt8SJ9NlyxXEoqLAZAChSEh2V/9AE=;
        b=qOLcluzl6vo9eF6fxBKOwJ8BlmlJQseRO0At331d3pjaqXuba1ISniLAzsJStOSTlp
         GNXAjmsFdAqrFBh29Se61hX2hbUICvNNpadpErZ/UVfXqxn1/VfTdQJ0kJaBMSRIM/K7
         PJ9eI02dIpm6P7JPuPUVQtiiH2dTqfx7aZNK8Ffxs43P0bBcfntkj4hHjpYN9m4RUHtp
         SmHElJiU8hS8hy3VZmEx7YvVpTyeNqh+Cz41QvGz7H71eePxyj/00xpCaqHKObPovSOK
         pyEudQOu4y+FPYiiVNKwQft/HxfdQazxZ9Gg6euL+tO251coFWuM+iwWs1IQwvWyhLwR
         6eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+I8QL8C0mxbXQ9Zt8SJ9NlyxXEoqLAZAChSEh2V/9AE=;
        b=pnchhNn7RiliXAcHcOFaqnFkPrhmSwPB+eBmFzCXlopvHywHBAxNFct6WvT3pC2Ira
         BVweXWZHxe9yv3xrQSw/Oh2fWhNp8sloW588CBlfo5amxg7wYXWQSQ9BnEMG2X3i10aV
         qntQobxqvDFfV1xAaTTp5Vp7s27cP6G5Sq/KeKJhx3+BjN6a8H/2cnXhGZY3ZiOLMiKA
         0NK0BTowncn8HtDCpmEKLW6jQ3Ht87Dxqp/XWMEcLRX1qiA4p6GKROKFsh/elNBzDuoG
         ZhCpDdd4ybzE4sQap5ZuHcvpRquBuVdnVphD5RuAZagwXIU4rduyzDhyiIQ9BbfXIxM5
         85Xw==
X-Gm-Message-State: AOAM530wiqDhicS6sL+XZME9RDyQ+P+jpdO8k5dKN//4XavuTX2HKIY7
        PyxjYzQqqI8jf0VYsqTQCRDUjyuce4rS9g==
X-Google-Smtp-Source: ABdhPJxorFSkKicoQ6nx7iRVYZwFTcspQKDIogIL2UFnav/e+5Xw5EhYFZYJ4Eis+GdlX5mDn+u0Dw==
X-Received: by 2002:a05:6402:35d3:: with SMTP id z19mr31074579edc.143.1615829133864;
        Mon, 15 Mar 2021 10:25:33 -0700 (PDT)
Received: from piling.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id v22sm7894689ejj.103.2021.03.15.10.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:25:33 -0700 (PDT)
From:   Ricardo Ribalda <ricardo.ribalda@gmail.com>
X-Google-Original-From: Ricardo Ribalda <ribalda@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH] v4l2-compliance: Let uvcvideo return -EACCES
Date:   Mon, 15 Mar 2021 18:25:31 +0100
Message-Id: <20210315172531.101694-1-ribalda@chromium.org>
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
 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.h      |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 21 +++++++++++++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

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
index 4be2f61c..70a8353a 100644
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
@@ -551,15 +555,18 @@ int testSimpleControls(struct node *node)
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
@@ -731,6 +738,8 @@ int testExtendedControls(struct node *node)
 			} else if (ret == EILSEQ) {
 				warn("s_ext_ctrls returned EILSEQ\n");
 				ret = 0;
+			} else if (ret == EACCES && is_uvcvideo) {
+				ret = 0;
 			}
 			if (ret)
 				return fail("s_ext_ctrls returned an error (%d)\n", ret);
@@ -806,6 +815,8 @@ int testExtendedControls(struct node *node)
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2DF633F001
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 13:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhCQMI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 08:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhCQMI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 08:08:27 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEBFC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 05:08:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z1so1929825edb.8
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+m82PFYackWNEdg+4B4vOZLDKXRQYokgiN02dws828=;
        b=NeS4WSfc/V1dZ6oiHb7LAvig3rgzR1p7wwKQ2ExJKCKqlWyfspevsGqJGi/P4TwNgD
         EGMtwXMJAOHK6+zyPLMbjeiW9FY59RNXofbaCiS6NjW8ycnoW+drxz5kMfhAOD7cZ+fI
         YXuGcDMi5ZNM942VUw+Zq8KoE+O4naJkaNAA5tOwrRLEDr7DJiu5X/d5nkD/IG9tTve3
         xC9sePr9cN7JxY3R9QLfZb4DMzR1eHtl5m9qCxRZ9XWZdEUR0nahlR+Pm/1I5ycXYPwZ
         BRQpaILJdC9wqvP2oZ31v6MAdKRjE00TpYPjj6NtHmUNfdvg4GgWipSnbBNhBhTbn4o0
         Z/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+m82PFYackWNEdg+4B4vOZLDKXRQYokgiN02dws828=;
        b=hpnusIXBV5pcZDhpimn83nzpT9CNrPV4d6+7cBabxOIkPvPOzlYFItUDHBZstvRPqs
         bOkeqIPJ+0Y1t1tDYZAGMdzKYMk41YY6nyCIGoA5Cwc0L4dniwVLHXf/og9KXK5u2N53
         oWpvTP0hSfCDvJflch+6Hd6vN3k005aQqlBNCo0+r09W0KgpBl9iJvCZoszDx49uZCTv
         RftmQsR6/kXWqp1Z/pSzwkS+IEWSanbKduEeqOBDt+GVRzGdO/ILU8q4UQJGH4MMQlsc
         fwameD/Z2aTd5BpE34z6WL0+t36X7CVCVSxqUJMXjrY8UojbWFx1jNWrF41NCEwDzNIO
         /pgA==
X-Gm-Message-State: AOAM531fVR7C9KYq64H7mOcx0RVLeq+HtUDaXcd9VQpvuTIlrfpshYf9
        GILIXr6hurZSj/i5cHkA1ASR4ej7X5bwew==
X-Google-Smtp-Source: ABdhPJw8BOSJJfT8bLFbF7hs8SEVJ7PCg0kR/SCrsBHj36LeR0jQ784CyNblRtVUUvhIePVNVVSoiA==
X-Received: by 2002:aa7:c94b:: with SMTP id h11mr17946546edt.160.1615982894273;
        Wed, 17 Mar 2021 05:08:14 -0700 (PDT)
Received: from piling.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id lx6sm11322382ejb.64.2021.03.17.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:08:13 -0700 (PDT)
From:   Ricardo Ribalda <ricardo.ribalda@gmail.com>
X-Google-Original-From: Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH v2] v4l2-compliance: Let uvcvideo return -EACCES
Date:   Wed, 17 Mar 2021 13:08:12 +0100
Message-Id: <20210317120812.292261-1-ribalda@chromium.org>
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

Changelog v2:
- Also fix MENU and INTEGER_MENU

 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.h      |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 23 +++++++++++++++-----
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 4be2f61c..511a76a5 100644
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
@@ -539,6 +543,8 @@ int testSimpleControls(struct node *node)
 				ctrl.id = qctrl.id;
 				ctrl.value = i;
 				ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
+				if (valid && ret == EACCES && is_uvcvideo)
+					continue;
 				if (valid && ret)
 					return fail("could not set valid menu item %d\n", i);
 				if (!valid && !ret)
@@ -551,15 +557,18 @@ int testSimpleControls(struct node *node)
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
@@ -731,6 +740,8 @@ int testExtendedControls(struct node *node)
 			} else if (ret == EILSEQ) {
 				warn("s_ext_ctrls returned EILSEQ\n");
 				ret = 0;
+			} else if (ret == EACCES && is_uvcvideo) {
+				ret = 0;
 			}
 			if (ret)
 				return fail("s_ext_ctrls returned an error (%d)\n", ret);
@@ -806,6 +817,8 @@ int testExtendedControls(struct node *node)
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


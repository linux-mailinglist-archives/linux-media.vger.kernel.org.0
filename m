Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059EB77F12B
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348456AbjHQH0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348466AbjHQH0P (ORCPT
        <rfc822;linux-media@vger.Kernel.org>);
        Thu, 17 Aug 2023 03:26:15 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D9B1BE7
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:13 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58daaa2ba65so9750477b3.1
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692257173; x=1692861973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vd0LT39H/TFsKaBJhSRGWPMSPLXWCHHW1OrDh0cpK1I=;
        b=DeziKXlGR3UAkJsWttsfeI4EcVGJeAX7iflP7jEmBYMtGCktkmAwC06eO12/8ha5VU
         qH0uC73ZDTQEsbgfAUkjfjcy/oiI04KWJaeAaVUZjUtb/2hw173idlr2fhAXf53BMAcj
         owUnsuoGMhoOAJaNdDPTNN2cG7RfJOX82oC+70gjNRIh30OFLYxqkfMjs9yX5Hb/XdEo
         tjKg6aOKBB6msOwwIr1ZCKN6j/OXejEiXd4STqntWUUWavJOpUgNFwasUJ9swzjgtUnf
         PV4dseHzDx+oBrsATwkXx0PzYPSoQhgEVlLp2XBNcRoAuV67c9k1M7+p546OYPnmgq5R
         P69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257173; x=1692861973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vd0LT39H/TFsKaBJhSRGWPMSPLXWCHHW1OrDh0cpK1I=;
        b=eNbSzkM5tYx0MSIk1RI+KJAmmNhLxOTg2LYHkbeKa5wPDna4acLJfJKTE58lb7BP23
         jWCnSr1HglilkpLMejMa+l3mYWLno1Bmi+HrUDqlA0TmEUzydBqgmrqMSIrjTeAbT70x
         6ZMz1g0If/0wr/ZnBh50OYQ2gPXHftkajOqtMwWWZGTnegVcrF9GpTkZBJXVdv8U1zUs
         keqm9bO6i2hR4iYiPPSfD9On6CLQVtAH6K12ijoZqMw/duMts0rnaxDVqyMWfpxQik45
         Wpc57LwiA7yjh6MFLU20S4hXKaU2UsSSWOxnxRMS2pUyqp6IUBl5NwAVta7OZ5951q6p
         CZ/w==
X-Gm-Message-State: AOJu0YxWd9915FAuM1ep+MHo7UB0ED90uCCtKobLhZ1a8frj4APHvZYk
        wy/HbejlKCIE/H0UdSSlDGaD5fRmW3A4lPoQBp4eNC2JdUgcDhJ7lOjtmdILTBplhrjEHkGXtd4
        T0CpsFYAYv+IhGvp7oPUIbfzoWFR4jGNTwtVGYfKYKLZQNwV/nNplqOTqrAxGe830ph08
X-Google-Smtp-Source: AGHT+IGZVeth5gqJGduq0ICd9RyiJWHziJNKASOyA51VwbWx5OiB3pzf/0h7YJLEB1agvEwFAJjOmOHiLMY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a81:b245:0:b0:589:9d51:c8c0 with SMTP id
 q66-20020a81b245000000b005899d51c8c0mr54138ywh.2.1692257172516; Thu, 17 Aug
 2023 00:26:12 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:25:36 +0900
In-Reply-To: <20230817072537.2837504-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817072537.2837504-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817072537.2837504-3-yunkec@google.com>
Subject: [PATCH 2/2] v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL
From:   Yunke Cao <yunkec@google.com>
To:     linux-media@vger.Kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add string name for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX.

Test that V4L2_CTRL_WHICH_MIN/MAX_VAL behaves as expected.
1. Calling G_EXT_CTRLS successes when V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX is set
   and returns -ENVALID if the flag is not set.
2. S_EXT_CTRLS and TRY_EXT_CTRLS always return fail.

Tested with VIVID:

./v4l2-ctl -l -d 0
...
		     area 0x0098f90b (area)   : value=1000x2000 flags=has-payload
read_only_integer_32_bits 0x0098f90c (int)    : min=0 max=255 step=1 default=0 value=0 flags=read-only, has-min-max
        u32_dynamic_array 0x0098f90d (u32)    : min=10 max=90 step=1 default=50 elems=1 dims=[100] flags=has-payload, dynamic-array
	   u8_pixel_array 0x0098f90e (u8)     : min=0 max=255 step=1 default=128 dims=[640][368] flags=has-payload
      s32_2_element_array 0x0098f90f (int)    : min=-10 max=10 step=1 default=2 dims=[2] flags=has-payload, has-min-max
      s64_5_element_array 0x0098f910 (int64)  : min=-10 max=10 step=1 default=4 dims=[5] flags=has-payload, has-min-max
		     rect 0x0098f911 (rect)   : value=300x400@200x100 flags=has-payload, has-min-max
...
./v4l2-compliance -d 0
...
Total for vivid device /dev/video0: 113, Succeeded: 113, Failed: 0, Warnings: 0

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 include/linux/videodev2.h                    |  3 ++
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 29 ++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index a27ea755..28a54e18 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1801,6 +1801,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -1903,6 +1905,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 4f8c2aa7..b8785245 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -530,6 +530,7 @@ std::string ctrlflags2s(__u32 flags)
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
 		{ V4L2_CTRL_FLAG_DYNAMIC_ARRAY, "dynamic-array" },
+		{ V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX, "has-min-max" },
 		{ 0, nullptr }
 	};
 	return flags2s(flags, def);
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index d7f6be43..e07269e6 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -973,6 +973,26 @@ int testExtendedControls(struct node *node)
 		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
 		    checkVividDynArray(node, ctrl, qctrl))
 			return fail("dynamic array tests failed\n");
+
+		ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
+			if (ret)
+				return fail("g_ext_ctrls return an error when using WHICH_MIN (%d)\n", ret);
+		} else {
+			if (ret != EINVAL && ret != EACCES)
+				return fail("did not check against HAS_WHICH_MIN_MAX\n");
+		}
+		ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
+			if (ret)
+				return fail("g_ext_ctrls return an error when using WHICH_MAX (%d)\n", ret);
+		} else {
+			if (ret != EINVAL && ret != EACCES)
+				return fail("did not check against HAS_WHICH_MIN_MAX\n");
+		}
+
 		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
 			delete [] ctrl.string;
 		ctrl.string = nullptr;
@@ -1084,6 +1104,15 @@ int testExtendedControls(struct node *node)
 	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
 	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
+	ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
+	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+
 	return 0;
 }
 
-- 
2.41.0.694.ge786442a9b-goog


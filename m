Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E78B5EECAE
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 06:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbiI2EME (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 00:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiI2EMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 00:12:02 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E986C60CD
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 21:12:00 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 70so205696pjo.4
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 21:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date;
        bh=STj+8SEfgS7lcB+faqFMRz9NJZkvwlKuwcm00sEGhU8=;
        b=lNR0fLJzXCnG+wp5+Jdwv/09D82ui3MgrLOOvMJN45VDqdrcOU8qvekS4ldycAjkgs
         syjz7hwKGLdkfKFzbei5ajU5F+H6Cci4Ad9TiBpilHqANACWkP5gbOGhx6XL0eOUbBln
         mxRKeJiuZA/U08yiVZb88Ecln0EUx0rRirhLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date;
        bh=STj+8SEfgS7lcB+faqFMRz9NJZkvwlKuwcm00sEGhU8=;
        b=EVGGU5Ttt0ziAXTbbpzPHbMbOvi1pl75NsnCxEFwZn/ceO8kmIYt4O3AOClTnzdfKF
         TdtHA9Ks2LU88xmweRGtWidHmKPfGKR6CmHKixMPW0uKF9b1lkVUiGe46sfBk0lN9etk
         /zOAPje19SELGsj8ttuiZ6bpNyvq7MTpfgs0rpD52saWYhe8sy3OUeVR0jd5MqsMByH/
         8GYfmLXEIJWj/58Sn7d5CTE3bpRv6g+84DDGdL3JHRLU28Ej9RHV088/6xnVmicBehrv
         CINZNM0gMoAP+wBjOb35jz7xIXHvHPSDQH0B6ZD0b1A4+51Fb8fROwlwhb/pZJltBqu9
         /e/g==
X-Gm-Message-State: ACrzQf2nEBubKHdKfqPgQeneagsOs/NTHeVk22kS+gN64ft7pHRDvQhL
        BYcD53B/CiBu1FMB976lYA9tdQ==
X-Google-Smtp-Source: AMsMyM4jCj6kK6IvM1Li6tTiCkuA4pJ7x9+4FBQ2MrrymNe4TLO0s6tDCfmZnlpNwteUwg+C2iUgnA==
X-Received: by 2002:a17:903:248:b0:172:7520:db07 with SMTP id j8-20020a170903024800b001727520db07mr1481613plh.76.1664424720487;
        Wed, 28 Sep 2022 21:12:00 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9375:8953:1af9:fa00])
        by smtp.gmail.com with ESMTPSA id j3-20020a63ec03000000b0043057fe66c0sm4436914pgh.48.2022.09.28.21.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 21:11:59 -0700 (PDT)
From:   Yunke Cao <yunkec@chromium.org>
Date:   Thu, 29 Sep 2022 13:11:55 +0900
Subject: [PATCH] Remove priv_user_controls in v4l2-test-controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunke Cao <yunkec@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-4d321
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removing priv_user_controls and its related checks.

I suspect this is wrong because:

1. priv_user_controls == priv_user_controls_check is not always true.

priv_user_controls counts the number of controls with
id >= V4L2_CID_PRIVATE_BASE (0x08000000).
priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).

The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
priv_user_controls_check, but not priv_user_controls. For example,
V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).

2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
priv_user_controls will not happen.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
---
 utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 999dbcd7..18c9f638 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
 	__u32 which = 0;
 	bool found_ctrl_class = false;
 	unsigned user_controls = 0;
-	unsigned priv_user_controls = 0;
 	unsigned user_controls_check = 0;
 	unsigned priv_user_controls_check = 0;
 	unsigned class_count = 0;
@@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
 		user_controls++;
 	}
 
-	for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
-		memset(&qctrl, 0xff, sizeof(qctrl));
-		qctrl.id = id;
-		ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
-		if (ret && ret != EINVAL)
-			return fail("invalid query_ext_ctrl return code (%d)\n", ret);
-		if (ret)
-			break;
-		if (qctrl.id != id)
-			return fail("qctrl.id (%08x) != id (%08x)\n",
-					qctrl.id, id);
-		if (checkQCtrl(node, qctrl))
-			return fail("invalid control %08x\n", qctrl.id);
-		priv_user_controls++;
-	}
-
-	if (priv_user_controls + user_controls && node->controls.empty())
+	if (user_controls && node->controls.empty())
 		return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
 	if (user_controls != user_controls_check)
 		return fail("expected %d user controls, got %d\n",
 			user_controls_check, user_controls);
-	if (priv_user_controls != priv_user_controls_check)
-		return fail("expected %d private controls, got %d\n",
-			priv_user_controls_check, priv_user_controls);
 	return result;
 }
 

---
base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
change-id: 20220929-remove_private_control_check-ab8cc38a1b9e

Best regards,
-- 
Yunke Cao <yunkec@chromium.org>

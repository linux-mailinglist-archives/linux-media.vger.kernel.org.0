Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6F21AB674
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 06:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgDPEAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 00:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgDPEAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 00:00:08 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B89C061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:00:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g32so1027232pgb.6
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sDltP+igphxYsUIFw0dEwd7kyA7vC4TJJOeE5tyTwnY=;
        b=WTbLL+fj06q/l5PbBC2JDQh2K+e40ocX6wNhdaC0fee8wcsAt6avNpbhktij2H6fyY
         jWrPyNGK8jM20xPGK4SZyIPJ3RaFKvTfua8fzlBcTjXYBcEetoXApHdCaFxZgY3j3cIE
         pehCghzClvAy1HIQnTjRV5xLcrCCLnPTDC7J9jbPhCwleAFbdUeOX2HCWNLyPfFkN+tP
         Y8jy3qAFiEDs7N6Exq0CpdedeYIksAIcbVu633M4w0U9ywvLQ+RB1mXkP+AmqOzh19Me
         Kxq+yrCI86wCrv6DbWFOtaaGXhq5PobrjiEWus2bee/PMLI4+/68qknTIjOZ85ubutm1
         UCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sDltP+igphxYsUIFw0dEwd7kyA7vC4TJJOeE5tyTwnY=;
        b=PO263pf07NzGIQxJsoIsUPicvAG/ssG1FbTcPK7R7EHOxKezfLtF+34izucnGf3zqm
         ykEkCLI8xfPBGG27sTGvpYGhQSfBw/XrNW7kWjN1pm6z9/wrjiltZpnwed31uiQP3rzW
         LdOFeXvqyVLycPB6G9X4oidBgYPGambA8I2Zu3mKw9OmrmG9Ycoll7dHuvheUnGUOVYu
         UqyPOid+7nPO/dmWIIAd/iAf4tOeRWL9uAWCQG9X19wm5MFTWj5/E9BbT4dX8pvMN01S
         eC8bQkquq1c2LpQfiDGpy+hu04dHcQNVFoi8nDCnkh7YZATqllZeXCMoo/2Zerh8CtTU
         O3zQ==
X-Gm-Message-State: AGi0PuZ9/Zzoy+40QXhSBwL0sQebxEFY4iZcdVUx9vmqd2qEB0d1dCPB
        me624m3b/RrlcuLwZgLplkAVJT7g
X-Google-Smtp-Source: APiQypKALU1jWLpcnvde+On4j89xFBmb9k6YAX9dVb33Lah9vGLwWdQOzDCFRBTi6WZ76uz6+WIEeg==
X-Received: by 2002:a63:c00f:: with SMTP id h15mr17521460pgg.63.1587009608051;
        Wed, 15 Apr 2020 21:00:08 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id o1sm3339845pfh.130.2020.04.15.21.00.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 21:00:07 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: fix redundant expressions
Date:   Wed, 15 Apr 2020 21:00:05 -0700
Message-Id: <20200416040005.387849-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also fix a subtle bug.

Found with clang-tidy's misc-redundant-expression

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libv4lconvert/tinyjpeg.c              | 2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libv4lconvert/tinyjpeg.c b/lib/libv4lconvert/tinyjpeg.c
index a0c3b0c8..070c92db 100644
--- a/lib/libv4lconvert/tinyjpeg.c
+++ b/lib/libv4lconvert/tinyjpeg.c
@@ -2048,7 +2048,7 @@ static int parse_JFIF(struct jdec_private *priv, const unsigned char *stream)
 		error("Sampling other than 1x1 for Cr and Cb is not supported\n");
 	if ((priv->flags & TINYJPEG_FLAGS_PLANAR_JPEG) &&
 			((priv->component_infos[cY].Hfactor != 2)
-			    || (priv->component_infos[cY].Hfactor != 2)))
+			    || (priv->component_infos[cY].Vfactor != 2)))
 		error("Sampling other than 2x2 for Y is not supported with planar JPEG\n");
 #endif
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 773c848c..bb32bae6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1040,7 +1040,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	else if (media_fd >= 0)
 		ent_id = mi_media_info_for_fd(media_fd, node.g_fd(), &is_invalid);
 
-	if (ent_id && ent_id != MEDIA_ENT_F_UNKNOWN) {
+	if (ent_id != MEDIA_ENT_F_UNKNOWN) {
 		memset(&node.entity, 0, sizeof(node.entity));
 		node.entity.id = ent_id;
 		if (!ioctl(media_fd, MEDIA_IOC_ENUM_ENTITIES, &node.entity)) {
-- 
2.25.2


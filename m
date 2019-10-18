Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9620DC88D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410569AbfJRPb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:31:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44329 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410487AbfJRPb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:31:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so6633639ljj.11
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2019 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsK0qBHyUMKU/EdKwwPiap0MZv2z/RxBZXIjDQMzJ+w=;
        b=kMKepBpN8Fx5S4KEFOReiXrYYq3RMMhi6mxaO3/sgLJZvOJlbdHUGfD0eeF+E/qRtZ
         TdCyco+nZ7hcCmq7nJW0WsyAHIUVQ7qCiAbGW7+hWwZVGvpyMDAsZ5S8Czfp30vcF6w6
         a5jHwzxIZh+OewhIfLb4JN8k10F33ShbeJLSyKacCuLsNDQ68IMhA1T8KomZHeNkVF+v
         fy2EofOtFq7Ejb4RAE2v8ovMEa1FLJo72XGSe8tQaLCcwzp4j46q7izfqvzvq7VOicp6
         QH+mwtPfwhaZ4SNtehWwoBNz6TGqi8rC0m9ADkJLQOqXIk9pVx6BB+dtTUiJBRrfYM8m
         NKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsK0qBHyUMKU/EdKwwPiap0MZv2z/RxBZXIjDQMzJ+w=;
        b=LLLbg/LvnWhflkHA4ClOlDn53t88GhOw4iO74212Hcc0HHWf32pHYiOfWSOKjslsdk
         pRb2D9rEwaeUCmrm0hpiwY0naZqi6uXbiGD12xgteOiWxrRd8Qyl45QAzn47BsIWxHaC
         x/k7y6mcv59GqUNJHnmyyBXALCbBYEa6hm4gt8OtI1TZu8bJmXR3WyDhpXmqA7X6DPPs
         4iTWWtFkQX0OTaO6UCAQj0BNpMBYh9UA+BL+iOSjqlyMHe2SB0q2bhvtTYazvpdNeJun
         PloIR7X28RdGzo2y+H2nYsbimurFoJDEVAbMokPj9yfWKX3/KuudkAvUp8Z0TFUzzogd
         vQow==
X-Gm-Message-State: APjAAAXz4OwA7hGewZCVhMJD3bwZB9N3rIe4U+f4OJNg5Vrm2Tr5wxML
        wQgHz7S/Dc2DqwInMuYXaRE=
X-Google-Smtp-Source: APXvYqxMZ7511qsCsVxrABp8n0c6vctGwgAvK0FasCv2jEW7FUXAv0zZRDV5Yi9mzHLYMurpHXdaGQ==
X-Received: by 2002:a2e:750c:: with SMTP id q12mr6502030ljc.138.1571412714740;
        Fri, 18 Oct 2019 08:31:54 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id k23sm2902060ljc.13.2019.10.18.08.31.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 08:31:54 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] media: v4l2-subdev: Don't use __u32 internally
Date:   Fri, 18 Oct 2019 17:31:40 +0200
Message-Id: <20191018153140.594-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
v4l2_subdev_call()") and commit 374d62e7aa50 ("media: v4l2-subdev:
Verify v4l2_subdev_call() pad config argument") introduced a few local
functions, unfortunately with arguments of type __u32, reserved for use
in Linux uAPI.  Use u32 instead.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f725cd9b66b9..9e987c0f840e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -112,7 +112,7 @@ static int subdev_close(struct file *file)
 	return 0;
 }
 
-static inline int check_which(__u32 which)
+static inline int check_which(u32 which)
 {
 	if (which != V4L2_SUBDEV_FORMAT_TRY &&
 	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
@@ -121,7 +121,7 @@ static inline int check_which(__u32 which)
 	return 0;
 }
 
-static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
+static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 {
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	if (sd->entity.num_pads) {
@@ -136,7 +136,7 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 	return 0;
 }
 
-static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
+static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
 		return -EINVAL;
-- 
2.21.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647E91C1B6D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729963AbgEARQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729951AbgEARQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:31 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE7EC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so3838510plk.10
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aulrQ6oHsIqioAIw97gNvp4/kCTJRc3i88m+9ebFRaM=;
        b=bLBHpG6M0dca4W9s4ixDuPHJu40MtnCkjhbN88og0aBxS2IVatu5zDyK9o1w84x0bz
         wemPs7bqkKv1WU9CUE1xfXyFx2RwlIGSkcbsLo2ej46VSVLFAqTakPqqj3d7uUR3wH+X
         y8JGSbwJvMbQODiO0TMYo17V4kq99x8VrxT0x6iem8O7OEbxJyQnqlWTj0SqWUvCt6u+
         C51p2cBcFEG1X4ln2sGNbRaaa2WctESJ9SMjKjj0hRdMlvYtuXyNdA3gKyKpPqLUozh4
         o/KGsO84rxoKLKma6utCojzjg3ye8bwQd6XFTGVLSixY7P5jjNTvmCoGgTeal2ZwgyBf
         mdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aulrQ6oHsIqioAIw97gNvp4/kCTJRc3i88m+9ebFRaM=;
        b=lrWZCPQEI6KAx/6COt7krL5vjSEZldGLluDT/MdgY2Jg+EGtVdmoMlq2kN78Xc3LsH
         xGNR3hUn/TGJjPUJjerl41HAYNd8ZG+//isLrj9yr+bCrLroaO+KP9a+7fL8pNgJ2Bo0
         oIJzr0so3MRTfGXat8X4tIrcGBHoeyyrD4ZGBO5/U7nOIl5fABRZzPSS/ELt2bTp8Q+p
         M5ag0bMM10pscYQgFN6YGOLbTBp4Q10QaZ7u3kPK+XyKK/mkkWoxfe5w0mJNOwo+DmV4
         i8Jia8oPIpdhgi25M+wivb04NfBn4jNHcXUgtp5zwxXSj95crT99LuL2pV8MKZijsUAM
         zDbw==
X-Gm-Message-State: AGi0PuaELa8tBdVM5hxLaV5EZhrihagkB1ewEYWjHlshj8RyCtN63zNM
        bwwf69QP3nizi9WBPKgaT3wdOLZe
X-Google-Smtp-Source: APiQypLc0664anz1R4W5JCyePgHv7Mvzc0jusQhzN6oUIkNxP/VEtj9lr0pNRmE5yAQYsuY7k9sxsg==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr5517649plz.127.1588353390684;
        Fri, 01 May 2020 10:16:30 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:30 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 21/22] media: imx: silence a couple debug messages
Date:   Fri,  1 May 2020 10:15:55 -0700
Message-Id: <20200501171556.14731-22-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert to dev_dbg the "subdev bound" and IPU-internal media-link
creation messages.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-dev-common.c  | 4 +++-
 drivers/staging/media/imx/imx-media-dev.c         | 2 +-
 drivers/staging/media/imx/imx-media-internal-sd.c | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index f6ad9631fa0e..5fe4b22ab847 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -24,7 +24,9 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
 				  struct v4l2_async_subdev *asd)
 {
-	v4l2_info(sd->v4l2_dev, "subdev %s bound\n", sd->name);
+	struct imx_media_dev *imxmd = notifier2dev(notifier);
+
+	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index 2c3c2adca683..6d2205461e56 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -32,7 +32,7 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 			return ret;
 	}
 
-	v4l2_info(&imxmd->v4l2_dev, "subdev %s bound\n", sd->name);
+	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-internal-sd.c b/drivers/staging/media/imx/imx-media-internal-sd.c
index d4237e1a4241..da4109b2fd13 100644
--- a/drivers/staging/media/imx/imx-media-internal-sd.c
+++ b/drivers/staging/media/imx/imx-media-internal-sd.c
@@ -142,9 +142,9 @@ static int create_internal_link(struct imx_media_dev *imxmd,
 				   &sink->entity.pads[link->remote_pad]))
 		return 0;
 
-	v4l2_info(&imxmd->v4l2_dev, "%s:%d -> %s:%d\n",
-		  src->name, link->local_pad,
-		  sink->name, link->remote_pad);
+	dev_dbg(imxmd->md.dev, "%s:%d -> %s:%d\n",
+		src->name, link->local_pad,
+		sink->name, link->remote_pad);
 
 	ret = media_create_pad_link(&src->entity, link->local_pad,
 				    &sink->entity, link->remote_pad, 0);
-- 
2.17.1


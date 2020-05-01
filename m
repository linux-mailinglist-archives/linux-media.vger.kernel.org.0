Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB811C1B64
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgEARQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5A3C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so146433pjh.2
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BnMGjNnDbs7knQNG08RhDP1eWnGEoczFnCi38jnuKiY=;
        b=das/IGQR7zyQOTvEceNfRO9GvX26AdyGcY0THN9bP6n3FsnSbtVFXp42pmyf/xhmGW
         CWF1dv9xtUOWq+hQ53RPeYAbp2i8Gjyr2kTLGtILug4KoNdPPW5+nbk3a2oZWYMWRE2r
         byS5/pewuzpzg/rycpO+nMKsuhPMS3kGCCw7/UV2ox0nYK6x6lZjPnp0Z/yTRRbS/BMs
         Bs2UblLGAQ7EqykvGJrupbwe9eIF9S3kpq/H4OTtXMsk7hC4R1+cPPoKSMDGxPUyyGSV
         AAJ+ZEdUt53DWp4XMWmMjLzh2WcY4g02OGMZa2vJ68F3Upsj9vew8IiKqd93fzxgxhja
         qDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BnMGjNnDbs7knQNG08RhDP1eWnGEoczFnCi38jnuKiY=;
        b=fv3a04RUuDln0wCkBpvgBhGDTo8VDq9CHT3ThjvqsGuNyz6acZYrocEIfjZqpGi3pt
         YC10yIy5w3NxVMVD6EN2OlYcdMQ+3CscGC4dAeWVv8bAecQMiw4UpjFKEi/Jli2TRKx2
         OlidpBYbaPiypKxpgL5ni9PsDEMxvf+wGC+t+07lbMm2q02J62giW6jAjSkSCCNx4Vqt
         bBSzJzmG1XyRS7wJpjvks0Fz0FeN5Zrtu3TH5XX4B1tSI7cKdazY+zbA40LsGmKwEVOb
         w1ZpEdxAJE7Dqal2tegXTuiExHfQiT7+lOYMqcGTxFAEOZs3Z8JUCIIKajFneDmXTc3o
         CrbA==
X-Gm-Message-State: AGi0PubcxLAnYx4ot4dVKyFjsL0oouE81Vw7tHjoMe0Yy5dojqLs6Rjv
        KVSElfS9istUgR2jmCPEJiISAiuZ
X-Google-Smtp-Source: APiQypJGrGmH0EYP1tEyCcspnlrATc+MAyOfXZE0KiBc8uDCPyPyyXDLlT3PcksKjpkb7Pb8DSj9ug==
X-Received: by 2002:a17:90a:2943:: with SMTP id x3mr666937pjf.63.1588353378703;
        Fri, 01 May 2020 10:16:18 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:18 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 12/22] media: video-mux: Create media links in bound notifier
Date:   Fri,  1 May 2020 10:15:46 -0700
Message-Id: <20200501171556.14731-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the video-mux sink pad(s).

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v5:
- went back to something similar to v2. A call is made to helper
  v4l2_create_fwnode_links().
Changes in v4:
- none
Changes in v3:
- this version does the work inline. The previous version called
  a media_create_fwnode_links() which is removed in v3.
---
 drivers/media/platform/video-mux.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 9f148f403603..53570250a25d 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
 struct video_mux {
@@ -36,6 +37,12 @@ static const struct v4l2_mbus_framefmt video_mux_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
+static inline struct video_mux *
+notifier_to_video_mux(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct video_mux, notifier);
+}
+
 static inline struct video_mux *v4l2_subdev_to_video_mux(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct video_mux, subdev);
@@ -332,6 +339,19 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 	.video = &video_mux_subdev_video_ops,
 };
 
+static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct video_mux *vmux = notifier_to_video_mux(notifier);
+
+	return v4l2_create_fwnode_links(sd, &vmux->subdev);
+}
+
+static const struct v4l2_async_notifier_operations video_mux_notify_ops = {
+	.bound = video_mux_notify_bound,
+};
+
 static int video_mux_async_register(struct video_mux *vmux,
 				    unsigned int num_input_pads)
 {
@@ -369,6 +389,8 @@ static int video_mux_async_register(struct video_mux *vmux,
 		}
 	}
 
+	vmux->notifier.ops = &video_mux_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
 						  &vmux->notifier);
 	if (ret)
-- 
2.17.1


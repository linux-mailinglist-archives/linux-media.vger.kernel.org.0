Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689BF1AFF48
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDTAj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726105AbgDTAj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBD1C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:56 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g2so3311404plo.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=diBzADfannDdYI1cw4/kwf/YiXFzLk18zW8vS88VTgg=;
        b=cRbmFLm7HWyET8M2mtdxR1yy54EDrI9cDfTlzDKiHJ/or4k+rIQWlM+4vs+BsbQ9zZ
         JN9Dm6CD2/Y6wdzw0UN2/lA3u1Du42/FJLPlG3aqzNKKVu/dt2wJfSO/BTVueOpAzl38
         P29oV6RrXFZCCEszq4x+v99HQ+qr0+8y+j3gQCiKsaQLD4dKH6WG/q9eViWNeuQGI92P
         AKZckvjqP3VYqPDa4yluMJO62eM9awibNfbdWbuEON9LxJKKeMe7IXY/6e7rG3/r5K6K
         uJ6p3W5KfmmfQiDdg9O3QZTqOEUoFFqmbkYWNcEKlUxLYhBzzxfM/qFd62zVyXRUAC3C
         83rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=diBzADfannDdYI1cw4/kwf/YiXFzLk18zW8vS88VTgg=;
        b=Ft3fFXAs4VIl0U5gzmH0GW23BryQ/ElIcgJ/yg5y+uGvxr/5DBXhriDlg1rIdsluUp
         3y7ThGudZ6talH4CmbRJZ0TraMbwOlvVN5BU7bPqyVnzbsK9jfzCWWypImzZ1+HzRyEV
         F7SFXxH8B0Dr0KJA6F8o7eyA+uaH9H3YKTlEpLd4a0TFmuTZBqG3/F/E+U3MZbrUDFQO
         j2rZqSs+RzgDVsiol4t5IyA8AICXX8MdkyMX/40M3tEj2ulj+m5fY0YM5UVGKHwzxXty
         wnm/T0I+k27RFcrFquaBti9zbht4rcbxggWsQMEA7vo3FgeCyxCuI/px8TPXoKpbdT0H
         7ieA==
X-Gm-Message-State: AGi0PubvmW7k3ahTnFtgJOUoXcUjsN0Pl8/VGBZ3detTtrdJ7tc+gt30
        sQshIAqouwn9tSOPfdVb4O5Q/cKWpSQ=
X-Google-Smtp-Source: APiQypJlbup7fHotYlAx/xuVClgsdrIXykUUWLkZ84fzozGP3eSLIQRDk0p5b74B9PgMyTUewJlVFw==
X-Received: by 2002:a17:902:8485:: with SMTP id c5mr14891219plo.242.1587343195338;
        Sun, 19 Apr 2020 17:39:55 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:54 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 13/23] media: video-mux: Create media links in bound notifier
Date:   Sun, 19 Apr 2020 17:39:20 -0700
Message-Id: <20200420003930.11463-14-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index a21b299ce0e7..4dd6f859450e 100644
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


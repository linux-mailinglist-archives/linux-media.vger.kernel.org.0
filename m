Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A407146A7
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 10:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjE2IvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 04:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjE2IvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 04:51:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BF7114
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 01:51:04 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5128DA3A;
        Mon, 29 May 2023 10:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685350231;
        bh=gJsvsftYBkcBNBVLjSE0RR5g7kuWlwMuDNeiX1ewwz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hon3C3w77WnU4qgpaLLZzEGXk4ZjZ9y7VwmPtVHgP2YXufigeYGxGF60uVAil/8u9
         rxQ7PUDtZWCQ5ZNExnwCPfZuFPMuFGI5fogNJFRQWvYJImWe+96B1YlNlJz3ofr1sH
         B9gb/RMh7rlvqKQUxA4fLUvASSFn/e/mvE/IUcVs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 6/7] utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
Date:   Mon, 29 May 2023 11:50:02 +0300
Message-Id: <20230529085003.47207-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new VIDIOC_SUBDEV_S_CLIENT_CAP ioctl to inform the kernel that
we support streams, and use the return values of
VIDIOC_SUBDEV_S_CLIENT_CAP and VIDIOC_SUBDEV_QUERYCAP to decide if the
entity supports streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/common/cv4l-helpers.h |  1 +
 utils/common/v4l-helpers.h  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 3cee372b..91a04146 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -82,6 +82,7 @@ public:
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
 	bool has_ext_pix_format() const { return v4l_has_ext_pix_format(this); }
+	bool has_streams() const { return have_streams; }
 
 	int querycap(v4l2_capability &cap, bool force = false)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index c09cd987..f8e96d58 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -9,6 +9,7 @@
 #ifndef _V4L_HELPERS_H_
 #define _V4L_HELPERS_H_
 
+#include <linux/v4l2-subdev.h>
 #include <linux/videodev2.h>
 #include <string.h>
 #include <stdlib.h>
@@ -39,6 +40,7 @@ struct v4l_fd {
 	bool have_selection;
 	bool is_subdev;
 	bool is_media;
+	bool have_streams;
 
 	int (*open)(struct v4l_fd *f, const char *file, int oflag, ...);
 	int (*close)(struct v4l_fd *f);
@@ -507,6 +509,12 @@ static inline int v4l_open(struct v4l_fd *f, const char *devname, bool non_block
 
 static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
 {
+	struct v4l2_subdev_client_capability clientcap = {};
+	struct v4l2_subdev_capability subdevcap = {};
+	bool subdev_streams;
+	bool client_streams;
+	int ret;
+
 	if (f->fd >= 0)
 		f->close(f);
 
@@ -528,6 +536,16 @@ static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
 	f->have_next_ctrl = false;
 	f->have_selection = false;
 
+	ret = ioctl(f->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
+
+	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+
+	ret = ioctl(f->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
+	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
+
+	f->have_streams = subdev_streams && client_streams;
+
 	return f->fd;
 }
 
-- 
2.34.1


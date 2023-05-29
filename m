Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3F6E7146A4
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 10:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjE2IvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 04:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbjE2IvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 04:51:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA51FC4
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 01:50:57 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46BBBE79;
        Mon, 29 May 2023 10:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685350230;
        bh=8X2s1Sy/Im9YB7N/rId1xhJPUtowtAaYHuLYG6mE4X4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OSUPUKtFKuxn2zz0K/S/MHxrePXRGdJaRcCz7VKNEjHFhbUkRFC+38PO3SpyODSGe
         S0VZpHcNV8A9qvCYhM+IZ4t7y3GRk+xxw2OjajBp7EwWWmAVrYlBptycI3Z4h/GtZW
         Led6xvqVtWqgAOVVi6ZG0r2dm7aVJA9Ft+5UgBCw=
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
Subject: [PATCH v5 5/7] media-ctl: Check for Streams API support
Date:   Mon, 29 May 2023 11:50:01 +0300
Message-Id: <20230529085003.47207-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new VIDIOC_SUBDEV_S_CLIENT_CAP ioctl to inform the kernel that
we support streams, and use the return values of
VIDIOC_SUBDEV_S_CLIENT_CAP and VIDIOC_SUBDEV_QUERYCAP to decide if the
entity supports streams. If not, return an error in case the user tries
to use streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/media-ctl/libv4l2subdev.c | 56 +++++++++++++++++++++++++++++++++
 utils/media-ctl/mediactl-priv.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 51d30e61..750796cc 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -42,6 +42,12 @@
 
 int v4l2_subdev_open(struct media_entity *entity)
 {
+	struct v4l2_subdev_client_capability clientcap = {};
+	struct v4l2_subdev_capability subdevcap = {};
+	bool subdev_streams;
+	bool client_streams;
+	int ret;
+
 	if (entity->fd != -1)
 		return 0;
 
@@ -54,6 +60,16 @@ int v4l2_subdev_open(struct media_entity *entity)
 		return ret;
 	}
 
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
+
+	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
+	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
+
+	entity->supports_streams = subdev_streams && client_streams;
+
 	return 0;
 }
 
@@ -74,6 +90,11 @@ int v4l2_subdev_get_format(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
 	fmt.stream = stream;
@@ -99,6 +120,11 @@ int v4l2_subdev_set_format(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
 	fmt.stream = stream;
@@ -127,6 +153,11 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
 	u.sel.target = target;
@@ -166,6 +197,11 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
 	u.sel.stream = stream;
@@ -209,6 +245,11 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
 	if (ret == -1 && errno != ENOSPC)
 		return -errno;
@@ -251,6 +292,11 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
 	if (ret == -1)
 		return -errno;
@@ -341,6 +387,11 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
 	ival.stream = stream;
@@ -364,6 +415,11 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
 	ival.stream = stream;
diff --git a/utils/media-ctl/mediactl-priv.h b/utils/media-ctl/mediactl-priv.h
index a0d3a55a..eb55e07e 100644
--- a/utils/media-ctl/mediactl-priv.h
+++ b/utils/media-ctl/mediactl-priv.h
@@ -33,6 +33,7 @@ struct media_entity {
 	struct media_link *links;
 	unsigned int max_links;
 	unsigned int num_links;
+	bool supports_streams;
 
 	char devname[32];
 	int fd;
-- 
2.34.1


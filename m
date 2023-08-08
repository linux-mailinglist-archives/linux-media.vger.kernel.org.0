Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C56D773D31
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjHHQO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjHHQNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2597EF4
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:26 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D96F29C2;
        Tue,  8 Aug 2023 08:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475529;
        bh=lCm58VbDkbfK5KGtuZSnxvgNUZOCx2S+nYJf8oWy7WI=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=qo+NWYPr4H0bVPvlozcZVdiNWpUnvIXE2ygoxyAzCfRackNRLpTNGUXUP31cGwcfn
         LE5SmsRvOQrXLWfjAWATni50CFnOLINQdpDHNXkDLFe9YXLZuWVWXehEHx99BUDofg
         lk5i/2QxN9eBUHPQKlXxSnGArtmxZbH00ML0LX3U=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:25 +0300
Subject: [PATCH v7 6/8] media-ctl: Check for Streams API support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-streams-support-v7-6-bd0b42a5826d@ideasonboard.com>
References: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
In-Reply-To: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4698;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lCm58VbDkbfK5KGtuZSnxvgNUZOCx2S+nYJf8oWy7WI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6GBENQvEf6/vYICHgfdv+PbWYtv9NF/lV+u
 uMDIzqeUUmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehgAKCRD6PaqMvJYe
 9WuZD/9Gt9zbzsFwtcWH4MXcFpTXmUDHlqw0SafAQIepCx7t2MM0brxBV9zN+MstjacKhLCuH/L
 NwxPW2ASqQL6qOPiCjptQ9GygYgcrhUaUghbsyTL8xEec4ZIdEBq/VejcNlPYJu4Yivup//tMpj
 9bYrgeOlySDiFqZr+ITZdsHBH0zY992o0nKkj/VNIhubAQXvQct8XMK//qHD7b6cYKRbc494403
 uUZr0ZkREgUiKNxwaI8xku2atq/UTeAqK3lE/PlGZ2mr+W6JZtMFLjP+IV+bek6HglnSLIFvZKJ
 MM6/RyZJ3Tvi2QtGjEWuaJmbgP3YjVhvC1wi1z4letZoWrwwSNp3hYlcZR1ZddQbLl8JSuQmeXD
 54TmAOfL7rE9lMSndkqpOF/K9NxIaLIMXpk5N1lSmuzuQMFRC5C0J+zXu6oq6AoyVHDscXgFE5o
 HYW/k2OZ1l2JWYKd5q1fQgXn/OuXQ9zM3W6XOrlk1l0qtEypd9Tygcm+ZVHfjaPcKtUof+R8x7u
 z7l5iPFLpPPiAGIthSEiWTRW5Icrplay5NGjccO0jmLR+ty5ieFMX0h+1p/CiOm6ui9/FfRXHCx
 nT7cTbHZGB8OPxPn2Kt+QIgypwcMtdhJuyVx9IN43BRgRA/Hpl9QKeR0MeClt9orv4LorGoeIVW
 VLU/kAmKFfguRUw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 utils/media-ctl/libv4l2subdev.c | 56 +++++++++++++++++++++++++++++++++++++++++
 utils/media-ctl/mediactl-priv.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 2144a527..16e1284c 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -48,6 +48,12 @@
 
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
 
@@ -60,6 +66,16 @@ int v4l2_subdev_open(struct media_entity *entity)
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
 
@@ -80,6 +96,11 @@ int v4l2_subdev_get_format(struct media_entity *entity,
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
@@ -105,6 +126,11 @@ int v4l2_subdev_set_format(struct media_entity *entity,
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
@@ -133,6 +159,11 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
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
@@ -172,6 +203,11 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
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
@@ -215,6 +251,11 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
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
@@ -257,6 +298,11 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
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
@@ -347,6 +393,11 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
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
@@ -370,6 +421,11 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
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


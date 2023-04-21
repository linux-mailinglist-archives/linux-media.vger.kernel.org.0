Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47E36EAAC0
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 14:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjDUMqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 08:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjDUMqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 08:46:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8420D974A
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 05:46:27 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0108F4DD7;
        Fri, 21 Apr 2023 14:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682081082;
        bh=cQz4TJsquTUKs4MAKTVP+ntAgFxr/CKGrVngCq/dUBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nGLV8FYCjMWaiZxNmcbbFNlZmjbTC0LB6BCtv4YbhcQKxaXlbJvjb0zBHIpc6aTNH
         nXiib9Q/6F1ul1qIl487qlDaKE2lOM3kojKDQ78HOUhXgqOQLM7zptKqniog4/TWOw
         HJwWAIl6ntvBDvY2NjTxvqrby1ajQ2sC8eKelHqA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 6/8] media-ctl: Check for Streams API support
Date:   Fri, 21 Apr 2023 15:44:26 +0300
Message-Id: <20230421124428.393261-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do two things:

- Inform the kernel that we support streams with a call to
  VIDIOC_SUBDEV_S_CLIENT_CAP

- Use the returns from VIDIOC_SUBDEV_S_CLIENT_CAP and
  VIDIOC_SUBDEV_QUERYCAP to decide if streams are supported. If not,
  fail in case the user tries to use streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/media-ctl/libv4l2subdev.c | 54 +++++++++++++++++++++++++++++++++
 utils/media-ctl/mediactl-priv.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 9205cfa4..186708ff 100644
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
@@ -210,6 +246,11 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
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
@@ -231,6 +272,9 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams)
+		return -ENOTSUP;
+
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
 	if (ret == -1 && errno != ENOSPC)
 		return -errno;
@@ -341,6 +385,11 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
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
@@ -364,6 +413,11 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
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


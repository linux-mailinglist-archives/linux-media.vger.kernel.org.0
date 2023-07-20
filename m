Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDA875A840
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjGTHv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbjGTHvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:51:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6B7272A
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:51:40 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21C4A3382;
        Thu, 20 Jul 2023 09:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689839411;
        bh=BpmE9bZ7z5hJsP27msHcvqBjaixMpL+pyxGKzukeODM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cv/cFPCcs5pTjYEhGL+JgLcO/RYrDpNrSYh/ELY+7Ggpy7D0Dd6s0FokL8lZg2nMO
         Nf98ORH3eEOA+rEIfCYknJmd/xoVJOA26z2pN0O/NvhfK35KeqivSYuFhthhY34xt3
         AKMwWAc7KrEZokHowCqtvgBpcxpKdn5CAQg9leeo=
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
Subject: [PATCH v6 6/8] media-ctl: Check for Streams API support
Date:   Thu, 20 Jul 2023 10:50:42 +0300
Message-Id: <20230720075044.442021-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
References: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE
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
 utils/media-ctl/libv4l2subdev.c | 56 +++++++++++++++++++++++++++++++++
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


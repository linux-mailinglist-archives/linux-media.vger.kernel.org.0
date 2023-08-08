Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F6A773D40
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjHHQO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbjHHQNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD103C11
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:32 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B273348;
        Tue,  8 Aug 2023 08:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475530;
        bh=GsspOjXZfVUwLjEEzLRR1gtnOd9Ywcd84/KazWpZWvM=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=FQ84imOI6+dC5FDwPeD5uvoPY9Z/3Dmp9TNwsA+lWaFfmd7ZzHBeisZd2VuAmjRJl
         Jy3iSfgj5Ex06FhPscMgt3lj+1jBFrwoJaoJgdH4gFWy8K/+CDNZDMHNCR+wvDNawB
         jn04VpspXeqORIiRplvASs68ZvQoTy8HRv5grOTA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:26 +0300
Subject: [PATCH v7 7/8] utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS
 for subdevs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-streams-support-v7-7-bd0b42a5826d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GsspOjXZfVUwLjEEzLRR1gtnOd9Ywcd84/KazWpZWvM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6Gjs5kwsuPAF5CzqhIs7PXSepbpr8kn+wLZ
 qftrhl3OzWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehgAKCRD6PaqMvJYe
 9TYCD/9Z2xFMA/AEvT+Y09tMwLnojf6PVTTINYUk+cB61GSF2ksMKh/i4dy2By0gHwi+b5ILoKO
 A/K91E+CPNWSC+PqXzMeLJTPdxmndzvCX1paXVQLzNBFTgAMfBKyV69PwzNn4H0RYz3eVzv8lv5
 Uphf6xGu8FwJuSEiELVCFVSMbmHUh83RmaBjUKI0hEdypDQILI4eS4kuGRDW8GhVyTF60A4t3AY
 RxP5NHsnMzHN/scEt9QvWLoFPyj7PQPZMtBoIHi9FcpMt1P+CnYTTQLPSUE1q+F8dvXEBsd2wv4
 g/V9AibzmS5ssmzIJC015/NlRjnoj/sUyVztBPwyLCDHMEVUzQgqlbz/dHW8wUVYkLGHtugSjx4
 Che89O7DBoQDf0ial3UDmiPL4BYbWJSrEWy1D5YxWsq+E/yZ5J7V1lIwHwlXL6O2jEo8JGDpBdy
 Bj8v7pLaWVeFMrmc5rX2h5mhZEbjqM2ShWY6Zb7HqQZCH2nBdDD12tKuTiZKaPt8lAM1FsE20jP
 b1z+eLXKNgGpeQxuwPZ5qxkBUbN6emoaFgOVKDlJZjHclpTNVM5Ob3AT/JN64RSXMR9yskuRq/w
 Z7domN0Xr8IUcr8DpBYm4LSgS5vIs19aIdXBcMl2NB2Pq4YBxd5zSGkXxpXuaQwx+2CDVLR/07d
 kPrrYHUu4MCFQ6Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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


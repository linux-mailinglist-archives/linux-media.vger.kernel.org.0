Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415EB17869A
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgCCXnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:22 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42211 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbgCCXnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:22 -0500
Received: by mail-pl1-f196.google.com with SMTP id u3so128503plr.9
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UmulW+gVzwrZmHWvKjh1tlSb5HuC+mxLHVPgwHlIe0I=;
        b=FbUt9xm1rkh1RyWcoAnoZqbdnmx7j4FohzExpZm30pdljQLLX6BzuiwiYrlKQLd3En
         ZRaAxL4JZzNGE405RxJWSWlM+vtUUzrs8Jdid0LeZFEnbBMRFo2GtkjsLYGweieP5Rcv
         hkJCl1bNkGpI1aq4WlUHE6iTc3L6J9qgQdkrR9qnXUkbLs7RfUrxT/UtN0Ct2+OaCoWH
         x9W6KVr8AmtsPebrKeJa9jiM7twqWu8pZR/dG0xQn8MNRYIz0yDYzBhpaz7ez9wguoI+
         WX634bZ8oxXmGKGkQB8I2K3m8c/swxIfjDEKTAFcuN7+zYLvuiUY8ZcEokKeLFlTzwOJ
         dsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UmulW+gVzwrZmHWvKjh1tlSb5HuC+mxLHVPgwHlIe0I=;
        b=LA+qByGAyq7WEuM5gipYgDO+f7TvtBcVAHZVdoKPd/EE7hgd8qw5lVEzmPGuHw7Wir
         p9NuM4993wEm+cuWM+ajYT5v+/zLy4lsLRakUVN0WxQ4rwML085pVF6Pdkzo3b8c71zp
         EKQ8Op2R9KGajAWl/P0QT9j/TX3FxDx2f4UJfzK7wuEkMopMW/okH58X96DTDievojfN
         1Kv7R0RUPFBROFciYsg8s0GL5zsjYLsmUiiQIL90yjIPRHgJZ2pDH31yKlllqLQ8PXZ9
         SHxmthGbIRN3Kio746izQlmwCMdktW+3BYuLe2pptVsdv/9dAWQhD7wP4xsoOcCAYwtZ
         6XbA==
X-Gm-Message-State: ANhLgQ3OdKA9D/iQvoaRhzMffm2JjxJyaAosetKYBcY+nL3uPnvRUDFo
        1aHRyIG3MveQHZbU6FGA/iS3D5kM/Bw=
X-Google-Smtp-Source: ADFU+vuB8/nxsVHa1juMm7SqRFBY9fZmTHCnMaxkVQIVyY6jUMLGmMo6bxF60Nd94sqRrBAUvL2eGw==
X-Received: by 2002:a17:902:123:: with SMTP id 32mr381607plb.38.1583278999571;
        Tue, 03 Mar 2020 15:43:19 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:19 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 07/17] media: video-mux: Implement get_fwnode_pad op
Date:   Tue,  3 Mar 2020 15:42:46 -0800
Message-Id: <20200303234256.8928-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement get_fwnode_pad operation. If the endpoint is owned by the video
mux, return the endpoint's port number. The video mux maps fwnode port
numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/video-mux.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 7b6c96a29aa5..f446ada82176 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -94,9 +94,38 @@ static int video_mux_link_setup(struct media_entity *entity,
 	return ret;
 }
 
+static int video_mux_get_fwnode_pad(struct media_entity *entity,
+				    struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
+	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
+	struct fwnode_handle *vmux_ep;
+
+	/*
+	 * If the endpoint is one of ours, return the endpoint's port
+	 * number. This device maps port numbers and pad indexes 1:1.
+	 */
+	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
+		if (endpoint->local_fwnode == vmux_ep) {
+			struct fwnode_endpoint fwep;
+			int ret;
+
+			ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
+
+			fwnode_handle_put(vmux_ep);
+
+			return ret ? ret : fwep.port;
+		}
+	}
+
+	return -ENXIO;
+}
+
 static const struct media_entity_operations video_mux_ops = {
 	.link_setup = video_mux_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = video_mux_get_fwnode_pad,
 };
 
 static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)
-- 
2.17.1


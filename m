Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E5E16001B
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBOTmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35844 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbgBOTmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:12 -0500
Received: by mail-pf1-f196.google.com with SMTP id 185so6758686pfv.3;
        Sat, 15 Feb 2020 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=72xnFHPEyLcodGDkHs6BcIOyiqauoZxf30bRgRrtTFY=;
        b=iJItRTiU9ZIGuHENK8T4BFJvF8IFQf2Hg5ysXS+3gJw2M6ZFeVmpbB5cVRniPq5bz0
         qEety9CoPmmC1QQi6SpusZ6mDuMhaiN3KUBW3nGM7guqRXOzFBB9gHSwFYwmtrXuDswp
         j+V6TiDR+o6+oHoEH+x2ISzofzsDsd6MEbN/zSRuUcvApxNZqjMYBm6Of9uF0Uco6E4W
         GVq73Fjz70YrFOswyoz/BfpVeOEeRyhbSounHPJ8EP0OqG+M6IeI1fKZUsXeN82TWRTn
         q/pDzOlANXNZKVHhMO4Ct67ZTBda4hIj6VTE/7aQ3TTvA20MFpa1PyI1EFNUVEEwTbAI
         Qudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=72xnFHPEyLcodGDkHs6BcIOyiqauoZxf30bRgRrtTFY=;
        b=YKYNS4lsFCJeAbSj6NUfKOQcxaFhCdUTb+mUBVig/cyW2SSX89oITnQGVt6B8QwxCK
         9RSHYO1MdAvj9r+pl68eOZ9+yjVPOjelU62WKu0fABYJGkCIddh78jyL5dP4RLywBmsM
         lZXDDSzr2tute/EQ3lWrXfQRi9zmQhjEP5IzPaSH7O7QA7DYeNqmh+PeSAzxnouZIJGb
         3t+RH4W5CPealDi5abPIoMAqBRwE0wBCCJvuGT1h2ktYPXGhkYu4CIs0qazlJUyy4Dbo
         yJ6EJN7X+IziPp99EKeOYXAhjz9j6IWjLQbE7M85bv3iesdugcFWnTj1yViczfFg8PyS
         w1gA==
X-Gm-Message-State: APjAAAUvjkpdL4VXz1UoBlBR/BUcf5qWMh6lHuy/Cug/QxQGoXC7y9GI
        3odin5eESeAm4gv2x+vK1jN8+Rc8xPw=
X-Google-Smtp-Source: APXvYqyA8eKEE1EZxDHRCm+vv/kHU5sceEimjzNg1Q+Nu0UvFglPJz9fmdCempM9IY4kUsbd/0gZKg==
X-Received: by 2002:a62:2ad1:: with SMTP id q200mr9748584pfq.123.1581795732019;
        Sat, 15 Feb 2020 11:42:12 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:11 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 05/17] media: video-mux: Implement get_fwnode_pad op
Date:   Sat, 15 Feb 2020 11:41:24 -0800
Message-Id: <20200215194136.10131-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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
index 3d2a5c2b4c08..c1c477e4e33f 100644
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


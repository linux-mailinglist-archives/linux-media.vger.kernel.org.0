Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BDC152389
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBDXto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:44 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38416 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbgBDXto (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:44 -0500
Received: by mail-pl1-f194.google.com with SMTP id t6so70818plj.5;
        Tue, 04 Feb 2020 15:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=72xnFHPEyLcodGDkHs6BcIOyiqauoZxf30bRgRrtTFY=;
        b=BQoE2aYg+S0CCCMxIZ0jWCqQjys5A76hZUcTbp30Q00N3hQz77rIsJc1QBKLbNOKxn
         kMCBfLVe6TA1ymqnIHtkBTnC0MFWfN+vRMIBOw2I43y1qOONMBg38jk285bH9TQDXB3r
         X7nvHi8CO+1gZ8CFaGdVqZ4IOx3p7TDuLs7TCSYfMfjbHAai370POhJEH5ETshMV9Gic
         l411WnVgfKpsYjgXv+WC5rqPBSyMXbqKOD0HA7xZW3Zz9bSC26r9n4qUcgXNxshYPTel
         MD11HclsYCfnd1ZyofkA9YfiUcQLzSgEIqB+TXbouxYhEbl0WqvWJPKVn76ec6D/MVcX
         Q+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=72xnFHPEyLcodGDkHs6BcIOyiqauoZxf30bRgRrtTFY=;
        b=DtgAcq6xJVF0DU/TuAlp5IWXwiWwVE+Aupl74+xhKwagb2Vtl0W260VDYb+NNTLAU3
         dwpsNeZTkziRnzJzKhdGz73V2Pue1F0kun5u3rjZFGvD91UwuV/viPiTW85yHpdVUkeB
         tfWzYKijT5u5UmQ1x896dSotvbGe2u7Swti/5PERpJE56VfFle8VvXwnjoanrOo+mL6G
         77wagXzopuJDN+f36lhjduGh4DxpOSv2qBP6l6IrylgRHxKs5v/p5/urss6dguJZ6oMu
         jG5JVB4UQFybvhFfHSGYOjD7PkabBxoFy+/nsXfo7hk49aY+LPt3IPb9pHhQcMYJlkgE
         /jmA==
X-Gm-Message-State: APjAAAVhRlpPEWwOzOb8FIvzQKcbPOkz8ylt4cvwQsRVp0JhTLyWjL7O
        qPks3uQi9iK2S01W+T5bbe4pkFit
X-Google-Smtp-Source: APXvYqx/lfvQjl0NuwmTSmHbb4rgUdlAX9w43sbHEMtjKlW115UDhnyIPhaLx4OtBJm3tPnV5HChsQ==
X-Received: by 2002:a17:902:8498:: with SMTP id c24mr17839937plo.233.1580860183328;
        Tue, 04 Feb 2020 15:49:43 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:42 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 05/17] media: video-mux: Implement get_fwnode_pad op
Date:   Tue,  4 Feb 2020 15:49:06 -0800
Message-Id: <20200204234918.20425-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA720243F43
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 21:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgHMTSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 15:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgHMTSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 15:18:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051EFC061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 12:18:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 39C8F299F54
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH] cedrus: Add missing v4l2_ctrl_request_hdl_put()
Date:   Thu, 13 Aug 2020 16:18:33 -0300
Message-Id: <20200813191833.16855-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check for a required control in the request was missing a call to
v4l2_ctrl_request_hdl_put() in the error path. Fix it.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bc27f9430eeb..7c6b91f0e780 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -199,6 +199,7 @@ static int cedrus_request_validate(struct media_request *req)
 	struct v4l2_ctrl *ctrl_test;
 	unsigned int count;
 	unsigned int i;
+	int ret = 0;
 
 	list_for_each_entry(obj, &req->objects, list) {
 		struct vb2_buffer *vb;
@@ -243,12 +244,16 @@ static int cedrus_request_validate(struct media_request *req)
 		if (!ctrl_test) {
 			v4l2_info(&ctx->dev->v4l2_dev,
 				  "Missing required codec control\n");
-			return -ENOENT;
+			ret = -ENOENT;
+			break;
 		}
 	}
 
 	v4l2_ctrl_request_hdl_put(hdl);
 
+	if (ret)
+		return ret;
+
 	return vb2_request_validate(req);
 }
 
-- 
2.27.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04680210BFA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgGANRu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:17:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45850 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730997AbgGANRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:17:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0294F2A56D0
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2] v4l2-core: Print control name in VIDIOC_S/G_(EXT)_CTRL(S)
Date:   Wed,  1 Jul 2020 10:17:30 -0300
Message-Id: <20200701131730.122209-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200609121514.9414-1-ezequiel@collabora.com>
References: <20200609121514.9414-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While debugging, it's currently really hard to identify controls
by their ID. Print the control name making the print more helpful.

With this change, the print changes from:

video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=45, id/size=0x990ce8/1048, id/size=0x990ce9/12, id/size=0x990cea/480, id/size=0x990ceb/896, id/size=0x990cec/400

to:

video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=42, name=H264 Sequence Parameter Set, id/size=0x990ce8/1048, name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice Parameters, id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400

For instance, this is specially helpful when the ioctl fails. Consider
the following example:

v4l2-ctrls: prepare_ext_ctrls: video1: pointer control id 0x990cec size too small, 400 bytes but 784 bytes needed
v4l2-ctrls: try_set_ext_ctrls: video1: video1: try_set_ext_ctrls_common failed (-14)
video1: VIDIOC_S_EXT_CTRLS: error -14: which=0xf010000, count=5, error_idx=5, request_fd=39, name=H264 Sequence Parameter Set, id/size=0x990ce8/1048, name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice Parameters, id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* As requested by Hans, only print the name if non-null.
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 02bfef0da76d..a556880f225a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -582,7 +582,10 @@ static void v4l_print_querymenu(const void *arg, bool write_only)
 static void v4l_print_control(const void *arg, bool write_only)
 {
 	const struct v4l2_control *p = arg;
+	const char *name = v4l2_ctrl_get_name(p->id);
 
+	if (name)
+		pr_cont("name=%s, ", name);
 	pr_cont("id=0x%x, value=%d\n", p->id, p->value);
 }
 
@@ -594,12 +597,15 @@ static void v4l_print_ext_controls(const void *arg, bool write_only)
 	pr_cont("which=0x%x, count=%d, error_idx=%d, request_fd=%d",
 			p->which, p->count, p->error_idx, p->request_fd);
 	for (i = 0; i < p->count; i++) {
+		unsigned int id = p->controls[i].id;
+		const char *name = v4l2_ctrl_get_name(id);
+
+		if (name)
+			pr_cont(", name=%s", name);
 		if (!p->controls[i].size)
-			pr_cont(", id/val=0x%x/0x%x",
-				p->controls[i].id, p->controls[i].value);
+			pr_cont(", id/val=0x%x/0x%x", id, p->controls[i].value);
 		else
-			pr_cont(", id/size=0x%x/%u",
-				p->controls[i].id, p->controls[i].size);
+			pr_cont(", id/size=0x%x/%u", id, p->controls[i].size);
 	}
 	pr_cont("\n");
 }
-- 
2.26.0.rc2


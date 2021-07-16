Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6673CB799
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 14:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239791AbhGPNAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 09:00:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34194 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239590AbhGPNAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 09:00:07 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:f07d:7270:7174:27c4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 099121F4407D;
        Fri, 16 Jul 2021 13:57:11 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [patch v4l-utils 1/2] v4l2-ctl: print specific error upon failure
Date:   Fri, 16 Jul 2021 14:57:02 +0200
Message-Id: <20210716125703.699-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716125703.699-1-dafna.hirschfeld@collabora.com>
References: <20210716125703.699-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an operation fails, print an error message
that specify the specific operation that failed
prefixed with the current function name.
This makes debugging less painful.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 62424e4c..0f28a537 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1153,8 +1153,10 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
 
-	if (q.obtain_bufs(&fd))
+	if (q.obtain_bufs(&fd)) {
+		fprintf(stderr, "%s q.obtain_bufs failed\n", __func__);
 		return QUEUE_ERROR;
+	}
 
 	fd.g_fmt(fmt, q.g_type());
 	{
@@ -1226,8 +1228,10 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 	for (unsigned i = 0; i < q.g_buffers(); i++) {
 		cv4l_buffer buf(q);
 
-		if (fd.querybuf(buf, i))
+		if (fd.querybuf(buf, i)) {
+			fprintf(stderr, "%s fd.querybuf failed\n", __func__);
 			return QUEUE_ERROR;
+		}
 
 		buf.update(q, i);
 		for (unsigned j = 0; j < q.g_num_planes(); j++)
@@ -2720,11 +2724,21 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 		fprintf(stderr, "mismatch between number of planes\n");
 		goto done;
 	}
+	if (in.obtain_bufs(&fd)) {
+		fprintf(stderr, "%s: in.obtain_bufs failed\n", __func__);
+		goto done;
+	}
 
-	if (in.obtain_bufs(&fd) ||
-	    in.queue_all(&fd) ||
-	    do_setup_out_buffers(out_fd, out, file[OUT], false, false) == QUEUE_ERROR)
+	if (in.queue_all(&fd)) {
+		fprintf(stderr, "%s: in.queue_all failed\n", __func__);
 		goto done;
+	}
+
+
+	if (do_setup_out_buffers(out_fd, out, file[OUT], false, false) == QUEUE_ERROR) {
+		fprintf(stderr, "%s: do_setup_out_buffers failed\n", __func__);
+		goto done;
+	}
 
 	fps_ts[CAP].determine_field(fd.g_fd(), in.g_type());
 	fps_ts[OUT].determine_field(fd.g_fd(), out.g_type());
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F8C3CB79B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 14:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239806AbhGPNAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 09:00:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34210 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239611AbhGPNAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 09:00:08 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:f07d:7270:7174:27c4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BA5451F44084;
        Fri, 16 Jul 2021 13:57:11 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [patch v4l-utils 2/2] v4l2-ctl: fix bugs found in streaming_set_cap2out
Date:   Fri, 16 Jul 2021 14:57:03 +0200
Message-Id: <20210716125703.699-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716125703.699-1-dafna.hirschfeld@collabora.com>
References: <20210716125703.699-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When exporting buffers from a capture device
to an output device. There are several bugs:
1. The bytesused are set from the exported buffer,
the value might be bigger than the length of the output buffer.
2. The file descriptor field 'm.fd' in 'struct v4l2_buffer' is not set.

This patch fix those issues.

Testing:

modprobe vimc
modprobe vivid

//configure vimc pipeline
media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'

v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81

// export buffers from vimc capture device (/dev/video2) to vivid output device (/dev/video4)
v4l2-ctl -d2 --stream-mmap --out-device /dev/video4 --stream-out-dmabuf

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 0f28a537..432f1cc6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1499,6 +1499,11 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 	if (cap) {
 		buf.s_index(cap->g_index());
 
+		if (fd.querybuf(buf)) {
+			fprintf(stderr, "%s fd.querybuf failed\n", __func__);
+			return QUEUE_ERROR;
+		}
+
 		for (unsigned j = 0; j < buf.g_num_planes(); j++) {
 			unsigned data_offset = cap->g_data_offset(j);
 
@@ -1507,8 +1512,17 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 				buf.s_bytesused(cap->g_bytesused(j) - data_offset, j);
 				buf.s_data_offset(0, j);
 			} else if (q.g_memory() == V4L2_MEMORY_DMABUF) {
-				buf.s_bytesused(cap->g_bytesused(j), j);
+				__u32 bytesused = cap->g_bytesused(j);
+				/*
+				 * bytesused comes from the exported cap buffer
+				 * but the length of the out buffer might be smaller
+				 * so take the smaller of the two
+				 */
+				if(bytesused > buf.g_length(j))
+					bytesused = buf.g_length(j);
+				buf.s_bytesused(bytesused, j);
 				buf.s_data_offset(data_offset, j);
+				buf.s_fd(q.g_fd(buf.g_index(), j));
 			}
 		}
 	} else {
-- 
2.17.1


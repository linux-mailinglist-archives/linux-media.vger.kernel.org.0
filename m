Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C1718F28E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 11:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgCWKT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 06:19:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgCWKT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 06:19:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30E55308
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 11:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584958795;
        bh=tDelpjEnSC+njxk5UoB9rLW0UvrB2GvteAVNi0FgE34=;
        h=From:To:Subject:Date:From;
        b=WeusS1DTa0mKpiFW4ikT/L58TCPGvIUVmohxsA1tleykdoQmbSgzgUxpxgZslCM7W
         cZ9HiYF1du914ZGJGXd8ZaA6ksz+WPqZsPaHG0brQO5L34B7IHOpRlFqx0ekYl4O2j
         4IHuttPo8PdNKhKz6qcg4Nv1RSjg65sHDY9vQX4s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: pci: Fill v4l2_fmtdesc with designated initializers
Date:   Mon, 23 Mar 2020 12:19:41 +0200
Message-Id: <20200323101941.9888-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace initialization of static const v4l2_fmtdesc instances that
specify every struct member with designated initializers. This allows
not zeroing the reserved fields explicitly, and will avoid a need to
patch these drivers every time a reserved field is repurposed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 22 ++++++++++++++++------
 drivers/media/pci/ivtv/ivtv-ioctl.c | 26 ++++++++++++++------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index fa57e12f2ac8..4864def20676 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -466,14 +466,24 @@ static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 					struct v4l2_fmtdesc *fmt)
 {
 	static const struct v4l2_fmtdesc formats[] = {
-		{ 0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
-		  "HM12 (YUV 4:1:1)", V4L2_PIX_FMT_HM12, { 0, 0, 0, 0 }
+		{
+			.index = 0,
+			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+			.description = "HM12 (YUV 4:1:1)",
+			.pixelformat = V4L2_PIX_FMT_HM12,
 		},
-		{ 1, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
-		  "MPEG", V4L2_PIX_FMT_MPEG, { 0, 0, 0, 0 }
+		{
+			.index = 1,
+			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+			.flags = V4L2_FMT_FLAG_COMPRESSED,
+			.description = "MPEG",
+			.pixelformat = V4L2_PIX_FMT_MPEG,
 		},
-		{ 2, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
-		  "UYVY 4:2:2", V4L2_PIX_FMT_UYVY, { 0, 0, 0, 0 }
+		{
+			.index = 2,
+			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+			.description = "UYVY 4:2:2",
+			.pixelformat = V4L2_PIX_FMT_UYVY,
 		},
 	};
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 137853944e46..35dccb31174c 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -920,14 +920,15 @@ static int ivtv_g_selection(struct file *file, void *fh,
 static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
 {
 	static const struct v4l2_fmtdesc hm12 = {
-		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
-		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
-		{ 0, 0, 0, 0 }
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.description = "HM12 (YUV 4:2:0)",
+		.pixelformat = V4L2_PIX_FMT_HM12,
 	};
 	static const struct v4l2_fmtdesc mpeg = {
-		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
-		"MPEG", V4L2_PIX_FMT_MPEG,
-		{ 0, 0, 0, 0 }
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+		.description = "MPEG",
+		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
 	struct ivtv *itv = fh2id(fh)->itv;
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
@@ -946,14 +947,15 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
 {
 	static const struct v4l2_fmtdesc hm12 = {
-		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, 0,
-		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
-		{ 0, 0, 0, 0 }
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
+		.description = "HM12 (YUV 4:2:0)",
+		.pixelformat = V4L2_PIX_FMT_HM12,
 	};
 	static const struct v4l2_fmtdesc mpeg = {
-		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, V4L2_FMT_FLAG_COMPRESSED,
-		"MPEG", V4L2_PIX_FMT_MPEG,
-		{ 0, 0, 0, 0 }
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+		.description = "MPEG",
+		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
 	struct ivtv *itv = fh2id(fh)->itv;
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
-- 
Regards,

Laurent Pinchart


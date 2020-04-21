Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F9B1B28D1
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgDUN6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:58:38 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:37859 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgDUN5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:57:53 -0400
X-Halon-ID: 1092cd26-83d8-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 1092cd26-83d8-11ea-aeed-005056917f90;
        Tue, 21 Apr 2020 15:57:41 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v8 2/6] media: pci: Fill v4l2_fmtdesc with designated initializers
Date:   Tue, 21 Apr 2020 15:57:39 +0200
Message-Id: <20200421135743.1381930-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Replace initialization of static const v4l2_fmtdesc instances that
specify every struct member with designated initializers. This allows
not zeroing the reserved fields explicitly, and will avoid a need to
patch these drivers every time a reserved field is repurposed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 22 ++++++++++++++++------
 drivers/media/pci/ivtv/ivtv-ioctl.c | 26 ++++++++++++++------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index fa57e12f2ac8f0d9..4864def20676ecef 100644
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
index 137853944e4619cb..35dccb31174c1e82 100644
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
2.26.0


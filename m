Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8B01A6D39
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 22:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbgDMU0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 16:26:04 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:21053 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388362AbgDMU0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 16:26:03 -0400
X-Halon-ID: f8f4e57d-7dc4-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id f8f4e57d-7dc4-11ea-aeed-005056917f90;
        Mon, 13 Apr 2020 22:25:53 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH v7 2/6] ivtv-ioctl.c: Do not initialize the reserved field of struct v4l2_fmtdesc
Date:   Mon, 13 Apr 2020 22:23:47 +0200
Message-Id: <20200413202351.1359754-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One of the reserved fields are about to be used. Instead of updating the
driver to only initialize three instead of four reserved fields remove
the explicit assignment.  As if one field in a struct is assigned, the
memory is zeroed and explicit assignment is redundant.

Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/pci/ivtv/ivtv-ioctl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 137853944e4619cb..8a45c50411c74831 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -922,12 +922,10 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 	static const struct v4l2_fmtdesc hm12 = {
 		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, 0,
 		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
-		{ 0, 0, 0, 0 }
 	};
 	static const struct v4l2_fmtdesc mpeg = {
 		0, V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FMT_FLAG_COMPRESSED,
 		"MPEG", V4L2_PIX_FMT_MPEG,
-		{ 0, 0, 0, 0 }
 	};
 	struct ivtv *itv = fh2id(fh)->itv;
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
@@ -948,12 +946,10 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 	static const struct v4l2_fmtdesc hm12 = {
 		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, 0,
 		"HM12 (YUV 4:2:0)", V4L2_PIX_FMT_HM12,
-		{ 0, 0, 0, 0 }
 	};
 	static const struct v4l2_fmtdesc mpeg = {
 		0, V4L2_BUF_TYPE_VIDEO_OUTPUT, V4L2_FMT_FLAG_COMPRESSED,
 		"MPEG", V4L2_PIX_FMT_MPEG,
-		{ 0, 0, 0, 0 }
 	};
 	struct ivtv *itv = fh2id(fh)->itv;
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
-- 
2.26.0


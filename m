Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5333618F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 18:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbfFEQqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 12:46:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51214 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbfFEQqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 12:46:33 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 339ED28527C;
        Wed,  5 Jun 2019 17:46:31 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] media: v4l2: Fix the _MPLANE format check in v4l_enum_fmt()
Date:   Wed,  5 Jun 2019 18:46:25 +0200
Message-Id: <20190605164625.5109-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAP_M2M_MPLANE means the device supports _MPLANE formats for both
capture and output. Adjust the check to avoid EINVAL errors on
such devices.

Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b4c73e8f23c5..ace9b9761bed 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_fmtdesc *p = arg;
 	int ret = check_fmt(file, p->type);
+	u32 cap_mask;
 
 	if (ret)
 		return ret;
@@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
+		cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			   V4L2_CAP_VIDEO_M2M_MPLANE;
+		if (!!(vdev->device_caps & cap_mask) !=
 		    (p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
 			break;
 
@@ -1408,7 +1411,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
+		cap_mask = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			   V4L2_CAP_VIDEO_M2M_MPLANE;
+		if (!!(vdev->device_caps & cap_mask) !=
 		    (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
 			break;
 
-- 
2.20.1


Return-Path: <linux-media+bounces-8681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 846228990EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 00:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13816B23868
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 22:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF98413C3D2;
	Thu,  4 Apr 2024 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="osVDb/sg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139513AA4D
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268028; cv=none; b=AAM1TAqXqPUIGIIfRQgPaZIXEHQ4EZOpXhK4HWggZz7BwL6/Zqtex5FMlp5K2wVURVKERbHG3c+RgHue9RJIdpRQnKSzJL5/igflA7GgRhpgfmSMkM/687U7kZDPKSZmiknO8HJQVqrBNtyj17jjN61QDRh/nRdJ/h1w0cBUS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268028; c=relaxed/simple;
	bh=qmnd8Ru/J1fswSlSR+bQOGumq2gaX5i3cvwMcP/Rn20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhQ1e4h7bSxEVaF6t6UCLlcddJbSvSrDyUW4GgJKvW/87f0X7xvJUQTP/Og8I1JPzAgGmCz8NXZFmaXt8rKR0D5pO0mqag5sQZTk83rw4KZcdBtuUVQlfcr0aXJFbKNeMjyUhsK2n+z9t9VJA5RPWkfQh9lfMlYS2Axg/uzCzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=osVDb/sg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54AB13A3;
	Thu,  4 Apr 2024 23:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712267985;
	bh=qmnd8Ru/J1fswSlSR+bQOGumq2gaX5i3cvwMcP/Rn20=;
	h=From:To:Cc:Subject:Date:From;
	b=osVDb/sgqdHkVGeSFm4GxTWLZmkESa4E7qJX6vV38Qz/ViJ0ZiJ4rk23PDXQL7tYD
	 gCneF5W8voYVanyShhDwu1LCycmhz9UiRxrAISaOT00+wn2sRTr/Zo/RJLyZHKQ4nw
	 N3mKHw3IfsvojHtJzRN4KnTTpY1rcifh5KiWTLms=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-subdev: Clearly document that the crop API won't be extended
Date: Fri,  5 Apr 2024 01:00:12 +0300
Message-ID: <20240404220012.7850-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V4L2 subdev crop API has been marked as obsolete, deprecated by the
selection API. Despite this, it has recently been extended with streams
support. In hindsight this was a mistake. Make sure it doesn't happen
again by clearly documenting that no new extensions will be accepted.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 6 +++---
 include/uapi/linux/v4l2-subdev.h                            | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 92d933631fda..88a748103a71 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -37,9 +37,9 @@ Description
 
 .. note::
 
-    This is an :ref:`obsolete` interface and may be removed
-    in the future. It is superseded by
-    :ref:`the selection API <VIDIOC_SUBDEV_G_SELECTION>`.
+    This is an :ref:`obsolete` interface and may be removed in the future. It is
+    superseded by :ref:`the selection API <VIDIOC_SUBDEV_G_SELECTION>`. No new
+    extensions to the :c:type:`v4l2_subdev_crop` structure will be accepted.
 
 To retrieve the current crop rectangle applications set the ``pad``
 field of a struct :c:type:`v4l2_subdev_crop` to the
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 7048c51581c6..81a24bd38003 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -50,6 +50,10 @@ struct v4l2_subdev_format {
  * @rect: pad crop rectangle boundaries
  * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
+ *
+ * The subdev crop API is an obsolete interface and may be removed in the
+ * future. It is superseded by the selection API. No new extensions to this
+ * structure will be accepted.
  */
 struct v4l2_subdev_crop {
 	__u32 which;
-- 
Regards,

Laurent Pinchart



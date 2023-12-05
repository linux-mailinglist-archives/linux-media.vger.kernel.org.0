Return-Path: <linux-media+bounces-1678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44B8056CE
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEDF71C20FD7
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A1565EB9;
	Tue,  5 Dec 2023 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WMVBQAj4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56E518D
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:08:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4192E158D;
	Tue,  5 Dec 2023 15:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701785250;
	bh=SfVmII1KkscBpgS7gomaUUxQp+APoc3mZTNh7VKo63k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WMVBQAj49jmNC73Fg9kKSrhS3JWNljtigvbzoj11Yh6vGtcEAMmYBHbPUlb4aShU3
	 voPaiu8aKA69ghqscAHYoRSKMV2mC4oDtTa7oYPCjMqZ0uaKHTzwk6Onj4cG4EhijZ
	 xZ4YfdtmtodEFSvYFoccvcXWdMmDDcHyCrnWKmO8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 6/7] media: docs: uAPI: Fix documentation of 'which' field for routing ioctls
Date: Tue,  5 Dec 2023 16:08:09 +0200
Message-ID: <20231205140810.22368-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The routing ioctls documentation incorrectly describes the 'which'
field, due to a bad copy & paste. Fix it.

Fixes: ea73eda50813 ("media: Documentation: Add GS_ROUTING documentation")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 791c1e628d5c..26b5004bfe6d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -72,7 +72,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
 
     * - __u32
       - ``which``
-      - Format to modified, from enum
+      - Routing table to be accessed, from enum
         :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
     * - struct :c:type:`v4l2_subdev_route`
       - ``routes[]``
-- 
Regards,

Laurent Pinchart



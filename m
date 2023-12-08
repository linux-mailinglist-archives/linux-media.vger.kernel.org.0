Return-Path: <linux-media+bounces-2015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF380ABE0
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C7B6B20C7D
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 18:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C478F4C3AC;
	Fri,  8 Dec 2023 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r1ud2rMW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B6FD5C
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 10:16:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2107E45;
	Fri,  8 Dec 2023 19:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702059368;
	bh=SfVmII1KkscBpgS7gomaUUxQp+APoc3mZTNh7VKo63k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r1ud2rMWJ0e5bm9Ibq1rwsSaWW2mfYdqtbIPlFAmP8JnrxEEQx4Ucy9ldSZg1A2yF
	 G+EHY/Y66X2aAbGXvvOAPttxIOKwMP9Ev2UBS0SZPYjcAhcUBihRJ7E9+J7ObIvZns
	 Z+QCNs1Ok1KXoVq1AR3KKVbmBbN/fkYysd7UcuFc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 7/8] media: docs: uAPI: Fix documentation of 'which' field for routing ioctls
Date: Fri,  8 Dec 2023 20:16:47 +0200
Message-ID: <20231208181648.13568-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
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



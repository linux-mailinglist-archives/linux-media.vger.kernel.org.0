Return-Path: <linux-media+bounces-2365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38546811573
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6C80B21279
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ED930D01;
	Wed, 13 Dec 2023 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ODB/UYOU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59516F2
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 07:00:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C461C293B;
	Wed, 13 Dec 2023 15:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702479568;
	bh=SfVmII1KkscBpgS7gomaUUxQp+APoc3mZTNh7VKo63k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ODB/UYOUgIC6Dpp5qgbMlV7wdm5PPVuDYamjOF1k6uNg2/tZq2Z+fpAYXOA/4hrMk
	 B+FofBZTGmIobEgS5+CD1XJMaxgpMLwHUxrIiH9nMeOWhKhYx8CjAtqiLLJM+kNT3J
	 0jIR1phxLctO4llB8IaKiaVyXOeRB31267//lfoc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v6 7/8] media: docs: uAPI: Fix documentation of 'which' field for routing ioctls
Date: Wed, 13 Dec 2023 17:00:09 +0200
Message-ID: <20231213150010.25593-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
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



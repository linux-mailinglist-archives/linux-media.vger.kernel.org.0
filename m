Return-Path: <linux-media+bounces-8485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B15896881
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E731C220DF
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0566D1A3;
	Wed,  3 Apr 2024 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tpsTaQsf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F185FB85
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132228; cv=none; b=s8bEn+3PaX6hbo2Nt3jjgX+EEhjTQdnzoEjvyfdyZRFfBIOyJAfH2jvkt2/kBjlvY6MxwD36F8UehGx0W+/JQ4YekASPjQhcP3bg/uB7VOI+OpBeZUCooPmnjyP+jKFGHA3JfPBXqGfwGe8hEbD9vQxpzG10lXb7GB+Yi7n6wEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132228; c=relaxed/simple;
	bh=P5H5yxAQy8eZaZ8gX4xLN3+4xkla09JA1QWQ8WYZ68c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFeP/SPEVXzKcb0wPW8Zrz59JJ41+Yuht50A4MkQliGe19SrXbmOnv73C9F7Iqcey5fZWlA5Wu+B8c12kTTV4K5kmvUSagQZu8QQ/CIVUhIbQU12u1fR5uUOnVZ+a3L6q0ZCeFMiQVe8PGTFkSP3CZnJvQ4PsXCb4mahaAUoL7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tpsTaQsf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2934B53;
	Wed,  3 Apr 2024 10:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712132185;
	bh=P5H5yxAQy8eZaZ8gX4xLN3+4xkla09JA1QWQ8WYZ68c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tpsTaQsf67R7jdMj3IV07MyrMgF00SldnDATt0PfrUUMvWwipbq6zmbQEHfi60XtL
	 EvsBkT1eZLrqmAYbI6m2JR8l5w83htUDYb5fW1tqvB8aku63H1v+hFX7QiwLeAgAIy
	 oaNqghg7qnXYd5LNWrcsrSYbGCuUrDKklPMjrV2A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Apr 2024 11:16:29 +0300
Subject: [PATCH v4l-utils 2/2] v4l2-compliance: Fix streams use in
 testSubDevEnumFrameSize()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-v4l2-compliance-streams-fixes-v1-2-a1c383cc2139@ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=P5H5yxAQy8eZaZ8gX4xLN3+4xkla09JA1QWQ8WYZ68c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDRB864RJvJ1ONva+56uU1vFldn5u/8jJiDsxQ
 nLPnfi1MoGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0QfAAKCRD6PaqMvJYe
 9ZA/EACuZdMDSHsxExWgdpES6FU6mOwe2idvJIHgwujt10a1LNeh8Y0X/BBzbo372yqfSdSIjkN
 WzPVhYws8JTWDZWIjkVeFngfDfAH/Zs6a4eJ9W5wo2MvGFiCT7wDS423TmX18NzJpARgZ8PVcZ0
 sArxUcgMM/FfBea+hvQpDhdfFbzHJyxXT+Dh+aBORU2PLMckO6LAXSDOPzLmY5DA6hRVuqc1Lll
 CobCDnI9bJTjwmplO59TcUc6B6+VEZj6qIbOC94SmF5j95EJWZBZcM8ZnWx2UVzWUoucWtZWOvO
 KpL9/weMH5rvj6uXD4KjN7gxh1+XcIa8qW8h++pQLItVxZGIM7B8qJiLo/Rckhy1OUXQoIWFqgq
 VnYNlH/PMxa38RfO93+prxtXEs757MN3PzSJ6aAzxNLeVUiD5ziYeOK2lTQAoksam8FLrpGqAEa
 ldSHfVX29/3JOolp/5rUxwPUtaSMemb5qFyr6U/lKVKsHXtMGXjdIJZwD4PVHMCaDVy2XpUKT6d
 oimL0LK2VL607DAPxTKwGBlCT/S2+Ubu/tFLfNlUk+fsc4jV2oh1oNJAxNpNL8Md2P8ccP1QNWD
 eDksPAwt6VUhUfLJj9Zto2fqugUMiFEgcRzAjULuHEps0J5rQfpDR67fYMc2NBz7ZtAyf6B3eu+
 b549Q7Np1fl/fcQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We don't pass the stream number to testSubDevEnumFrameSize(), which
instead always uses stream number 0. This causes failures when the
subdevice uses streams.

Fix this by adding stream parameter, and passing the correct stream ID.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index fe7a9e1d..b2667a3b 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -121,7 +121,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
 }
 
 static int testSubDevEnumFrameSize(struct node *node, unsigned which,
-				   unsigned pad, unsigned code)
+				   unsigned pad, unsigned stream, unsigned code)
 {
 	struct v4l2_subdev_frame_size_enum fse;
 	unsigned num_sizes;
@@ -130,7 +130,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
-	fse.stream = 0;
+	fse.stream = stream;
 	fse.code = code;
 	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse);
 	node->has_subdev_enum_fsize |= (ret != ENOTTY) << which;
@@ -140,7 +140,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 		memset(&fie, 0, sizeof(fie));
 		fie.which = which;
 		fie.pad = pad;
-		fie.stream = 0;
+		fie.stream = stream;
 		fie.code = code;
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY);
 		return ret;
@@ -156,7 +156,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0xff, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
-	fse.stream = 0;
+	fse.stream = stream;
 	fse.code = code;
 	fse.index = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse));
@@ -266,7 +266,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
 		fail_on_test(mbus_core_enum.stream != stream);
 		fail_on_test(mbus_core_enum.index != i);
 
-		ret = testSubDevEnumFrameSize(node, which, pad, mbus_core_enum.code);
+		ret = testSubDevEnumFrameSize(node, which, pad, stream, mbus_core_enum.code);
 		fail_on_test(ret && ret != ENOTTY);
 	}
 	return 0;

-- 
2.34.1



Return-Path: <linux-media+bounces-8506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A96896C22
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B31EB2FBC7
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77208137C2F;
	Wed,  3 Apr 2024 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HIbW1dW7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF613698D
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139367; cv=none; b=FHOxOhXHbWXtxYLrsuIGVSdDRlJ9a2Tb1Wj80Qdj/lBfjAADHxj/bsMqdhjmTuHNqQWVakx16re62ItutIHRcm7biUPmwxXMhjHWxIxcSOOEV055K96Nhsl1KIn1jezDdgEfKCyhbKWmwqusO96SJHVglTpROjGkuH5tuUn3png=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139367; c=relaxed/simple;
	bh=/d342kkljzgo3r0LvxBbz92ayYMdIqOOMoPh6QK+w7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDvFRoGHnbOg1RXZ+CYw3kNLRXTaXC+Ykp17n3agl86vsKvUGKFM5eDBb+7twY4fFwjbpgbJgVOOt1cIjiLrDZrbnMwtRMZ9d655/hRHFkvTj1wno0CPVi3P9ECfCj24ifiGiOqDZqw504HJSKythMnxrNWxRsP57cElBcReQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HIbW1dW7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698F2B53;
	Wed,  3 Apr 2024 12:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712139323;
	bh=/d342kkljzgo3r0LvxBbz92ayYMdIqOOMoPh6QK+w7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HIbW1dW7xEEopZ6mK06mkqVXTkRwNmcKeLTYzPihXZNjl1HoJOKc/c2RuhCOlOU1j
	 fNAB4TNUa3pjJUWNiUahf+DnamkfNYMCRfillnEgxQ3Xf2qa2GEqV+71PjvVDIYD+T
	 0cn8WXJat+Ucx4KkyROQXfrulHperT5OCQj6DbDk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Apr 2024 13:15:45 +0300
Subject: [PATCH v4l-utils v2 2/2] v4l2-compliance: Fix streams use in
 testSubDevEnumFrameSize()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-v4l2-compliance-streams-fixes-v2-2-be9b338dc204@ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/d342kkljzgo3r0LvxBbz92ayYMdIqOOMoPh6QK+w7w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDSxeMpldOlkNRK/4VIX2oXtpxy0YTN/Mzp2i4
 5zkcg3W3TGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0sXgAKCRD6PaqMvJYe
 9U2ZEACrpctcA6kJDlt10akQg+hJFoA/DA3xZwdDLkwtgHUelqdcNtdgahTUt4qBlpnrjvLBV2G
 0BrZYf0A8Qdq5VVeb5HFK3cWkJhYkVzIXrHHAjGWVQLhdRgYv8Nn+TGZFDdqD1bFaLLkzoA/h9z
 Gpo76qHAY7RqK54eHh33RHjHezob+mRh+/zfGf1w2GcVgB2ypPdbQ363G9E9EMS8ScQ7Wez9vn0
 alwNn73iEo+RLGoSqG8q5p3DNGak6mAP0iESGrK/pz92AGjz4uhMGLbjmAjVWaEGWfdnP4hYKr/
 HZHkBlEMONqIIopmuvHHKw4l6uj2ZVJpPdRpVx9JCckjMvCreTscOlkkmq+rRA2x5g3tUVYVVDl
 2V+tznWtQDpmIhUjQC7ECqZesAAnadBgOo6Jcn8L2NNR8Q1yo+2rvrg+nS9ymqmR96wrWphP4eV
 re/7PfQYSAAxHPvoYz7+51r9VivtgkTyVOPb39pp/KH2SJB5KnsPn+tT2q6USUtBcNzSQXxrlZ/
 +mpK+di9s5n4Puwq1UUHFgWqKA8MneYGJqMUqO+4DxHqbkt8IHTJA3gc+efkGLnrQAoqELz4kNa
 H+6KQk5duqdLdOIEFMl55RIjeafFRFJg8CbtUO8vMbQM7g2X5x6/O+5s0LNgP1H/XIIyKr5xRrR
 HOvQWa/GT2rkZKA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We don't pass the stream number to testSubDevEnumFrameSize(), which
instead always uses stream number 0. This causes failures when the
subdevice uses streams.

Fix this by adding stream parameter, and passing the correct stream ID.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 560efb70..da304a8c 100644
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



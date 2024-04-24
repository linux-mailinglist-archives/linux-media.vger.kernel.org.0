Return-Path: <linux-media+bounces-10039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A88B0E0D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F73B1C23BA6
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FB5160862;
	Wed, 24 Apr 2024 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ovQGRFrz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB59B160873
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972167; cv=none; b=L6XgFQpOZcJtq1hgiK+t3SIskRGYuunKd8QM97m4eig1JoiCc5t5MKeRbS9mWBEoFeLcmV6l9iyDkRnQVjZw9abcCAGNofCi9zzahJNeuauduuFeNwiLqwSbYEQVyvwTf8grTB5WbbANUhdmNQPTF/hTRtLpSJI0FOobgYKxzVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972167; c=relaxed/simple;
	bh=sJNrqvWwyRhl0VoBpq2vFdfD40L3zzAl0advP0i08G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpmVm1IfJ5ku48fRZPV2PjFB/GU2wOt2+QhpbnskuWTvkG3XgWFYJPZKW/iJ8Epw2g8n9u2EuuQdCFAOvFIfXD99rxjCLnEQV+NYl7xH8GuMYjYm34msawnJkhdRlIe9zsJfkHG0zcz4IZtoQHVHsUMaLN7aY19OiKAPud2n1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ovQGRFrz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0FDB114D;
	Wed, 24 Apr 2024 17:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972109;
	bh=sJNrqvWwyRhl0VoBpq2vFdfD40L3zzAl0advP0i08G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovQGRFrzGGh8Ue/NGnWz4WuLJVdY/DH+4xmLvMUgV0VV5fVfAWSpFpqQBhXu9zLbu
	 4lWN4zTRndewJTY2tuQ1dkA0rIAyQ8lH12Q1lxX+SEof9m+rWcBvATtcK6dTT6EtN9
	 MlM3HqDKqN7JYhs9oFZn/ttjctg8sZ9nENQzaWJk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 4/7] v4l2-compliance: Add tests for V4L2_FMT_FLAG_META_LINE_BASED flag
Date: Wed, 24 Apr 2024 18:22:27 +0300
Message-ID: <20240424152230.31923-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The metadata API supports a new flag, V4L2_FMT_FLAG_META_LINE_BASED. It
can be set for metadata formats only, and is the only flag that can be
set for metadata formats. When set, the width, height and bytesperline
fields must not be zero. Add corresponding tests.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 423567fe573b..5507e45ef3dd 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -281,12 +281,23 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 				      V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL |
 				      V4L2_FMT_FLAG_CSC_COLORSPACE |
 				      V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_HSV_ENC |
-				      V4L2_FMT_FLAG_CSC_QUANTIZATION | V4L2_FMT_FLAG_CSC_XFER_FUNC))
+				      V4L2_FMT_FLAG_CSC_QUANTIZATION | V4L2_FMT_FLAG_CSC_XFER_FUNC |
+				      V4L2_FMT_FLAG_META_LINE_BASED))
 			return fail("unknown flag %08x returned\n", fmtdesc.flags);
 		if (!(fmtdesc.flags & V4L2_FMT_FLAG_COMPRESSED))
 			fail_on_test(fmtdesc.flags & (V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
 						      V4L2_FMT_FLAG_DYN_RESOLUTION |
 						      V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL));
+
+		// Checks for metadata formats.
+		// The META_LINE_BASED flag can be set for metadata formats only.
+		if (type == V4L2_BUF_TYPE_META_OUTPUT || type == V4L2_BUF_TYPE_META_CAPTURE)
+			fail_on_test(fmtdesc.flags & ~V4L2_FMT_FLAG_META_LINE_BASED);
+		// Only the META_LINE_BASED flag is valid for metadata formats.
+		if (fmtdesc.flags & V4L2_FMT_FLAG_META_LINE_BASED)
+			fail_on_test(type != V4L2_BUF_TYPE_META_OUTPUT &&
+				     type != V4L2_BUF_TYPE_META_CAPTURE);
+
 		ret = testEnumFrameSizes(node, fmtdesc.pixelformat);
 		if (ret)
 			fail_on_test(node->codec_mask & STATEFUL_ENCODER);
@@ -590,6 +601,10 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 			return fail("dataformat %08x (%s) for buftype %d not reported by ENUM_FMT\n",
 					meta.dataformat, fcc2s(meta.dataformat).c_str(), type);
 		fail_on_test(meta.buffersize == 0);
+		if (map.at(meta.dataformat) & V4L2_FMT_FLAG_META_LINE_BASED) {
+			fail_on_test(!meta.width || !meta.height);
+			fail_on_test(!meta.bytesperline);
+		}
 		break;
 	case V4L2_BUF_TYPE_PRIVATE:
 		break;
-- 
Regards,

Laurent Pinchart



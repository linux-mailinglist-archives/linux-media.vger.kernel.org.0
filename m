Return-Path: <linux-media+bounces-8324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26958894818
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD18B21220
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB1A10A0C;
	Tue,  2 Apr 2024 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J6UqcFtc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2274D53C
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016059; cv=none; b=IJZVM3JTnGNBp6GiistjjAr8hn24vlbI+Zm1zw++H10A85jc8TfxB9QLpHchgp3oNhemS/j8IwMSlSZ5h2GW4374mete2oXMVfTnnuhWRgz+/A1ESW8TrHLZXuvinEV9+TfMcwFrQPyptxZIYzN1ICmb/HmFlM3r9evXZT1GjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016059; c=relaxed/simple;
	bh=sJNrqvWwyRhl0VoBpq2vFdfD40L3zzAl0advP0i08G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIISqwJyl7XrdtO6TtfZaRVxpdYf7V3sal2o4uOUzOkVI7pUmpomid5LPvO92qdoZjao6jdww5+gVZk5HsDukqWQzt+UE54jI89w6zAaBRsp3YZRcZnD5FwYEO+4PXmdfCmMAL6S7GCaDX/mEM1rJu/lgkj3A9zRGzfJIGph1ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J6UqcFtc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06616B53;
	Tue,  2 Apr 2024 02:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016017;
	bh=sJNrqvWwyRhl0VoBpq2vFdfD40L3zzAl0advP0i08G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J6UqcFtcdfNutVF4Z4hCt0j9vtjqdfUJMMVYLEbJNNoBESlrRMK7kyRExEUno4Wnr
	 Iy1GTvk9CMhS5FHF5VDgwltqiTIm5ZFzVgZr7mUB1WFeg7uwlMcxTkI4L2AcWRZUNY
	 g8epmngI/3e1vHaJs0HWo7kgETBXdifJ2GXjk01o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 7/8] v4l2-compliance: Add tests for V4L2_FMT_FLAG_META_LINE_BASED flag
Date: Tue,  2 Apr 2024 03:00:32 +0300
Message-ID: <20240402000033.4007-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
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



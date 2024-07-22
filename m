Return-Path: <linux-media+bounces-15262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E5939161
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A08F1F2235E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BE416E865;
	Mon, 22 Jul 2024 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WDP5X+HP"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5377816DED9
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660768; cv=none; b=f9jNkzh5DoaeTpyMkboIBqruiJyR7W0J5FlWK/MVrmKLJMB77lkrTz4YzdPYxc7GCqtW65Qffj+ZcJC2fFNHt0LztP7zPux6e0LpliG0GyrnfqNQiLr1HqL8mWjE7QD0gwwQXUMpvhDdwtHBdXeZbIue5O819RPgYW70/qm3IzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660768; c=relaxed/simple;
	bh=3dm9s1yJwX7FmV7gb+E4iAMepVKP06BS+8hk3bez1eY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YL9MKYBj5r5bSlsa5otIaGS9wRR/HphaRvI+dHxpMpvP1oBUTOPQSuh8/c/7OjzTTip9Wl6/aXidY3F5mlerwtnMYlVHrtoW5s8yshrJiDkApQveCFZTjtjQ+RrOAwadQsEfVtVxaQqxbA1zpyn5yceDoRqsTqO/x9Y6PJfcPQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WDP5X+HP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660766;
	bh=3dm9s1yJwX7FmV7gb+E4iAMepVKP06BS+8hk3bez1eY=;
	h=From:To:Cc:Subject:Date:From;
	b=WDP5X+HPEfwdWEx95wpa9mGnAzVg7PDyYiKUoueIi+jcGBf6gMzHZPbiTqJ0OS5fK
	 CTLddjMplWLifmhPXYSvDeARZCFq3ZcgYOvvGbYjFseCAPa1mu3fEZZhC7SITNCDRf
	 3+IpiMUqydptAM8oRnJtlp6T4NEIgPxk6+JGj2PO1CfCw7AVhefv8qBUrRxBW7iSLt
	 fvOIx3nUQHpjmy0pfvwGnP9DhtQg0C5ec8yS5RDQhbWDRP9lzGNRJVzFci3lqxIrl5
	 Afd7jbcx3qfXnT8m5IT3RTa7cM4ksP3NdYzILOzDnoU0xFa2oV7+MrfOpC9nTrmSYQ
	 qy6eU7Ajg9C+Q==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B642B378001E;
	Mon, 22 Jul 2024 15:06:05 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] v4l2-compliance: Add enum all formats test
Date: Mon, 22 Jul 2024 17:06:04 +0200
Message-ID: <20240722150604.149707-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test to check if V4L2_FMT_FLAG_ENUM_ALL is supported
or not by drivers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h                   |  3 ++
 utils/common/v4l2-info.cpp                  |  1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-formats.cpp | 60 +++++++++++++++++++--
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index f18a40d4..8e2a8b36 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -864,6 +864,9 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
 #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
+/*  Format description flag, to be ORed with the index */
+#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
+
 	/* Frame Size and frame rate enumeration */
 /*
  *	F R A M E   S I Z E   E N U M E R A T I O N
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index aaf7b0b5..c2c49ad0 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -383,6 +383,7 @@ static constexpr flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
 	{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" }, 		\
 	{ V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" }, 			\
 	{ V4L2_FMT_FLAG_META_LINE_BASED, "meta-line-based" },			\
+	{ V4L2_FMT_FLAG_ENUM_ALL, "enum-all-formats" },				\
 	{ 0, NULL } 								\
 };
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 144f9618..3446f66f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1444,6 +1444,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 
 		printf("Format ioctls%s:\n", suffix);
 		printf("\ttest VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: %s\n", ok(testEnumFormats(&node)));
+		printf("\ttest VIDIOC_ENUM_FMT ALL FORMATS: %s\n", ok(testEnumAllFormats(&node)));
 		printf("\ttest VIDIOC_G/S_PARM: %s\n", ok(testParm(&node)));
 		printf("\ttest VIDIOC_G_FBUF: %s\n", ok(testFBuf(&node)));
 		printf("\ttest VIDIOC_G_FMT: %s\n", ok(testGetFormats(&node)));
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 948b62fd..be72590f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -366,6 +366,7 @@ int testEdid(struct node *node);
 
 // Format ioctl tests
 int testEnumFormats(struct node *node);
+int testEnumAllFormats(struct node *node);
 int testParm(struct node *node);
 int testFBuf(struct node *node);
 int testGetFormats(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index fc16ad39..2b9b00ae 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -221,7 +221,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
 	return 0;
 }
 
-static int testEnumFormatsType(struct node *node, unsigned type)
+static int _testEnumFormatsType(struct node *node, unsigned type, bool enum_all_formats)
 {
 	pixfmt_map &map = node->buftype_pixfmts[type];
 	struct v4l2_fmtdesc fmtdesc;
@@ -234,6 +234,9 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 		fmtdesc.index = f;
 		fmtdesc.mbus_code = 0;
 
+		if (enum_all_formats)
+			fmtdesc.index |= V4L2_FMT_FLAG_ENUM_ALL;
+
 		ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
 		if (ret == ENOTTY)
 			return ret;
@@ -246,7 +249,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 		ret = check_0(fmtdesc.reserved, sizeof(fmtdesc.reserved));
 		if (ret)
 			return fail("fmtdesc.reserved not zeroed\n");
-		if (fmtdesc.index != f)
+		if ((fmtdesc.index & ~V4L2_FMT_FLAG_ENUM_ALL) != f)
 			return fail("fmtdesc.index was modified\n");
 		if (fmtdesc.type != type)
 			return fail("fmtdesc.type was modified\n");
@@ -312,7 +315,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 			continue;
 		// Update define in v4l2-compliance.h if new buffer types are added
 		assert(type <= V4L2_BUF_TYPE_LAST);
-		if (map.find(fmtdesc.pixelformat) != map.end())
+		if (map.find(fmtdesc.pixelformat) != map.end() && !enum_all_formats)
 			return fail("duplicate format %08x (%s)\n",
 				    fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
 		map[fmtdesc.pixelformat] = fmtdesc.flags;
@@ -321,6 +324,16 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 	return 0;
 }
 
+static int testEnumFormatsType(struct node *node, unsigned type)
+{
+	return _testEnumFormatsType(node, type, false);
+}
+
+static int testEnumAllFormatsType(struct node *node, unsigned type)
+{
+	return _testEnumFormatsType(node, type, true);
+}
+
 int testEnumFormats(struct node *node)
 {
 	bool supported = false;
@@ -372,6 +385,47 @@ int testEnumFormats(struct node *node)
 	return supported ? 0 : ENOTTY;
 }
 
+int testEnumAllFormats(struct node *node)
+{
+	bool supported = false;
+	unsigned type;
+	int ret;
+
+	for (type = 0; type <= V4L2_BUF_TYPE_LAST; type++) {
+		ret = testEnumAllFormatsType(node, type);
+		if (ret && ret != ENOTTY)
+			return ret;
+		if (!ret)
+			supported = true;
+		switch (type) {
+		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		case V4L2_BUF_TYPE_VIDEO_OVERLAY:
+		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		case V4L2_BUF_TYPE_SDR_CAPTURE:
+		case V4L2_BUF_TYPE_SDR_OUTPUT:
+			if (supported && ret && (node->g_caps() & buftype2cap[type]))
+				return fail("%s cap set, but no %s formats defined\n",
+						buftype2s(type).c_str(), buftype2s(type).c_str());
+			if (supported && !ret && !(node->g_caps() & buftype2cap[type]))
+				return fail("%s cap not set, but %s formats defined\n",
+						buftype2s(type).c_str(), buftype2s(type).c_str());
+			break;
+		case V4L2_BUF_TYPE_META_CAPTURE:
+		case V4L2_BUF_TYPE_META_OUTPUT:
+			/* Metadata formats need not be present for the current input/output */
+			break;
+		default:
+			if (!ret)
+				return fail("Buffer type %s not allowed!\n", buftype2s(type).c_str());
+			break;
+		}
+	}
+
+	return supported ? 0 : ENOTTY;
+}
+
 static int testColorspace(bool non_zero_colorspace,
 			  __u32 pixelformat, __u32 colorspace, __u32 ycbcr_enc, __u32 quantization)
 {
-- 
2.43.0



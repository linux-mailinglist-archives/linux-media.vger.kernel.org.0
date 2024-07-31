Return-Path: <linux-media+bounces-15631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3F4942AA8
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F4C9B2368D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE121AB530;
	Wed, 31 Jul 2024 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fsuILdFH"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05BA1AB529
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418531; cv=none; b=h+cgZvj1RpiqslLX0iEtAZ7fR8WnN5ElTHBEBdM5V7kmumxKzzn3JUicj7b8pks3dmvUH0YWw5w3X4pnIdN4LB/aLNg+dNKJzre8HTDxC8qRIUXU8NBKCNrBzeuTNuUOWpeXEMPzwy5jQDcWWzB7vYjcIye/zZnc0jLQXcxOJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418531; c=relaxed/simple;
	bh=6ty6HEJGNzXvSeX3C5zgUhACHOsMfJtQHwVi1KBFheQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3jNR7H2v1TGeP2rFlmSZKItv5SchdNkqxJrMluvvD8tTzhnzmHGVIZsUljHnUmHrh0sSloMfuyB8B57dlxq21P5pBlkfKkcrS1iBFl2drN8Kk/2U3cZ5/2a0iyvzx30LdsYCqqqK7DM+fikWkDc1lnYyxqpP2Ona+VUSyAHwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fsuILdFH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722418528;
	bh=6ty6HEJGNzXvSeX3C5zgUhACHOsMfJtQHwVi1KBFheQ=;
	h=From:To:Cc:Subject:Date:From;
	b=fsuILdFH1w52xr38EBp/OBVSjET8zwIlDhMsn9DrFzAyu8zgTnssRTCEizL7aSfHZ
	 6CR6V86NFcFq8bXM5fIpIcftU+5SkWZV1VMPBYZ5RQjnxpg++ZJvRQkZBdpmc/hC7S
	 HRWt9Xcfr0MpE8/cCcGhGLAVS8uTb/i9zRt60azLUMLMuWmh+ToZ5VgmwfSA/hPYLg
	 sLAGTpRntRuOPh/67KM7fRX1E8zO38iTMXwN4RAVrkRmkY3eQQAuMkkcPPVGOPqapL
	 +Gl+7i/khYPmAniDSNFbFjegI0b8l58xFX4O54F1JpawPO6Ab8JwEkM6X4uTbfW24H
	 6adypZ05Oli1w==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 56D103780BC9;
	Wed, 31 Jul 2024 09:35:28 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2] v4l2-compliance: Add test for V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Wed, 31 Jul 2024 11:35:26 +0200
Message-ID: <20240731093526.29137-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported, test if all
pixel formats list with VIDIOC_ENUM_FMT without the flag been set
is a subset of the list created with the flag.
Also Test that the flag is cleared after calling VIDIOC_ENUM_FMT.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 2:
- Completely rework how the test it done.

 include/linux/videodev2.h                   |  3 ++
 utils/common/v4l2-info.cpp                  |  1 +
 utils/v4l2-compliance/v4l2-test-formats.cpp | 36 +++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index f18a40d4..c166bb35 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -864,6 +864,9 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
 #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
+/*  Format description flag, to be ORed with the index */
+#define V4L2_FMTDESC_FLAG_ENUM_ALL		0x80000000
+
 	/* Frame Size and frame rate enumeration */
 /*
  *	F R A M E   S I Z E   E N U M E R A T I O N
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index aaf7b0b5..248ab9c3 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -383,6 +383,7 @@ static constexpr flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
 	{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" }, 		\
 	{ V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" }, 			\
 	{ V4L2_FMT_FLAG_META_LINE_BASED, "meta-line-based" },			\
+	{ V4L2_FMTDESC_FLAG_ENUM_ALL, "enum-all-format" },			\
 	{ 0, NULL } 								\
 };
 
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index fc16ad39..2b743da5 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -224,6 +224,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
 static int testEnumFormatsType(struct node *node, unsigned type)
 {
 	pixfmt_map &map = node->buftype_pixfmts[type];
+	pixfmt_map enum_all;
 	struct v4l2_fmtdesc fmtdesc;
 	unsigned f = 0;
 	int ret;
@@ -317,6 +318,41 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 				    fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
 		map[fmtdesc.pixelformat] = fmtdesc.flags;
 	}
+
+	/* Test V4L2_FMTDESC_FLAG_ENUM_ALL if supported */
+	f = 0;
+	for (;;) {
+		memset(&fmtdesc, 0xff, sizeof(fmtdesc));
+		fmtdesc.type = type;
+		fmtdesc.index = f | V4L2_FMTDESC_FLAG_ENUM_ALL;
+		fmtdesc.mbus_code = 0;
+
+		ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
+		if (ret == ENOTTY)
+			return ret;
+		if (f == 0 && ret == EINVAL)
+			return 0;
+		if (ret == EINVAL)
+			break;
+		if (ret)
+			return fail("expected EINVAL, but got %d when enumerating buftype %d\n", ret, type);
+		if (fmtdesc.index != f)
+			return fail("V4L2_FMTDESC_FLAG_ENUM_ALL hasn't been cleared from fmtdesc.index 0x%x f 0x%x\n", fmtdesc.index, f);
+		f++;
+		if (type == V4L2_BUF_TYPE_PRIVATE)
+			continue;
+		assert(type <= V4L2_BUF_TYPE_LAST);
+		if (enum_all.find(fmtdesc.pixelformat) != enum_all.end())
+			return fail("duplicate format %08x (%s)\n",
+				    fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
+		enum_all[fmtdesc.pixelformat] = fmtdesc.flags;
+	}
+	/* if V4L2_FMTDESC_FLAG_ENUM_ALL is supported, verify that the list is a subset of VIDIOC_ENUM_FMT list */
+	if (!enum_all.empty()) {
+		for (auto it = map.begin(); it != map.end(); it++)
+			if (enum_all.find(it->first) == enum_all.end())
+				return fail("V4L2_FMTDESC_FLAG_ENUM_ALL failed to enumerate format %08x (%s)\n", it->first, fcc2s(it->first).c_str());
+	}
 	info("found %d formats for buftype %d\n", f, type);
 	return 0;
 }
-- 
2.43.0



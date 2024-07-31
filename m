Return-Path: <linux-media+bounces-15640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F79942F4E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 14:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8D7D28EDCE
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E71BD011;
	Wed, 31 Jul 2024 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SO/hCuqP"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6411B1425
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430277; cv=none; b=t56kxO3/20YFMG3MzAcTyxgU1bLcpLmzKSRkmAYe9zTAvfEvkcjcb1FMZiC0RJABT5e4MqQxYxxX9itGeS3aqRmj3Gi1FnGWeA/K1HloyHlZXPGD7M3hQBdIGupTp/tBTly1caE4hQYgOtbtW1+jeJkcd8u0HLCGwJBz/VVzgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430277; c=relaxed/simple;
	bh=TI1enjLJ30Lo+IkqSjSo5Q+oc+w0/DhGPm+PhSHBX6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYg6xFyj7HMs231euPkjsRf2WzMZoluLEX8XVwqdH9tVASAAw7qYk+nrd6ef6lkhqMORUmIDLlxtGbmXogbCGiJw26gOi5u2PtFpb3wNgozeSVMo20vgZN1b9ZPlk80k1Q/X1/5j8iBjsIgk2+dUe4VVkFHdTUC9ngewZ/2m6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SO/hCuqP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722430274;
	bh=TI1enjLJ30Lo+IkqSjSo5Q+oc+w0/DhGPm+PhSHBX6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SO/hCuqP/d3U140kREpj+LV/93Ivv/m0tfqb8sVs91k8yUWI9wMshTXscwSJsKHhD
	 BcZro70eL5TTzWde8p5R1qqJeP2mhmXMVly8bV/hiB4iwRdO+cCgCFLQFLtDYfYJUV
	 M4fISdxH+xOyZFsHBO1pPWmilKumlu2gB4qWu7wpTkOZSwVRQlJ02IyDNsInPbFgh3
	 5ebPMyMqxvKGV32TV1J58ETNJtVN4PFm66uUELxJRftcsgVEOmRBrx+p54B21xKfYz
	 eh3T205lekQBdKSgqZIpWrelJh2YlgF2aBWVMpAcpgwM50V2EJm/NXMoieCKYXg5M5
	 +fnDprMMIuIqA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BF6F37811F4;
	Wed, 31 Jul 2024 12:51:14 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 1/2] v4l2-compliance: Add test for V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Wed, 31 Jul 2024 14:51:07 +0200
Message-ID: <20240731125108.38407-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731125108.38407-1-benjamin.gaignard@collabora.com>
References: <20240731125108.38407-1-benjamin.gaignard@collabora.com>
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
Also Test that the flag is cleared of calling VIDIOC_ENUM_FMT.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 3:
- Fix the remarks done by Hans

 include/linux/videodev2.h                   |  3 ++
 utils/v4l2-compliance/v4l2-test-formats.cpp | 35 +++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index fc16ad39..bac28cba 100644
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
@@ -318,6 +319,40 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 		map[fmtdesc.pixelformat] = fmtdesc.flags;
 	}
 	info("found %d formats for buftype %d\n", f, type);
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
+	info("found %d formats for buftype %d (with V4L2_FMTDESC_FLAG_ENUM_ALL)\n", f, type);
+
+	/* if V4L2_FMTDESC_FLAG_ENUM_ALL is supported, verify that the list is a subset of VIDIOC_ENUM_FMT list */
+	for (auto it = map.begin(); it != map.end(); it++)
+		if (enum_all.find(it->first) == enum_all.end())
+			return fail("V4L2_FMTDESC_FLAG_ENUM_ALL failed to enumerate format %08x (%s)\n", it->first, fcc2s(it->first).c_str());
+
 	return 0;
 }
 
-- 
2.43.0



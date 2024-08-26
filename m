Return-Path: <linux-media+bounces-16849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2195F7D5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254C91C22004
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E264A;
	Mon, 26 Aug 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iUre3MLV";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ZsLp5ZV/"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-40.smtp-out.eu-west-1.amazonses.com (a7-40.smtp-out.eu-west-1.amazonses.com [54.240.7.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A151917DF
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692815; cv=none; b=p5FVnjW9iimVGQdBZT2eD7Y/paFhMQiAsXW7x59Vg47IsGDpmIrVtygimIFQwiHXSm2LP4k0xHdke/I97zqdSjGOeUvaveyO3T+xNfwTMFYPAqQlXCP07cD2H3nqzRw11iIX9ygrBytOFiwQRafb1jMWRs1sEK5gMLrVyW7L2wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692815; c=relaxed/simple;
	bh=8JeMApPWlaQv0tbX+hlRbBQjpN7mc/W+zuvS/3thdHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qu/qymJfmD0mnuLg+hilgFmynRqJSYrPiVSvLt/uuNHPtdxoa2Cne/2OeUS517xpMz2PSBdauC/8TxQMn90optrjunABIOAnoyylb2bD5qKMe9aLAYL+KNlVxvAqrxBu5CUe6q0jlosp1O1sKTszQshsT45nUJ3dNRGY/Np8ohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iUre3MLV; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ZsLp5ZV/; arc=none smtp.client-ip=54.240.7.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8JeMApPWlaQv0tbX+hlRbBQjpN7mc/W+zuvS/3thdHc=;
	b=iUre3MLVwq6qEYIrtxFlqW7nqmO3Qe6fXODsJPwRmkowmH801K8X6Pk+8Vb5ohQi
	4VOjFjDRMTTgUsZrwS8Arjrx79nX7H0OezgLeCR+q1zJ0NMs1JPP079+dyKzq73bk/N
	szrbNVMlxX0vfO+T1zhPZzScyOA23bn9i8Cx12nXGpaNJPxpnbO2lOGutLrvdKAEBVD
	BMgzsh9PaY6+BRi1Tyux/j/w747U6Eqq/Ca45djIhxao+iL6oU950cWEhZZpdH/8JlC
	9JPLb0+Yjty8l6FM3rrxXU51+mb5/FGVRyMHYDfCIPKaRavZaYTttmVkUhXtWKYcVaI
	kim+9V9paA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=8JeMApPWlaQv0tbX+hlRbBQjpN7mc/W+zuvS/3thdHc=;
	b=ZsLp5ZV/mvz3bs3d7phv5KcrsOhWLUJv6hmeSWywem/S7373vdmA63dn3rY8wf2w
	Ko1CCu89xfOVCmduhsbNkzByuyJ1pkV2xNapMki8I505Hq182Tnb99GECji6BhVYGQa
	a8yE0IhTVd1XgtXKuV04/5tS2p35ar+QFz5dF7QU=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 1/2] v4l2-compliance: Add test for V4L2_FMTDESC_FLAG_ENUM_ALL flag
Date: Mon, 26 Aug 2024 17:20:11 +0000
Message-ID: <010201918fb3d081-a676cc64-a19a-4c45-8083-7413a389f048-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826172009.140022-1-benjamin.gaignard@collabora.com>
References: <20240826172009.140022-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.40

If V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported, test if all
pixel formats list with VIDIOC_ENUM_FMT without the flag been set
is a subset of the list created with the flag.
Also Test that the flag is cleared of calling VIDIOC_ENUM_FMT.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
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



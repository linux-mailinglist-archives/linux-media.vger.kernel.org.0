Return-Path: <linux-media+bounces-3819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E429D83090B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962A91F25B58
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C8521A04;
	Wed, 17 Jan 2024 15:02:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495A20DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503772; cv=none; b=eDBeEdKBsdmZYcealvvRVo9jWcUJ8R7IRoNEXSNDI1mCjRkExVxOIR1tom/Z9r0sbMM3T7CYUkmHFkKOxqj25/zxnV4k6aBblp84FDhVhPsxMiLvro11PIqYPKXcV4Jd0N7aYqqkit9AZDBU2pIDpBXTKCDB4/xAZiTJeFQNmtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503772; c=relaxed/simple;
	bh=8GN5EZOJosO8bbjyEyqEyslNIpvVFI8PY+UTQEgOehs=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=n1gXYZVrV5isa+j8mfRzBY8Q2R7UMfb6wzOOzaJx2rRV8hKeJ2AWpCSrB4oubxws4PRTa6Yigfcms5J3L4CKfwKKOVb6VoQ+FgGWYbN1AwZRJOyTMS9+Q2xh5u4B5LTO/a4Qtzo6AIKIyjnyR342i3u4Zf8EdKGqrhe6quoHQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17401C433F1;
	Wed, 17 Jan 2024 15:02:50 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 10/10] v4l2-ctl: add --float option
Date: Wed, 17 Jan 2024 16:02:18 +0100
Message-ID: <6958b1f9fe2bde2ca547f2d55fa1cd9e4c03e40a.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If given, report fixed point values as floating point values.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 6 ++++++
 utils/v4l2-ctl/v4l2-ctl.cpp        | 1 +
 utils/v4l2-ctl/v4l2-ctl.h          | 1 +
 3 files changed, 8 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 4b3308f3..15de0a7f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -99,6 +99,7 @@ void common_usage()
 	       "  -r, --subset <ctrl>[,<offset>,<size>]+\n"
 	       "                     the subset of the N-dimensional array to get/set for control <ctrl>,\n"
 	       "                     for every dimension an (<offset>, <size>) tuple is given.\n"
+	       "  --float            report fixed-point control values as floating point\n"
 #ifndef NO_LIBV4L2
 	       "  -w, --wrapper      use the libv4l2 wrapper library.\n"
 #endif
@@ -443,6 +444,11 @@ static void print_fp(__s64 v, unsigned int fraction_bits)
 
 	if (!f) {
 		printf("%lld", i);
+	} else if (options[OptFloat]) {
+		if (fraction_bits <= 16)
+			printf("%.8f", (double)v / (1ULL << fraction_bits));
+		else
+			printf("%.8g", (double)v / (1ULL << fraction_bits));
 	} else if (fraction_bits < 20) {
 		__u64 div = 1ULL << fraction_bits;
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index fb03675e..7d9f2a17 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -142,6 +142,7 @@ static struct option long_options[] = {
 	{"silent", no_argument, nullptr, OptSilent},
 	{"verbose", no_argument, nullptr, OptVerbose},
 	{"log-status", no_argument, nullptr, OptLogStatus},
+	{"float", no_argument, nullptr, OptFloat},
 	{"get-fmt-overlay", no_argument, nullptr, OptGetOverlayFormat},
 	{"set-fmt-overlay", optional_argument, nullptr, OptSetOverlayFormat},
 	{"try-fmt-overlay", optional_argument, nullptr, OptTryOverlayFormat},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b9e7c352..f453a5d3 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -142,6 +142,7 @@ enum Option {
 	OptLogStatus,
 	OptVerbose,
 	OptSilent,
+	OptFloat,
 	OptGetSlicedVbiCap,
 	OptGetSlicedVbiOutCap,
 	OptGetFBuf,
-- 
2.42.0



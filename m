Return-Path: <linux-media+bounces-3818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1FD830908
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6BA288666
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8310C219FC;
	Wed, 17 Jan 2024 15:02:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8520DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503771; cv=none; b=CdO71vprCKjhhjOrk8DMR1XutG3wotnlhEJ0v9W3YBtmwoEmBQ6ETg9awMIXa6XIVQJhKodln+qa0zNKNqsa/VbYmaY4XBOk7xpYJNb6je8i6bcSHejRVFfWrciMCZoRy82L0jEowrwGXu9t8PHgMFyDicLzURy0rYRJkRQlc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503771; c=relaxed/simple;
	bh=VPc0ZNMS8EeOrUgrUgvnwt+ObuOu7vEqNL8nA98j5m4=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=PbvS0CK82FrYMqSs6O2MM/MluN4RK737L6uyMLkjjePxQmBJ8pkPt3fvpC73IWdOoVTcUweOaxfzqMgOP7NtAPNf0D7E7j8+0GzK2hxqjl9/omHOdFDjJFMT1pl9RxvhoR+UHN6K2j0j6raUZttll7/UPFGYZNL3g3cKNX6Roqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C6AC43609;
	Wed, 17 Jan 2024 15:02:49 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/10] v4l2-ctl: add fixed point support
Date: Wed, 17 Jan 2024 16:02:17 +0100
Message-ID: <d56c43b4e411413e1f4224cc8929a1cffd7257b9.1705503477.git.hverkuil-cisco@xs4all.nl>
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

Correctly report fixed point control values.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 156 ++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 25 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index c089c332..4b3308f3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -417,6 +417,55 @@ static bool fill_subset(const struct v4l2_query_ext_ctrl &qc, ctrl_subset &subse
 	return false;
 }
 
+static void print_fp(__s64 v, unsigned int fraction_bits)
+{
+	__s64 i, f, mask;
+
+	if (!fraction_bits) {
+		printf("%lld", v);
+		return;
+	}
+
+	mask = (1ULL << fraction_bits) - 1;
+
+	/*
+	 * Note: this function does not support fixed point u64 with
+	 * fraction_bits set to 64. At the moment there is no U64
+	 * control type, but if that is added, then this code will have
+	 * to add support for it.
+	 */
+	if (fraction_bits >= 63)
+		i = v < 0 ? -1 : 0;
+	else
+		i = v / (1LL << fraction_bits);
+
+	f = (v & mask) ? (v < 0 ? -((-v) & mask) : (v & mask)) : 0;
+
+	if (!f) {
+		printf("%lld", i);
+	} else if (fraction_bits < 20) {
+		__u64 div = 1ULL << fraction_bits;
+
+		if (!i && f < 0)
+			printf("-%lld/%llu", -f, div);
+		else if (!i)
+			printf("%lld/%llu", f, div);
+		else if (i < 0 || f < 0)
+			printf("-%lld-%llu/%llu", -i, -f, div);
+		else
+			printf("%lld+%llu/%llu", i, f, div);
+	} else {
+		if (!i && f < 0)
+			printf("-%lld/(2^%u)", -f, fraction_bits);
+		else if (!i)
+			printf("%lld/(2^%u)", f, fraction_bits);
+		else if (i < 0 || f < 0)
+			printf("-%lld-%llu/(2^%u)", -i, -f, fraction_bits);
+		else
+			printf("%lld+%llu/(2^%u)", i, f, fraction_bits);
+	}
+}
+
 static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &ctrl,
 			const ctrl_subset &subset)
 {
@@ -452,7 +501,10 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 		switch (qc.type) {
 		case V4L2_CTRL_TYPE_U8:
 			for (i = from; i <= to; i++) {
-				printf("%4u", ctrl.p_u8[idx + i]);
+				if (qc.fraction_bits)
+					print_fp(ctrl.p_u8[idx + i], qc.fraction_bits);
+				else
+					printf("%4u", ctrl.p_u8[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -460,7 +512,10 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 			break;
 		case V4L2_CTRL_TYPE_U16:
 			for (i = from; i <= to; i++) {
-				printf("%6u", ctrl.p_u16[idx + i]);
+				if (qc.fraction_bits)
+					print_fp(ctrl.p_u16[idx + i], qc.fraction_bits);
+				else
+					printf("%6u", ctrl.p_u16[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -468,7 +523,10 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 			break;
 		case V4L2_CTRL_TYPE_U32:
 			for (i = from; i <= to; i++) {
-				printf("%10u", ctrl.p_u32[idx + i]);
+				if (qc.fraction_bits)
+					print_fp(ctrl.p_u32[idx + i], qc.fraction_bits);
+				else
+					printf("%10u", ctrl.p_u32[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -476,7 +534,10 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 			break;
 		case V4L2_CTRL_TYPE_INTEGER:
 			for (i = from; i <= to; i++) {
-				printf("%10i", ctrl.p_s32[idx + i]);
+				if (qc.fraction_bits)
+					print_fp(ctrl.p_s32[idx + i], qc.fraction_bits);
+				else
+					printf("%10d", ctrl.p_s32[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -484,7 +545,10 @@ static void print_array(const v4l2_query_ext_ctrl &qc, const v4l2_ext_control &c
 			break;
 		case V4L2_CTRL_TYPE_INTEGER64:
 			for (i = from; i <= to; i++) {
-				printf("%12lli", ctrl.p_s64[idx + i]);
+				if (qc.fraction_bits)
+					print_fp(ctrl.p_s64[idx + i], qc.fraction_bits);
+				else
+					printf("%12lld", ctrl.p_s64[idx + i]);
 				if (i < to)
 					printf(", ");
 			}
@@ -524,13 +588,13 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 	if (qc.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD) {
 		switch (qc.type) {
 		case V4L2_CTRL_TYPE_U8:
-			printf("%u", *ctrl.p_u8);
+			print_fp(*ctrl.p_u8, qc.fraction_bits);
 			break;
 		case V4L2_CTRL_TYPE_U16:
-			printf("%u", *ctrl.p_u16);
+			print_fp(*ctrl.p_u16, qc.fraction_bits);
 			break;
 		case V4L2_CTRL_TYPE_U32:
-			printf("%u", *ctrl.p_u32);
+			print_fp(*ctrl.p_u32, qc.fraction_bits);
 			break;
 		case V4L2_CTRL_TYPE_STRING:
 			printf("'%s'", safename(ctrl.string).c_str());
@@ -546,7 +610,7 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 	}
 	switch (qc.type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
-		printf("%lld", ctrl.value64);
+		print_fp(ctrl.value64, qc.fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
@@ -561,7 +625,7 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 			printf("%d (%lld 0x%llx)", ctrl.value, qmenu.value, qmenu.value);
 		break;
 	default:
-		printf("%d", ctrl.value);
+		print_fp(ctrl.value, qc.fraction_bits);
 		break;
 	}
 }
@@ -574,14 +638,30 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 
 	switch (qc.type) {
 	case V4L2_CTRL_TYPE_INTEGER:
-		printf("%31s %#8.8x (int)    : min=%lld max=%lld step=%lld default=%lld",
-				s.c_str(), qc.id, qc.minimum, qc.maximum,
-				qc.step, qc.default_value);
+		printf("%31s %#8.8x (int)    :", s.c_str(), qc.id);
+		if (qc.fraction_bits) {
+			printf(" min="); print_fp(qc.minimum, qc.fraction_bits);
+			printf(" max="); print_fp(qc.maximum, qc.fraction_bits);
+			printf(" step="); print_fp(qc.step, qc.fraction_bits);
+			printf(" default="); print_fp(qc.default_value, qc.fraction_bits);
+		} else {
+			printf(" min=%lld max=%lld step=%lld default=%lld",
+			       qc.minimum, qc.maximum,
+			       qc.step, qc.default_value);
+		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		printf("%31s %#8.8x (int64)  : min=%lld max=%lld step=%lld default=%lld",
-				s.c_str(), qc.id, qc.minimum, qc.maximum,
-				qc.step, qc.default_value);
+		printf("%31s %#8.8x (int64)  :", s.c_str(), qc.id);
+		if (qc.fraction_bits) {
+			printf(" min="); print_fp(qc.minimum, qc.fraction_bits);
+			printf(" max="); print_fp(qc.maximum, qc.fraction_bits);
+			printf(" step="); print_fp(qc.step, qc.fraction_bits);
+			printf(" default="); print_fp(qc.default_value, qc.fraction_bits);
+		} else {
+			printf(" min=%lld max=%lld step=%lld default=%lld",
+			       qc.minimum, qc.maximum,
+			       qc.step, qc.default_value);
+		}
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		printf("%31s %#8.8x (str)    : min=%lld max=%lld step=%lld",
@@ -609,19 +689,43 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 				s.c_str(), qc.id, qc.maximum, qc.default_value);
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		printf("%31s %#8.8x (u8)     : min=%lld max=%lld step=%lld default=%lld",
-				s.c_str(), qc.id, qc.minimum, qc.maximum,
-				qc.step, qc.default_value);
+		printf("%31s %#8.8x (u8)     :", s.c_str(), qc.id);
+		if (qc.fraction_bits) {
+			printf(" min="); print_fp(qc.minimum, qc.fraction_bits);
+			printf(" max="); print_fp(qc.maximum, qc.fraction_bits);
+			printf(" step="); print_fp(qc.step, qc.fraction_bits);
+			printf(" default="); print_fp(qc.default_value, qc.fraction_bits);
+		} else {
+			printf(" min=%lld max=%lld step=%lld default=%lld",
+			       qc.minimum, qc.maximum,
+			       qc.step, qc.default_value);
+		}
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		printf("%31s %#8.8x (u16)    : min=%lld max=%lld step=%lld default=%lld",
-				s.c_str(), qc.id, qc.minimum, qc.maximum,
-				qc.step, qc.default_value);
+		printf("%31s %#8.8x (u16)    :", s.c_str(), qc.id);
+		if (qc.fraction_bits) {
+			printf(" min="); print_fp(qc.minimum, qc.fraction_bits);
+			printf(" max="); print_fp(qc.maximum, qc.fraction_bits);
+			printf(" step="); print_fp(qc.step, qc.fraction_bits);
+			printf(" default="); print_fp(qc.default_value, qc.fraction_bits);
+		} else {
+			printf(" min=%lld max=%lld step=%lld default=%lld",
+			       qc.minimum, qc.maximum,
+			       qc.step, qc.default_value);
+		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		printf("%31s %#8.8x (u32)    : min=%lld max=%lld step=%lld default=%lld",
-				s.c_str(), qc.id, qc.minimum, qc.maximum,
-				qc.step, qc.default_value);
+		printf("%31s %#8.8x (u32)    :", s.c_str(), qc.id);
+		if (qc.fraction_bits) {
+			printf(" min="); print_fp(qc.minimum, qc.fraction_bits);
+			printf(" max="); print_fp(qc.maximum, qc.fraction_bits);
+			printf(" step="); print_fp(qc.step, qc.fraction_bits);
+			printf(" default="); print_fp(qc.default_value, qc.fraction_bits);
+		} else {
+			printf(" min=%lld max=%lld step=%lld default=%lld",
+			       qc.minimum, qc.maximum,
+			       qc.step, qc.default_value);
+		}
 		break;
 	case V4L2_CTRL_TYPE_AREA:
 		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
@@ -710,6 +814,8 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 		for (i = 0; i < qc.nr_of_dims; i++)
 			printf("[%u]", qc.dims[i]);
 	}
+	if (qc.fraction_bits)
+		printf(" fraction_bits=%u", qc.fraction_bits);
 	if (qc.flags)
 		printf(" flags=%s", ctrlflags2s(qc.flags).c_str());
 	printf("\n");
-- 
2.42.0



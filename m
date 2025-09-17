Return-Path: <linux-media+bounces-42652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B0B7EFD3
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425077B6911
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8938A32D5C5;
	Wed, 17 Sep 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=deepin.org header.i=@deepin.org header.b="s9wSfpfj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFD532D5B1
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099658; cv=none; b=Z0SsTnS3E/X+FF1ZR2QWpu8Ez8NClEbTprXPMBJo38x4N9WwV1ligXU1ZN2cNvyGumFZrp+podShobsEoCp5twEdNCQiOIGZhINbcrkEcs5o3hlbhJfOt7PBizeJ1mvq/2qnuBk4ZcIDaVVS79aUnPpLh/0i1AayK+8RDUbPONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099658; c=relaxed/simple;
	bh=+EhSHeH+3Ive0hotrP1n2hHpAg6eDRM3jq0I0B+gkRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOuQOFuFENTMYnqB5HWqn/lxtqdHblD2Q2y8gSSfebj1NSg/efo0rI0V8Mqjbgw0b3pmq12fkyYACxCpJskOiXwkFYYhVOLf3HjU9izWSrwMifp9OFtmtgRPgcERdlOivdkMMikD61TMr8Qo2HGJK967Hx2mRWzrzpcmWJXDeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepin.org; spf=pass smtp.mailfrom=deepin.org; dkim=pass (1024-bit key) header.d=deepin.org header.i=@deepin.org header.b=s9wSfpfj; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepin.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deepin.org;
	s=ukjg2408; t=1758099645;
	bh=BKzEB4cvfUok6n+57MJEhC13+a7VHLKWvj1/AtJWzC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=s9wSfpfjvgDI1gKZ32PzcNFWz+fPisnBjfiILBjw3zeYh4ow+1H1+0Hd1QxNw2v+W
	 SYy66frEUJ3Y42IMDwhoyVRUC/WUC4MmGm+06EF5/ljSdQl0rbhSDKz09UvX4cbT/c
	 IY3wCYXChQJxWjg1fbmWxZE0To3MNZcDDF2Xq+Rs=
X-QQ-mid: zesmtpsz8t1758099644t7ce1a97e
X-QQ-Originating-IP: 1vjZySOLEe1Fe8v/+tUedEZiBLxNIflooxMJJs9nWIM=
Received: from ut005408-PC.. ( [103.118.42.229])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 17:00:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7389270774021793937
EX-QQ-RecipientCnt: 2
From: Tianyu Chen <sweetyfish@deepin.org>
To: linux-media@vger.kernel.org
Cc: Tianyu Chen <sweetyfish@deepin.org>
Subject: [PATCH v4l-utils] libv4l2: zero v4l2_buffer
Date: Wed, 17 Sep 2025 17:00:34 +0800
Message-ID: <2545FFD2D43FDCEF+20250917090034.3663196-1-sweetyfish@deepin.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:deepin.org:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NyyVYz5M5Wue2vWAMy1irZ7D47oXYif162cBmSpW8rxNACmFCzuxUwDP
	o2XF+hekSvEDLJqVH9qspPaUmKLaYYwz6M32HixB++Kb6uxYvM7/FM1gsrgTax+uv1mBgXF
	kjsYQbGXqiORj/ntmHcPIS455X0JYz7pyOAVAAuC4y87rxv77CaDWT85SQ0RCQwzfih/dmJ
	KzkT8g305zSjAVyAGgt6bVhsX6OtIZi6v5JmpNmw20XQYa1HeSq5pbqIBcF7D5e/O04pzLb
	Ma8NhSqvQV2B7rny+5EN053q+EqYhZnGrCSdaqBs2fN0DNGYWgmWShpWm19X6jSNItisauK
	dQEALuG/sn0nqq1+lAL8GdmBiIQGAoHAKlJ3WvfwP2YW14Lfx+t+UPemEX+DXOcFMUt70sf
	rwMRaOajqEmhegxJMCyhUCdWKKG/RRZ6LulGmHnlIcxCbsV9AvSIHWbyoUb7lORA4ldDvo9
	Nv1HbK8DCZIxhGC96rpGMEqT1vAcfaQNCs7BL5RgH/cXjT64uA+OdsZ+6bMU9ozv6e5kjsf
	kpEOYosRCyGt/5kx+bnhvBQHEDr0vnJRH/vxZvF3+OtpfKJaXZcNcwZaQWeJbbR3SBAEReH
	0p/JWbBNXZjYkL3hzBHJFjNfrNrq3p88yUVw6fCIsLv2lm5T++TSwAw6d8VxEvXo2H67Dt/
	fzbevafRrrgZOFc3R4uOMomiAmFjmCpHLfUf/x1Pjro5RNZlXO+Pc3HBmikk31aWc8uITgk
	gmi2F7OKj2aiQK0gS2zyvIj0fAnBDYhjJpbvG/lAk+dDDsbcU7pxvYN0R77BZct+Lvl0Vy/
	xEX8qhXfq41/cNjamrDQ1waDOUEfL+q1P2O7qOUleSXNQ3uh/8d6fyt/Zy3OtUxwWTJsAUr
	sLMi/9fEPpIgq06A0I3IcNOsffW6yrIoJphrRYuq4Adhh/PKO0mh2aKKZR0Jiq//QWXPDtx
	WelSGLb7jddkw3tabWuIAElaiqgg7a8H1X3pl9NZinqXHBRBQ2L0ucgg7KsL9LY09YfSIqg
	m3oqd3EiJre/F90nfDjRNw16KXB274WSE9NbvfdY/0QSYPuHGLEHk+OccuH5iMLhVmNUn7m
	g==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

v4l2_buffer should be zeroed.

Signed-off-by: Tianyu Chen <sweetyfish@deepin.org>
---
 lib/libv4l2/libv4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 289501d9..06396abb 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -1584,7 +1584,7 @@ ssize_t v4l2_read(int fd, void *dest, size_t n)
 	if (devices[index].flags & V4L2_USE_READ_FOR_READ) {
 		result = v4l2_read_and_convert(index, dest, n);
 	} else {
-		struct v4l2_buffer buf;
+		struct v4l2_buffer buf = {};
 
 		buf.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		buf.memory = V4L2_MEMORY_MMAP;
-- 
2.47.2



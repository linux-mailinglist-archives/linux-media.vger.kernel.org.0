Return-Path: <linux-media+bounces-47643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98943C7F1A2
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 07:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28513AB586
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 06:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD64E2D94B8;
	Mon, 24 Nov 2025 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=deepin.org header.i=@deepin.org header.b="raLPcWW7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90D2D8792
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966117; cv=none; b=o026B46wUvbcCxLjUD3f4YPd3geYdORP0tm2Km9UbJGzPy+ZJuN1HSLIIgqACdQpV8WEX9Y+RomT6OaAmFOeLyFuwrUNEGb9+jo0vxviC0la8tUexJgm4TSqdhP3R2nMz/o+h4WjwRdyzF/O4enuCKRNkAIcx8I/o3Aem1NjbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966117; c=relaxed/simple;
	bh=9Iieci6E6Qt6eWm9wgb4CLUg71wMHcE7Sm6YZjYzw8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVL7DJnvJoKzc4hiwgmnv4MNv1UDKnKKWXEpaKmdzst90BD+abMb2BMdUWurQu2lt6ztF9Ppe2R6uV9ScwvLYP6Wy08csy09TfUZ0PSQGRMeGqW+1DlvUXQ8qg3XNVJwJtnXHRYGZwvuThDn+LFa+qpz1qXTgobZ2SyNyancQlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepin.org; spf=pass smtp.mailfrom=deepin.org; dkim=pass (1024-bit key) header.d=deepin.org header.i=@deepin.org header.b=raLPcWW7; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepin.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deepin.org;
	s=ukjg2408; t=1763966108;
	bh=xnOjccNb0Jw+nn6RncUWU25F0n4Qc8AzaZvqNkVBbgk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=raLPcWW7Ne6FwPr2QeTeOgZP0Bgg5ussJRNlOba0w0SGGMxEVLbWEZ4XfWeCnMZNI
	 l4uKqY7y1A10Pb6T4sTxPOpBdWHVAIc8vDnouM0b1QBmjl9GiTXNG2ADVMCilO8I8g
	 WpaXAqHt8hBQkorfyecERh80dHQowpUdv1llCS2I=
X-QQ-mid: zesmtpgz1t1763966107t5630b4ae
X-QQ-Originating-IP: yzEmcdSkc/mtYEEF6ffxpxATJmovat3JLQw/7OW23TI=
Received: from ut005408-PC.. ( [103.118.42.229])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Nov 2025 14:35:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14111664059910992199
EX-QQ-RecipientCnt: 2
From: Tianyu Chen <sweetyfish@deepin.org>
To: linux-media@vger.kernel.org
Cc: Tianyu Chen <sweetyfish@deepin.org>
Subject: [PATCH v4l-utils] libv4l2: zero v4l2_buffer
Date: Mon, 24 Nov 2025 14:34:58 +0800
Message-ID: <F7314D7B842F6CC2+20251124063458.1224107-1-sweetyfish@deepin.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:deepin.org:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: OWetTbhfR/zwZ5jUcT5WwHInE8J9dRrMiC5RljTapv22rhEE+7W9MCcf
	yECm8pN1dkdeg9FzW3LqWMMBEKI/X8pgM4o8rjNw0z1mc0+uZMSUNaXTgqTwEeIzWG7U/Xa
	n5qv/aW0+QYzLVzj8zxhxeXgxnoJVoLxVl4uhN1LUhX3IPd7cr10h+Iox6LV0FFI8Boval7
	zNeog9G4v34EWdaQFX7trn4XFovDNN2CWE7jbOgnUDxZ2G663GfjgmC1Oncfpdb+F2YEzAE
	vJhSEnTvcF5b5zYMW19OA2g0l18QZyqnjnXcjyaqWK6rdlksDXk1hZoGqog+7HqDtV69XRA
	1y9S2L/WrHNMktUVh9Y810SXEIz93nVEuYfPc4Q7yB78A11HnuyQeckXz42i+Lr0IZJn1sh
	S4jCQosOcTyazuWyIgRK2TXZi8XQQlOhA1gXa7IAkKq+D8YM2BV5iGfZRULtMQWAMSLF3eK
	QiVryuEXiK71nTwGgZB9DMzxoZdYHydckokihxB77zwkP8l1NJwrhHQxAv+iEdA6kFVRu83
	deQsbGqitKSVpFDo5uuKdCEIenI+EXq2UyT3/AQP9UxRiWHSIyFdwy9gsiy73rb+6fA5oyf
	IfgTf9ktRNA3T6jEW6UrYdVrAFief2BiZ117yoIPOLjATsWMRlZst26QAGeu0H+Y0GQK+On
	PKbjmeas6NS9wr1g3usyz67kpt4ycbSjfSBhZ0sjFYfi5Qc6yIRjR/buq/+KzgOQhA5eUdb
	HMZV4yoE390N9rIFozaEKDqlETIAGFS439LvVTNFf6yJpQGfClYhiPExI8ut1PbjjlGrGnI
	X0gDJL+hvHm3B+JddaPoQK16NUXkW/K5PM2LDNlEPOhZumpoS303RrE40zL476wpVwtZmow
	uC4NDjW3bfqq8M4R7/MjC5eV5CSjwjWMuw67Zqjs0UP7U7VQ8hCol1VpvLO6jHb8ULB5TK7
	jheyS1LuJ4I7f+OlXTz4oq1aQkCmPzaSQo6YGUsXUN/BKpJG5hfXUYpbUK8tDBOu8CZECHu
	yxk26dZxcPakUadeaIPtTcQgfgd2Zr7HUiEpAgDKvVEltT420+
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

v4l2_buffer should be zeroed.

Signed-off-by: Tianyu Chen <sweetyfish@deepin.org>
---
 lib/libv4l2/libv4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 06396abb..0958cf7e 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -176,7 +176,7 @@ static int v4l2_map_buffers(int index)
 {
 	int result = 0;
 	unsigned int i;
-	struct v4l2_buffer buf;
+	struct v4l2_buffer buf = {};
 
 	for (i = 0; i < devices[index].no_frames; i++) {
 		if (devices[index].frame_pointers[i] != MAP_FAILED)
@@ -568,7 +568,7 @@ static int v4l2_buffers_mapped(int index)
 
 	if (!v4l2_needs_conversion(index)) {
 		/* Normal (no conversion) mode */
-		struct v4l2_buffer buf;
+		struct v4l2_buffer buf = {};
 
 		for (i = 0; i < devices[index].no_frames; i++) {
 			buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-- 
2.47.2



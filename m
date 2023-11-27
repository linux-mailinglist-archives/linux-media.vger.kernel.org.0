Return-Path: <linux-media+bounces-1174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BDC7FAB0C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 21:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84FA1C20E37
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 20:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33FE45C07;
	Mon, 27 Nov 2023 20:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yn3IGOp1"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1421B6
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 12:09:57 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D1DA6607090;
	Mon, 27 Nov 2023 20:09:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701115796;
	bh=6/D/1TRAvQ3pB8Hp6T1pjIvNvG2FUvkbFaUuZv+5xNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yn3IGOp1my8wSysXwx+1E8H50bFV3QSMineDSdydY4ut8esbFivyVsFa6Z+ulLWKk
	 t3kX44N4Mie03an94VN41RakSena5L+Dy4kDcrs19nVPuFrPL/g4BAp6o8qU4CAf/g
	 Hb9De/rq6n3Y4de2a7yKL8KGs+9wCjz8p4CMA3dULOHokNWVMLKcgg/iRMkiLxpv0N
	 obE8rUdIMv5EvbWbe3BJZ6cnratkzZpzbSKVErfb3aeqcPqUE7HNoIkpGWmWK/TZlD
	 szJqlBUkiWzyNvV8FuOYSm23IxDGy86ITasIctjpciukVQoOZVhWS+V+FOaW6xTiSh
	 ClsllbQlCl0bg==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Date: Mon, 27 Nov 2023 12:09:14 -0800
Message-ID: <d470d99e37e94ad79ccc8888f0a1bec5f51d66c4.1701114910.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701114910.git.deborah.brouwer@collabora.com>
References: <cover.1701114910.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After v4l-utils is synced with the latest kernel headers, generate and
apply patches for the changes that need to be made to the v4l2-tracer.
This makes it easier to see how the kernel headers are changing the
v4l2-tracer and also to revert those changes if necessary.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 .gitignore          |  1 +
 sync-with-kernel.sh | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/.gitignore b/.gitignore
index ef546cd4..fcd3d43b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,3 +2,4 @@
 patches/
 build/
 *.pc
+v4l2-tracer-gen/
diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
index ad5681c6..cd6c2b09 100755
--- a/sync-with-kernel.sh
+++ b/sync-with-kernel.sh
@@ -115,8 +115,33 @@ function freebsd {
 	quilt push -a
 }
 
+function v4l2-tracer {
+	V4L2TRACERDIR="${TOPSRCDIR}/utils/v4l2-tracer"
+	V4L2TRACERSOURCES="${TOPSRCDIR}/include/linux/v4l2-controls.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/videodev2.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/media.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/v4l2-common.h "
+
+	mkdir -p $V4L2TRACERDIR/v4l2-tracer-gen
+
+	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $V4L2TRACERDIR/v4l2-tracer-gen $V4L2TRACERSOURCES
+
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.cpp" > "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.cpp" > "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen-h.patch"
+
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen-h.patch
+}
+
 keytable
 libdvbv5
 freebsd
 ioctl-test
 xc3028-firmware
+v4l2-tracer
-- 
2.41.0



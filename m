Return-Path: <linux-media+bounces-1434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E177FFFFB
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21282819B8
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F099515C3;
	Fri,  1 Dec 2023 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HVrBAZ/+"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000A91B2
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:13:31 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B98CF6607386;
	Fri,  1 Dec 2023 00:13:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701389610;
	bh=8n/pxD5Ph/FASrLnQnEoDBain/VTUzAEWfSD/DV7Ers=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVrBAZ/+g1QpRxRh3LacSZfpAU1m1PLjMzGSaCOHTmojdO/aqHZun5ZdL6tvP3S41
	 kiAE/xK7X61vacZR/B39/+PfF1hWrg04+WS5X15HQR8MtQ+4YFpJU1w8Jzf52+Aj34
	 p4Imk8nPNiF+ARNxrMePUWCXo56LEKZ3A8xpwL7b2Mdnx89BDfeT9X9YdgFeYtqc2N
	 P82CFFOx1qUM2yF4cQ/8u/0FB/FtT+67y4MOvYA7xwIa/niN0PBGtj2iYAX0JHqZ04
	 UFkd1Y0hVhgj6JaHIhRr0Oyu2LdHkJBLUTj2r1T/eJKGIjPESRADDwMQjV1fWUBcWz
	 oAKSVWMMNfglA==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Date: Thu, 30 Nov 2023 16:12:29 -0800
Message-ID: <c8adf732788e3ab317024553c7b2137e3a541269.1701388238.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701388237.git.deborah.brouwer@collabora.com>
References: <cover.1701388237.git.deborah.brouwer@collabora.com>
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
 sync-with-kernel.sh | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
index ad5681c6..dec90620 100755
--- a/sync-with-kernel.sh
+++ b/sync-with-kernel.sh
@@ -115,8 +115,35 @@ function freebsd {
 	quilt push -a
 }
 
+function v4l2-tracer {
+	V4L2TRACERDIR="${TOPSRCDIR}/utils/v4l2-tracer"
+	V4L2TRACERSOURCES="${TOPSRCDIR}/include/linux/v4l2-controls.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/videodev2.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/media.h "
+	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/v4l2-common.h "
+
+	TMPDIR=$(mktemp -d "${V4L2TRACERDIR}/v4l2-tracer-gen.XXXXXXXXXX")
+
+	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $TMPDIR $V4L2TRACERSOURCES
+
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${TMPDIR}/trace-gen.cpp" > "${TMPDIR}/trace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${TMPDIR}/trace-gen.h" > "${TMPDIR}/trace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${TMPDIR}/retrace-gen.cpp" > "${TMPDIR}/retrace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${TMPDIR}/retrace-gen.h" > "${TMPDIR}/retrace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${TMPDIR}/v4l2-tracer-info-gen.h" > "${TMPDIR}/v4l2-tracer-info-gen-h.patch"
+
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/trace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/trace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/retrace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/retrace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/v4l2-tracer-info-gen-h.patch
+
+	rm -r "$TMPDIR"
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



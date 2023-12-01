Return-Path: <linux-media+bounces-1487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 037308010E5
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 18:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3461281B56
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033D64E1C2;
	Fri,  1 Dec 2023 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KL7pOqfl"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C866106
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 09:14:07 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BF1C660739A;
	Fri,  1 Dec 2023 17:14:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701450845;
	bh=4CKyz75OH6AeMqNjUL+jbVJd/RVpbbh/eGezF+FUHGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KL7pOqflQ83qOBnTNhCl/T2b0jI1yQ4SGIk4ZvsQdR96fLbASuEuJ2enoanfiU1Yv
	 ydSmJ7CbnV96YrHnmkor36XHDD0LMn8YhG1P99ySFN39pfrCcUevmNLnxindYLtjjs
	 ceg3EB7CUwwfUsLpJ07ZeEoPnt34VIe2kbyYl7/UUkbC8l2giBWxwwwV+lODv7ord2
	 NCC/jq3MvmBKqCRwIjR6PJXzxs9Fs70fMMu+d+qdt5rnVtTvnt2i3ors2Q+CPjIwKA
	 eOhzsSy9K3X5AMFKmyoI+BNLMVOPdPBPqrqXbfspM1lkuHEA8P5ucEm5AmBAkfz0mC
	 HuuQ88vE6MtNQ==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Date: Fri,  1 Dec 2023 09:13:33 -0800
Message-ID: <2f09965e148881405e6a029778ff887d459e65d3.1701450544.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701450544.git.deborah.brouwer@collabora.com>
References: <cover.1701450544.git.deborah.brouwer@collabora.com>
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
index ad5681c6..8c9106aa 100755
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
+	V4L2TRACERTMPDIR=$(mktemp -d "${V4L2TRACERDIR}/v4l2-tracer-gen.XXXXXXXXXX")
+
+	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $V4L2TRACERTMPDIR $V4L2TRACERSOURCES
+
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${V4L2TRACERTMPDIR}/trace-gen.cpp" > "${V4L2TRACERTMPDIR}/trace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${V4L2TRACERTMPDIR}/trace-gen.h" > "${V4L2TRACERTMPDIR}/trace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${V4L2TRACERTMPDIR}/retrace-gen.cpp" > "${V4L2TRACERTMPDIR}/retrace-gen.patch"
+	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${V4L2TRACERTMPDIR}/retrace-gen.h" > "${V4L2TRACERTMPDIR}/retrace-gen-h.patch"
+	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen.h" > "${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen-h.patch"
+
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/trace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/trace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/retrace-gen.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/retrace-gen-h.patch
+	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen-h.patch
+
+	rm -r "$V4L2TRACERTMPDIR"
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



Return-Path: <linux-media+bounces-299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B987EA444
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5170E280F35
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7340E24211;
	Mon, 13 Nov 2023 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nKDkJnQu"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519B2374B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:07:01 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885801706
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:58 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EEA46602F3A;
	Mon, 13 Nov 2023 20:06:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906017;
	bh=D6XnyenCNI2d7hPf7Kzl/txGfH7HneHIjGURf9xA3ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKDkJnQuViN1NMCW1Tmx+BAQcghm4qNgdmHtP9XhbC8nNCb9u/qWfJ0xZr6yJh3Ee
	 ZIhNUoDzDWIDqF3aDiWcBbn7m0BEF6zO+caIiWGMjl/Awbb4tNZawn/SXKjHjmiDTU
	 uxwOrZFqk4iR1PmVCgO/0SP+jAMvSV5BcDNTqmDiUAh82aNqwLIpZKaKrphMPQFJ5a
	 I5wQSfaKZHxrPUvWZDxmBClmYNav/4ct3HM8l3Hp6Q20xztdoQCqmi9JUjl+tk9K7p
	 goJmeuCj3vXodNtcHievDZLY4YTC9/tyLGeT9FfnQEckyhBiUu/CpbUhhmoDsdvydY
	 mGv3zKmZt84RA==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 7/8] v4l2-tracer: stop retracing failed ioctls
Date: Mon, 13 Nov 2023 12:06:18 -0800
Message-ID: <5213ebe1728427f892690ed644f6a8d1a42a96b0.1699904350.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699904350.git.deborah.brouwer@collabora.com>
References: <cover.1699904350.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Stop retracing ioctls that failed during the original trace. These ioctls
won’t affect the retrace and reporting their (expected) failure adds
noise to the retracer’s debug information.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/retrace.cpp | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index d2f6a6e7..d251180e 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -1246,7 +1246,6 @@ void retrace_ioctl(json_object *syscall_obj)
 {
 	__s64 cmd = 0;
 	int fd_retrace = 0;
-	bool ioctl_error = false;
 
 	json_object *fd_trace_obj;
 	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
@@ -1258,7 +1257,7 @@ void retrace_ioctl(json_object *syscall_obj)
 
 	json_object *errno_obj;
 	if (json_object_object_get_ex(syscall_obj, "errno", &errno_obj))
-		ioctl_error = true;
+		return;
 
 	if (fd_retrace < 0) {
 		line_info("\n\tBad file descriptor on %s\n", json_object_get_string(cmd_obj));
@@ -1389,9 +1388,6 @@ void retrace_ioctl(json_object *syscall_obj)
 		retrace_vidioc_try_decoder_cmd(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_DQEVENT:
-		/* Don't retrace a timed-out DQEVENT */
-		if (ioctl_error)
-			break;
 		retrace_vidioc_dqevent(fd_retrace);
 		break;
 	case VIDIOC_SUBSCRIBE_EVENT:
-- 
2.41.0



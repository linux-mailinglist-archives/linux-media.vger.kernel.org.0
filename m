Return-Path: <linux-media+bounces-45296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D560BFD746
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60D1E566DC6
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A97227F16C;
	Wed, 22 Oct 2025 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I4Uqho4P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C12C0282
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151641; cv=none; b=D5lef+ProfZELIuIh8+froDOqtjlUwgAXRwGR6/ftNk0A1qr4JOPl0cGyVwqqOAJRN/KbWjvfrfMNRWfJaNexYgQ20NFcf4UMfcmjsaFpA6WMKTwm+BLy5QXGGkNzGZdk4heCg5twfU/Emk6DqUYfLaoMu65wFjY7lBTohGPads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151641; c=relaxed/simple;
	bh=ekWtdHY3AtkcjyzeAc5Ypz7AoY8mW5C1l+EnzGiJkr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRHylUt7Od62qihz4vf4oHbaVFVGC7XuCQfFsAEJeV05aJbaD6H7Ry2/VtgDOlwTPHRgzm/dbd6zNT3qC9f2PD7ZwUUOrS0K9csn41CGym+mHsOQFbaMTUNEWOD8I3G/lF2xqZtyD3iyudKRLHXTN+D6Pei0zuPQYAOeUj/sSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I4Uqho4P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D0DA78FA;
	Wed, 22 Oct 2025 18:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761151534;
	bh=ekWtdHY3AtkcjyzeAc5Ypz7AoY8mW5C1l+EnzGiJkr0=;
	h=From:To:Cc:Subject:Date:From;
	b=I4Uqho4PEkWeJBApNH+jcE45iinSWbK38ww9tV8FHctmEa+kl+p9SVVTtvz7O3O2G
	 F615OK71LPO47CBSS+2KffNThb9Kp10o2V+rVDl28o5nkW12gI4gBHCP25YZuFXHCI
	 jOo2w6cOOsLnq74m8gu3ImpGSAqKGk+3ZsuNQW3A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [v4l-utils] [PATCH] v4l2-ctl: Don't ignore skip when writing capture buffers
Date: Wed, 22 Oct 2025 19:47:06 +0300
Message-ID: <20251022164706.9538-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The --stream-skip option is documented as "skipping the first <count>
buffers". There is no mention that the option is ignored on the capture
queue of M2M encoders, as currently implemented. Skipping writing an
initial number of capture buffers to the output file is a useful feature
on all devices, so align the implementation with the documentation by
honouring stream_skip in all cases.

Dropping the ignore_count_skip check is not enough. For M2M encoders,
the stream_skip variable is decrementing on the output side and
completely ignored on the capture side. As the output and capture queues
run independently, we need a capture-specific counter of skipped frames
to ensure proper operation. Duplicate the stream_skip variable for the
output and capture sides.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I'm not entirely happy with the implementation as it feels the code is
quite convoluted, but that's mostly a pre-existing problem. Following
the ignore_count_skip logic is a bit painful, and I'm wondering if it
could be simplified by duplicating stream_count as well and removing
ignore_count_skip completely. The behaviour my change slightly though,
and I'm not sure if that could cause issues.

This patch applies on top of "v4l2-ctl: Take stream skip into account to
setup out buffers".
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 5192f1e168b9..1629ff70c762 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -15,7 +15,8 @@ extern "C" {
 }
 
 static unsigned stream_count;
-static unsigned stream_skip;
+static unsigned stream_skip_out;
+static unsigned stream_skip_cap;
 static __u32 memory = V4L2_MEMORY_MMAP;
 static __u32 out_memory = V4L2_MEMORY_MMAP;
 static int stream_sleep_count = -1;
@@ -717,7 +718,8 @@ void streaming_cmd(int ch, char *optarg)
 		stream_count = strtoul(optarg, nullptr, 0);
 		break;
 	case OptStreamSkip:
-		stream_skip = strtoul(optarg, nullptr, 0);
+		stream_skip_out = strtoul(optarg, nullptr, 0);
+		stream_skip_cap = stream_skip_out;
 		break;
 	case OptStreamSleep:
 		subs = optarg;
@@ -1375,8 +1377,8 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 				stderr_info(">");
 			fflush(stderr);
 			if (!ignore_count_skip) {
-				if (stream_skip) {
-					--stream_skip;
+				if (stream_skip_out) {
+					--stream_skip_out;
 				} else if (stream_count) {
 					if (!--stream_count)
 						return QUEUE_STOPPED;
@@ -1510,8 +1512,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 	double ts_secs = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
 	fps_ts.add_ts(ts_secs, buf.g_sequence(), buf.g_field());
 
-	if (fout && (!stream_skip || ignore_count_skip) &&
-	    !is_empty_frame && !is_error_frame)
+	if (fout && !stream_skip_cap && !is_empty_frame && !is_error_frame)
 		write_buffer_to_file(fd, q, buf, fmt, fout);
 
 	if (buf.g_flags() & V4L2_BUF_FLAG_KEYFRAME)
@@ -1558,8 +1559,11 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 	}
 	count++;
 
-	if (ignore_count_skip)
+	if (ignore_count_skip) {
+		if (!is_empty_frame && !is_error_frame && stream_skip_cap)
+			stream_skip_cap--;
 		return 0;
+	}
 
 	if (need_sleep(count)) {
 		if (stream_sleep_mode & 2)
@@ -1570,8 +1574,8 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 	if (is_empty_frame || is_error_frame)
 		return 0;
 
-	if (stream_skip) {
-		stream_skip--;
+	if (stream_skip_cap) {
+		stream_skip_cap--;
 		return 0;
 	}
 
@@ -1723,8 +1727,8 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 		do_sleep();
 	}
 
-	if (stream_skip) {
-		stream_skip--;
+	if (stream_skip_out) {
+		stream_skip_out--;
 		return 0;
 	}
 

base-commit: 910ce5d9ec8377811faaad7da456d25370c9188b
prerequisite-patch-id: e937d6ae4fa0418a2daf171155b561b710bdf9db
-- 
Regards,

Laurent Pinchart



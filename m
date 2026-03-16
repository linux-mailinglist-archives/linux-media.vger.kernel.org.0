Return-Path: <linux-media+bounces-55909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPeGOzoFuGlpYAEAu9opvQ
	(envelope-from <linux-media+bounces-55909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:27:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B729A518
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21F30301D56D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C955B3976B3;
	Mon, 16 Mar 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm4vQ3iF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBB33D50F
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667477; cv=none; b=QEAsbBQOZj3/PYjSyy8/PIaSYHrjEjMZ5rDfxDwKnxwtOGQUfcUfVy7zBeE4re5p51A6DisvD1/Zeu8SBe4Shdy9pGLl1+YsVaSW6jpv5tqQiUU0Xz9fL4IDpZTAO0edT5Tt57l+FzZSy1B+YcBB1LK2senEmKGjj7kEI/DFUek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667477; c=relaxed/simple;
	bh=1/zBFna1UazFMb+bpUIW7RhTM35z8cL8vNYaG2ERe7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCLTZN72KeGwLzMrBxlFVwYYQb5pfsI7rbxRfZXDyoJYxnKGbsVRGoHrfWyHIpCAXJ4r3ntJxbR9dokvyRtECR82b+2x39xRKSoc4vBey9SaprO2xhIc1nehja5jBp4usLfhl6NPxQzbhqDzmYZLW44L4BDA0N5Iy313Uizi6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm4vQ3iF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so4015878f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773667474; x=1774272274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWqaEm9mFZzzjgLsPGkX7bxkxiONv4dEOkhsqgojyUQ=;
        b=Zm4vQ3iFOzNrTfiWJVRxdyEkaRSwTmc+Q9oMqqXtuVXkpI+3spenP9eyxYRbz6/oln
         p/jAeJGuABm6wR+FHYMgcu7YQkqI8eg8HI4jpLritMLkyEhCnclO4KEzhwtV/hNxpBWK
         Yow4w1pD5vyfyllgVO1vBhK67KiF8pqtKTj2VQLTZXpYDS+BZ/lR9Pwdz00cvIBM3Q+I
         44pPWjR+wV+Rl1itpazjTy0tV85HJhCoi+VWVaCNqa17PNU10LLgepx3xdQ/75aQAnem
         KYucU/hwSVyYW5Q/ZI4PuvRjjYabH6kerKXwi0eFmJ9DGxjoA2J4w5+tXmgqnxY7SOx9
         FGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667474; x=1774272274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWqaEm9mFZzzjgLsPGkX7bxkxiONv4dEOkhsqgojyUQ=;
        b=YEGj0e+PwDcHi+HFf5CGbI2/qSnKq191zI6N+mgsB7x4GRxuQ/qff3zXrMrD1GwruI
         5v2FtFTR0oVt96X5/5OtWJaSVfsrMVpObdNqcXnGn/uaikFQrc0WlMz84mAikSuVzD08
         5ffPBgFLvvxWGleDQMdwfCpDvHUIHLVl01QilunSkuCddT0AmIaAI3Z/4VVWBRqB41o/
         2c5KST0FwqBeGFNtp/zTH8j0TpQ/LGmih1EeWKcyiVS8Vc8UEnB62CyNdE3IWuEhPSA0
         YVsESVdwtIkUEX3Sx4lViM2UuWcqQa3r72ck+rXiCSaxp5HlQCMeXioZQoEwoAmqSBjg
         OSsQ==
X-Gm-Message-State: AOJu0YxHTv2XuYesb5X6F0UWvKGoBSAjoQWAAB2v9N7e/Yc9N7T2IGw7
	GIku3t3f9pcS467TUo8BjnN5sa+X1U+vLrGA9eeoWuVX9nQt0b3ECA6HH8i27Dt6
X-Gm-Gg: ATEYQzy+EYC1+gJm6N4WvyVFSILlfIE5P2mJu6UEKqzOBUcCvBED+XEm0wiDENGOvUn
	fTijeN5XPJWIKcuwHNdM3fcjtIpP6dHx++i+EOHtB46gfXl1D6uLEPhF7NAdxWl44C+FLbPfjmf
	Q0Rd+a+zrynFwmALzwF7W7bhB3YUNtlu6lH5ABmF6u2brIUUMv9PBz704E3pdT4c4cL4Du4vST3
	VebyT3ngLvH21GM07fEcHfc6B8xThDY7q9vshamYKRJkBdI7kVWH+4tpy1FHu2jx1PdjH2Jqzbp
	m7BWTZdNWlJz3BMrYFOZ1q2jrwLPdE95V91L++qBgoGHZvimj2E4gmtrwFPdDjeRJ02CedVf6q9
	6PO6mqQ1SuauAeFvjwM+kxtgYBH6PZT3W0+P4lRP4V/E4nrYpY7HlQcuIaSCLNlNBrvRjy4FlIN
	4/DXS6cBvDd/V8aaXSDVpKj7aUQDdTjvTJojwnj7SS2bpyAkC9EaVw
X-Received: by 2002:a05:600c:4752:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-48555ac714fmr212700275e9.7.1773667473926;
        Mon, 16 Mar 2026 06:24:33 -0700 (PDT)
Received: from sarah-VirtualBox.local ([147.234.100.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm472938825e9.6.2026.03.16.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:24:33 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 2/2] calculate expected length using v4l2-fwht info
Date: Mon, 16 Mar 2026 15:22:23 +0200
Message-ID: <20260316132223.7337-3-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316132223.7337-1-sarah556726@gmail.com>
References: <20260316132223.7337-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55909-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 400B729A518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update get_expected_length_trace to calculate the expected buffer length
based on v4l2_fwht_find_pixfmt info.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 utils/v4l2-tracer/trace-helper.cpp | 40 +++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 6c296dbf..a59d7761 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -6,6 +6,11 @@
 #include "trace.h"
 #include <math.h>
 
+extern "C" {
+#include "codec-v4l2-fwht.h"
+}
+
+
 struct trace_context ctx_trace = {};
 
 bool is_video_or_media_device(const char *path)
@@ -233,18 +238,29 @@ void print_buffers_trace(void)
 
 unsigned get_expected_length_trace()
 {
-	/*
-	 * TODO: this assumes that the stride is equal to the real width and that the
-	 * padding follows the end of the chroma plane. It could be improved by
-	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
-	 */
-	unsigned expected_length = ctx_trace.width * ctx_trace.height;
-	if (ctx_trace.pixelformat == V4L2_PIX_FMT_NV12 || ctx_trace.pixelformat == V4L2_PIX_FMT_YUV420) {
-		expected_length *= 3;
-		expected_length /= 2;
-		expected_length += (expected_length % 2);
-	}
-	return expected_length;
+	const auto *info = v4l2_fwht_find_pixfmt(ctx_trace.pixelformat);
+    if (!info)
+		return 0;
+
+    unsigned coded_height = ctx_trace.height;
+    unsigned expected = 0;
+
+    for (unsigned plane_idx = 0; plane_idx < info->planes_num; ++plane_idx) {
+        unsigned stride = ctx_trace.plane_bytesperline[plane_idx];
+        
+        bool is_chroma = (plane_idx == 1 || plane_idx == 2);
+        unsigned h_div = is_chroma ? info->height_div : 1;
+
+        if (info->planes_num == 3 && plane_idx == 1)
+            stride /= 2;
+
+        if (plane_idx == 1 &&
+            (info->id == V4L2_PIX_FMT_NV24 || info->id == V4L2_PIX_FMT_NV42))
+            stride *= 2;
+
+        expected += stride * (coded_height / h_div);
+    }
+    return expected;
 }
 
 void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
-- 
2.43.0



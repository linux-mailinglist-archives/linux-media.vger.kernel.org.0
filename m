Return-Path: <linux-media+bounces-55209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LdUEnQ/sGkehgIAu9opvQ
	(envelope-from <linux-media+bounces-55209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B43254212
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FE56320309B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0601311969;
	Tue, 10 Mar 2026 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1C0zfIq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A130F7EB
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156238; cv=none; b=dLhffbYy9A4PgnKjoGTvJDfS+YfTo3lNsZN0SeCO+vLr/SXo+aRTPhIOv2DSgNRLWu26BhvgQaCY3FshUgiq4gv6t9pGtEGMuDc4tiH5YMU3WSpITiCbZO4qskbJTE4WlS2ItTak/+b/aJqo/FPNsxR5p2+FW03V012MggX7v7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156238; c=relaxed/simple;
	bh=1/zBFna1UazFMb+bpUIW7RhTM35z8cL8vNYaG2ERe7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4hhIbRANScFxe7yDjb6d5I84iJDduSr0+9vG4pNwwxgK2jHMgvh/uaM5YeRZRUHgKfeJdk/PA86SlxeQNmUp1v3DUeupdZWxFXIzRGl1uaktLkbM2dfVc2rMo/ZHg9LNuxMlu6RJ9hMh4tD4D2/U+MhpXhjN0ke9uwG2mWUal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1C0zfIq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so6060904f8f.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773156235; x=1773761035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWqaEm9mFZzzjgLsPGkX7bxkxiONv4dEOkhsqgojyUQ=;
        b=k1C0zfIqO0Yew9BuI5VrNSFzHVZY9+QZ8HTvSGbWb5HpwUtdOChGVLlYBfKgsKUaBe
         JODj6j1LxGRO6EagHLyH/mUV8CaRiROaT/6CZGS7dMYkUMEZ1C8gN0TwPXfKFZxFisJq
         kllXGPE64/eoCD/CRfp76QxsGy2Fz7eGkmA91kqxTIuXvz5fULrxFxiCDnl8uRNJOj0Q
         P6ni0VWaml0uAXVOk3DRd7Gnkmp+8H47NtMW3ylUmF8Us38XVopeYgAGe4vC5prDAgSG
         WJLXS/3wVJBJv2oFiZt6knWAsIt22oisu2EHfhMbTyqIZClG7PJL8GYXfWaa8W3oXNn5
         u42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156235; x=1773761035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWqaEm9mFZzzjgLsPGkX7bxkxiONv4dEOkhsqgojyUQ=;
        b=IfFhITL4Vx5y/uywBB9elgaGuUgTOeYD1+EeCtztzHH2KyzTqYFWOggeBavYPyDVgx
         CCIaTQKZIqxjW8ycIOrldCVMHY78Y7ZyQLUleLDCK8fKo/EdDRUp8pZyuTneiP4pZBfz
         ycSR2eaRYnKQZLtM3wWOt7JGo5Qk6+C0CdRKMy+uN8EIHzjkjxSa7n/zuPdThQD4W4sh
         7SSAE5C8bGLiOCIPykB4/OXJT/5oHcJxW/i8ngZ1XkatlMXR6IIqGF0tiY5qTW/Y/l/U
         rnr/FYMaaWfw7YMsxMjvMMwiJAQlow1qdvW3ZxEzRPVZSpbckliAKruQt3GpPGdXQCi0
         FW3g==
X-Gm-Message-State: AOJu0YyCqZq6GLs9TiD3pDsUIFqYhSTALSYH4p6ASqSwWHPB7n1rCKLV
	a21YgvrSpzQGWNL4T6yMCESGp7pU5lOod9akmCqQ6XL0f3iZiltAY3fpme7aWXlC
X-Gm-Gg: ATEYQzyvLH04vSk53JeeDm8Pz1LYsqQciGXlT0htpCEIWvFrkyPH2AxYz6cd7xgTrhs
	lsVLuLwwvNsZ1amP0mZHXWsO81GBHgxKIYcdINlelZAY3YJXtzYEq/+EsS7Z+zKWJoGQYH3ucoZ
	8W2q40n/CvbCMbprxe1eSQMnuxKmKdp2wyTQ1MLmJ/7djYVRhOqell+kWNagwoKDuo3P1H25Dua
	xTKYeXSSSR0Q5W/oA9uK+I0grCIhzoC468YJy9AvwOFAJGyhUWdq/jM6UzylqKV4+yLt4SFGVz4
	fJIsYxK4xsOhvorG8DIb5g741tP9QNCz/EYAv5RoWAFjuSbxkYMlIMKwLvPZLcfrllVlLVF+3Kh
	WxXPG0FrjaaXNv806Gykmdgmz3BL4i9xHUDwUS6vCL+BLsrHl98figoT1pKj5x3OVp1dU+MZecO
	TGTyz6T1o72ug7XtfsOlJkEw0u1bdaM8G1g7CVfEPO
X-Received: by 2002:a05:6000:2905:b0:439:ac53:a941 with SMTP id ffacd0b85a97d-439eff4466bmr6705832f8f.22.1773156234818;
        Tue, 10 Mar 2026 08:23:54 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([213.137.77.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm34653806f8f.26.2026.03.10.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:23:54 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH 2/2] calculate expected length using v4l2-fwht info
Date: Tue, 10 Mar 2026 17:20:47 +0200
Message-ID: <20260310152047.4595-3-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310152047.4595-1-sarah556726@gmail.com>
References: <20260310152047.4595-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A7B43254212
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-55209-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

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



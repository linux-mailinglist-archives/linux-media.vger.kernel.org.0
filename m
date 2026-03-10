Return-Path: <linux-media+bounces-55208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF+IKIU/sGkehgIAu9opvQ
	(envelope-from <linux-media+bounces-55208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C36254227
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2EA4318D461
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FEB315D53;
	Tue, 10 Mar 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsPzYDdX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB114302CD5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156234; cv=none; b=a72z31Aw00Isp8XPPEfRk415WqGQe2szL4Dprowx/h3nPnDWX39gVK+0XXyCeb1ULYDoRydTdvo4gppEW0AAHDWaTjDVrpVhdATBZLqzkc0zPjqrTMaqhmHf4k3kYyRizqdwRESgkK9BSU83UMfh57EMYiicdnNUPw+BbGDUlRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156234; c=relaxed/simple;
	bh=9eOlAUpBrf/X4ITvAy9TcF1PycXGGKX8k1zI11Vak+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqqMMW8ZlRZXGh397xydwzkGNp0RXOLwQ3BzKKLs7jhuC62WXxhG7V/13o5vusbJbf6tP4cX6ubNIqimUV2VsvqYKZQ1tH/10CdzX9+E6wtLVx/nE8Ek/KFWpzcsssaS6sCdhXa5HmzP0gI+xh/abV35tTRNcbe/gMnnGPyDnSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsPzYDdX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so39409685e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773156231; x=1773761031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+4GZrfB9EKzONwQ/xrdN8YXtQ/EM2kJGvmjPy9855E=;
        b=FsPzYDdXADKuMtkETDQawBIBrfl8H0UiyTcfcWrhA1icpDovcF4NrBVLAbVMw9SSoe
         yuCYk3ZxGVXfB+bneVZ5plWbW/ZYwoHub9Laq6mkG5xa0pOZ910qEBajohfzsV6wpuqj
         TZm/0zIZ9kF+j6Miyf2jOYqoIIr07hQZgNUF6McoliWkQyWjms3+X2Pu0HuGhZSh/JI7
         bIneRoKaCL07L3Kk4eBVBDqN1/JOYfO1inHYAcDX4nvTvJ4mAEahbXOWeHjcSmbqVyP4
         dEEpS74KA9q+OHFYhsgl11tE91nMTHvAHZNo7lCGFNLWAsZeuGoxSxJKoiW+50oy4eKv
         NLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156231; x=1773761031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+4GZrfB9EKzONwQ/xrdN8YXtQ/EM2kJGvmjPy9855E=;
        b=VfT4QO9hIZMKxclLctp5E0167WFXOvb3MGxbV+x8X4ans7LI5dUc1K9L5ZNO4yg2Jn
         kAnPi38xCbsopEx2nQ4+Jf7NrOSaCVVjouzH5X9g8eeSL74WVy3DDj1qwWvBNuC1jO73
         3LuNaTgqsur9H3MB5SywLcPyq2KlelMvEQH8TSHbMWfIIWj26Q9G4SEYSW+GsPO4PfUV
         Lba+v/QqrGOTFTCtzAVfgS66qh8SHQcOK1ltznQXTY2WQQ4Xriywd+TK6SThyuuDYAXE
         1cr6t2owCAGTnhvSYU5sgtY/uFJen0JNutLHP/mnTB8KUcsyKDO4wolGJLRMRAofswy9
         08Gg==
X-Gm-Message-State: AOJu0YxNTTFZjvkLEccogy+IkQfjgx7aOKQxnVmG/+qqvklWoA7LzgXP
	8Hv5CI0k3QKAnLQUFta57TekEsMLYkdYclpUtBgwU8nOqeTTlLYcUsT4f0PI8u7z
X-Gm-Gg: ATEYQzzJcwfYLK0eJmrFfIBjtfBlUpOsZffBn98Pmvz98k3ccqi5XF1SEuPG6Etc2xp
	r4jOqgSd0rgjXof758Qr35MWkMx+tZRk7SI8nz6YfEwyOlfjdamSwstVob1hObLxdnO6kgRG/PC
	uYJVwOJf+Td1bHk1aOvj4IOPVJFsh1tOvZlMimHw8+kAJA21bEfaygch0F1yt9JbwajNc15JHy5
	pGKKCVtLvEUrePhgLuw+ID31sfYE8FFXoNzeG+0NlUQKSOeS+JJqRVpWE0vGDI/dHrut39Uj3Rz
	sPM9SRNcHad6NbA9HjmGPki8JL99SzZekg7zzIQGw/PyJSC6cDw8Dd2eDCpVmhTi4p3512zFbnj
	JW54VvjvIFwrhQssO3DksQyTq8IPYlaXWNqQu6R9n1l1LaQVAC70xmlf9JoOwfMftfXf3p/m1wm
	v3ZzVZru0+9aO5/TEkmtVTQSngUjhL0P/sKKJI6bUH
X-Received: by 2002:a05:600c:3b0c:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485269188admr256407815e9.5.1773156230756;
        Tue, 10 Mar 2026 08:23:50 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([213.137.77.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm34653806f8f.26.2026.03.10.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:23:50 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH 1/2] add plane_bytesperline to trace_context
Date: Tue, 10 Mar 2026 17:20:46 +0200
Message-ID: <20260310152047.4595-2-sarah556726@gmail.com>
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
X-Rspamd-Queue-Id: 20C36254227
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
	TAGGED_FROM(0.00)[bounces-55208-lists,linux-media=lfdr.de];
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

Add plane_bytesperline array to trace_context to store stride per plane for
multiplanar formats. Update g_fmt_setup_trace to initialize the array.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 utils/v4l2-tracer/trace-helper.cpp | 15 +++++++++++++--
 utils/v4l2-tracer/trace.h          |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 9e5747a2..6c296dbf 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -399,16 +399,27 @@ void g_fmt_setup_trace(struct v4l2_format *format)
 		ctx_trace.width = format->fmt.pix.width;
 		ctx_trace.height = format->fmt.pix.height;
 		ctx_trace.pixelformat = format->fmt.pix.pixelformat;
+		ctx_trace.plane_bytesperline[0] = format->fmt.pix.bytesperline;
 	}
 	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		ctx_trace.width = format->fmt.pix_mp.width;
 		ctx_trace.height = format->fmt.pix_mp.height;
 		ctx_trace.pixelformat = format->fmt.pix_mp.pixelformat;
+
+		for (unsigned i = 0; i < format->fmt.pix_mp.num_planes; i++){
+			ctx_trace.plane_bytesperline[i] = format->fmt.pix_mp.plane_fmt[i].bytesperline;
+		}
 	}
-	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT){
 		ctx_trace.compression_format = format->fmt.pix.pixelformat;
-	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		ctx_trace.plane_bytesperline[0] = format->fmt.pix.bytesperline;
+	}
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE){
 		ctx_trace.compression_format = format->fmt.pix_mp.pixelformat;
+		for (unsigned i = 0; i < format->fmt.pix_mp.num_planes; i++){
+			ctx_trace.plane_bytesperline[i] = format->fmt.pix_mp.plane_fmt[i].bytesperline;
+		}
+	}
 }
 
 void s_fmt_setup(struct v4l2_format *format)
diff --git a/utils/v4l2-tracer/trace.h b/utils/v4l2-tracer/trace.h
index a74a5f3f..7f166287 100644
--- a/utils/v4l2-tracer/trace.h
+++ b/utils/v4l2-tracer/trace.h
@@ -32,6 +32,7 @@ struct trace_context {
 	__u32 pixelformat;
 	std::string media_device;
 	__u32 compression_format;
+	__u32 plane_bytesperline[VIDEO_MAX_PLANES];
 	union {
 		struct h264_info h264;
 	} fmt;
-- 
2.43.0



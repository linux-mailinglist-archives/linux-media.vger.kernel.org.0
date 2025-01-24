Return-Path: <linux-media+bounces-25260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C0A1B50C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 12:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4CFE3A6B1A
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 11:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A461F21ADAF;
	Fri, 24 Jan 2025 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vhr1OYFA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5A4A1D
	for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737719788; cv=none; b=Xm34YKqVMorugcztO7Sp1SpqEyEpMc8vYdChQtgiblzBkKyRHpiLgRh52CNJG0EIv67+Mkq1wikbmuQXu0EstgmKFjPs/caQITmOfPe1lugkWY/A4Ft62xX8WHSdHUwERxr/zzPeS7weEGKGi48lWCg4/vl3tg91vSFC+G60jyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737719788; c=relaxed/simple;
	bh=4WGP5dadGutjzJ3+H8p5KAG8XyR3Rj/yYU5qUl6jSTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pe2d9CDp9Q/G8Sq492Daau2/+YjHF4phPvh19K/FF5y7v8/5molZxJXxFD5AAuOsHY5YIt5vQtqLXv6bPjY6LSnG0f76vE9JeZQTbxDcgtrYFEhB3FF659MPsUvRb/iJRJrzwzpzCulpXWvm0/4BfzkUueYdBu4nsXV+yFKyavc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vhr1OYFA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so38801525ad.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 03:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737719786; x=1738324586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2R9y3ggvKVuzIkCaJAAdRrqVKtdraSfJvImQnZ5AKc=;
        b=Vhr1OYFAAaDkZ1rMagifDIQbugCoaVFCXjmpPrurmxomnjHLeRI6WwHVN4uYeTFA94
         NeWdphaeIp6YEvbNlcZvXGnBuAcxlMqzJv3v1FQt/crzUgoNSL3dDatLixxOSDReLoIs
         gy8wPtM51VsPHuhayu4nk86g/SNvJo7MtIyvu7wR9vwO3Lpe0JA3WKfsc8vnrsHlp0aC
         W95lC3DGY9W2CMtju8alj89ckUKecDNkCwJJcvbQFBzV3EHd4kFn3LEJ2DtaHRbf5+te
         eBEzCJEvAJC2/9aK9wXJm51d184W7iqlXJtv6eBMMqmBR+r6wuXMURQgY55/0b2qaJ+X
         up9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737719786; x=1738324586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2R9y3ggvKVuzIkCaJAAdRrqVKtdraSfJvImQnZ5AKc=;
        b=kHJqz9jvkRvrEESL3DmyompA1iErKE5WWKOtUftzqIRWi4pdBfFd7AtP5h3GWt7tuG
         WigFvFbNbCFMZ7iq+ItTUgrxedDTTmf0BSq/n/2ZEfH0oaKRhRFCtieazXuSujVU52+0
         BOEBre9hhBZCghKfXw7qUmgY5QJUdqxzMZ8fDoggac8PYwrdZIi/ko+gVhhsOPt5HkLT
         qEILY47Mb9c4x4qm26DkDoiXZrYwLFPNtNCPu4MH9A657AGq3PsETkvY6nN/PyrPGHGL
         5HQKwjE745n6hsRxCk2WbcH/T4+JqnWYL8LivqMqf1jYeZV1V8W0EWcgDzwe5AogEeXr
         KiPw==
X-Gm-Message-State: AOJu0Yx20Woj/gxSMvEU8FNpdzTqof2Nls1xxuirmC9KU8Khzy6X90/u
	vEyz5edQazS72h1Jf56W6b269ovWT3RanOHPyHejmbzB8phdHmSfPogcQqNC
X-Gm-Gg: ASbGncvEfn3U8o2RQDsW+RyI99BEgs/6TyqmiDVBsQ8OB1o083J47DrLTpT6nihSZ8+
	UsX3dceLFVCCyiH/H34YAXhlV5AAG3omzeEY1OZc24Kl7uNyMKHYqig1Pu3Els9t/nYD5qLXBfz
	94sS5GJX50ndAHUETxxJJOm4TFLeT/ycF8buWYRUGYL0N+vQLIn4cPfe5bcr47nyW83S/Bo9/6c
	BxpWyL2aRkVb3lq/S2nliyRqiSl2KXd10P115o6Qt5cdVgSWl9N0adAy9HdwGHCSNGkUJ7aY6DC
	XmhWjINVQSll
X-Google-Smtp-Source: AGHT+IEp9uSpvqcRSCpcA1v9cfLL4kxuYscX5yWK4yz5gITPjwm0liw2RNGmZa406bQpyI1LKsVhmg==
X-Received: by 2002:a17:903:1ce:b0:216:4a06:e87a with SMTP id d9443c01a7336-21c355dc64bmr474991385ad.40.1737719785619;
        Fri, 24 Jan 2025 03:56:25 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c605sm14593715ad.41.2025.01.24.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:56:24 -0800 (PST)
From: Alexandre Courbot <gnurou@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] v4l2-ctl: process events before queues in stateful_m2m()
Date: Fri, 24 Jan 2025 20:56:06 +0900
Message-ID: <20250124115606.734788-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Events can change the streaming state and affect our ability (or
willingness) to further dequeue/requeue buffers.

For instance, a V4L2_EVENT_EOS means that we will stop streaming, so we
shouldn't process the OUTPUT queue any further once we receive it.
However, the current code processes the queues before the events, and
this can lead to issues such as an OUTPUT buffer dequeue attempt being
performed even though there is no buffer currently queued, resulting in
an indefinitely blocking DQBUF.

The issue was difficult to spot because (I assume) this usecase has been
mostly tested with software drivers like vicodec, which publish their
side-effects (notably in terms of events) before the ioctl that caused
them returns. But as far as I can tell this is not a requirement, and
events can also be sent asynchronously. In this case, a race condition
can cause the decoding loop to iterate one extra time and perform the
unfortunate DQBUF.

The fix is simple: process events before queues, so that the latter are
immediately affected by the result of published events instead of on the
next iteration of the loop. Events are supposed to be higher priority
anyway, and this is already done in that order in streaming_set_cap(),
so this sounds reasonable to do in any case.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 1068ef2e6..a565628d3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2460,6 +2460,33 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			return;
 		}
 
+		if (ex_fds && FD_ISSET(fd.g_fd(), ex_fds)) {
+			struct v4l2_event ev;
+
+			while (!fd.dqevent(ev)) {
+				if (ev.type == V4L2_EVENT_EOS) {
+					wr_fds = nullptr;
+					if (!verbose)
+						stderr_info("\n");
+					stderr_info("EOS EVENT\n");
+					fflush(stderr);
+				} else if (ev.type == V4L2_EVENT_SOURCE_CHANGE) {
+					if (!verbose)
+						stderr_info("\n");
+					stderr_info("SOURCE CHANGE EVENT\n");
+					in_source_change_event = true;
+
+					/*
+					 * if capture is not streaming, the
+					 * driver will not send a last buffer so
+					 * we set it here
+					 */
+					if (!cap_streaming)
+						last_buffer = true;
+				}
+			}
+		}
+
 		if (rd_fds && FD_ISSET(fd.g_fd(), rd_fds)) {
 			r = do_handle_cap(fd, in, fin, nullptr,
 					  count[CAP], fps_ts[CAP], fmt_in,
@@ -2495,33 +2522,6 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			}
 		}
 
-		if (ex_fds && FD_ISSET(fd.g_fd(), ex_fds)) {
-			struct v4l2_event ev;
-
-			while (!fd.dqevent(ev)) {
-				if (ev.type == V4L2_EVENT_EOS) {
-					wr_fds = nullptr;
-					if (!verbose)
-						stderr_info("\n");
-					stderr_info("EOS EVENT\n");
-					fflush(stderr);
-				} else if (ev.type == V4L2_EVENT_SOURCE_CHANGE) {
-					if (!verbose)
-						stderr_info("\n");
-					stderr_info("SOURCE CHANGE EVENT\n");
-					in_source_change_event = true;
-
-					/*
-					 * if capture is not streaming, the
-					 * driver will not send a last buffer so
-					 * we set it here
-					 */
-					if (!cap_streaming)
-						last_buffer = true;
-				}
-			}
-		}
-
 		if (last_buffer) {
 			if (in_source_change_event) {
 				struct v4l2_control ctrl = {
-- 
2.48.1



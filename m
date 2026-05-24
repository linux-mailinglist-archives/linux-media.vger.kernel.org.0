Return-Path: <linux-media+bounces-62690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FewCptjE2r+/QYAu9opvQ
	(envelope-from <linux-media+bounces-62690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 929F25C4381
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BC50300D90D
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C6E330B14;
	Sun, 24 May 2026 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfLxgh9j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF830676C
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655569; cv=none; b=YPEiqsbyl6PoO10xgvQUbb4fMf83/YD+fiU+5gQsxN+NDtAcSW8Jiufqi8i7h1Rt4tc8t+aBPCbjMXacSvVr9iK6ut4+96481gGS8QstFPk5GLSuEbALSlEVBw7tLoWvXGbjHjTrVVTXWrEzXjzCGU0YKrCNmJkITym2pabySu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655569; c=relaxed/simple;
	bh=vWb+RtT9oEUWho39dX6l0hepPsqVghamdtytkI4oI5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSCVSHcFoQgs7l/bY0BykvGBKso+iF6kfOj9VPLRL0mmrBsETjxBwgj/XBxpOcJVeQtEImMmfc7MvzB1YwToSr+e0VPTVsAEoWKgJf2k03PMwgnoA4Nu7MWp5QCbsXfwisxTqiTezqvu5iV13hR3n6iaSCWxVBAIzRHWEzxlipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfLxgh9j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49039a8851fso33732545e9.2
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655567; x=1780260367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hhnWR1OhZizBrfxp+KCthhEUJb8829SbMEV0N2ws8U=;
        b=ZfLxgh9jpZ/Nqg2m5nhIOWQ5Z65sRZahc8GYw8DHNxjIPBgF+jkJ5kmJ5ggMxp89Wv
         igGpKbuaHadNbJW9TX6BsxcvW4S9Mu8v/ikuPHiE1g/h6GmC3V9M8F71I+tJaMJ+pjqn
         ljJ6Kra2dN8FPigRkXfsoEV2hx0ksWtTo+Od42dL41deTq3nLNRikP/Xg0SbyOpCRkZY
         Fo+/KQ550yenkMVFDFYevR6FQSDgJxRWWK/W9tia5ZgSn7VqOFI0WM9vO7X7BftflV8j
         AzUKLb9Lcm4vcVL8E4Xfj1Q+n6Fhd2XaJX7Q3VLcc0FhODsE5Az7/DsXT+3n5KeF1s6J
         ozJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655567; x=1780260367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hhnWR1OhZizBrfxp+KCthhEUJb8829SbMEV0N2ws8U=;
        b=I9SUChBa9qEXkxnADE+Kc6sXPAlHXkH8Xyna9NujDbvL5KXkpcW04NKn44MN1qPIDz
         GIXQT/quwImu7jar+sIcyDdGKkUx3x8vv43WxaNTDBEuUvW5R+b/uLly3lSXJpwMveU1
         bNBpTVKze6GAU+Mf40GNctsxH3yEl/M2/RGEDnYJkQ/uH66ab/rUVnMIps6Hr7NLspNG
         bqI0nnPUpmLRuXGRJX5DoXY4D39AEGnquQpNaWxOnja42xZLvHi7SCS13Dif33Ec8eXp
         AHgr8CN4Sf9romfpiJuVMLJlhVPoeDmC+/T6lp2bKto1/QuQTjqouDfrSx21IDDdwOR3
         aDjw==
X-Gm-Message-State: AOJu0YxWjIEy/T4j2rUxD9hfwpWRm3OMnUhNXrqj4aB/6W4jixt6zYr8
	VwFLncjsv3EXSJQiobluy5EbloweOIGJ/1LijvNmfrCHL26wBnjRAHe1LCuAog==
X-Gm-Gg: Acq92OFiqqF0pEy4WW9PNDxCHzvhm23wZqhc5Ru+Z7/HwbCRsb6UGRxqKAmB3VmxACg
	96AApAY22pNnQ5DXS0UbwOo+t6+J7kmBSJE/TDWh+WARHy6Llp9r9JNdCH/UnQeowLKaxtMF07G
	QqeE7NJgoTsrr4+vqF4A98zcNr2TM3pF8R+yO69wZEbnXWdG102LtKSV7epyouiW1qaJpg7hU2Z
	EG9xXIbZlJuHX/R6W8hZATXxV2wvv+1RJYmDId4gYGNGwPaLhDmKVMIuzDxtdpMP8UX8XhYkHkN
	CvSs1bWqYua25Jra3YEOIL8Xuce3vJtDHF1hXLG5lN9uGXvFq5A1it49dQ1sEd25IpM073w/072
	CACvkXVHiFXLTUUnLshjB7COfFVw/1gLUbZTeVCdqiRx65fBZaGygiGAEQ/oRq7H8UxlbBL0UCN
	8XZ98+/md62CrjNf+fOmhAvEoKC3O4Fs349ThuzL1G+SbQItWl99/V5jrLlJ0sbbN1W6y9Om1XP
	YwKyvseBG32
X-Received: by 2002:a05:600c:4e45:b0:490:538a:9c0b with SMTP id 5b1f17b1804b1-490538a9eb2mr115687955e9.2.1779655566661;
        Sun, 24 May 2026 13:46:06 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm208148865e9.12.2026.05.24.13.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:46:06 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 1/2] add plane_bytesperline to trace_context
Date: Sun, 24 May 2026 23:43:59 +0300
Message-ID: <20260524204400.8287-2-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524204400.8287-1-sarah556726@gmail.com>
References: <20260524204400.8287-1-sarah556726@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62690-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 929F25C4381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bytesperline to trace_context to support accurate stride handling in frame size calculation and update g_fmt_setup_trace to initialize the array.

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



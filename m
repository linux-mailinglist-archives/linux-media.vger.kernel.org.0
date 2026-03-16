Return-Path: <linux-media+bounces-55908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHR0DjEFuGlpYAEAu9opvQ
	(envelope-from <linux-media+bounces-55908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:27:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321929A508
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC63A3023449
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F63397E7C;
	Mon, 16 Mar 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsaFh3Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBC33D50F
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667475; cv=none; b=B09VRgnv2w3R6oVHQgOnOZmNwx+ngsVYmqVwIhhxdZgtcp2W10LR30rQlRM3SFFThAbYxH4xll7CrFFlUY6G85gw2CYoGE8vFaRtT8UhGtLL62j5pwcIZEXfni2DM7yzG7NifaeMnz4pvxMIM/SuNp3J+c8vGI8fnOBM4WPrp34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667475; c=relaxed/simple;
	bh=9eOlAUpBrf/X4ITvAy9TcF1PycXGGKX8k1zI11Vak+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFbiDZjH44NvEY/u8+ogtA94K2fiPSXrWETHXFMi/M0ZR0yI8VduegicNMU30XFyIWjE4bOQrhOVCdLmSgTBiaE1fni/akLBu5z4PBFm7Q8dkeft/CzRkLwta2f0BQ8mgDrKHVBhMbOl/isYDicXlpwvVII7jK2jApFewwE0BaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsaFh3Bb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso4102085e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773667472; x=1774272272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+4GZrfB9EKzONwQ/xrdN8YXtQ/EM2kJGvmjPy9855E=;
        b=QsaFh3BbnoUB52Jv7T22pDv1hnMvO7gLwgvkg5dcYXNEZ9r/JLjfc+3OAgoOMJiRWj
         jIOrECfYkbtYWHjKlvUHFabANrVRnokACNhmXeYjvdpBU+68p1uyBv9QmwqyNt6sVR3W
         N6MTGekZztMtidqizE3pfYY3nsAufTRQZPfjK5sEAPnvsfYhyfWLhAUeWRpp8YEbous0
         FbSz+xmLHcWk5Nmyj+9dcnWTasFqywhSnb13uUWc9Jr81JH/V+WcxtoXQP6fOBUNAijd
         6Zq9VbBjSTMw5emPBvsFgZZpVlpoMLUcOHRv6b+m53Ng++Heqr2F/wWlIRDqSnFWQAMf
         Q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667472; x=1774272272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+4GZrfB9EKzONwQ/xrdN8YXtQ/EM2kJGvmjPy9855E=;
        b=hAww/UTLKUGEtnNMiletkLJgcxqxTaevXlUUrJCJ1L3o4hwEHkPLBMJybQHqygRCax
         9OItmlIHDQR8/jYHEXZs1YIQaKovPDsYPdXcY/9SmJEzp1GBrRwqoj+yIMXC/vyaRixl
         UkZkdYCM7v6895JcDhU4TNncupte0SKfO0DRMMikfnJIyhhMQlJ6XHs8W+uRfC48q3sQ
         888whhIk3zTqqK/iasx2YacEY1lJD2pyyZvbQQ3CMbh4Dn8L5wUZQHS2i4v24duGEA7R
         RDngtpiX/6Q6W+L7/1BG9QqVtCUAyWI0H4mOpqImfxNBNv+4/4X1CclSkOHDmu7jsFbf
         0lHQ==
X-Gm-Message-State: AOJu0YxuThKcWdDzWGz3SVRHZBGSP/8zjnEVEalUXN/hDPHixID47Mia
	UeUFLtzHX4MiEFhLwObpnGg4GGkqejEcOxW/90OLV51tYdj4Tg62LqrugGJCXK9x
X-Gm-Gg: ATEYQzzBPW5Zuj4NpjH1ET0WFK3vBf33gmYdK8hiVt6QKoIMzyLnE8OznMGlBphe9ql
	hkTpQA3n7/3bwgV2NOSvfyUnmRgDkoeMyxGXqxluuJ0/6O/e/vdBbNuzZyeVl5C2xraQS3Ob3uJ
	l3uFE7nKi3z7oRu4DXf4dQErbgSOwrSSfqJYfQ3gn56K+96iy4WP71pt+qwZC7Yo/OufF7Lo/cs
	Jw35Fh4KHnywvYTVMHbk40fkNNI/EKYaqXAQqWTat31rWjSRN6YtkuY4QcG6iF3MP8VOHiB0s84
	CvOlUpF19fB5OVxtAxigXrkPQiqFqgICKn4Ecdbksp7HY5mifuI0+LRA8m+oTt71M48U/S0TT7o
	8fetRPsH/oL1tqjY4gI9QSqHZ9Qr+iJ3dYn20cJqfBbKu4w46GUPOaL9Q2V6wv3frPPyuV1w3qo
	qa5nvGTBOW54vqKE3pVBffChwM6nDwfLLZ6+BxPyBx+Q==
X-Received: by 2002:a05:600c:a08:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-485566ca978mr221197425e9.2.1773667471540;
        Mon, 16 Mar 2026 06:24:31 -0700 (PDT)
Received: from sarah-VirtualBox.local ([147.234.100.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm472938825e9.6.2026.03.16.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:24:31 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 1/2] add plane_bytesperline to trace_context
Date: Mon, 16 Mar 2026 15:22:22 +0200
Message-ID: <20260316132223.7337-2-sarah556726@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-55908-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 4321929A508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



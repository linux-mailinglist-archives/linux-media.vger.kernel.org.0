Return-Path: <linux-media+bounces-57150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCe2K4A6xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:54:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D418336559
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E24B3095C98
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F40D2C08AB;
	Thu, 26 Mar 2026 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF0KaK6z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB82F12CE
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532835; cv=none; b=nbs+CugZQQxpVxCYxEzdEji5bj3Xz9ObPm4nG4WsMMXJ5fmtd5cFxQjoZ8l9B5ryDKD54kRzm081mESa8GikjocFk9qybT5S2Q1gmtVUyw9BZ7/G7SaYpIey4/plSc5oZwzHYj9KyUrMNz7RfXpOhIN8NdNcIu7xXXARoZ9Bf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532835; c=relaxed/simple;
	bh=U4HNRfZzFCQkdvwhjSgsLZD7bFDbMKeFuwSax4EV/jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nG5Yij/44/aS7fVmnnWFadRxU74F/j8Hsq6R7QlCJyoojrwSI6AuVAol5Ao+Lh6G59AWuEmvGwecdY1nU1OEM4Y6S5k+K1Z5Z5EKjZbgBpK4Y2MhyEvmA8ysAd8kJyHWiY93jXdjEFL0yu15Mil09nLxAjfQiYhjtouIQOybQw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF0KaK6z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-487035181a7so6285965e9.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532831; x=1775137631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqx3eGr3NfCyOhs1aYpBbzZa6pQ+QeOMCPst+WYgaMo=;
        b=AF0KaK6zrO2csNiF1JF6y/VirOsSIdWJB4rrW1SYjRa0wFd9fIBfFSFLTg900XYoK6
         b4wX0Rwt4HlPoKwwRW1I4q07RzJyz4Ihp8OJtAC0bOtpnqjnZmPhBsiPOG8ldoyDNHMA
         XZ8F4iakOC0l7ej7J9y38OqnZjbP4h0QBinyDNnrBRUAmAOAqzzD4Oznszg/KMzlSivt
         ZyWcdRLcFmMGDt8L70A69twcYLQt6w8FxMkNQ/wh+kqSyzGtG3iBBNNOtHOJL+7hiprA
         T8M+miiL00ruFaD9Inr8Tsp4LrQxKe9fsgWixr6wrgPO2pH6fVsIMO2Bape0MOkQqMWo
         6e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532831; x=1775137631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqx3eGr3NfCyOhs1aYpBbzZa6pQ+QeOMCPst+WYgaMo=;
        b=lwDArn861Z/BlhS0cNwRsn0q46FM2FuFMiFPZWK4ko2RcRguMbw5HM8lTHAhdtJous
         nFugnL6xY8SJagdnw9vAgVTUoJBGI8OAjxI4yFS0MJNpBVsOfFdwxQlPMQlCF7hGtIhr
         NKkncbH25WmSmsJT3KIuviA7qLI7WMs+Q7sN8CSKc9zT5p2a87R82WuHYnd8atoNKFee
         uPQT2lr1Wq/Xd3hMmRaftpmzfjdRTGSKNTEKTH2JenCBp7hBZoPnIcZS9oLlcoKK+AKL
         KKhi2vlA3kBX6MhzXP4OQ+Tq08LW8u2qeHqD9hshdLXIy8Bhm+gUq41FQBB8139wVn2W
         Gi+g==
X-Gm-Message-State: AOJu0YzYj3+P24RQQ26qTKH4xZj6x8mPFw7iLpwF62Uv/L22cDmim1/6
	guM1B0tnir5um9VezxKnpNFn9Dx5ySRZIMnjqk+5jVt1ZA/F/VP6/tEKhA1iBYhu
X-Gm-Gg: ATEYQzzuPibsl4rY1d7xfuZQYqZdC6aRlyfipwvNW72ojxdsSK2Rz9ARk2f/UnwDaC5
	YSK8X57/wbi73DxMDrhiFd9vxx4dCFdEmf5pVg5IjJLb0h1t86gKTxF+UxtddQX0I//4F5C9Y7e
	tKh02fjiRp+Meoffa1UMY4cF49+sZTBkYhLOBiTbMqy+kuJtuIZDd4v4w9tI8AtE7L+qL2ck9iZ
	ayUtqBJbDuhbUSQLze9UcgxSE9bQkCe9ZpjRWbPg/nrQ2Vxb9zs3BXXxiPiIHOzivMtYpIgGnxT
	lyS2mSauBI7fQMPRE92xinj5lwrQ8NrTsO/QT0wtmDYZDUNqHL18fb+YfbC+VrFU/hQiTpZf/wS
	3TO/Wf0X1LJ0MC+bFM0LEoNe0dCOzgTYVEDPGke3twROIrYhnJ5rzvEfkka+h0+rWoZOFlFjfHE
	rfiP7R7AvRhjPDtfEnClzAyICs5hmMlmnt3voUSA==
X-Received: by 2002:a05:600c:5298:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-4871606c6a9mr122155795e9.30.1774532830962;
        Thu, 26 Mar 2026 06:47:10 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm29705765e9.6.2026.03.26.06.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:47:09 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils v2 1/2] add plane_bytesperline to trace_context
Date: Thu, 26 Mar 2026 15:45:02 +0200
Message-ID: <20260326134503.10323-2-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326134503.10323-1-sarah556726@gmail.com>
References: <20260326134503.10323-1-sarah556726@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57150-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D418336559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add plane_bytesperline array to trace_context to store stride per plane. Update g_fmt_setup_trace to initialize the array.

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



Return-Path: <linux-media+bounces-61407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IONEbtlBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:51:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2D5328C7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A0FB30F8CDC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCC1402435;
	Wed, 13 May 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GuxwttD6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E93FFAAA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672972; cv=none; b=ipWyFEDIEkEWgvXGIwafxl7NALa/t6flHW0egn6ZR4/Hm3QoFuRYLBLNlPnmuJ7GyhVjzdHQCk1Xietn0HZKwv+jInRVhsoxLOn0SqcYV+WBqE4+dGzTLjGOxvfAn5MesxiRLhs0KgnpNjxS5c5vLbWKuJuuraTAxlFLIlXNQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672972; c=relaxed/simple;
	bh=JUaMHkC5DDmGPxOxMX018PdMdBjM0VT9k/OIdCbMX/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/WtFbfXf0wShiTLV74s1izqJDqqSl4cu+mH+IdAC16UqhRCRhfRL/AJmLnbJVO1cxzKIRrjAZ37LZlTCllBVwiVmA9LcINEvgBcWizwFVuX3ERupMEetxX1GqhwBozIcc0I35s1gil2qFyajmADGSo7vYVDWxy5jyDoQoxrdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GuxwttD6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-392445f11c5so68342671fa.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778672969; x=1779277769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bmtb+ICKBQ1P69XGsTJCXIGwUDaGvqHA8PV94ag1Rbs=;
        b=GuxwttD67/612PrCpbW3r5nKyITrCcIr26pX5oQirvgkobSFARzoagLuvrO0edYYyw
         7lp7kWSV1eM6EYnkrbR5HlGQhGhkygNNkXPnFsCozSNEWiy2yxOk3m/II0wNnJxHyMT7
         ezYsv/AAbskZWz2cqDJrdII8F4ZK6bqNXNEWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672969; x=1779277769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bmtb+ICKBQ1P69XGsTJCXIGwUDaGvqHA8PV94ag1Rbs=;
        b=mEVgfL7qadgHw92riKQp5rAdFqzOZbir3/hLSBaVFU6aUFZvQedAppXkcCRPdlLu8R
         C+yYA1Shur/nl6G2ZxRHg0Si/1skVL+9C/TJjNsi5xy4v5/WkIeki0/DgEU9qOafa6oj
         c7wsE5BklZsPa04TrXTh7vo0AKGUrTd3wtufyyMoWsd8AVYovjYdWhojqmoB+UO0PVAw
         KCQz20VzjfZ9asyQi8bmo01rjtE+MDFzSeskEt2ms/m4u682Pwwl6Li/flrryKNCLTui
         vYLe2yJaDYvuxGJPRVK2JulK9fY3lZrEuvTr7QoBkf9gSAneo8drlrp0ogVV5kbmjBKg
         gXeg==
X-Forwarded-Encrypted: i=1; AFNElJ/CQm/L1O+/l8PLkCTjFWSsDHn7wmyJIxX10A9jyQD2JpAP+cT3ytOz5vJZseoGd+WTPEFKPyYiWEQZxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzafN6Ryel6x1eWkgS4fF7hc1Klt/dyfv65PQQpjQ0XJQrWWDTg
	F0rybPJ5wx34a7YlAlYTs8XnPm1DBnEbaytQEaqOzAKK8/199venuGEtg8KJoLoGgvTzuy538Nv
	QpDxbj8cp
X-Gm-Gg: Acq92OEcMceBjEtljfu8ixVOajsojjeLmzUAgZh/M3Xad9vfn6xMxq5tkU+xulby2Qw
	dcc/gE9wyO/DeTamULNo3iF83CxkYtJqWT3XwzXwykZT+lKIt/H65oAxB45DJzo2cd38a6PQKxV
	rAIG9B49m/+AHYoWlBARGcAZwt2Shz/heH2AEFKDnq6lrexqOBQnkNiDMYpTx0AXcK3QqCIhLAb
	j7m13WWvdoXF+uO3mWscn6d3FicbXOsnO9iyFmY1FZcrXsP51xUG4xW4OTB0PWNKljfzA87kNUg
	GTThU2hIC+NFtOKG8XpnE21mU40zsCPiJWLDsJpRDOKFjlCoYLfGsiSRVvB/ZW9aIk4mAB4kGcm
	n1cDnsFOWN1mxF0TuE8XtRdqDCSa8CMCu65txHwP0BwVZD1JgSP4XoMefhXvfCPxweA/vVRbOhH
	xYXPVHcqp6IKHPtdQR9ZLIohzehialEpuarJ56qmQnvI3WH/n6APXS9FGRTQ1650R/jzthoZNIP
	w==
X-Received: by 2002:a05:651c:41d8:b0:394:8fc:8c3d with SMTP id 38308e7fff4ca-3944af67cbdmr9578691fa.4.1778672968626;
        Wed, 13 May 2026 04:49:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm40971071fa.27.2026.05.13.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:49:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 11:49:22 +0000
Subject: [PATCH v3 3/6] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-uvc-hwtimestamp-v3-3-7a64838b0b02@chromium.org>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: A6D2D5328C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61407-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

In the initial version we set the min value to 250msec. Looks like
100msec can also provide a good value.

Now that we are at it, add a macro to make it cleaner.

Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 01dcb81d96fd..355b9bfb799e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
  * Clocks and timestamps
  */
 
+/*
+ * The accuracy of the hardware timestamping depends on having enough data to
+ * interpolate between the different clock domains. This value is sof cycles,
+ * this is, milliseconds.
+ */
+#define UVC_MIN_HW_TIMESTAMP_DIFF 100
+
 static inline ktime_t uvc_video_get_time(void)
 {
 	if (uvc_clock_param == CLOCK_MONOTONIC)
@@ -843,13 +850,13 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	 * buffer, but RAM is expensive these days, specially the infinitely
 	 * big.
 	 *
-	 * The value of 1/4th of a second was determined by running Android's
-	 * CTS on different devices.
+	 * The value of UVC_MIN_HW_TIMESTAMP_DIFF was determined by running
+	 * Android's CTS on different devices.
 	 *
-	 * dev_sof runs at 1KHz, and we have a fixed point precision of
-	 * 16 bits.
+	 * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
 	 */
-	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
+	if (clock->size != clock->count &&
+	    (y2 - y1) < (UVC_MIN_HW_TIMESTAMP_DIFF << 16))
 		goto done;
 
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
2.54.0.563.g4f69b47b94-goog



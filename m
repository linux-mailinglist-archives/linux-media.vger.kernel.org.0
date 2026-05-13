Return-Path: <linux-media+bounces-61409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNFrAPFlBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:52:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFB5328EC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E9C0310C786
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE7D406281;
	Wed, 13 May 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eStO93dL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB143FF8B7
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672974; cv=none; b=bdMdpXi2EY/3tWnNSvL09Wo2lWcfqz6KvGdYnLBXH8eYtGqjrqW+ZujR5ZAPKltZB3j6XcEgiu2JzMcdGVHRYmPVqrdekPywbPlWPdeclbhoLHW39JAaniCuHLJkG54ro4os2CocoXCoZ/sDeqBq8nqpFwK8xeieuRGMO+aR870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672974; c=relaxed/simple;
	bh=DCkjyOBWZRcHIA6nU//LVMUpl0tnorfSv5T3WpPg3Cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JY6DRiA/9G+6L8Du+nNsFc2BkJjlmWVsGx89K8VohdXlhvGSqL1s4vIIQTm6G8kQH9+1fjAkhmcDpU5oUiKlZrdGuwfD/iI/tTH8aIYGGJ7jRMVUqa6EqlJijNY8XKgFzhRyzLCppkZlXuL3XznJFGz8xxHXZuDChNXNpe3H2BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eStO93dL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8738c178dso4649248e87.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778672970; x=1779277770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXgj880JmBdfDZbOWn+8yzsEMqNo4ZRXvagLZHIR1MI=;
        b=eStO93dL7mEPrx6e8kdOboPp1SSB1O4XA3gv9fXC1YHeNWzR6ZIkbz34gYNJFuiDiU
         xUo2HsYIq+ZfvvvSOeY9qgv4yTafzsXn3O9MtJYu+X/iIhwfLknZStl+TYNkxtMIinGV
         yOL8oqd2UA6bhsXqj7ZKiJV6XqmBGrWl6/TsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672970; x=1779277770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXgj880JmBdfDZbOWn+8yzsEMqNo4ZRXvagLZHIR1MI=;
        b=ewfIhJsOO8H5K3myC9lpIZzzz5Csn5U2kNTzaFQisu5W1+b4Ttae0qH1kC6UtAaF/I
         hV8c21UZumlEczNS3l2eSt2M6Rfj8cGlA/cjWgKpEbnxm5Yjg/Kig/eIG160grfYoVaC
         S1XxVgslJoNCzpz+0jUHBrWczlM+ZLEXgaQQHw3pIFJVgdTgsgJC6NFnuT+NUIcOhh9k
         bHrlgLNPeeAZGhahpH4cY/lp2ELuuWt6c+PD9IGYvzdF9Elb3LLmV07EQFQqbStwpfWz
         insp0fIZ43AwS5Trpmp9PGc5pMyEhJomDcWbkYGKG2MI8T6pzHqtUB9AFQsaKRdFd314
         HRcA==
X-Forwarded-Encrypted: i=1; AFNElJ81Nk6ceaycBs1/ifwpGvO9/gwkXHpAfdwpYyLhOTKyzXB1rHuU9TKOfGDdgbfogJ+hvLJZJEXP/H9ETA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbrgNhcsPnF8AjOw6JuzreghoPDCtrWTUTkErDC/5WeU+3J/S
	iAz/foRM3K5VK+1521cIiRckaShEAoGM8mBBv0wWfsz8n6RBE3h8VMxPzONWSSvSYQ==
X-Gm-Gg: Acq92OHWxsAE4RhqBjW7FBfWidggKFaOBiZzUiFmvQF7AwpMZ+d63GRBn5tsxG9jZIN
	HCfTqTDKqNJJe7u9ehs82fC6gGpY9Cj6z7ks37wEkTuGstweJYcj3vEfuKKhgU+ym6Kq67//6lx
	N73LLPvey0vpmCZxKLF45SUD39Tu201BD8kdVVB4jsgBwM6pJ59EYmCUSwu2QkxhCZI7BpF0iV9
	pouHW7FVkjG3uJCSAeanFh/K5WKWi21It4hnCtQ6L75yufGzQcHudUHZw3ZA6xp9oVeD8iQ8ePu
	K7+/PVjygrF/vFOZOnebditUIFQYlQS2Ai+0QdMnqmfRzEb0cyYo8Oyutxm6b9ldwgdaceRdMDP
	kaUR8A5ftwW8/CEcm6bXPL5aFXUkgii1paUQ9yrMiw3LsGT2PSD6zHVV8TykI5LX1fnRME78BWA
	LxrleyXdwyEIeTgSlmXN+6T2N74i9+tFkbLWK/3A9wrD8I7cUPeJHB4C2C7rLRss/d6DOMCAV2E
	eVv30Q8JkIy
X-Received: by 2002:a05:6512:1086:b0:5a8:a201:f27f with SMTP id 2adb3069b0e04-5a8ef99abc8mr1223224e87.34.1778672970533;
        Wed, 13 May 2026 04:49:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm40971071fa.27.2026.05.13.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:49:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 11:49:24 +0000
Subject: [PATCH v3 5/6] media: uvcvideo: Do not add samples if dev_sof has
 not changed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-uvc-hwtimestamp-v3-5-7a64838b0b02@chromium.org>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 42FFB5328EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61409-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:mid,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

We only save relevant samples into the circular buffer. If the data is
very similar to the previous one, exit early, this allows us to avoid
some expensive operations such as usb_get_current_frame_number().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 63850b779e24..6794031cd0fb 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
+	if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
 		/*
 		 * Remove data from the circular buffer that is older than the
 		 * last SOF overflow. We only support one SOF overflow per
@@ -599,7 +599,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (!has_scr)
 		return;
 
-	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
+	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]) & 2047;
+	/* If the sample SOF is identical to the previous one, quit early. */
+	if (stream->clock.last_sof_raw == sample.dev_sof)
+		return;
+	stream->clock.last_sof_raw = sample.dev_sof;
+
 	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
 
 	/*
@@ -678,19 +683,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	 * all the data packets of the same frame contains the same SOF. In that
 	 * case only the first one will match the host_sof.
 	 */
-	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
+	if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
 	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
 	uvc_video_clock_add_sample(&stream->clock, &sample);
-	stream->clock.last_sof = sample.dev_sof;
+	stream->clock.last_sof_processed = sample.dev_sof;
 }
 
 static void uvc_video_clock_reset(struct uvc_clock *clock)
 {
 	clock->head = 0;
 	clock->count = 0;
-	clock->last_sof = -1;
+	clock->last_sof_processed = -1;
+	clock->last_sof_raw = -1;
 	clock->last_sof_overflow = -1;
 	clock->sof_offset = -1;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 4ba35727e954..b6bcee4a222f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -522,7 +522,8 @@ struct uvc_streaming {
 		unsigned int size;
 		unsigned int last_sof_overflow;
 
-		u16 last_sof;
+		u16 last_sof_processed;
+		u16 last_sof_raw;
 		u16 sof_offset;
 
 		u8 last_scr[6];

-- 
2.54.0.563.g4f69b47b94-goog



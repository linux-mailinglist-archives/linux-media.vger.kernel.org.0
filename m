Return-Path: <linux-media+bounces-62691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAByJJ9jE2of/gYAu9opvQ
	(envelope-from <linux-media+bounces-62691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CB5C4389
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAEE1300F7A4
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1B0333434;
	Sun, 24 May 2026 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nqgrh3PR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D561E555
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655570; cv=none; b=PHMYrfB7M+mICW59EI6OHXqUgl4jr4IFXxP9fAfxMvRmajZophR1mJu6UBsdouPbVJttLGOEPIJ16echQdlAH7XtcTFiuwhyixxS1j84U0cJz0oRM8GwILuc9Rpy19SggVZmQyqNygQu4GaGNE9Xi3PLlsWUzLNUlM0W2b0uXng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655570; c=relaxed/simple;
	bh=nLbGNUquuTxDNs6KGZ4Mu+s7hZ8Us3f1vpxwNbU2M7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbZmDwYnaJTIXqPaaw1C5G3nURMp3tzD6x/ZB3XqM8SFf3F+VNjlq7iNhAOa5hxMJgdYZTVg3EPg52kpDnCfyxOCCVVT1iNPYG7YrOBgDKyVwMuIWGZjEh1TJGweLfXbmR/annPsKtMTHxJyOgF/iW5yJdP9FF/lMIJb0C9vc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nqgrh3PR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49050bfe053so15514165e9.3
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655568; x=1780260368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeIpuMJ+03Ky1SEliE0xHMO+6I116HGvNeqXrJ7rydc=;
        b=Nqgrh3PRCLqSJvMHEoS16Cj/CzZYJVZNy88WDLeyEPWv8GY3+Ku2/HPdnWbS97Z0nQ
         yRTIA2OAbaqcJcdbkTRRnrL89H6yfPpgCYxfvQlCsiv6v6m2cTw8LyHnWuEXd78RNoy3
         hfWYwoZUkcfDKVEC0fyH0TI4LyUx8VgRoxWCo9cAiecLR0g+b4fhCDWRbiV92nAnxBvM
         H2MSPv3hYDWG4bR0Io4hRmywvZG96gdGT8k9w3JgQ+uDR3y9fZ+xnqZKB12ks/MvhKxi
         SYeuBMeiPbnGANzXiQxl333qAnY2RICG7Dp47ZXVQV/BJ9RMTCf+nZOE2v9aNl/l9DRy
         44yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655568; x=1780260368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FeIpuMJ+03Ky1SEliE0xHMO+6I116HGvNeqXrJ7rydc=;
        b=bX7eptOmkTVDa9ZT6cWnZRzgXmF57vGHkXhnAiGLt3+2oKJxqVV9IBxj71l6R0Cxfp
         6zn7UcFGEYgKnmiqh0whSI9TX/vGhlHI+DtNvePrtD4yBHDY2GJsGUtBVcN8fGsPuKsX
         jG1En3g60hDgCEWVxr236BHVhBRmRXHXNaJUDmpTUFiXTi0WGPB78XoNSoLPwkj0A1wp
         3XefN5jWEJdkF7y+SYu7XEuUUdLg+lpOI9zUk0TKP278bByGkL3aMcLUmjA8jJUVsHCx
         irPAVozX/pelE9E76UKoTrJAENBye6IB2ppETeH9/eqqKfVQQ4Dlki2mzKTS2c7RI8bC
         fW/w==
X-Gm-Message-State: AOJu0YxndaW/HCfzPi6gylk7PJj7m18ic7iJM1afeGvQlvLZU6cHhEYb
	GaBifdoz31N5VkVjwGVQ3YO+GoIhpfrPpiIsFqvhpFOkseiRgjxFH1MR3ytKxg==
X-Gm-Gg: Acq92OHRKCWtbiP4DdlrnvAUPC97r7cl4u6eEV8fIWa0JBTW6FiiKZWXMrj76lBk+nZ
	El3PlMf+mPMC6uHER86Nj8o0Mz/d7p9Dh9yUbaNPT40x4PHk9RMTIwPs8lax4TCIeojJEskXSdA
	NK+i2HjrNGwgqSWaitM7MfJiGG7y7KndZ2v8d5mYZ+wUwbUEKkukB5/AeBLkoeRU5WF56/8KNdn
	tPeWfElnxJs3mW4xNvASO3FfF7gW656EbxvmMINuIvKo46ELPDU/fN6rjHj5CxnFzGTiY0ECgj2
	oxGM/D0sO7bRO6FAaiByWaILDg9ygRpShcFinXimV2OJY1dIwW2YtNAFNQuy+w8SbPNDRNTcWBs
	jajcgw5Qt6g6d7KHqzvXezuzB1r3UGOqlcUVvjFqbe8TqHsQaAQZInb0mTU5ncifQ+4FQevEUy0
	0hh1Z3zryw7to1ugai63s8R1OJcBzGTlXNdFCcFwltvOf2s1qCI1vIibjORVyW05GqEfPTEFUj0
	g==
X-Received: by 2002:a05:600c:a402:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-490426d1a91mr137589135e9.19.1779655567824;
        Sun, 24 May 2026 13:46:07 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm208148865e9.12.2026.05.24.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:46:07 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 2/2] Fix expected length calculation using bytesperline
Date: Sun, 24 May 2026 23:44:00 +0300
Message-ID: <20260524204400.8287-3-sarah556726@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62691-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 431CB5C4389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current implementation of get_expected_length_trace() assumes that the stride is equal to the image width, which can lead to incorrect buffer size calculations when padding is present.
Fix this by using the bytesperline value provided by the driver instead of width when computing the expected buffer length.
Keep the existing format-specific logic for formats such as NV12 and YUV420 unchanged, but base the calculation on the actual stride.
This addresses the TODO comment regarding incorrect assumptions about stride handling.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 utils/v4l2-tracer/trace-helper.cpp | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 6c296dbf..a56e2d02 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -233,12 +233,7 @@ void print_buffers_trace(void)
 
 unsigned get_expected_length_trace()
 {
-	/*
-	 * TODO: this assumes that the stride is equal to the real width and that the
-	 * padding follows the end of the chroma plane. It could be improved by
-	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
-	 */
-	unsigned expected_length = ctx_trace.width * ctx_trace.height;
+	unsigned expected_length = ctx_trace.plane_bytesperline[0] * ctx_trace.height;
 	if (ctx_trace.pixelformat == V4L2_PIX_FMT_NV12 || ctx_trace.pixelformat == V4L2_PIX_FMT_YUV420) {
 		expected_length *= 3;
 		expected_length /= 2;
-- 
2.43.0



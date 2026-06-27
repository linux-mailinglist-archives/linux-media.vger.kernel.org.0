Return-Path: <linux-media+bounces-65795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48awGSuuP2r7WgkAu9opvQ
	(envelope-from <linux-media+bounces-65795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:04:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE656D1CEB
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:04:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=0sec.ai header.s=google header.b=NL7M+0Kt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65795-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65795-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D20B30234C3
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A7D3ACA7E;
	Sat, 27 Jun 2026 11:04:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F923BD1B
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 11:03:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782558241; cv=none; b=u+xyDE8YMQaGh7GCnja4AhZuqZ7ygP0kfCAy25rFLeiyep2ANA8NYNvQbG8iTpOERJwrZhSYo5mCXQKNa2EEOtW+VeqR90cqSZIy0mXCV9kg6Qs25ev2BahDnXuJmSB0MqcHttkPNJMBucjgtMbrnPEm+cOQ2y2m9yCZgc0NVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782558241; c=relaxed/simple;
	bh=TSh4dcKfnWaDtBFTEgrD5cxFrEKGsq1lUwd6DdkSMwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcK8SE+zy/87rym5OYEdgcn51eVJJhkuH3ffhb4OOQ2Nbq7ri1iOQOmZ+i5g21A70gfcy8n1qEcFRWbBWz9cC4cXKh8xPBQebOiytG+xbDytPuQLscasuuFWq9Cse5WQOxDI+lcSGpOkEf6gWlZJDXxh4dpuGqEFdlNbXiWi5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=NL7M+0Kt; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46ed4f66256so1535912f8f.3
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782558238; x=1783163038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnR6fISR5OFFfaQoxjn4A8je6s9oxTo0vTn7EXK+LZU=;
        b=NL7M+0Ktlhwy8tEwYXwZlGsLvVMJnen5WQNHeomqZYXRKiQiC8uo4//jE7WamVyd1X
         3cb8BfTnJXElIkM6l31FgBufAG+9vIJVy9N6XaRRbZJ/wkU3/d5zEp0Y3o7MSRSzKS7q
         2kn1GwXaprnkKQFOhhDrUfLt8O1HTU4fycTREzQTXMB7E/mFfADXxoQzLZkl4qWy1XS+
         kOU6TGJY3/iQ3nRar4SQkgDDE2VdjBhCYFiCTSw4MC+5MePkdDEPTi3cVmnKprwNsA3i
         byCY23y6vvobPeM50ouUG2lkhm2ErIMJ8zR0M+n5MNiocaP4zWh+D8MlODuGjOzTy/WA
         KXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782558238; x=1783163038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnR6fISR5OFFfaQoxjn4A8je6s9oxTo0vTn7EXK+LZU=;
        b=aqxO6No5dZrZTm764OntS/NL10zgukLtU+jnU/NPF0GgcHH6ltVd82mXa6HmPMb99x
         TcetimxwFNYjLTAPmHIxoNDOFsQx42fRnsKcLv2vSqaaBbvvlQVgRDqYf95vIL6+BEEE
         7paOqSldwRVeTaEWQna+cIuvF+Jj8TewZA5Y2pSw+bvwZ9vQ3nbV6vSGbPf529T/7XAd
         9FMKZXpexDtrznEAcsabEr9GhLHxuLxGvG4xO3Lu8/NOTtls2lFKf3m6QANXt2SX2wX2
         5Y8icdk5PU83L2YaEV7pKV6+sHuyvyOH/pwS6L8btDA1Wtc/ts3+SQJWhybDXN4UQZji
         yUtw==
X-Forwarded-Encrypted: i=1; AFNElJ9dwRMMzCx/M91rHYLP2BMPP3ickrAHreYsCPqo+iZV1RXjGCaoPw3gacQX0ObnFcUg21xMOYLFoMOPKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1f120fOU3JR/ZGIS6T7bhtu6HkFBpk/yfIG1pJC8hTvmowiua
	bcDKW95bNBf8/PY88UC2hfRm0T7deshXCEA0ncUoiexTlGny3Gi6bnCjn8OvKxqDTLSz
X-Gm-Gg: AfdE7cn/O7edlAIYNw2yObGGElOKkdYe+ptS1H07yiD4x1/Qxftranh4YfqXDB3VvMh
	16o86YqELHG9XMrwbZrN2Ju7XvJRqP9T8ox3XiivHKOzllbMlaXBN1X0tqURLIrzVgVLkICVgVv
	ExkqVmQvrMbjj5o5sFdJYWWkajFANbgHAdcVJRENoBXCqadnv4BLSIlH90xZvzHAFvAEw4un8Ll
	TYhNweXGyr2k/Imt9Ua94sCtHQat1uYjo0uvsDjDnGpJ693m81zZeroEkquvDPvTyCFeOG7sn8S
	Db7sMQqiOccsxkG7sHWakmOhFEQA2ccqlc0Ke9AsZZ/hLZtOwk8yl0/3TEmQ2WMPMil1Mtfim+2
	9WJB7o8iu9ud2EEuDzd6HRg9dHAIxU0C+unmP02y3TFOG1So9RX7ui6eSqlh7GtYyu2EQb2RVr2
	KUXbUpDbYKMV6lN1nrIgn8l65XxbLqYw1pNk+USeQVZFAPfxTQFtg3/yZ0aeu3v6DJSDcraI7nB
	yOQV+6q22NX6vfnEGAUFI0IGH4/4r607PsapNUiZErWeg==
X-Received: by 2002:a05:600c:3552:b0:492:700b:deea with SMTP id 5b1f17b1804b1-492700bdef5mr67123065e9.13.1782558237833;
        Sat, 27 Jun 2026 04:03:57 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0d36sm243869495e9.2.2026.06.27.04.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 04:03:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: atomisp: reject frame dimensions that overflow the size calculation
Date: Sat, 27 Jun 2026 13:03:55 +0200
Message-ID: <20260627110355.27167-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[0sec.ai:s=google];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65795-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	DMARC_NA(0.00)[0sec.ai];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:mid,0sec.ai:email,0sec.ai:url,0sec.ai:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDE656D1CEB

ia_css_frame_allocate() computes frame->data_bytes (a u32) in the
frame_init_*_planes() helpers as width/padded_width * height *
bytes-per-pixel * plane-count, using plain unsigned arithmetic with no
overflow check, and then hands the result to hmm_alloc(). A large
width/height pair wraps the u32, so hmm_alloc() returns an undersized
buffer that a subsequent copy can overflow.

Reject up front, in ia_css_frame_allocate() (which already returns
-EINVAL for bad arguments), any dimensions whose worst-case byte count
cannot be represented in the u32 data_bytes field. The factor 16
conservatively bounds the largest per-pixel multiplier across all
supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
per element).

The most directly user-influenced caller,
atomisp_v4l2_framebuffer_to_css_frame() (S_ISP_FPN_TABLE), is currently
gated off by 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all
private IOCTLs"), and other callers pass driver-derived dimensions, so
this is defense-in-depth on the shared allocator rather than a live
userspace overflow.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel atomisp
hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..f34135683d32 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/math.h>
+#include <linux/overflow.h>
 
 #include "assert_support.h"
 #include "atomisp_internal.h"
@@ -106,10 +107,15 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 				      unsigned int raw_bit_depth)
 {
 	int err = 0;
+	u32 bytes;
 
 	if (!frame || width == 0 || height == 0)
 		return -EINVAL;
 
+	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
+	    check_mul_overflow(bytes, 16u, &bytes))
+		return -EINVAL;
+
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
 			    width, height, format, padded_width, raw_bit_depth);
-- 
2.53.0



Return-Path: <linux-media+bounces-59529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEuqLKRq62kcMwAAu9opvQ
	(envelope-from <linux-media+bounces-59529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:05:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228245ED4E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C57D301DEED
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EEA3C3C13;
	Fri, 24 Apr 2026 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngnHd2FS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17981A682E
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035888; cv=none; b=t+OUVgk8+y4B/UsB/JzUE3WOM6uFtp7NiTIjCKBNwPr89Xlob2ECI6cJwrqvtY2Ewhj6eBJ5H0fbnCTFWiPey1ox6MQRpXqcQiJ2Sc+N7cVqtcv53WFrL3puACA44GtdArI7QOT6CzyACbXMCbHeFtNxJhVWxuC8Afspj70ptYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035888; c=relaxed/simple;
	bh=sUhARkVV6WLuVK6uPJiiX5weqFRNg5lAxGuewHw1t0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q61JnxY/7TF/LiZ12iKaugA0VxrkVxCfQd3MCS0+UUkIz90tro4gd7CBTyBj2JpHXQZwZsTxiD2723L67IO7w0Uf0bUkSdSQs1CEOvoddnK52NxmA4Dz92EPLaqZNMVcys2BDdY57JtdGWqSIu4+3zV2nb5jH132XbypKH9ba2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngnHd2FS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso6244434a91.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777035887; x=1777640687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7K+Nhaj6x5Daa8GmE0tApiYThiT0TvOLB3gffHvOj0=;
        b=ngnHd2FSrHUnTjl0jd0LCzjgjUAx+rPgP7RePCtMJmw+dZFpOLETKQOXKquwS2Ye4F
         Qb5IVrY46vqWsa8RQmfJzWz6yItue+Q9O0udyhYJJt7zkKJQUq9ADhG9C3BkKv+PVEKL
         oIxFIVedKbG8l+/rFMEAj5Ck0u62ebTIYwFUvnpgc9aN5byhyllCkdtjuRGA2SLTgcBp
         aBJRSMHE7cOc8lFclUwIWyKtmxHI1nngPfiIVfk2MxM9xfl+Z5uNGwgrad/mv0Z0R0fw
         apgK/FG0P9ukz9RvxjxfPF6s5o0QLsX7RIA/i5G/B32ljY86tGXOHnAHPUVF1JdOqnd/
         Hw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035887; x=1777640687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7K+Nhaj6x5Daa8GmE0tApiYThiT0TvOLB3gffHvOj0=;
        b=a1bG7cHCrOylyASBzaaFlXyoBeVd4HM8fO/dHLCy5IerdtcV0yDd+GISMe281W5Hsz
         Soa8nzRLuGDkN0jmHz+IhTw59imNV2YS48GtLOnLMqpRJGKJ98xgdaIhfwxPPDbbEjiA
         9Gbx5rV7XGBFI0ZNtsD5z0OdqDEdFqa3bGO9bfHt9nKeIjY5iM9uuV7Yl/DMsX4ON1Sj
         d9hSqoY8kJWJs3j9+oRhWDF8sG3vnR1jr9LEIomuV7MBPtUMZfH4lUZklh1y4X5yXrbn
         yB1Wl/yl4hFv+J9Jm1p5KUb17RnbzUFFOuwoLylS4YmIH6h5SJ6k7BRSXjOJk9gJ65uc
         4KyA==
X-Forwarded-Encrypted: i=1; AFNElJ+O46aLZ4rBGrrfXsZyQWVGdlFDZi22NV4ngWeGNBQ8O8ZqlcWkwc2BkLjhGJdQqmcC7ifu2lB+johA6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzVUaeDO7zDf6+a+t0rTAIgnvDLkZffMI3kXqYqD2sPCiFc8nK
	fAYzi9iiSC7iVCxRpIPsVNB5oYaWPfyxblxBXH2W8W0lsGzHl5sn+mYH
X-Gm-Gg: AeBDievo1/mImyYXdZ6dI+SQ/hus1E6zS/g4PvL+0EIW4ig/ZhO6ISfFZ97v8k45K0Y
	pMu9ub+9pZoIyEQXsHhPxTd2T1ba7eNNS/3obSwDBTtYh1NUtpq8LNcXi8jsMQCkUgNfjYkEY/9
	sjeTvcj5kz3ientPpBMWI+g7d+DbP2rp/8+btR/niBgeG3152xKh4FjP6R9v4F/Ot4Nah9yikc1
	jl6qZnhNPZN3DUO+C0TBMI/nd0lh8UH71UttRYCwD7rAxiFS8rLPAukcN3gHnljB3bVUkUQpkWX
	IcOiqsOqhVMqDRB/mAd6ZKXHafy+D/jo64UGOa030tAH8FSoVNO4iGde4WBd7zaz49DU/jKdStA
	tPWWIgXauQXhr83xjr5SjXU5bJZ80m2pmvYYXe664ZjSUi3NE52wNmEISx+btq0475y+LVOsjzy
	5HOCaKewqCUfY2Aw3bHPPhrIBA3Zvm1DQx5D5sAV9FhX8lAy8g/hnA
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-361403d61camr31590648a91.3.1777035886857;
        Fri, 24 Apr 2026 06:04:46 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm8517285a91.11.2026.04.24.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:04:46 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v6] media: atomisp: Remove unimplemented DPCM decompression
Date: Fri, 24 Apr 2026 18:34:28 +0530
Message-ID: <20260424130428.27019-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
References: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3228245ED4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59529-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url]

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. The rest of the driver does not support DPCM decompression,
so remove all DPCM-related dead code:

- Remove the FIXME comment in atomisp_csi2.c
- Remove atomisp_subdev_uncompressed_code() function
- Remove atomisp_subdev_is_compressed() function
- Remove atomisp_find_in_fmt_conv_compressed() declaration
- Remove compressed_codes[] array from atomisp_subdev.c

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v6:
- Squashed into a single patch and removed comment in atomisp_csi2.c

v5:
- Rebased onto linuxtv.org/sailus/media_tree.git

v4:
- Complete removal of DPCM decompression attempt
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  1 -
 .../media/atomisp/pci/atomisp_subdev.c        | 33 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 --
 3 files changed, 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..d15e607784e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,7 +107,6 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
 	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
 						  CSI2_PAD_SINK);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..07189230c308 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -51,39 +51,6 @@ const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
 	{}
 };
 
-static const struct {
-	u32 code;
-	u32 compressed;
-} compressed_codes[] = {
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
-};
-
-u32 atomisp_subdev_uncompressed_code(u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(compressed_codes); i++)
-		if (code == compressed_codes[i].compressed)
-			return compressed_codes[i].code;
-
-	return code;
-}
-
-bool atomisp_subdev_is_compressed(u32 code)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (code == atomisp_in_fmt_conv[i].code)
-			return atomisp_in_fmt_conv[i].bpp !=
-			       atomisp_in_fmt_conv[i].depth;
-
-	return false;
-}
-
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 {
 	int i;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be3f2..b399319ae2c9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -296,8 +296,6 @@ struct atomisp_sub_device {
 
 extern const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[];
 
-u32 atomisp_subdev_uncompressed_code(u32 code);
-bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
 /* ISP2400 */
@@ -309,7 +307,6 @@ const struct atomisp_in_fmt_conv
 *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
 	atomisp_in_fmt);
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 
 /* Get pointer to appropriate format */
-- 
2.53.0



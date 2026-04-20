Return-Path: <linux-media+bounces-59111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0e7zKned5WnLmAEAu9opvQ
	(envelope-from <linux-media+bounces-59111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 05:28:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4664268E0
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 05:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27BE73006781
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 03:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6544137FF50;
	Mon, 20 Apr 2026 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdXscuaw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60F377544
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 03:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776655731; cv=none; b=AInw/dRybvpjOsA1G9Q5pharben6G6Ut6obguIlryBjIJE0bD2HwXwbt13UwMFjry6Vd6XKQ4h3xaOxJng9w/yx4LlV0z/tyHpFf5/OEYjuhTMjLWI8KBQrolMqD1t+Z8b2E+6NyDYt02bRHuwclGo1ay7ashSor545n6WyCQbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776655731; c=relaxed/simple;
	bh=8RyeZRkPocpu3XADaSYHtDJkP24aI8UpoYQwth7E5PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAQ+Svkvf5gpBlfWqSUxKoAgD3mXhcKOlobnNQyamMj0e9xyjysAbeDb52Hy9fFALLD/YvQQ6blDBml4C7s1GPvj0VKkIOudiPeFwFVgucVTfoKgtZSsnrjSh37E61Fzj4OMDfVDDuROjYy24X9oIJcMAJZkzG8QFOMYYvgYG4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdXscuaw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso1743686b3a.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 20:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776655730; x=1777260530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RziaJ6zqK2RvwU0310ZyP1dPnpTZQW8g+PDO4r27y7g=;
        b=CdXscuawV4nNU8H6qrmPOahGiEkrdiBL4AKT17WeB+HWrJUUA4KVOKpkr3aoiTJXXl
         Exo/D6OydT1r9wbW7CQ5jSTHzHFrjPZmqY4Hyjfh6ic0ECffcLT83SbQXbxcA9DwseUa
         Ru6H8QppjpDOVGGZ7Vm6LzbAVQwhP/QTXz8o/pt66/TJmnHk2ekLKqild8H34Dx2iJNj
         2ZIz22Rbsh0+x77tHCDtg2JjuTrYK/bgaF9Xn8Z8N9NAs/bcV5hQ3JoCJeRJE1l09MJx
         p/wvj9ROyQFvoCKm5maB8MzFq2vVwA6BkjI9i9jFLqeScX5lR2VDKtnQm3AVmAcTnXGE
         T8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776655730; x=1777260530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RziaJ6zqK2RvwU0310ZyP1dPnpTZQW8g+PDO4r27y7g=;
        b=Y/FQSuhC0vKLkty8UfqEwZAF2gdDVQa5kFNYt1lagvz8Hlk/l172bx1w+CxOVs7npR
         Cs0rFgNo50DTjaNqSgC79cDAPB7ZsMsJZOCr2zHn3aXkCgoPEvsSClu/VTQWhhMn4mqQ
         6GMCmL1pDLP6WPlKJibtrmFhzcBP1qz6ZPa9Gi69JPlyCnyLyAe+zRU9owWux7UTCCGN
         l/HJTmjnhEeNAkoMqyMMrfoyrsqmvBXzrYtAXlhoduNG+uUlAdWZBYAeJjfZVtJQamxI
         nPPA0yTA3gPr/pB78C//yDonsFg8zpEYO4PE/piWZFeoGpR2yEld9n+8JJpY0WyIcZ56
         ByPg==
X-Forwarded-Encrypted: i=1; AFNElJ8MLCH7S8WwSblzLlR4S2jSt9wAW2nsuDIqNxN8CjIoyWGeyG9QszXSq7QeFIEOCv/Eb0CDoOEOxVbtgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuIrIEAHR/lYMWrJtPRimEHsUbB5JNoVGdXOmoic8GWugmA0Wt
	1noJ1iFF3WpZNjI9ve17T9fLS6YcNMj1Es5d47k+HX4uADRKC78TsfOr
X-Gm-Gg: AeBDieuEuVx7+aN1po+QmMSJ852PL7YwO7g5jnAqkj9BFylcCiOpl7WyBPXvcNuW3oU
	NR7gSNvQROslIx4aQYuW9eWg4WW/JdkAN3hX4JXZDnUjPqTnlopbFql8p4kxicWtnnXz3h2YIIH
	nbwiCeeJIW83+g/cugTB37LCs6rqXjSbnGmw+Z+iY5fw6yxeyPhm4MYRr0dxoJK+qm0OjvTZRc2
	O4T6hb96tE7OUb3IInQL7gu/XJZZRdBvxRFPzrcPK6nqBF4LSIjG67jIsXGgnXInv/aovMP4YRx
	b/xlWRaWepVlQ5o/8pt/K0QhVofo4UWPi9eaDaF4ltqsrmjdzmy+ozALVkXoqV88HYknqL+xjJQ
	LqQiPCsAqCY7K6d00Cg/zcQhI2oGo/8g28af0LQ2dR8fQtdPukWeSgOCRAsQlHn6YSh8irg0HP4
	0kdUm4a7pep9iBKQZBqHrzabKC8LTxT9kBxmBgGazsm65q4BI0yF5u
X-Received: by 2002:a05:6a00:3695:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82f8c3dac2dmr11526854b3a.0.1776655730045;
        Sun, 19 Apr 2026 20:28:50 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981829sm10537865b3a.12.2026.04.19.20.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:28:49 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	debjeetbanerjee48@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	inux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Mon, 20 Apr 2026 08:57:01 +0530
Message-ID: <20260420032701.33250-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-59111-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C4664268E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. This was marked with a FIXME comment.

When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
before passing it to the ISP pipeline. Therefore the source pad must
expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
the compressed one.

atomisp_subdev_uncompressed_code() already implements this mapping via
the compressed_codes[] table in atomisp_subdev.c, which pairs each
DPCM mbus code with its uncompressed counterpart. For codes that are not
DPCM-compressed, the function returns the code unchanged, so this change
is a no-op for all non-DPCM formats.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..484765b0d9e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-     /* FIXME: DPCM decompression */
-     *actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
-                 CSI2_PAD_SINK);
-    
+    /*
+     * The source pad must expose the uncompressed format even when the sink
+     * pad receives DPCM-compressed data. The hardware decompresses DPCM
+     * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
+     * so propagate the sink format but map the mbus code to its uncompressed
+     * equivalent. atomisp_subdev_uncompressed_code() returns the code
+     * unchanged for formats that are not DPCM-compressed.
+     */
+    *actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
+    actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
+    *ffmt = *actual_ffmt;
      return 0;
   }
 
-- 
2.53.0



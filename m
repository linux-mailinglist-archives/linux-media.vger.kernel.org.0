Return-Path: <linux-media+bounces-65221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYeGGwkLNGqoLwYAu9opvQ
	(envelope-from <linux-media+bounces-65221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:13:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDEE6A124C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XlZkrhqM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65221-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65221-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 953DA3045470
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E773F54AB;
	Thu, 18 Jun 2026 15:13:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6CA3F39C4
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:13:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795589; cv=none; b=nuO4FPMhXRYoMIv9/xhIkclyEBX6opXbTSHPpIuWetSWAlnfFfvbC5V+Jn8a0py0KUf0nGu1/+9Ple1biwutKch5KU971KMXZQpHbaB7YW16tYVGCA2QIL/b0ssfXBwkDE06aPlOodUx5X8KY6mfChMwA6yLaeq1+YVqpagSzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795589; c=relaxed/simple;
	bh=t3LaCYvGa1J0W8y9SDLscTANfvqgNL6GUOc3eE8EHDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNIWy98wpo4FVVKm3jZycmdkfahwRw748AY1brasluMsdn20w4DmCCnDxMpiEHhwZs2FXY/KPy75LwsPxxzbOSxBsCtcFpM2hqWbpW/BOptljjYcYS6FpjYkcu53p3pPEFRI4MeCx0jVm5ZCKz1o4UcUs24bRVehay/mOIsOaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlZkrhqM; arc=none smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39972d9a66fso11534351fa.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795587; x=1782400387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE63r6EER7alhbSLAaD+Ak+nUquf6xxaUXbDMVJJIMc=;
        b=XlZkrhqMhB0uVmugg9EUSqE9WmtL/4S91KKFjJ/QgUgGt2+1j797KWmUgA5AZ8xlnK
         9OYcfjMvNdsg9CyHAmH1me6Zsx5YPUcZUsYSxlVo2DRxlgV/f5aWLf8mmuk9lzHgl2id
         +9L70z83xD/VwBuWojK/7HjEet9BV8SD0WRzrueNGLZTCVsmYdB6X8xIevenqyg+UYVw
         qpkqh0m7jDf6zt4Me+XRVa9sxuXY+C8ZZQEGQeSdg2HVfizilX2KE/9ERtoCSNMZol/D
         6unWrlBO34+lK3bxjePNJFHnmGdsDxUCZz5FaZWOlnMbi6dm7xLT3Namyrui7CRR/aX9
         zegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795587; x=1782400387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wE63r6EER7alhbSLAaD+Ak+nUquf6xxaUXbDMVJJIMc=;
        b=bd1kGCRXTWh66xmq9DoKQVB40Oc6SDccx40HIizZmGRXAY2ZNOsXMgzyacwQ2HAB6e
         LgSXGMubq57B2ns4R72HaaXtKNHsCBzpUzKQTiWzh2iBG8WU2+BWvuJNpZDjXIrrmQzE
         9+VG+Iant5secKG8SBMr9ZDcgisIY7YZpkNLrcj54rdX71lnM6Vkx1W182F2SX6HBaVN
         allk1vTbLaDhdQGwflHSPGkDtpSWQPN+EpWxF8Wg9Hc5lTN+Ka/SA/gWXYIrioBWMJQt
         8LocB0D5Nb9A0oz7cabXn5xs/Emx8ovDqu2A3GINIVQRL7ckNvm1P6xkPA5MKl8vHnkm
         RPcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bi9sFYIaQSskyPq+BIUu0sHspoyaip4uNHmnH43KWO797HstxfqCuV17vr9uQnV0CJPKEaRg2dbYpiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxjFq/o6GuV/1r1OOLvNqCa4gjE5v935UJFc/E0T5MG3nth9Uj
	sSIpjr5bxwP5QZpNoFuzV+02RbOYhsB3NqYQPq8TstbYLdJ0WokzbGEG
X-Gm-Gg: AfdE7cnLzmQgn4hpfy3vrl9quobkjETVtDdW8x6cGqi4WsX/0IXPVtojK8NIAiVDbuQ
	vh1QRKVruKLuzw8RzWC+viqtNypDXtS/RgdiURMMrugxLblmp8poPksI4vl6Wm4ygQkokHTwUHq
	IwwaYucdswY2BAe3Lnhe31WvIVSOvD8qQjWhIGJ9bZN7ZK/fLFwYIRKjMjN0wJZ5YUzBZ3604jQ
	VwQzWll7iTPZVqVu/4mbEvFX+CYKHZQNAV3gZj+lG7+HKGRzZO1/6lJOG3h/4Zt7h9PjaWzh5dx
	BDJkG4toi4dDoxSPIO2MdteGT3Pllx7yNSBPehZZtkOmPovLpWMBTM4Kcev5XzxOH9CjzY0u1CM
	TUYcTkoSVIkjDOOq+T9QVUd6dcRi8NSI9s3zgO79eXj6ricXLlbGoXEggcjH36GDcPCaSH0NPHl
	GQH7lFAhXONsmCGrMgVNPC9EcioPfrQDanczry7HXO35AHFhCcTzh8fQc3UmxGdFfLXb+BLCJde
	tiWwAVr5NQ=
X-Received: by 2002:a2e:be14:0:b0:394:378:b53c with SMTP id 38308e7fff4ca-3997783eb06mr12943281fa.29.1781795586492;
        Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 3/3] staging: media: atomisp: remove dead platform_support.h header file
Date: Thu, 18 Jun 2026 18:12:46 +0300
Message-Id: <20260618151246.6678-4-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65221-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DDEE6A124C

Remove the platform_support.h header file completely as it is no longer
used anywhere in the driver and its contents are obsolete.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../hive_isp_css_include/platform_support.h   | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
deleted file mode 100644
index 473d8d4fb9ba..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __PLATFORM_SUPPORT_H_INCLUDED__
-#define __PLATFORM_SUPPORT_H_INCLUDED__
-
-/**
-* @file
-* Platform specific includes and functionality.
-*/
-
-#include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-
-#define UINT16_MAX USHRT_MAX
-#define UINT32_MAX UINT_MAX
-#define UCHAR_MAX  (255)
-
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
-
-#endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1



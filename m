Return-Path: <linux-media+bounces-56912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLrEIbfpwmkOnQQAu9opvQ
	(envelope-from <linux-media+bounces-56912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:44:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C5831BB58
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15695304AD28
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FE83845CE;
	Tue, 24 Mar 2026 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyVPsxB1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D063A341ACA
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381452; cv=none; b=usnPB3IOeGjkzOrUJREajzyXtiMLrljGk1kh1w+mx4CCkdJPtX1BHJ8OWDyyzkg3ffh/SNPS6CShXdxKMeRUAOXxesuafZ/dH8ACF0rpdr0u4d6vUt42eTDrrdxLK67JxCqPOR4GXr17ZRcpXmcI1CnNDW4z2KSWwCHHUChYrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381452; c=relaxed/simple;
	bh=Cr1EGRtFDNYN4F0ds66Cj+wQr7wmiUbs4gw2kBIuGys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXQahv3u7QKmuo6CbqVLCCO5/OmnCbsozY5jn0l8oAUTikkzfE3j/Y581gOgsCLdqjqJY3w4sXPHTxLoLb7jhNU5OU1Mzr8mJ842S0vOR82213pD2jHYfzJkLBKVJ2no4HNoAh405gVu/6laarQAnNo7aXQeQqOwhUql98GB/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyVPsxB1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a871daa98fso35863255ad.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774381449; x=1774986249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x91fosFnDqLtUvCrhnAf87G3z2o0B5MR3jt+r9NyeJY=;
        b=CyVPsxB1GWaZvCfWv0LwOo2fCzvgDF+PZDmptu70MUycdD4pSe5CeQkj+9+vItIRTK
         OSZMiqyK/9EWfAuSRuKyhB+gRwCWEmbO+hLCRGT4bb03OhB15XxSrVH/6AHlQESo+vas
         f1TT0PJBFdDzCmVNP0IUvsK0lAyN9rtq4hnVZi0jBkaYLHA607BlK+yehFaFk46HD1N+
         lS0x3tFdNhAWeXFwvwVmQETiKUgC6nt2g4jxS5wqpfwXQajthh8ZiyLwJvltNl8/buCa
         IbPwtZv44lXoZlxKa5tsON6HmJY9Dl5pn7FYw8KixLTlscHsG8vpuhC6/wUKV8Gjvy+x
         N/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774381449; x=1774986249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x91fosFnDqLtUvCrhnAf87G3z2o0B5MR3jt+r9NyeJY=;
        b=clU3kSVNKLZB6aY7t7hzRy6eCFZm8A/iFfF32KXctvIsbONW8QGykEOQLzGSQOMEoI
         1Myi90hTBK9zosxoXlZI26zVZ5egGztliJhcwP8gx3HXtDPNBTO3PSkSEJomEmwz0amr
         D/d1SVvFLQLgJv4ufabHzRW1iEWF1i3+K+PtWdYSmpJmx8H3MfgMU3ellnaVrVSpKLCI
         pF8FPCBiNzOAp3/AAl4Ga15HZiYKEafT2RHo4YurdjsCGBxAGR6Z9z25MrJ1QRS7UGPD
         Q1Z/GJz71hFBjX9dgMCjRhXqI7vPnEWdIDKA0zPTMd5o4lIc/fR5YjTKVnYd7Pa+TMlu
         5eeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW31Y+a+JY0VQmK50xYbuND3m0b+dqTBh6QW4sd1F4QTZ9ysOPx0U4WTd/rHhoiF7/3OyGXmzbMUJNBrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7oeYEzUap8H2goa9XDukcQEd/8MgwIlb0mGl2rIT0ATEQ015
	RkkQtNso5hbG1qZ2CcxufZNMhh5Y+ry6NdspoEEwc2mwatIWg+7fHoiw
X-Gm-Gg: ATEYQzwQq0zRgEgh9WfWqrcJhBjw17GhloaK9BHoSsbveKksZy4GMT1B+Zq6eUFTw91
	YGV/KSxpntEm9iOfIwU+jScOznNnMQm+Mwc2S4FVJgz4WSuEXPllOskY7OvqL66kBGJP+P9P80p
	G3pHA27b5a+QPOW1h6zqvlEFchsY0AbWgzoQFhLe3MQ8F1YakXxLyhGJwtmHGlw2XpwJRls4aaf
	P7V0Ep5u3Ym26ymsSu1GweHW5TkzGzD41Cbq3C9aSI1FW91fR8uC80CNEiGkXssz1Q5Bi6M/7GG
	Cqmr9RHY1nu5NArDYXcimL4mLYMNU2zuZicZzU+TCczlh42Em/OEvN01mPzyf77iA319rBzmHDh
	WktI0LbuBPbrkH62Xg2Mi6Mc6l9ARVZ2Cq1DvdRjEeZwTOOki5Jwl8NcVFh7alW8kS5hnoMKa3X
	s8KKcb/n6iOBPo141lQOS71v2XeP0ozAxhzg==
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr7830885ad.53.1774381449171;
        Tue, 24 Mar 2026 12:44:09 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365535bsm148469605ad.50.2026.03.24.12.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:44:08 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: anushkabadhe@gmail.com
Cc: andriy.shevchenko@intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v3] staging: media: atomisp: pci: fix block comment style and merge split declaration
Date: Wed, 25 Mar 2026 01:13:56 +0530
Message-ID: <20260324194356.49090-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324180821.42084-1-anushkabadhe@gmail.com>
References: <20260324180821.42084-1-anushkabadhe@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56912-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69C5831BB58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The closing */ of a block comment is on the same line as the comment
text, violating kernel coding style. GP_TIMER_BASE declaration is also
unnecessarily split across two lines. Fix both issues.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Checked the rest of the file for similar issues; no others found.

 drivers/staging/media/atomisp/pci/system_local.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..1c513ead5300 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -85,9 +85,9 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
- * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+ * different timers does not help
+ */
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0



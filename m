Return-Path: <linux-media+bounces-56901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIouIDDUwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:13:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D725A31A8DE
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B02F3118457
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6754638946B;
	Tue, 24 Mar 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioVoX5+O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E938236B
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375734; cv=none; b=eiLPWDoXZ9Ue8sFy6X2qhCnlGBpxJ/NS92Vjt62RV1SiLsK90Du5hMFKQaRuO2rg8BZs6gmvf5mo9WRuN/DQ+/T6vW8T+F3yaGX+VxXPNewrNiv1p8NZNCH+up4Q9UCVUBwn/CqGBHY/VcTC3RGcrrS/bgbEd1UUy9hPUk1z5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375734; c=relaxed/simple;
	bh=sDOm3ILNrUo/i+Whe0kO6hbAvPjjolJ0LB0vVGmLZVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjshOs7HD8fcVqzkCv3Qi21qi4rZ4ktjhLZFUVPWoIK1O1BqlEF3vg4wjaLWy7qSHa3PfBD/aCSES+Rb3jlDMfOCXDW/TxRWbGB40IbwguZUfRCn7EJ9d6T8NbU1KlYwVFJranuHmK2mm1yRQxEyeEMBZG9NyyodrzZMNcgtWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioVoX5+O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aaf43014d0so38388645ad.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774375732; x=1774980532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwm/RWezWuWLRKLrKQqL0phbl67VjldslJGOJUeSIj4=;
        b=ioVoX5+OogtNwbLkTY/Ohph6jKqfW/DjXMcExj2nDZhuTKC3s0TpDgdZ98Nc3xxJf8
         7m4D43H6AtuSvChcijYwPBKAJnrVfbEHk8+CBvqB85KzhP7RN4QzxfouIDanURAP3qow
         yFkhtGDdkx3TKcTyaRNOr4UZNWqRV0DJaySxmg+WslYFnT7uIspwbiLOeBvtKaOjodA1
         /ruAdMJJWHUVXtMuWS15IoasetYS4fMGE/iV5KSa/JW25ZAghsJQYZuNCHeultYgb5Ku
         OJddcw2EkgcbmzQbwNr17flbzDJF2fhDBHO6n5BAR4PFzJ/qfWIahvSj3JJ5u7X/SUkv
         aYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375732; x=1774980532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fwm/RWezWuWLRKLrKQqL0phbl67VjldslJGOJUeSIj4=;
        b=CS6UdYIiBdvat5sfCMu/Q3rYHMS7yJTgKQqsu1PmgjVvNNkz2BdHSba3nwkSJkZiFy
         E/aPvhC8ZFPeYLqaLK5hS1W8AxYsyFX5BgESw76/AVc64rlPcxXVzf4Phk0VojthGIb8
         WHOClTbkE8u8OnfDdiyuboH7vpGRE3DbgzKQw7oA7xWjrDGB/B8qaapRvbJylV0iZEhb
         gSRpj6v0m3SLcEh+8GWsVLcG4HQ6M36V5vHSVZ13+NxFPydcxk9O1wlpraVjhMcJmLP1
         qPtKI9VfsjD5rC4rYXeCNroCK4AXlqzfc2LgFIeVPd7Izu9GNVyWqv2xMjebt5wmoqgp
         LLBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKFaa5beWdJLDT/5vcv12rAN6lmSFOLDKhH4Hhkd5qlVDkuUonVyM9lbuwx/5+oPUFTNtOZyuORx3KOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0phOWSHBaT12ATob+E31qCFTpQxQ1FizF4nC1HPHGjw+EBfa
	y162WuxXAK3caSMaddOm9zpKGdPnk6upX/8rQsmjevk6S9O3oSIynINp
X-Gm-Gg: ATEYQzzK2a2M+LV4gMXQubE3mSa6NlBn6rLwL0d5/Dxb6swkytwVpEX6D4odtehIRWR
	AfYwU4YpcaRdNInjunYSAkgMnfxhFjRiisbo+xgDSszbzLRCkQNhGZhH+hk3XS0fKyJ3OpRkflh
	UXPOr9DhPIFrPXoLnVsT5JqY6d2vXJipCKyIJA2PV05IumOo6B9G3hwPHQKMA+dZzkEfuxYb4Ec
	KZS0Xg56plC6TxLIMATEkYKHG8N4t4b/OOGrb6tWjhjTmGVZ/NjRJbiFidvR+/He5IhPzVtqeZ5
	/S75ISq1iU5GtFiiKv3ZyhhayZqBgPC+CYD5GvRiQd0cfS0uTRAlSF9tab9A4yxnfhM4dObm87z
	deMBD9iyUG5yqYil7znfLiRAwDqlyxY41sdThri8AwdXgXO8fkQtgh+SCaohWY9aH+22yhdQlkN
	UhyBpjyQtnkL12FDwKmBvqutw=
X-Received: by 2002:a17:902:e784:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b0b0a29cc4mr5838925ad.14.1774375732461;
        Tue, 24 Mar 2026 11:08:52 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b5dsm190071645ad.52.2026.03.24.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:08:52 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: atomisp: pci: fix block comment style and merge split declaration
Date: Tue, 24 Mar 2026 23:38:21 +0530
Message-ID: <20260324180821.42084-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acJ6sH4yUyity0gu@ashevche-desk.local>
References: <acJ6sH4yUyity0gu@ashevche-desk.local>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56901-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D725A31A8DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Checked the rest of the file for similar issues; no others found.

Thank you so much for your guidance on improving the patch.

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



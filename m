Return-Path: <linux-media+bounces-64057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fbpmK5ZtJWqFIAIAu9opvQ
	(envelope-from <linux-media+bounces-64057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26681650995
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="MlRI/zOR";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64057-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64057-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BAC33014124
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 13:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D343A9D95;
	Sun,  7 Jun 2026 13:09:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E815539182E
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 13:09:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837759; cv=none; b=Z1JSUZ+r1FXhZdATeGepQktn6dlvW2483K+E5GxDNYU7G5eRe11TMWbYvc1z/SrwidlKEgAsQyYAk1UrdhQFNJvK4W85th61c9wF7EW2br/QZU7XssFcz5+wokqWJxG48MC1J9ROqU1STrW/Npv0vkeoagoVanK0zm3WkhsnoEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837759; c=relaxed/simple;
	bh=giVJpu1hqen56IxCPpdotBrAyZ2FqZ7Vxy0chtztvdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f8pQ+V5DsvgnJcm9zz0PEIl9+L9eesb0YZcD3V47jO70sCM57mwE0hcEKUmQo++TalnXHEoGyqPR5kpAfCa4xLiamRLyCMaWibfPhQOHqjSn+6G7vq8a2WdSWXotnfUcBYOQoeQkjyI1cE4PFQ3Rjbnt987OBkeSW0RY75b8DEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlRI/zOR; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137335bc3caso4081732c88.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837757; x=1781442557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXS8/dg7URcZBQpaXiUyE9kXUr2VwD9pKcyoQXQtQaU=;
        b=MlRI/zORn8A25yeleb4d22cN9MmZVIHsVMWFzGF1AiD6xihrbxfeIXF4yKXU7nbgy3
         EXofnTsTUUzRGjK4Hl1v/aDfgDaIf9DHi0tXaA2aS14ulPwSz6Ydy4YbfqG56F1b3bPt
         +mzqBBrrUh0qgm0e+IKilHR/9xbNPsdHLU8b6kVoTe4v6/DSYHbipwfLOTRozj5YesuR
         ZxM681zp7PUa9PJjsNRjr5oCuxrq20lST4A3k0WBp0/jI21p93yS8o76PG/8YiK1O1By
         a/TbhLc7AZngQmLAouZLvJKR7n8JvtxonadxMoZ8YzMUXedUbkHr0PfWdqT8FhvYaCeS
         4BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837757; x=1781442557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXS8/dg7URcZBQpaXiUyE9kXUr2VwD9pKcyoQXQtQaU=;
        b=EVLCzZaOVXGs6rMNpg+BwrvI7y1bm5yjO7CU4Fayub76VlXuLKWW4m9tSo3VIVr8/S
         l50C7lHBFi6uQ60Q3Nx6aUd/KpE3eVjPsF791vfPWKzZoKbGjMelMn4CV4KnakHApUYj
         wXI8ZU34Nn5PlYiFuHE9Fn76Kc4gWpqqKgsufUQ+puYpXtlhUbGYX4OyRjIWAc61Oz8H
         6s3vgBi/wvEiKD0zenrWpXx1Jtd7ubqHzgh1s2W61rw5D3me6baFCCJBTWpfQQ7mwN8H
         YE2hlRcnoPoZRt79MTMlpuRp+ATYmQpnbVrsSYNsj/p1iVVU99V+1XWKSXUBk2pNkG+T
         VdCw==
X-Forwarded-Encrypted: i=1; AFNElJ8l9s+7sJQxVuUwl6tjSTtRU2Liajb02ofzrym3RNb/LqezuLAvCPA94fUTpmZQ5ljBrfV3XUkrTURgHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEvXhIzo0BMpeHFjDzZS3oJSlHlk989OZCdzVAqve6JIyNIXDj
	a+S2D0IcXN5qN3KSgIzKIL33PPGQ46/fhbUjPDrB/5eg/WDAW17EgPkl
X-Gm-Gg: Acq92OGHPLKrAlk8aMEwXC8s1ykFY2biOTbrb4HmjzCxLFC2/Kar6KHASRwfZcGxKLY
	EpF2kHh+5rVAQ6QH6LC8DDe7XUzbT2rQ2/cyMKBWQDTpcajOTbhhpQx8M91Pfs44mCsEUIiFShm
	i7b45utbut/A+CHdtbWK5xTLJY/Jw03IkOARkmgqPHKY1a80THBC4gF6fyp7EJLBVM6WZlmyUEw
	kSUoezreIjcZZUaOY2KcgpuJML2JlrsQuDcOwcKDJuI1CTPqkHhbgsIHNZ9oow55osq5aaNhYSF
	hYYzR1FCKmVowmHdTE4LpcspbrXVhLg3aM9tGU8iBOIf1T8F5UMhvJ7okQQvFHGka4F5hB14Aef
	5BvuswiXg2lYE//LtJUTRW0JB6IrDlcJBk3kdLCVePIcg8mfTpl9x5edEfMRtQCQKcTlEbnqrCC
	3dxJpVULpJTgqs7X5m9HuAZymzjSmDV5B24B10qYHm1wY9I+re2PETAKXMaUu04MZnGA==
X-Received: by 2002:a05:7022:204:b0:137:edc4:a5e6 with SMTP id a92af1059eb24-138066fa2ddmr5916315c88.29.1780837757025;
        Sun, 07 Jun 2026 06:09:17 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm11820906c88.9.2026.06.07.06.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:09:16 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com
Cc: hao.yao@intel.com,
	jimmy.su@intel.com,
	jason.z.chen@intel.com,
	ribalda@chromium.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/2] media: intel: ipu-bridge: add sentinel to ivsc_acpi_ids
Date: Sun,  7 Jun 2026 13:08:52 +0000
Message-Id: <20260607130853.55980-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260607130853.55980-1-dennylin0707@gmail.com>
References: <20260607130853.55980-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64057-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,chromium.org,kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hao.yao@intel.com,m:jimmy.su@intel.com,m:jason.z.chen@intel.com,m:ribalda@chromium.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26681650995

Add a terminating empty entry to ivsc_acpi_ids[].

The table currently contains only valid ACPI IDs. Add a
terminating entry to follow the common convention used by
device ID tables.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33de4..471a449f11f6 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -168,6 +168,7 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC1095" },
 	{ "INTC100A" },
 	{ "INTC10CF" },
+	{}
 };
 
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
-- 
2.34.1



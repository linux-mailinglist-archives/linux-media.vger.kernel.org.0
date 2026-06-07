Return-Path: <linux-media+bounces-64058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unM2IJNtJWqDIAIAu9opvQ
	(envelope-from <linux-media+bounces-64058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758465098D
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HCe8bE+A;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64058-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64058-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 236ED3005AAF
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 13:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879D53AB287;
	Sun,  7 Jun 2026 13:09:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E587B3A960F
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 13:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837760; cv=none; b=I9QwptdnG1AirqPw0BMhmiLQ00jcSbkMbW/Dy7yhHDnagsRaqtghOWz5mKNr/CsSaUocJtjI++9230n4HSMtbcClJk3yF4o4CMv18wucqLMZrOYU09ZXlaE/VfvMJmkWzTHrFpdli+5Og4FMtuKzUh2xpGZIc6wdUmXJy0DWvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837760; c=relaxed/simple;
	bh=LPEcjOLuxjJfg9WXdmORzy7ajQymeDF3GtBkKCWTI5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJOCnzmkAhG/Ho2Sb1cSrGZEO/kVYvRNlxt1om6nfmzUCH7gZgbyd+VRmHsz+JpCcGhu0lIdEpwtWFGCpc9KLr9be1sUHKHjvitQXxW/afBShMp+sc5xg5Cu9SVXPjlqw6BJ1KuhH1HbXuRwbV9jsgxuffUdIV3zGFmzv1vemPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCe8bE+A; arc=none smtp.client-ip=74.125.82.66
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-13810b63a1aso4273267c88.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837758; x=1781442558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfeYqmkEgh8c2w2Zl9arGYDVZudQwmcIzBJFs/Jppko=;
        b=HCe8bE+ABVutbWmhIC4GI5k7di8Tl1cobnt2j3rZPGDL4+bkvdC6gmAGDaOGdp5vOr
         LQSxzl/G1g74yEYRJPSS3dvLChvYxiXKt2I38WM5RdemUuwwmWNoer5pbCjuks8Hj2Br
         6zJ1ujihw2hhreLmmKWfCthZYKhiB0wfH2ieZKjUoUSAJleoU+y226EhIHbjPRYBojv9
         Rw9sSrFeeU8KSPaLEsw1iKXuKSqstY6ITC7pOqOwCttBaafRy2FDHJ6SZ3mc99lJ2o1I
         wc9ajZPs6Vi0ZIgIyIjU5UNjfYFE2D+U/lyCppJdanu9BLdmeG86eYvcwU843LQ1I334
         jifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837758; x=1781442558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfeYqmkEgh8c2w2Zl9arGYDVZudQwmcIzBJFs/Jppko=;
        b=OmIj0Nqe/M9MH64jOfmjsRieUY2zrihaNGd9VJ4af6c1QRy/P4i1UyKdUbXkAOMjjA
         +IT1lvp/iD6gxxn/gYenErv1KFxqxlMIfnryKyG0us01hMbj3KYK5O8w3h+QxogUBI9U
         zTH7CIS340q1o1o2vH6x/N2vCSgzkfeazglIxCgnUVoo+JOqP6dukUYs2UqTfK5/v0Sa
         3O1cx204vY1C/mCRBLpLtWBb9KBugEajqffjQIvY6obDf+5a9lBPT5M03QKszFmUg+xc
         b7bXZxU0H0UZcO0nu0KEunc0ZsrHYYstLRrzAurAO2vUndCuT5PypTQ89iNTujLXAtLD
         pVlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+O/cgRoZv4LxaBNN/Xm7Y8NFp5DtFfzbQYN2Rtp0q0BME5vawyCNU3oXXb2L9ToJ5k6Q7l/ddQ4SkMyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJHc1ZnK0vLk7XCHa5S9y3hLmHSAk5a6xCzjSVJrC1hKu8LDL
	TwCMKl5R11xfIIpL7pHBZWCldLDJhEpJoakq0vXVqWUFH03qMFlQ11eu
X-Gm-Gg: Acq92OHGDoMZBHEGPIJFxSX59ErLz8ckZshu7tCp1/VljcydS/MIZBPu41qdPvQealv
	evn0R2nEUMVlveXm3wwCImj381wQrmvw9rTpXD3UOrXtZL2AAFyllO3Z4zHoads8lupKCVsPPKB
	UX/zX7e3Kotdzjhb0x8m77n6tiQCnwXlJuH+3Og6ERsk9ivXA0shm/ofiQAv12onr41gXriRtO5
	beVxOAGqAALBs48n/xp3esuq7tUusTQYtpFcbgM7w42ZxEN/PBK8pqX/tjVpHGmdFG/O1rVIUIX
	ZxX9dZzAKcI9Cnb/E0rJ+RsQVGLa5/pjk93dwF+6vnq+WobOak29mzyCKy5LWmM4Wbir4nWS2qZ
	0U0IHOClajuP8OKLpkwS04cQfvQ2p7Y4s1UYbLRfqqXOhXKOrYrGhiqFhNMAAQodmOWXi6v3Day
	GPaJWN+DUu5yAHRbOiJKMv6G7Pes+kq3Fwrji2Jiw+jZ7usb21AQfRb4LJi5nreREolQ==
X-Received: by 2002:a05:7022:38e:b0:138:5ae:3eaa with SMTP id a92af1059eb24-1380666889cmr6455573c88.9.1780837758039;
        Sun, 07 Jun 2026 06:09:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm11820906c88.9.2026.06.07.06.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:09:17 -0700 (PDT)
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
Subject: [PATCH 2/2] media: intel: ipu-bridge: add blank line after declarations
Date: Sun,  7 Jun 2026 13:08:53 +0000
Message-Id: <20260607130853.55980-3-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64058-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2758465098D

Add a blank line between the local variable declarations and
the following statement in ipu_bridge_get_ivsc_acpi_dev().

This addresses a checkpatch.pl warning.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 471a449f11f6..28d309646c1e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -180,6 +180,7 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
 		struct acpi_device *consumer, *ivsc_adev;
 
 		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
+
 		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
 			/* camera sensor depends on IVSC in DSDT if exist */
 			for_each_acpi_consumer_dev(ivsc_adev, consumer)
-- 
2.34.1



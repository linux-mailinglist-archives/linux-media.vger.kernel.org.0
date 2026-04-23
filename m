Return-Path: <linux-media+bounces-59403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNsyCSYX6mlHtwIAu9opvQ
	(envelope-from <linux-media+bounces-59403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:57:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936E452632
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9E5F30A5372
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758763EF0A5;
	Thu, 23 Apr 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj/Gtorb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F113EE1D0
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948756; cv=none; b=jyMzNzDs3dmo2gbAsXd8seq0QuPkKmokjqE6CAqWurhJAS2uH2RloAI+6DRajC+7pqnajRhPecepFBvH6nGnukBe63pplichWUuKYWYim3KdqGjbQo9zvUAZPbSXnUM2iy8NAYTIGn9MHiGSlp38l87Q0PONQXvBKR/p1Xf+B50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948756; c=relaxed/simple;
	bh=tKQ2tJ6SD6k4XaJGv1agTBDudy2Fgh4ItfGIyGUm3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olW5X3N7OGroBdimnAg/QDQzvZuZGYxng1uG1CrwX6xewPJuvSFC2uuHna3GWKRIUPA07AH/ug/pRn5UmvsbsE7GOs2uuDfl7zpyE2JhI4cLV2x8hAHikGtZhBNpPXXnAnCZ/TWrSyJ7Z0VUnN6ugky2Spay7aMYX9bA17g/Va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj/Gtorb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f69a286dbso5086608b3a.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948754; x=1777553554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+RZEmGjfBSKMztRaXEJerE29lzPNudyadXu2P4tV0s=;
        b=Wj/GtorbEH9Hfq/NgvXvBnpxNjID+MSklVEFqZTBmoa8ILAhWbg6NBuUAJHAvJeTM3
         EhdIHZTh/jB8TVsEJuKQ5VsxD7XyzM/E8Mqq/Ox318VG4aA/8XyhIFpXDykrIII1WxC5
         f4MPl09XoO8zK19iiwAMRnHfFa9C/z2se+NMW4wvhHDmXCDvMOl8tM5Znd//0c0zZBAL
         PMi8e79NW6RFInzHYDrW7d4Y4c9BEAJ0LW0KeWrw8TA2ioXMkb2fYO/FXpK2bawnAml9
         wHK+JMumWsFx+gJITdgS3sLZ0hJSGZmfMRdQcCQO1jfbx4JOnlaIt0VgXlzWdcYWVMru
         CylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948754; x=1777553554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+RZEmGjfBSKMztRaXEJerE29lzPNudyadXu2P4tV0s=;
        b=UUYK95XqKgDOSbp4GcwyVzWB/fLAJT6DrkYU1CuesI1gZ0XkIOF25KWR5JLVHwwyyi
         noM3fYqtnHKQchuewU24eUh51WSPAW4tbm0zTsb4j7sLv+UMbWAizqI863lwKneLbzJC
         NjZ86MPWWn8hM5JhUYjcgxbt21tcp3oYI7C8rHizAPKs2YSfw+IHy/bqbm0BrWD3ok0e
         p4E+XN7FZ4EaG0Svp8G1ZcgC/7+dffKXeM1IHYbgYp4N/jB/UaBAYZ2YwW73Su2gBgTq
         vUvWLM5OVvDiUH4tS26oHoG9/l/kIbnWxY2AKar+ghg8o/I3jxi2N6bso9N36M7PEhXx
         yOXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SoCBU9lp59/vtuI3wVU5zzKGuloK1Fkj9PA+hFevwPgUovQ9z9ZWIc0ifRmDj2OSbIL+Vs7tcR7iPOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+4F7xBIl9/WXXqGC+YhGVnlq0nj9pLANzlDaVugjx+JNi3dI
	dBqU2/N648fYapk1NR3CZIDIbExr9+1jG6jTH4iDtSSaUNvbNZn31cfm
X-Gm-Gg: AeBDieuAyrZ9TV7YE1BrtAWXo5XHcoG5psGOSt0MhkAxun8mhctpUMZLeTGJncpi+oj
	szrnPBsivxX3Yd2nHwrFJABxVG/Qnmd9SBHtBLTjzoK0LYY88SuoWqz6Zco2Zk4602H9bCt6n5m
	KDCVwy5HQDnTl5dAtHoEIKMvkQr9Wht4/Tu2CeioeQ5/MvUuv0ZCIlJzySVmXX+QFhvqHwjIcgp
	jO4+kQrroFjka5exCFYeXESKqxP6y849dZYUIV/pGiruABpSAvnsGDwT7O1Mj6zqdOBWdqYLd1+
	d8Fc/8YqsO/jb+BV5t7Y8pm0hRapCsS6cpAq8gJ2h9gfmFfQgAoMlMtjAUcxOC8DnNtvls+eXhg
	bCuUhX17KWd/93b8Mlrd79MQzb/AVTIVc6iJKdGH2d2SGzcpttLiSpBz15QLnjR2TFZdeAMu2WH
	x/ySbisBHpEWT0Vmqi1VKrTRiBh8Ti2T+bERn6JSkthdtAYYVEYyUrZUKAJNHcHr8=
X-Received: by 2002:a05:6a00:ba02:b0:82f:8b20:9165 with SMTP id d2e1a72fcca58-82f8c9222e1mr28873037b3a.44.1776948754378;
        Thu, 23 Apr 2026 05:52:34 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0092bsm22043687b3a.50.2026.04.23.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:33 -0700 (PDT)
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
Subject: [PATCH v5 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Thu, 23 Apr 2026 18:22:15 +0530
Message-ID: <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejF4OlVJtKSknxg@kekkonen.localdomain>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59403-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 8936E452632
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The source pad format handling attempted to map DPCM-compressed mbus
codes to their uncompressed equivalents. However, the rest of the
driver does not support DPCM decompression, making this dead code.

Remove the DPCM unmapping logic and simplify to directly copy the sink
pad format to the source pad. Add an explicit comment stating that
DPCM is not supported.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v5:
- Rebased onto linuxtv.org/sailus/media_tree.git (per Sakari Ailus request)

v4:
- Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..64419c1a805e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,7 +107,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
+	/* Source pad format is copied from sink pad. DPCM is not supported. */
 	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
 						  CSI2_PAD_SINK);
 
-- 
2.53.0



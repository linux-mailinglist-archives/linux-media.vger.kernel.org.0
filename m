Return-Path: <linux-media+bounces-56628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PB8KYDTv2mY8wMAu9opvQ
	(envelope-from <linux-media+bounces-56628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 12:33:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC62E8EA3
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 12:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE1F1301951B
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 11:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED7633F5B8;
	Sun, 22 Mar 2026 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQcchAux"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0B2848AA
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774179171; cv=none; b=A6OWkxVjRekH9z7jucMmFRqdwM6GBMFA9nNByVMJhMjzzlfgx5uMz8WZ/XE0zgS16GfBapvV5RhH8rRXdbdg+jW3swg8FCdWfjvRjKxQdj9paCJAxaoOJWcOXOJi8bDoeHqEtDEfbOilM5ussBjAX2xVexGrvC+LdavQLunE8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774179171; c=relaxed/simple;
	bh=iqw9joRcspZCH/8gMqnFSFCc4GCnkWYXmP5HtvqP8lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXmSShItGrUJIbcgGYQM9wg9d+nLRFBDSmT438aP4ufhg03VA1A3BHyGKJEWAhHkrRGYtRd0GewcwSLr3k8PAIvbIHsE+ChFsPwLf9aS5tB3ps4s5ZKPtWmENEo6q1bltJ+mCrp/YtOaHfoBh6Ec5V/kzSkkVxu5d/h7NBRPjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQcchAux; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so13003835e9.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774179167; x=1774783967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=VQcchAuxHfyLKG32+Pq4cdV7sfwpt3ku+RfCjjkWuxo8V/PYxFkHAc8cGgsgci77Ug
         HHJ6+L0xfN+hknFF5COSZcUOWzbGyrk17oa9ox+eKis2xobKokquarpz0zFL/vNsAH7x
         YdcFwdzziQ15hYRwC90zyB8d32Kny128HksAVwDyDrOWYbBZfCRf2ca6LpNx/A6XRwgA
         Php7jivkZdCeyKmpYEWbdon7wiumurwSoNBvUGHdL0dAFDo8CT6/pXnZdB/02oc3x8cL
         RK+e0iTt8g4PzrpsKRPcX2wt4cdvMKjKWknedajdnrUHAlYmfY/E6BE4usZQUW1jQVgZ
         nwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774179167; x=1774783967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=PRT0lO34ea6yyYDSXKbWp96otBsid7XS7yr+vyupotej6mcFXSMvthEm0tM8vyd9Su
         e9w4Z31pcrLUgmQ/ZRWG6q7XwlGz8YJWnz9O+Qeai2Tad/VU5S3XxZJHfPSB4m+yBthX
         YKZqe3nB/20+7dMM/xF8b1Rxey44/TtsepYsHso5ujUhfEXKrwqkghx3WLmxDGPTlUWT
         WIdmtg7B56xfosD1kM1mTA9H2P1S98iILkFqb2ksJcLlB97opsdkM02d/mW9okn99aR5
         yeXNvDaI/FLmmzAg7/fAIHGRNP2BNfn8P1fRbZSYz0zy5ZIonKneQv7I/OxaXjPSZlYn
         uosg==
X-Forwarded-Encrypted: i=1; AJvYcCXS615sqzmsV9u3W3rpnFcRQzNaRmvafGg+FYU6HN76lixwUDP1emh434dIbq6XRc5gFIVeZnKpitZ6QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYwhCS3/X4o8bqRYO+7ve6JEB6hOH0nfLzvZwdYXC0zRxFm8k
	Op+NZEyEG27viqzNpMHeHvEMdF0GQK8jFhEZlaWu/06inxFbn1GDkK0=
X-Gm-Gg: ATEYQzzChHMqOtqy1dWVArIAUo7FVG/dbe2YoYShPaQAzPbDIAYXRIddYVlvum5zlCD
	/THoKsYPPI25S+YRCC8eA2RdEbHf5AR2ERdtklOg1FKN+iMcmfF3YjhiBS1oC5e0u34FluXmkPh
	tM8zuuFKavkzimOZ4Fz28COEnlO/e+XFanGbOUwcEUtPSGd8nLkoPLFqkGNmpFBnoEtg7h1rgQf
	IxOswW69tUJSbpcM4aP/XfalJ2LyHXuzJD7HzgBZQGtWM0jpgWOsN0czOtCWTM/lXLYZyTlkm+m
	nQv8Dg8dhmfX/XRNVsOvV3ffYbnUp3XZqdwdAyB2og7JNS70GjX6Z099FgeQts/TXuJLc6uJjz6
	gh/694IJCuDFCbyicAssSlG34JWEzQjFSbHVxNkL0jRwjw4SrksEsRQqKO/BaCI2mz8F+x9hoRu
	uSYBjXBKd21pv47hGT8jpMs12zw158Q8wXw3TgNoF+oJXDhKBvMvBrGFZ4HV1oOEWokzxmWfo=
X-Received: by 2002:a05:600c:3b07:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-486febbc65emr123715415e9.3.1774179167349;
        Sun, 22 Mar 2026 04:32:47 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm201025045e9.12.2026.03.22.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 04:32:47 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH] staging: atomisp: fix spelling mistake
Date: Sun, 22 Mar 2026 12:32:22 +0100
Message-ID: <20260322113222.27488-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-56628-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FEC62E8EA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
comment within system_global.h. This improves code readability and
searchability within the atomisp driver.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..bfa8682ee667 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -29,7 +29,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0



Return-Path: <linux-media+bounces-58825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK1vBbKu32lCXwAAu9opvQ
	(envelope-from <linux-media+bounces-58825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:28:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B6405EDA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC06D3003341
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 15:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFC83DCDAC;
	Wed, 15 Apr 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkjwaP4q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1753DA5CC
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266922; cv=none; b=hsiWFjdlqbP9eDYZQEKtWM/68COm9psgQv2/1LtZpeVny30Zc72DCQU6ySzKrKPmTJhHIQCMuOlu7fm9AYXPG9KMGtQt+h2sYJbm3a5xnBzGxF5Y+VA+OPS8cDlMcKZUqBcWAuE2Ges2zXSS7YVF8wBK+dhukYe/ulAsC8BFRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266922; c=relaxed/simple;
	bh=oJIKfpkjLTRuSN0Na5MbEEyvI1htq76RZymUd605YJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bC+oA+j4LKrPFQftHxFqv22mfhPjrcd+mGWqPcziveOWXV/t6XAOpCv0X0QJ4srJNdJSYJu5kwUqplEvZGRp4J6Ceyp3Q58Sw6qbTwnGOssg82pwtm7TZliQRibO7dEpv/TumDv1dMUdj8Mbc0pamC3I4TgzhGyxeV3j/CxW2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkjwaP4q; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2429f98d0so43439065ad.2
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266921; x=1776871721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpi8dSRmXDyoL9oy3Sy4RDdQKtqc7S8AukkEChjSFcU=;
        b=IkjwaP4qxK1AOR4Wcskl1buhA2/hEBFNUZAgFgz0iacco2DZHQvEH1mCuYmY6hFy5Y
         CVixGBXglLe8VZdQZOq6stuLwCN7Ir+328Pku9uTwk1zTtorTFYBBpYUucCzmXCJP7AX
         RFMTPS52JwygLXGTiNuEoDm3z41mt8hkkXTNULbCVsmWyfiU+26DMvAutXO/TklTozwq
         wF1eqQA+HfvaTuP5zPNFfBcD6x+saP6y5n6MSFVo0XfI/k/Sl83ymJmX9riHLnGlPYlv
         vviTd+T/BEaMnQhrkyc2HFv9QYPGVVWOikFXPY4BzHKgYMQHyZJU7HOEYnEJ+Dnux8bH
         StkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266921; x=1776871721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpi8dSRmXDyoL9oy3Sy4RDdQKtqc7S8AukkEChjSFcU=;
        b=aIyucff81B82YqTfEAIQhQaqAMScRw6xX+UfuiBSN89A0HE2uJGQe8KKpRTnEpA0F+
         F0dRaxbFnz9gdI1tyPc+DZfyhU+KORkh6g55W5BumSqD5kKUH4J96Uc1eLezxT9qmynx
         0LceNFAiEOso4iKqK8zrFvHBkXkMk3CHrJnNUiIzeVeDscFBLDxJH9ilZ52PpojnGZAK
         bhhRmjEqcV0AB5fxhaKLpQcvmIJRodsiIPnHH+cVF2mFlTAY5AJJA69D1wt7Y78ey1I2
         vQ9FmDyFRJk5Ns1YkSzY1KzbOm5C/g9FpHHoAwwwnVWlo0Q4kejg6rD/gxcZ9TckSagU
         t4Tg==
X-Forwarded-Encrypted: i=1; AFNElJ+hG7Q38uub3H6CeKnK/FrXNwEZsDKp04eVrzd0Js+BrLgGCVQ3zGQQnjAPWmiCfG86uCI+mAjGkcz66Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWlESk9CesgZPqlP+OXIs6zd7elUZ+s/s+DoJNXfXz1qnBS3C
	ULQs0QB4xR+9aJvNc/RKmhSUVD4s6JHdNd5TfeTaLtrLkSVpi3rplYGE
X-Gm-Gg: AeBDieu56FnbYBTtKzt1UAmbht0vYlaar50CM5fU4lOe9PVeUx8F0JzUD1oqf4/2FKS
	PX81oXCzV0LRsAmmvHapcaiZK2e/e8XaEL5iksE7QI6Q1dIXDDOtwPK1igoRyPy0p+HThK+Nzgm
	HPIXZNmXtcYbmHb9UaTdVVugaL896VuiLsZi1z09RaEtTW92traEGW2p1fIizet//1J/wiopNSZ
	KC7lETZZHN/X8IiV6/51x6/wCRW6m6IVctnpmTUx9wKS4VkNJyVhNsZHKWZF1OP555vVkYWpivr
	KsEK67r7QAxXAZyKXJJeb4yVnIn2mRtn4bAMV0vAobbEAvIEgGPCPUJ3FrZSylkA6fTTFEgw8Hl
	kmIK80WuBM8nY8WPcUF2EKJL6p8YC0hCAOR876/d2/7yrVW9+QXm0sisSK/ufjssYnuT7pqIXRC
	J7AF6GJjm8dIOXlVgqOrqwEPFSs7JrVbBOozFnsJ4zhw==
X-Received: by 2002:a17:903:3848:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b4678c60a9mr90028585ad.0.1776266920513;
        Wed, 15 Apr 2026 08:28:40 -0700 (PDT)
Received: from lgs.. ([2409:893d:1179:9a96:408e:b322:d944:7204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810ae96sm34661885ad.21.2026.04.15.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:28:39 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: vidtv: fix reference leak on failed device registration
Date: Wed, 15 Apr 2026 23:28:26 +0800
Message-ID: <20260415152826.3406217-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58825-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E6B6405EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in vidtv_bridge_init(), the
embedded struct device in vidtv_bridge_dev has already been initialized
by device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  vidtv_bridge_init()
    -> platform_device_register(&vidtv_bridge_dev)
       -> device_initialize(&vidtv_bridge_dev.dev)
       -> setup_pdev_dma_masks(&vidtv_bridge_dev)
       -> platform_device_add(&vidtv_bridge_dev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: f90cf6079bf67 ("media: vidtv: add a bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index b6203e10e37a..0b551981a5b2 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -592,8 +592,10 @@ static int __init vidtv_bridge_init(void)
 	int ret;
 
 	ret = platform_device_register(&vidtv_bridge_dev);
-	if (ret)
+	if (ret) {
+		platform_device_put(&vidtv_bridge_dev);
 		return ret;
+	}
 
 	ret = platform_driver_register(&vidtv_bridge_driver);
 	if (ret)
-- 
2.43.0



Return-Path: <linux-media+bounces-58823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCrIDsGs32mOXgAAu9opvQ
	(envelope-from <linux-media+bounces-58823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:20:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469B405D13
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB9E3105DD5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 15:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FCD3D5234;
	Wed, 15 Apr 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsVXePxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900FF314B6D
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266111; cv=none; b=EBMUZOXE3Bb2Jb/2/zf6IvXmkE8ElIR6KSJCka8bpwPKqhaSsyOq7bHYih0UNc5tg2vKK9tJ79nKMXublRs+1KEze5ekJx8nAnoKNfX9zkgpu8zZtSUKPyFEcdgSv6UVCNdqJiapw+SFPpHR8Enf9vVhZOlr5NruaQdcz82mcdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266111; c=relaxed/simple;
	bh=bVYuDe6E8/tQa9JSwBETMmxVEyh0dqCHzU/TdSwyWIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUQkYK23j3kXZoFC2qbQVNkqUEohaEIgAuiPdQmQholzgBea2KYAVYg4ePFZCCSu7dhgszcBhAU09Ye9MP2ZDIrVvBwL7yZTI88gkNg5dWMHyEDhj9uAanqBxzbiUssNXxyGBGFCLG20T5fmEctRt1vF+D8EDM/rTFtpRqODcUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsVXePxZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d95017a68so4334891a91.3
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266110; x=1776870910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jOR7w0F+ZPAedOetlmUBsNvlbtBWh+W8kyjE1x6Q9SU=;
        b=jsVXePxZoA/2KfSYUVjx53xNylkpZqrnQwoxf/C76uqh2l/sR5TKl7GGMgpkbRQ6s5
         C0LN3FI0LFRPNi9PoXXc9q2J2BNoENVm8FMntoF71ONMNA67d1E369y5NE7Af/tE4ti+
         ACfSSXD3S6JNFsuCuicXjtY0T8WUiTAX3APtu8PXsSJn77lTcMNUMNSH75Ic5hG2qlTx
         I2OUJHzFrA92NxWlswSvPDxz9SZvs0v9pi065jPXh1YifvYDI0+EHtzKB89ro+kX2yJW
         5FivwB1w7Z3mwvZKN9AIK0ylgTVH4xwlHRn8BvbCjv/yAx7++beUYmJ3058VfIs87pwy
         Xfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266110; x=1776870910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOR7w0F+ZPAedOetlmUBsNvlbtBWh+W8kyjE1x6Q9SU=;
        b=ZrIOpGCd3LshVGe4ycKCsxf0/qC4v1zimFatOqRRADZGP3qudigTxwuU1ctzmcVtUm
         t6ouif5gI2Td48hS9IkwUjnZ7JnYww5D6qPfD4X/eNl3oT9JWUHxculQgnREC5PhngxR
         Q4vwwPrziSXQaawRrlrLaVCxVMzI5g3Zo/kTqOlc91rnHfitJnISG9AUlwhWTrdv1jzX
         1eE299gapSWrnLbDtED55/HNhXmUNnCn6kZENtrmVfe/coVSfVk2I69bWuRW1p8UU+Ir
         ZX7aQEYgHMDC7o2UZDJSoEwxs4CqJPLlQ7zptfGqSVLm4h4kC+5ivlqJGqUQxwVpOKvV
         k7BA==
X-Forwarded-Encrypted: i=1; AFNElJ/6BDIxBNxtLxBTCMS1bqceU5S0g48SYFckrWuM2qyXYedGV4BtCGrZc/cYY71mJoQnclHC9FDlhBXGpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytKBSkmhBj+QiwYtDDWMzz5zyDlqiskuC5N13Vy4QcZYhE9MjJ
	lCqeWSiG+OAbNRdklyNeQ0ZAw1zMk/3RR3JSk2e1KOPs0JFsGhdXBMRn
X-Gm-Gg: AeBDietNYljNK2EnLQJ7SriWg9UbaZhSabACK29y9yfw3zdw/BWDNZCNACZ1kBSVj/5
	KAOpJfeMBG33S1/mxO9r3kzSsRiCc7a89B/O7+2Us11Dqk93PKllWB2zY6NgpmJnegf9/eK82l3
	isD+CLP2MeDa06QWv7AYMrboPdIXJG7ISlq5/16KrXgAwE5I+yc0ry8xA8dEx0bH618ou7XA7B5
	7+YnjSHTpmkR7PhKhvsFxUe+eILGccZYNCL1qL5adpjT4iZiv1jrSG5uVgsL1ckFVeLc11Djiqn
	v5SVBcnJAN6jzGqCY2Cm/RU5dmc1Fj9dv5qb6N5BnrytLsH6nmOu4zEl5W8/25dA3VeLfO83az/
	swt+y9qdf/kxwnENbMSmzS3R19nOdcscVK3dMLEbIXiCMiU0UuzMNIByNoM3K0K1H9F8MoWshrc
	ZELGMa3RL3iljvcJsNlNCjsgeJ+7Mswa6tWMBXmh25hA==
X-Received: by 2002:a17:90a:741:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-35e5723894dmr10328629a91.9.1776266105215;
        Wed, 15 Apr 2026 08:15:05 -0700 (PDT)
Received: from lgs.. ([2409:893d:1179:9a96:408e:b322:d944:7204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd20d0c3bsm2458832a91.9.2026.04.15.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:15:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: vim2m: fix reference leak on failed device registration
Date: Wed, 15 Apr 2026 23:14:49 +0800
Message-ID: <20260415151449.3387235-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,ideasonboard.com,gmail.com,pengutronix.de,linux.intel.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58823-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5469B405D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in vim2m_init(), the embedded
struct device in vim2m_pdev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  vim2m_init()
    -> platform_device_register(&vim2m_pdev)
       -> device_initialize(&vim2m_pdev.dev)
       -> setup_pdev_dma_masks(&vim2m_pdev)
       -> platform_device_add(&vim2m_pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 1f923a42033ad ("[media] mem2mem_testdev: rename to vim2m")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/test-drivers/vim2m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index bb2dd11eef0e..80dc7edcbb5e 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1601,8 +1601,10 @@ static int __init vim2m_init(void)
 	int ret;
 
 	ret = platform_device_register(&vim2m_pdev);
-	if (ret)
+	if (ret) {
+		platform_device_put(&vim2m_pdev);
 		return ret;
+	}
 
 	ret = platform_driver_register(&vim2m_pdrv);
 	if (ret)
-- 
2.43.0



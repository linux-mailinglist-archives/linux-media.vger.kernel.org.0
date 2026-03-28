Return-Path: <linux-media+bounces-57467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCUkJm8byGkGhAUAu9opvQ
	(envelope-from <linux-media+bounces-57467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:18:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430F34F7DF
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98571300D0CE
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18673A4F25;
	Sat, 28 Mar 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdYGK2Si"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA4347FDE
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774721895; cv=none; b=UYx8/ygfF26Gxm5Qug55bdVFYRVamABO2PdVCCdGr1GV9XJihofqKjR61LbR+lQPIdMb7Fky0bEAeyakyTULTgqg8wyoqykHICBge7bJ3C9bpeN7IP+YSwyL3/bByNy1OFsYaCCsTvTqV3qxZcsGtzthGW7I6AHdtV/P4lfDmJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774721895; c=relaxed/simple;
	bh=x3Qs7m5fijr+xXEtA4IK3QhDipBLzYv2dg9ySDgdXdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxMfZqBS9a5kuSXtVHwCCdpTCmeQEhfuYs+y3Qc74xCkH8HItJCWwpI5GhJEtEen7ZkIkh79W0bfT8Sqc8dN159wgZK68mnznIaTQHqGW4ulMrx3H1f+jgbcmg2xFMlmFGl1zsvUp/Q8BJW97E0plf5rkASuurxmK53snDAGH38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdYGK2Si; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so30117255e9.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774721892; x=1775326692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wNuQm4/hkzS93ZEPVy54NJxy1R6wP2SseNtwzyElDg=;
        b=TdYGK2Si7FlGWwZztF3mnz0s5VwTDvw2U+/e/0gWCGKeDxa6SRPmF4wXR4bqWwhV7L
         xq46QjgjyKpShlq6MBzzEnaGGNdBpm7cldpZUahf+OWvmOq/KOA21kYoTQSj/VddSTgY
         R9W+q++czejBLJXceihGoChYfTVUBzEnkQlKYhMqHQuancI1UP/KZVcHFiwajyb+psDo
         bUmvDpqscxKup1htMdnu4nB+R889fP9SJ2TTACY0B/QgVwr1x+F3fpO4KqA3dgKcdaaI
         N8c6xxKtRJJ7zy4ktxNYC3uOc4XLxWRq6feumPIAHQmIogRJmdeJhJeEUQyUQFnMAMi7
         zUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774721892; x=1775326692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wNuQm4/hkzS93ZEPVy54NJxy1R6wP2SseNtwzyElDg=;
        b=cyTOKp+dM/ub1ZDgGjlYYRMkclboxesBEuhNsKcp3ZN0VXmN0z0ad9yYnQwTlzhxb8
         CdNxgwkmNBzi8VNc6oTOZzYr8ZPCdMH3SBa4KcppTCa1xGG2aPrPqzAJYuWV6MVH0WZd
         0u7/otcUXFpjruKKXodfrgXe9zhmHjpxpstVhkkKqB9VuNn2VFKjO5oX/jQVyJC0T8t/
         +WLM+HPTSH/fc7ukgLB9gQibdnbiob63lUw+XiTDFJb9dTSk9A66UCd9Gf7sFhGb9456
         T6Rj/kNv6wwS6GuDtJTXTxTXtZl6WbT9UBtNNJd5MDDcRDeyenoLGorA8Qndjf5WH9DC
         Kzpg==
X-Gm-Message-State: AOJu0YzFAltIRVThUgWz/RSl4p/efHOkzETMDcC21rMiV9tEsFyqTCKR
	e/sPR8+U4tXktnVWdHEwLDo3lhB7DrdCLNhrjJ4lFkFCcnmjf9IbYbdC
X-Gm-Gg: ATEYQzxJ/Cf6C8nTPQcCb2fqkqBK6owotiNIQ6heQK0FSQy/XHUSfMoSJNcPs3rGxUI
	CvhvgtKcAWE9B0ZGacmdGIkmo818sBcuiduWIaZhQ2an0lze0v8GQfn8rsE39PE+nbGtCo7Ifua
	iCM7Vm5onrhrApzL+BEV0qcnhYcqy9K3OyAtBBCX5a8pImlqZtG5290KOFy5vF0VOP4lXFQZ89l
	CO3kd4sywIJE7OQH3fuGRdbsHuy0SKj/RtCHwPmxwzXBEci8oj2AzaacgXz6VwJJBHsG41IuB1D
	xJpXaCjOl3lFLzw2f1Jm5xhtcYrUEUlTbc+nzCSi4m0+5PJoyrh2gnmOzV9geZ6vaifA5bjSQXq
	2UinUU1JY8QQd+ShSdnfY4Fy7XJPqPGXHPRvkSwL8hc/5lfLYyHT8gFoMsOSt+mhssMaOHsgvhf
	8LoDqzEaciJ7MUBMr/GwkyY553l7mTcDKo4QkQyXunCONXKEwwE7Yk5thLAT7lF9g+ivlbqWDnK
	URTBWg3JDO3
X-Received: by 2002:a05:600c:3b95:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48727d59448mr106333395e9.4.1774721892211;
        Sat, 28 Mar 2026 11:18:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270dd790sm83670455e9.5.2026.03.28.11.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:18:11 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Sat, 28 Mar 2026 18:18:09 +0000
Message-ID: <20260328181809.13988-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69c8189a.050a0220.bacd1.a31f@mx.google.com>
References: <69c8189a.050a0220.bacd1.a31f@mx.google.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57467-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9430F34F7DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

npcm_video_probe() allocates the npcm_video structure with kzalloc_obj()
but never frees it on any probe error path or in npcm_video_remove(),
leaking the allocation on every failed probe and every normal unbind.

Additionally, when npcm_video_setup_video() fails, the reserved memory
association established by of_reserved_mem_device_init() in
npcm_video_init() is not released, leaking the rmem_assigned_device
entry on the global list.

Fix both by adding kfree(video) to all probe error paths and to
npcm_video_remove(), and adding the missing
of_reserved_mem_device_release() call when npcm_video_setup_video()
fails.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 32 +++++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 5c6bddfe8073..52505af35c08 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1750,42 +1750,55 @@ static int npcm_video_probe(struct platform_device *pdev)
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(&pdev->dev, "Failed to parse VCD reg in DTS\n");
-		return PTR_ERR(regs);
+		rc = PTR_ERR(regs);
+		goto err_free;
 	}
 
 	video->vcd_regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						  &npcm_video_regmap_cfg);
 	if (IS_ERR(video->vcd_regmap)) {
 		dev_err(&pdev->dev, "Failed to initialize VCD regmap\n");
-		return PTR_ERR(video->vcd_regmap);
+		rc = PTR_ERR(video->vcd_regmap);
+		goto err_free;
 	}
 
 	video->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(&pdev->dev, "Failed to get VCD reset control in DTS\n");
-		return PTR_ERR(video->reset);
+		rc = PTR_ERR(video->reset);
+		goto err_free;
 	}
 
 	video->gcr_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgcr");
-	if (IS_ERR(video->gcr_regmap))
-		return PTR_ERR(video->gcr_regmap);
+	if (IS_ERR(video->gcr_regmap)) {
+		rc = PTR_ERR(video->gcr_regmap);
+		goto err_free;
+	}
 
 	video->gfx_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgfxi");
-	if (IS_ERR(video->gfx_regmap))
-		return PTR_ERR(video->gfx_regmap);
+	if (IS_ERR(video->gfx_regmap)) {
+		rc = PTR_ERR(video->gfx_regmap);
+		goto err_free;
+	}
 
 	rc = npcm_video_init(video);
 	if (rc)
-		return rc;
+		goto err_free;
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		return rc;
+		goto err_release_mem;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
+
+err_release_mem:
+	of_reserved_mem_device_release(&pdev->dev);
+err_free:
+	kfree(video);
+	return rc;
 }
 
 static void npcm_video_remove(struct platform_device *pdev)
@@ -1800,6 +1813,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
+	kfree(video);
 	of_reserved_mem_device_release(dev);
 }
 
-- 
2.53.0



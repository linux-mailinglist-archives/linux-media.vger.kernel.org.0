Return-Path: <linux-media+bounces-57377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOXkDh4Dx2lORgUAu9opvQ
	(envelope-from <linux-media+bounces-57377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:22:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF334BF11
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768493091D15
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543F39281D;
	Fri, 27 Mar 2026 22:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjQ5jwRX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821339DBDF
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649955; cv=none; b=DezARTpalZRrtgJu05hiQDgPVzSFHSZbZwKpW/rxiZTupB1UjXdso9Jav6LASNY6/QhWspRn2VCCgEtySu/7n6Wq6xrLfrCFkKzDVEeaPJMM/6LIqJoEklH7KegVAtaeueuiP5i3BE/33kcsKisq+jvKeWrNI8u2yJjpD5/4DBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649955; c=relaxed/simple;
	bh=neL999lXG/lvtuo9ubfiRZGfekJKqnqC5wp1ETW2xBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFR5HaJohDtpVRW7vqqHwQsBrg0vhi38IMD0gm7vmHHMJSDexFQnS//d9vJLv1176JViem4cXKdgC4XxpoB7dLWQ9FwAnOxY0XRKcrFZze70afgDxG51Ty7Wc1Hy+Dw8ZmfzhwYMj2r/cFo0KNg+PU7fHGpHwpDyNYWgE+8kZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjQ5jwRX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso34328755e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649952; x=1775254752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2youRr357rlRwtasZfNZwC9KNFZnZTwKHeGB3J4nWQ=;
        b=WjQ5jwRX4mbE6muof08caG2rYw/QK4mUJUCMCELsP+fb5SyDGgIkJtZScprOwG+jj6
         tmrgRZVVVw3G01d49I2QdrcslycSkXL9voAOHAv+M7sz002kXSBDdAj5MRTtRFhsMIF4
         ySDVe+p4Y57EsNbOtx6mPOwjBSSuq5CJdZA4mjqUwvccbgQu5jS32tr1JNRVwJ/TEKXH
         Q/qeBuc2o8ckTqhZmtyS8Fo76Ao7KNRvfa+yT1LUIiHKz22LLFBTp7QQ7F+9sM+BmkRi
         3Ex4Ts7UHqhDsQjybtpQVTNOlJfGKR52rQpFUv4feJWPJIU/Q81w6oQXj9Ze9mKY/2wW
         9Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649952; x=1775254752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2youRr357rlRwtasZfNZwC9KNFZnZTwKHeGB3J4nWQ=;
        b=EdR5yZYr59ul9zAfsRojNTA4FEjoXm9cTF4chGKPPrIsfPZad564BZOtH2T7LJHJ36
         0Qwb53WPSj/I93D6OlwjDUKwngYuQL3D/yMKW7pfS47wPWo7PKhNjXvyfLCshD0sUdam
         0gs/kINbURdodQVUTZhiG7u1BSd9L/HcLMMpLy/NZrSbKWHyPkDBXOGtQ7yLfoNCimFY
         M3mb7fHnMKnxDo/gYOabaZwlPBK5SYVwUpA5Tin2TMhNtWK5szhrFEbaOqRh4vgIHdff
         xZ+3+TKu/NTewbXQfDROyG0akD/6oCQ92g4ISBhrVSJj4zs0KvpsK6bhr17WWwf4wZL9
         f54g==
X-Gm-Message-State: AOJu0Yz0zOE43fUG00NUnLIZwo762zlhTJClgQnpD5YeUHKdm/+31tB7
	OPeQyDJQqJerjKiA0ijauiCid1K0IoLz6R98iwa+jpxB3KCGY/PQ/maL
X-Gm-Gg: ATEYQzzuUUp4dTABVaktIymv7rAE+EfE+nfZdjdQflqTVoyLa4Vu5sMLyoJUM09ZRaW
	J+nSJANHQ6PucUrgsOyNz+ZcjB34jHP0VdRgyAUa4rDVchHlyjVm8TNs3gdHpRAmBwmqWRB+Jka
	LgqtRC5hBtlYYmtkfpXCthi/EFxu7e4zPcf/1DBlDh280EPLkwK6DE29fyDjd4PfJTzO61PxS4a
	aUzz4Z2qJi0xb/hFR7KkP9EfzlvQNufKC97nVT8JgVEiy0gnzLXfk38slTW6fJcTgQA8oIoF3go
	ZqVW+njzmhOX8ULaySd/6X4LxgqRsB54SWcod/hq+/32SJ8MqQCr20BKg4KKHi25h7NoelxzYhY
	p4EM6gkvGG37eTO/YnOjNvi15QIPhIaR2VR89e2pgcA4NdvQFw1aBnqlfOkHYehAK0nu8YoVBlT
	/KppV3xfjA5soJYdarmDmV1lR8a7Kv4pdM6qc75MsM8xOH/ee3hlR22R6wJqJopOlIREyMc4wRd
	+Ycy+dwGW4x
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr59241125e9.15.1774649951916;
        Fri, 27 Mar 2026 15:19:11 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306acb47sm8489965e9.15.2026.03.27.15.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:19:10 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Fri, 27 Mar 2026 22:19:05 +0000
Message-ID: <20260327221905.267410-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327221905.267410-1-devnexen@gmail.com>
References: <20260327221905.267410-1-devnexen@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57377-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: ABBF334BF11
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

Fixes: 7c3a5e744482 ("media: nuvoton: Add driver for NPCM video capture/encode engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 5c6bddfe8073..87b09979cc52 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1749,6 +1749,7 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to parse VCD reg in DTS\n");
 		return PTR_ERR(regs);
 	}
@@ -1756,33 +1757,44 @@ static int npcm_video_probe(struct platform_device *pdev)
 	video->vcd_regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						  &npcm_video_regmap_cfg);
 	if (IS_ERR(video->vcd_regmap)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to initialize VCD regmap\n");
 		return PTR_ERR(video->vcd_regmap);
 	}
 
 	video->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(video->reset)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to get VCD reset control in DTS\n");
 		return PTR_ERR(video->reset);
 	}
 
 	video->gcr_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgcr");
-	if (IS_ERR(video->gcr_regmap))
+	if (IS_ERR(video->gcr_regmap)) {
+		kfree(video);
 		return PTR_ERR(video->gcr_regmap);
+	}
 
 	video->gfx_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgfxi");
-	if (IS_ERR(video->gfx_regmap))
+	if (IS_ERR(video->gfx_regmap)) {
+		kfree(video);
 		return PTR_ERR(video->gfx_regmap);
+	}
 
 	rc = npcm_video_init(video);
-	if (rc)
+	if (rc) {
+		kfree(video);
 		return rc;
+	}
 
 	rc = npcm_video_setup_video(video);
-	if (rc)
+	if (rc) {
+		of_reserved_mem_device_release(&pdev->dev);
+		kfree(video);
 		return rc;
+	}
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
@@ -1800,6 +1812,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
+	kfree(video);
 	of_reserved_mem_device_release(dev);
 }
 
-- 
2.53.0



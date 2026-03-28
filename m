Return-Path: <linux-media+bounces-57443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l/xsDAPqx2mOewUAu9opvQ
	(envelope-from <linux-media+bounces-57443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:47:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABB34EB63
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A17E3028C35
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8D11FC0FC;
	Sat, 28 Mar 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKDpf+dA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4F946C
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709243; cv=none; b=ltKjSgquwUGpbg0Lz3lvcy8xtv1CuUWgQHVLt6neB5qu18WiBku3vACTwq2NV7aLRH1Gd4fGZkBAoshZUz1CaR6ehsC3oDtzoPzOIqI0dqr4jUQ0c25hdRXy25LUlPGKthJxJT9XU5ksmIwak9MRmw9A/u5oyyS4xxVnxDERltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709243; c=relaxed/simple;
	bh=A6MoI/96KtmHHQEY1kMP2uWxdbmW5+XGXps7ROfY0nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqwpbUgHa1lVem1yIi00NTIKhV4lav0b/QKMciJ4IhzFNLvBYvzZsK5xdBc6cyaUcDe8/S3/wNCgEh6HvaMI3P1dKQyyhqC3jXdde79i6fgyrBMKqFK3ey0uAiEVvk7ssFwoXntUpM12BfP6DBWIgoq1qjTu0COW0Kqe+nnq/C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKDpf+dA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso26537705e9.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774709241; x=1775314041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MorpkP6r/T60MTiGCUcfsot6ur/wG/ccNFtLOYY+Uxo=;
        b=rKDpf+dATWSB14S4UGWZaYYHX0FjEtC3gglAQqpwbh5HEaErkhrgKk3vFb1xS9Gynv
         Sm2oEFYy3yPwsXCuWTNPoUXz3RtanBhQXiUPaLhJVZNXLXnWuYkn1GGccRcazEavgDDH
         /G0fuQLRbfRhUiqx0eX80+hjalrhxLf6jBoV9CNkN9TPWFHo6ClSKn8tz4y3TCxZyDnV
         5fZGdy9bR5xTqyaaPwP7FbAZuPYJRbj+NmIv08tcft6hoRLteA+OWhJ/VYxXYGcsk4hA
         FUUZ0mrwsW0Mri1Mt/aWRrr2d0U9+1RDudE/B3zVjcfA9OOgzn1HwdBdOtC0oGPcR1jd
         w+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709241; x=1775314041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MorpkP6r/T60MTiGCUcfsot6ur/wG/ccNFtLOYY+Uxo=;
        b=VXaE+3I1m/TAasORTzWPs7wv4Iz1pcbztXUhiC1CiHkPinYNDLqzxFmyRhTMbGYhby
         SbFY8tCivxlxRMKXUSkWDgS9CVDkJ3jlAzS8nNEQwznpNVh6Fr5ZvASgwmPQRpRtpNnf
         8qiNYTUtIaXJrCbsqOzKsJZCx8AL7VHKLjCmO4RR7epTaaXXGXT7cEOl9klfDZK5tHFo
         SQ4R/i6qUAmiWKZ+SVWgYDlRNQHr6H4ITNx+XA5GjPSJtyRjNt4V5DrhMz813zV+Doaj
         TJiEjymcs1ctEwlg4H0MklDBQRqJDKXZkHEu+UeTTAqGWz0K/vKT+6DGiwPtJVqOrNVg
         vq/w==
X-Gm-Message-State: AOJu0Yyb5QF81eEhZ6UCzIsY2MBOPd/mpNxssr6y8ceP6wugQ5J+Gjb8
	rSo4wEjREuy34le3hcIoBGlLDq45bcKBTeRK57rnrBdI0HreJaIXEG5z
X-Gm-Gg: ATEYQzwwQcHWEbriV0r/rBU++W7fCtBGTzX2SCWvKBYj7E4B6n+5zIG82sJfrD9jyES
	0lGojKjb8lN431zCuZKSBoXyAw/c2QLESQl6DD65O+2+IenWlRZtoPorHmP99zfRN95cStubY0u
	aKnJh9ZLfTgnf61baHdmxlqPPxqMMKEgFGJ81HsSDNOJ7Rv/LimYaHEM90zx62phngLlVIauNaY
	m5ISW4Ru3aLXg/uXDHMQIAJJ9Dxx7fJ0tYH0pCnic3rUHLXhe1rTCX8OYdtxcWI2/EpnBGUCatk
	jOsyNwg+rP9lxIuyj1dOBXW9zMTCMrAj8rRdD8QAiZdcVpAFAFBq+q0FBhSdtH6v1bp8z2XpWM3
	JTDoXwLYmuqNvIRKtQz4Vqwzl6tC7miDduAmdIdG4TH+UMzunE8DpqLXOXwtp8LVV5K+aMPgXyt
	civl79NSInuWbhn4b26hVsSxk30mUum7sgo9q08kf9bPYOX4YaN+NWdZAGiycrT3F4aQyNSYpqi
	ITJfBlCQacQ
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr104982175e9.26.1774709240531;
        Sat, 28 Mar 2026 07:47:20 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f279bsm5077450f8f.16.2026.03.28.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:47:20 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Sat, 28 Mar 2026 14:47:17 +0000
Message-ID: <20260328144718.68282-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327221905.267410-2-devnexen@gmail.com>
References: <20260327221905.267410-2-devnexen@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57443-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85ABB34EB63
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



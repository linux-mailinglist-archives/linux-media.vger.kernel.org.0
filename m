Return-Path: <linux-media+bounces-64850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eL9jOiwPL2p27gQAu9opvQ
	(envelope-from <linux-media+bounces-64850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BC6822AA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="HOhx/Gk7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64850-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64850-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88DAC300A3B8
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB2C31F9B9;
	Sun, 14 Jun 2026 20:29:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509B30F7FA
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468957; cv=none; b=L7JnBLU/7vxmRAFhX9V/sDFJ0x45L1xpu0Orsu39MyIHtp2rEAjpUPMJgSEno9e5T+mg1/dwlrlV7QDb/YWEGK4HTl4tkGhgJ5zePpPbQmtXg9TfHcy+b6f/PPwXK9jmlnFCzGT0wgeEHPEx/GJQ201sasWmZog70TyXo9VaB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468957; c=relaxed/simple;
	bh=0+ct/5bSD8+/j7t0yYGnadG9asE1gLg5nV/9XZUde3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIRoIJhgpkhEGrX1Md0XiSbl07DTwnS6V/kziLkJUEo7Qp5S5azM9eP74Cj1QV3f4HiRGnAhZIx8NkR2HBlOkMNZ69FFwNsG676m6rrhFtLUHJH59Tq2ZViJGt7vYr3BoQqJ81SJUDhASpB5JWxJWTe5g7ZJIIQZIM/KWy0fsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOhx/Gk7; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1620037a91.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468956; x=1782073756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok0RHylowIwuCH+GVJHVjfNsxfGaqa73fuuohT05y6U=;
        b=HOhx/Gk7UYZ3b1MGq9zQf7wSndxvt/DjQBwRp78L47rgaUrc0mkDyyhbZDwm4ZvXCc
         329YYbeETmevVbh8ynBQkNDMia3dUXnPZ2FBzwt+9XYIDqZpSKmKkOBkLoui2FXcw+mw
         Bnfah3SYkeI3+lCPAFalFJ65qa4ebSvro1scs2ETXisjkxy5A0Eu4vtzeT+hUKa7hL2g
         /W0aVpWKu8lYQ6OqLtRuMm8agGbTtEr+Fx7xcJbKgQDIAs+l6REhhF1KY8hQg1fr6FAW
         OKMyahtAe7pjrIt3vFA5aP8LXLmXsjNEk0lfawZuM5nq2mkWHYnsjZs1r7gC1hapoTlx
         w83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468956; x=1782073756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ok0RHylowIwuCH+GVJHVjfNsxfGaqa73fuuohT05y6U=;
        b=BViUMj/y81KJM7h2py+nKNy1+fc2KQY+t2w4Fj/C2Bl/CWuoHQXbgQYnDGBjdYkWya
         V4/21jeBqbrq/Pu01w+9fxmhmMXxHXE6LLzAwR6zjg0lHjo3T8Tupin1yLM5Z35MPZHi
         KQKtWI/bN9z8JJN+vnf1u+AHxxtQ7oWXxe7B1GZ/tEM0KaOGjy1O4FQ27UsXN/Ncg+fe
         J5Y/R7BCaIneGnCfc9U67m6NvY0CGL43YHfG/rTMl+fSoaznocnQwodw8yBvL3shFuoC
         DB7P8pPZeEIhgv56U1MB82BUgjUsUEKsNlelP24QHFgOXgHx1LPrTvLKUk0z7QcKp/Lw
         CX4w==
X-Gm-Message-State: AOJu0Yzukqd0DnHC4oAtcVq800iVclfEhGDvhKp2TvEaw+74vId+89hu
	VXphulirtFUFoQRbFew9Muqkjbh3KEfK/JcE7sWVuyaEbphuzX3hhFDqIWVzPpGs
X-Gm-Gg: Acq92OHrFGMukqOFqJWUVN1RZE7/WlL2M+IVrBh/g9xsdLgOYTdHkc/yPdy3NICv1sx
	oRe2Ao6lv5tVHzW9vTV6NlpTQ3mubE5NE5Q/6r7G+snQmYpTal57/o4a0xtwwUG1/yNXBEMSs1o
	RC7pPM1/mukETIsUidHQLGlQ85tfoi5luP5w0h3YSW8Dd+oE9CRYk4tovl4PUR6AFzdhsGyMHL9
	9evf2LE+tdrFkS52I1G3JZ4wdGQ1TXSn5jpj31aKqhvRJFyRwfLG36X8mtbQjVIANydpNf1fxQH
	W50qiySDgk/Ql5dYl6+1FTDSKndJ0UG1RcDANMtCh6w5nXB9iEIO/5O0VZb97aXSNSS6u2TmLjl
	ea3CP/NyVhk403VvHjHxXlQlZdRG7H5IAHxC8F3K3qn05s8X3SAnPwQBcMsrNVqFKTpnB8Hx6Nl
	zTQrF0HU2aNTJaFZlOs8bG8/epIHeC/kqo/Aia6JtzR9a6MOHm2H7n
X-Received: by 2002:a17:90b:4a11:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-37a01b3f8b6mr11155373a91.6.1781468955988;
        Sun, 14 Jun 2026 13:29:15 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:15 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 7/22] media: platform: sun4i_csi: Add missing media_entity_cleanup() + fix UAF
Date: Mon, 15 Jun 2026 01:58:07 +0530
Message-ID: <20260614202835.11977-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64850-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mripard@kernel.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844BC6822AA

This patch adds missing calls to media_entity_cleanup() in the
probe error paths and the remove function to properly release
media entities.

Additionally, this patch completely restructures the error rollback
cascades in sun4i_csi_probe() and sun4i_csi_notify_complete().
Previously, early initialization failures in probe would return
directly, permanently leaking IDA internal structures initialized by
media_device_init(). Furthermore, failures in the async notifier
complete callback would return without unregistering the exposed
video device, leading to a Use-After-Free. A v4l2_async_nf_cleanup()
leak was also fixed in the probe path.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 56 +++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..2e5dfc938ac6 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -85,11 +85,11 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 	ret = sun4i_csi_v4l2_register(csi);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_subdev;
 
 	ret = media_device_register(&csi->mdev);
 	if (ret)
-		return ret;
+		goto err_unregister_vdev;
 
 	/* Create link from subdev to main device */
 	ret = media_create_pad_link(&subdev->entity, CSI_SUBDEV_SOURCE,
@@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 err_clean_media:
 	media_device_unregister(&csi->mdev);
+err_unregister_vdev:
+	vb2_video_unregister_device(&csi->vdev);
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(subdev);
 
 	return ret;
 }
@@ -187,37 +191,45 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	csi->v4l.mdev = &csi->mdev;
 
 	csi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regs))
-		return PTR_ERR(csi->regs);
+	if (IS_ERR(csi->regs)) {
+		ret = PTR_ERR(csi->regs);
+		goto err_clean_media_dev;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_clean_media_dev;
+	}
 
 	csi->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(csi->bus_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our bus clock\n");
-		return PTR_ERR(csi->bus_clk);
+		ret = PTR_ERR(csi->bus_clk);
+		goto err_clean_media_dev;
 	}
 
 	if (csi->traits->has_isp) {
 		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
 		if (IS_ERR(csi->isp_clk)) {
 			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-			return PTR_ERR(csi->isp_clk);
+			ret = PTR_ERR(csi->isp_clk);
+			goto err_clean_media_dev;
 		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(csi->ram_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our ram clock\n");
-		return PTR_ERR(csi->ram_clk);
+		ret = PTR_ERR(csi->ram_clk);
+		goto err_clean_media_dev;
 	}
 
 	csi->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(csi->rst)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(csi->rst);
+		ret = PTR_ERR(csi->rst);
+		goto err_clean_media_dev;
 	}
 
 	/* Initialize subdev */
@@ -236,37 +248,41 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&subdev->entity, CSI_SUBDEV_PADS,
 				     csi->subdev_pads);
 	if (ret < 0)
-		return ret;
+		goto err_clean_media_dev;
 
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_subdev_entity;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_vdev_entity;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
-		goto err_unregister_media;
+		goto err_unregister_dma;
 
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register our notifier.\n");
-		goto err_unregister_media;
+		goto err_clean_notifier;
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
-err_unregister_media:
-	media_device_unregister(&csi->mdev);
+err_clean_notifier:
+	v4l2_async_nf_cleanup(&csi->notifier);
+err_unregister_dma:
 	sun4i_csi_dma_unregister(csi);
-
-err_clean_pad:
+err_clean_vdev_entity:
+	media_entity_cleanup(&vdev->entity);
+err_clean_subdev_entity:
+	media_entity_cleanup(&subdev->entity);
+err_clean_media_dev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;
@@ -282,6 +298,8 @@ static void sun4i_csi_remove(struct platform_device *pdev)
 	vb2_video_unregister_device(&csi->vdev);
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
+	media_entity_cleanup(&csi->subdev.entity);
+	media_entity_cleanup(&csi->vdev.entity);
 	media_device_cleanup(&csi->mdev);
 }
 


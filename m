Return-Path: <linux-media+bounces-64829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0rnhFoTqLmpY6AQAu9opvQ
	(envelope-from <linux-media+bounces-64829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:53:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A802A681D21
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:53:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=N68Iln68;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64829-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64829-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2835C300B11C
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EA939E17C;
	Sun, 14 Jun 2026 17:53:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C14720DD51
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 17:53:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781459582; cv=none; b=ZgcmTJVNCwlZW2dFcLZ+RjZC0uq8XBqwxplsGHdXgFVcDhEWWY5v+G93kM0k896/k9G2kh6bOJ5Es2g+aViR5byf5nkAWAXvJM7p/++ZwslSh2dtMGUfTs0uOqURLqfPfUeGLVXMJSv3qJkAgt9iuPsOCPhkQM0CBs9JfS59Gg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781459582; c=relaxed/simple;
	bh=KMCtR+MmvbvYx56GcH0AFHlpko62cSAPwFqWkITyMVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXhTJpxaoUzzxxCOSv6lD+MeK6zJT2MYMhZt0J70mwICOvkuUc1dQBKMe7XMx/qiy1IkgUc6MGq8AuE1r1YjVNnCaIE3ZZRS/IZ2E3fWyJt/vtZh6FgArmDEG4x134Swljb2ftOug6YHBJx9uGkmjOZFs3tO9nN/+Zxt43xytdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N68Iln68; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1146150a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781459581; x=1782064381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmQyvBJa55LW2txaddMy7yENahO3ngHsP8KSfqyOwho=;
        b=N68Iln68lVjS6H6grISgxYePPssZXKZhdy8DT3cH/c7A6w2b7R5sy6m7ngWQt+Eicv
         d4SACBmuxQa1rPSyAR1pFq4jk5FPcKJahTZ+xJSRCymP7xIART6tM7zERSRDe1JLbA1M
         31rBKIBn3yRhSXb7N2FZ/6NGJCcq+PUoXcMtq/rzz/wf1uQAKYRpt2cSqvJ5Lfb/sXbl
         voELE/YJf5bIz6bMWw6h14lF39CxN5HVPcZwTWW0v/8fUBTVxUJIHd6bXNOs56I+AnEq
         K6kRiEjh2XeZyu9h7mxuiMZuDHY5Bju53/JNehdqubAfb/Z4kkxzCot7G3dRMwUNL7z/
         l4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781459581; x=1782064381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmQyvBJa55LW2txaddMy7yENahO3ngHsP8KSfqyOwho=;
        b=baXEJDNf00pHOP5LjKpM6B7zgbZ84I4/eo2GqluIPpJR7AbRtnoi1AzILDjPrrKHO/
         V/s2ef8U4hpZCYNMj1TZW/ltB4fppDcrVfkODmkuFzCzooI08n6nVnmnk52RfdsEHZcC
         foOqMAIISCBfT7nSrIzewKSZms9AS1fQZfnGd2M83eZLTtt8yk9h4Mv8YELqgI0wYfCS
         7guL6bm9ZM6CdN2mCXlBgl2psqOp2bzqaMIVyh0bYPIierdtniT55tNS78ZYFctiBMec
         hbx6T+Mdk2Oavn7e7jXVeDxt0BiJIduK6Am2L35aFTDbz3FUN57Kwbv4qfJJNBjclgfl
         Pcsg==
X-Gm-Message-State: AOJu0YxL0mPGBsyOTTDagd+plcx2ofrkJKKubKKe4KjBH4ocJRyQbXjI
	YGCUeGEOxjzkxETwgpmLXAPQy/6DRcnceuEeIbxEeOa7DICmNFiNVr1mg3Wy1XsD
X-Gm-Gg: Acq92OFCcmCaadBruGSFNxnmTMwu2UqSnFGekH8HGV+Hx0hWgX8zy5BwS6T4Y8v8c9c
	Qg/JwDNSBJoirUBB53qtExJqC8uzInZArlbY1H7kkXDZPnO+btzLIjLzg2+GQuwBcXcU2gmvDoH
	6kxaKnIv+wtgtKdRF0GZDBBzIK1Ep602WssVaH6vWUdrK+DNLAnxOrqomFzpuBRd1l8YhaPgHl5
	VE3c0SJWA3tpMgs0/AvTWvvxTpJtI6OZU82BaeH0GPTFzYTngjsLdU0Q2ltCw2OaHGU2RQixwwh
	3hsvuoyrRAWwso/PEQhsxE/bYpRJ+THc/BelM0rCV6ZxCfMcfoO5eGRtOGDUkVQJYe8buXGdtEE
	6yYuBYt0v2m/Olv+gnH+wERy1gwHwUnqU6IA6YaTqUbl7uonr12QUaSlEmRsbLcFYwaXlEB2ejj
	Uy5Ub8Jm1KIMbkZ+5u2rsrpo+SDDaK/GL02NV4AXjUgIHxJ62lOe/x
X-Received: by 2002:a17:90b:560d:b0:36b:a2cc:4857 with SMTP id 98e67ed59e1d1-37a03ad61e4mr10637833a91.18.1781459580624;
        Sun, 14 Jun 2026 10:53:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm7913694a91.2.2026.06.14.10.52.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 10:52:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/3] media: platform: sun4i_csi: Add missing media_entity_cleanup() + fix UAF
Date: Sun, 14 Jun 2026 23:22:10 +0530
Message-ID: <20260614175221.6619-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64829-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mripard@kernel.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A802A681D21

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
Assisted-by: Claude:claude-opus-4-8
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
 


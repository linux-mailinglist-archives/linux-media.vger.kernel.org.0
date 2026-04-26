Return-Path: <linux-media+bounces-59629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM1GCUYM7mlmqQAAu9opvQ
	(envelope-from <linux-media+bounces-59629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:59:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0C469DDE
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D6F43007ADB
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A4F3603DB;
	Sun, 26 Apr 2026 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku8FJ+D4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A928E35AC1D
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777208379; cv=none; b=RadMTgyCifzNN+gtDKDgCnEGyO7OwDgf9IvlhuUeUT7Mjff4jM8pL6XLXfVm8Ju2aVv6jnvkSP9Uqh+HEuuLwOCwZncs96S1DnieDZ57PZdqAjv4VLHiFVGvX+QzgbltiRsPs78zTBs2EJMlStZ2JKkjTSYkR83aUX9foWND1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777208379; c=relaxed/simple;
	bh=GS6hajXwZat+NBSlsYlaHhAw7w0PBNcSVaczRpYLUFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5MnA/tPr7BlRahkQ4FcVKvx+Nwu2N7ipu07FBn6LU8frgnbmbGuoSamhjXBGvVAcpFc93JmoysXIV+yCIs3uIGwydb3G8E/p6x++Bs2Ok4viCKqbf7+FMSDBbIC3jm815RhhcUU9p8leUif+l5k5/U+E7riUL38ITDr7rBY3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku8FJ+D4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b23fcf90b2so88944735ad.3
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208378; x=1777813178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=Ku8FJ+D4yfEfn7weq5k/SaTK3+sf01O0n25RZCsD3bFGLCs11JeEqnZzg2HwHpSje2
         NEAuNr/2bk/QO82efWtxhoaB0y+6054aTvSpn+MjOvr1rnBEukf1ha1T6/6Dy4eDebeA
         4sBj+JdYrxfF3Jfpc9LlsYl+HEfsMbJH0Q87SuvzfPvCHom+qHOpiVsfHrfFJ+GSogac
         WTppz9BASON1TiCR3q9EqCLw5kay8DgrewszZxKKsd2U6lLPL8mzp6OXYTW0PGK/cntQ
         3No+1llNSGJCDwwrCgxtr14zz+bekcSCH3YJCMk9Fi5lLb46YlvoPk+9rzlPUe7aeD7t
         kBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208378; x=1777813178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=oPEmFKAw05kYpbDo3ubUt4+IDyDUq4L/hEKxbCiMjphw9aM+2CHtLR1wW+pxxv9jxI
         fm0evlbU220/fgRd6AEMIFPuqzWI/pmEn4BgwpxISJpFHdV57m1ioXTDgcox9Dbm3hJY
         eLKe0nidJ4jBYyJG+04Go/OVLy/TrJCi3p4y9phCsJOvZfm6fbO4l0Gk0ld9hHCVTM2n
         vSwQQeT4InOjF1VNbsCVTKSfVuJ0bEQ0zt1YNFPmUuYvXPF6VEuQ1nQWejNWQxfswMzv
         1GIGjVxdhVjv5DZAcuKN8TJxCyCs8pr8AVUZQym5de2Gc5FQZ6C5M1305EEOxsN5zjYh
         OeMw==
X-Forwarded-Encrypted: i=1; AFNElJ/5UnEg43O6wIMREHXc57sgREvKv7tmAKh6l8CqAk8/wQOiYnBpnLruaoCICpWUhOO9QX4uYhH16FL6ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGj4OWRxgAIUU35PGhgCBwD6jypjRLFK8dpeX7VERfmp1o5Yf3
	YGBzNdZKajtTP6U6ECDLaSfw6bD+ikknl36+IqLUfEWYE6kLFaqcoyc=
X-Gm-Gg: AeBDievaOU4ScADaB/tgZ7tKwGEJt+4dYTQzJL7MgVBwwoO7gjRGLCyeuG4OpVSX1og
	UgpzMoHv/856eH+3/+9Mrq5qbHWy/IVXTiuDucKxf4ZUZAFryAhnlyY5za6kQZjLHdmfHLt9hgD
	h2U3YFp3zzcHpw2F/mzJIHL2EUtlA+80emERQmRakYDs/T5GNx1ukypmcLrE4oihh3bPIpE/Xus
	uCysmABurnor0zAlUzo+ykIOqcM628UtTSH0MsYjetJ+3dy5lU6/09aHiMw1JjgQAlYUzgjGjrM
	cGERvF59Z2gCsAzO0jBchEcUPhAS2Q5VnhMy8dWA5sVFeOUP5+yyE9YqJaJ6TDJ+tLGJEuzN+h4
	DcO/qOjAaQJbh1z35sqEnkT5bXSbT7jn/wzZjK4pue/ooAuqUWxF6DmPhNxeFlTq0IteqR39LsY
	gc3exyx6C7ycrMyJ6P9BXiO6NdqCgVwjKNPL2O81Nl3H/IyqOz9N5LAnFdgl/r7aaFckmeS863X
	f2McPIEjA==
X-Received: by 2002:a17:903:17cf:b0:2b0:6829:9414 with SMTP id d9443c01a7336-2b5f9e64c6cmr396098325ad.8.1777208378015;
        Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c6asm252710075ad.58.2026.04.26.05.59.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 05:59:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: sun4i-csi: Clean up media device on probe errors
Date: Sun, 26 Apr 2026 21:59:11 +0900
Message-ID: <20260426125917.53665-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A2C0C469DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59629-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

sun4i_csi_probe() initializes the media device before acquiring the
MMIO resource, IRQ, clocks, reset control and media entity pads.
Several of those failure paths return directly.

media_device_cleanup() is still required after media_device_init(),
and a failed probe does not run the driver remove callback. Route
those errors through the existing media-device cleanup path before
returning.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 30 ++++++++++++++--------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..f6798cf0a2 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -187,37 +187,45 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	csi->v4l.mdev = &csi->mdev;
 
 	csi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regs))
-		return PTR_ERR(csi->regs);
+	if (IS_ERR(csi->regs)) {
+		ret = PTR_ERR(csi->regs);
+		goto err_clean_mdev;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_clean_mdev;
+	}
 
 	csi->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(csi->bus_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our bus clock\n");
-		return PTR_ERR(csi->bus_clk);
+		ret = PTR_ERR(csi->bus_clk);
+		goto err_clean_mdev;
 	}
 
 	if (csi->traits->has_isp) {
 		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
 		if (IS_ERR(csi->isp_clk)) {
 			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-			return PTR_ERR(csi->isp_clk);
+			ret = PTR_ERR(csi->isp_clk);
+			goto err_clean_mdev;
 		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(csi->ram_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our ram clock\n");
-		return PTR_ERR(csi->ram_clk);
+		ret = PTR_ERR(csi->ram_clk);
+		goto err_clean_mdev;
 	}
 
 	csi->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(csi->rst)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(csi->rst);
+		ret = PTR_ERR(csi->rst);
+		goto err_clean_mdev;
 	}
 
 	/* Initialize subdev */
@@ -236,13 +244,13 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&subdev->entity, CSI_SUBDEV_PADS,
 				     csi->subdev_pads);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;


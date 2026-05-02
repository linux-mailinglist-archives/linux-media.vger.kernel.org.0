Return-Path: <linux-media+bounces-60172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF1dGeGV9WkaMwIAu9opvQ
	(envelope-from <linux-media+bounces-60172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 08:12:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E404B1220
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 08:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5145E3019143
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 06:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39EB2F290B;
	Sat,  2 May 2026 06:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSXFEZx/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252742D0C94
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 06:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702362; cv=none; b=ovow0kSottDOfLs6z/5wQ2LcfhINXw0+f0MWnQkummW0bRIq9/IgjChyY3smbt49wzpYc9tntkU0ICNkrBcOpRQNLgl84KAv/9zCuD2gVFFGfOYCKb9GfVHFlqWmxalRm8hPcAbkaLnB6B2sTjl0ddvfUDGADXf/P8XExoUKrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702362; c=relaxed/simple;
	bh=TueC70Q2BnjUS5mq/ZnFlpCzcBfCUG4Cw+8Fdn9sjoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfVMePH1VZIPYXM5C6co0xtM6/kRKxEqdWHrWuxaS50u77sZkKKdgcx87jJwgC5vQU5VCgvFTcvVcGxs6jtbZCgqTqip95DQJkoDRT6HjoLVZ7Hu0mgiQXsJ/uAVyF1pde6nQRr//RNwRI37VvKdCaJRDLQLI8jJMqLdAVADVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSXFEZx/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b941cd869cso15060375ad.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777702359; x=1778307159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=ZSXFEZx/Jtt1Az/FVfeSvG0nhpl0jfYVMoMJF/bYejJ6tlhblOFl/rA2GbjPftIghX
         DA2sggKwpccnrKx8bfs7f7XzEK6g1A2JQQ73UFS53xBdOniadhekCk3KEdL7F2cD229P
         vlrYHkhAV9vMRMOuycUDonQfvpxbcERGgWMUm+u9HW3nYUC/EH3rfQBXluJr3MkCE8Vi
         WseNZgtgvnQZfE1DpqQu1s99Rs5eZFbcgY0QLT03oAYCxgHsON46RVg6lffdIILJzdtE
         G/EjApkZTMdFfBsQte0MDQ9IlU/pYOM15ULHGmqgsztNVczQlYj5nK3eBrMzdw1Z+5py
         z46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777702359; x=1778307159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=UL9ZRT8qkj1fzxn3uVNQOLmPZl2zdwFXdvo6dxur9W4JJ+ff8OFrDuea21cRYqMV0o
         4tPFOPalPoxLHekqm/1WEMl6C+fZvzX3OPxwa3MbLgNECdkjYlFjf8bpxBtJ8pGI792O
         qAJHQucO9c1Em9zYjeolYPXTkU6fQocQdjUsOtgHO3P6PGNUi8LbslDUBqZJHL+kDVwT
         hLwouQytsk5F3mOlPRcafPDN4ObwmLckONXhzfX56uCCGTPOI46KaTSVdacwcGI2kdnb
         Bs3WtsSbcJM1z3YNJQNrGWKQB4aWkE0uLGbwdPZ4JzF3ZUI4QrkmcAZPWomj3eU8gTK/
         6Khg==
X-Forwarded-Encrypted: i=1; AFNElJ8no/Oz61FZtQ85qr1/gLV8aVCliTajtCie5HvgxOe5rFcfRADxltC/GUzyn/FsLapZW2LjgzxbP5kHig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyupVPWl8/CGi62BUqb91aWWWCje9A4D6AhbY/AAxWVFoAugKim
	gkMknaW4dJ+v4iWkyLjF8/2/wagP3jyM65ii7VtP9/SLn49syRuRxFQ=
X-Gm-Gg: AeBDieu+efe+L/q5GbnwS/+3u4ow0OSDP1co0Wu/IFsbEgALOlV5dTdvimtITCLTjjV
	RZezSARWKXRL+na6X+IixypnJI1XbkDiiVhzv36KFnFwshcvE0S4g+aiRiKSKJhpspn4gMbJX0m
	3+AY6hs8Icjm5a5dCnwbIWJcHprwxSNkz2oeNOLdySbrWXpCGV+g7k6sGPThhm9BEuRhDt4glni
	wLwm4GJnH4ag125Xegy7Cu/A/mO5Rqz61rRECfqfFFYpWL7KY24w9wKuN4Aw3haT/nRrSFGsFs5
	vx0kLIBF0U5/SSi4eR7E1dBLcFJ4rA1ZI67WY/roO55YMXU7QVI0Mruzwii7NbYcTl5GFwBtvyb
	4nW3bfCq4nNfhjCBStyRlEER6rJir9mRVHWNu8rAwTPSpMUvKhVX8c7ycGiHbvjG10l3Yx3E3X+
	Fvk+5Jrr1KMTB3Qq8teyhDHi/CDQRYz6SAgosoa/3eyExPPSTpM4oYIEMOjejwduZQjr6mZPjAQ
	+dK/cGfpQ==
X-Received: by 2002:a17:903:3847:b0:2b0:9101:1b77 with SMTP id d9443c01a7336-2b9f2586e79mr19418775ad.17.1777702359380;
        Fri, 01 May 2026 23:12:39 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae54860sm37981415ad.72.2026.05.01.23.12.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 May 2026 23:12:38 -0700 (PDT)
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
Subject: [PATCH v2] media: sun4i-csi: clean up media device on probe errors
Date: Sat,  2 May 2026 15:12:25 +0900
Message-ID: <20260502061231.50473-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1E404B1220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60172-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
Changes in v2:
- Fix the remaining sun4i_csi_dma_register() error path to use the renamed
  media-device cleanup label, fixing the build failure reported by Media CI.

 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..a504a1c78e 100644
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
@@ -236,17 +244,17 @@ static int sun4i_csi_probe(struct platform_device *pdev)
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
-		goto err_clean_pad;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;


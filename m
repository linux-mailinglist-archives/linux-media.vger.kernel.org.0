Return-Path: <linux-media+bounces-59632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBd+NQsa7mm/qgAAu9opvQ
	(envelope-from <linux-media+bounces-59632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:58:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9846A335
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 525A730078C4
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4699E3559CA;
	Sun, 26 Apr 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7pdQ2Ty"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1E363C5E
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777211905; cv=none; b=XLExeK3Rej2qNFRp1CKyo8MIKl4IsX64EASid0FoqZIgJayx98r6yKR2L9cqLXtxiXpDW/UaCLKxM28S7XmVT26q+KrC4TiRawwoZsLKnWZoOMcxiSiMiOttW2PL3oWvmlpPPeyXcCO5xAy7MHwhZjy6YMImYc0yDTaOgEqu9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777211905; c=relaxed/simple;
	bh=9mxkbIYzrVb4tEULWkgR6CtT2TzXnJT1Hr+hwp+gk18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FizelF9ej6fUXfP0ko3Nk+hp4j3GMqbU1gnVaGqhviHiamaeJjXF0NC81afTdyo8dzA6U/gkEBqtU+bp9Ev+Wu+aIzLszu9aUi54Ixb+TFM1AjFPfqIZ32CkVcFH8CqC7y1qlfP9TOXv0dROIgZnwHblBfUVW1XW72Sw6UXEBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7pdQ2Ty; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79467f124dso3400367a12.2
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777211903; x=1777816703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=U7pdQ2Tyl7fGAuzolRfeceVvkDp702xQe+hC41YzpBL1VKf/JXzLMg9fUrRDN0hmAi
         cg/whvZ9hKQUruCtmzF7Xug+HDzXBPKBoyVlUilYohRHQNvKkE1Kgg8XMd1/fMZgze7T
         QSIxSfiXdJMGzAtGOkwlKDsZTJUrUO1Ht11omi9S1P5fscLbgIhRoKuWjXJYHrWvfR3w
         3Xf3fEuADHT+D8osMLEzA75cexfBHQ8+E9wh74bBMq6qD+htSY/om/p3RX2uDiBUsXJl
         gbGn2ZALr4R73uRQXugyaQPN54AbnJQvey/IFI09XBxn2nQz6YIf/wkqTEZ2PPqgDmuR
         1zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777211903; x=1777816703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=AL/PaFE/M3RZsaz5Ux2A5Ohn5fCYwv3HvE+1x/aYg+cBOVY5fVGMOnhabQHS4Snz4q
         7bOIRX5A+HqZ8EviqgFVgX4gUBoM+CCdP8Ruj9vA7wyXtpK6LX0GkumxFsJuDEuC/eW+
         M0AFVmEMpUM/iYuVutjQ9uZViJWsoELa/ubrOp7ti17/mKwGIGJ67ihyVwZiNtc5AqJD
         35kbZJKiynU0INNfXRBEamgVDd6FpCLn7pK0q4b+66GzKWNRXhNExCF5FqDgN3aU5tLB
         D4qJfcalCY9mzFnVIrZux+hJkd5PwlpCkpdU8xbrEUpSrkF2cqK07EXVP8N6C2pQ6KBA
         LgUA==
X-Forwarded-Encrypted: i=1; AFNElJ+BaSkmHYSr1jraiAe8GJa7IQlDYTt+0Kzone/SZRJk+dvvXbF/B2o50HzDEduGL+aVJICbL2bt3mEeag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsv0y3czaR6b+uSA64PwQ99EpzqknLrM35TjEmF+VVCl8pflGm
	A14yw6hvzNk/lVdWRplrvPoIW/WoVdaCFZVjhR+yUd2ZdXRjjQpj08Y=
X-Gm-Gg: AeBDietg6OslNRSTZ+RDWN/jePosKrSC8akFYvjn49WzoPTW8axiIxZsV3T4wXzJiwu
	6kjD+zoESnevhoJ0gCGiUvusjzrP8u1pNauKOrgJi/AZcv6At4aBhXUBESPUt+eTiLTiiiH7gpb
	+lqSjmWFx693NjWgzNsspg4TV8ZgHjjjXHp3Co/kk5w80Go/gN3vBU4bEUmAzkSfpe7JoPDG4qm
	YyI/kwmZq7s81JAJ5e16WOb11QgeNTdEs2TRhJ1Eod3zdxQJuv+X86sj5qJv2I2BM+iz13b9YAl
	gkW7wQ/qn1XtH2zQShgTah3UR4h5bMlnCLfw+qC6g8vVLnR9KWjZO1Gwma09H6/w7/FCYfWhwBP
	sKEwpI2ulY0RvWvds57p6PTczBA4dALhYb6/JlRjxlx6b4/s888fv/zSnT9n5xjec1z3MCAxC/E
	RfrUNCQZmXP/Dp3WRtsxTEBFinjyEIz3GYNEG/q6RbGm2cZeA4jmem5lBO4juzSqoZCRy2piAXa
	iJvP+7L8w==
X-Received: by 2002:a05:6a20:e210:b0:39b:91d1:6bf3 with SMTP id adf61e73a8af0-3a08d8ff2b2mr42090665637.56.1777211903497;
        Sun, 26 Apr 2026 06:58:23 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm36558098b3a.32.2026.04.26.06.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 06:58:22 -0700 (PDT)
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
Date: Sun, 26 Apr 2026 22:58:11 +0900
Message-ID: <20260426135816.8080-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 14C9846A335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59632-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

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


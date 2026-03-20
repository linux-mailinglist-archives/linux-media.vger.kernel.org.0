Return-Path: <linux-media+bounces-56432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dw1pHbySvGkY0wIAu9opvQ
	(envelope-from <linux-media+bounces-56432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:20:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA82D46E2
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DA70300BC89
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B241E25F9;
	Fri, 20 Mar 2026 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu2njmvg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49A1D5CFB
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773966005; cv=none; b=NxjAtI2Y8glyzdxHMpWZPEN7R62rNd9o5ZXy4BM7soGWUtLD2TVK4D9wfM/Nr0hum57l1zDA9UD3SyXByi+lXjJx8HmaBAvdBekqhgAr04/l3GZBgbwRXOIXw1UMFoZGSRGIMmXSNL/94itNmuHz0B7W7AG4Wqj/Dv/BbE/P4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773966005; c=relaxed/simple;
	bh=gLQNx9glXF6hqM2kMDc3j1Sg/zalWdjszUK7zPegkZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZpopMsVp6iEALZ7DL5CsxGZO2kwsY8Ab+ts6dd7rDRfviIIHZXmoyBzuwHMwbNex5yZ7jWXcmcOCgBATkCTkUd6MCqsGu0lwE1zcALF/hiJVUIJ4prVnogLltaV+X6vMA31Gq35XZ9MReDzFh2PpK4f94e0DrXvWcrw/EZLR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu2njmvg; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a2ee65171so1462557b3.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773966002; x=1774570802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=gu2njmvgEsAawV6zbSZQTBlFW9Tn6B+EoIuPg+GFRNWx2lXiMTugyFJ98WLueKRYOq
         U1t3uhqrov/9fC7J/dKJBuDulMppWLDfJSBfruli01pk4MlsMCEh3BLAjhRvSY9ebMQp
         1aAv17P1CuQV9ScWyVc7vC++djFBmzoR9Vn7nSvIpDtQYchbgOAMnsTVbx1nNkkJ45Km
         rviGOxnj9kR6nn4y8DK+l2kpgP81hiQRINugvGqOH3+r9wfuxhyTT6of+94m6ajmZ47s
         4fSwiAN8pjda7X9NW2zR4zRKJVo0hY+pN+UbPPYRnr9nhgEEdYpabGbauLeLPuAbQiqq
         K5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966002; x=1774570802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=FU+5npjSkjnAeXw2cp9WNV5ALTbI9zEXUcc6ZSe1+apuQOUZWSdKljjiF8n1poPoof
         C7uUjI7UKlwMMbNDtreovj66VUlMaoFRs8z6cNDU1/UX+bLu0yTNYCsg3HZSp0qckAmk
         bVVjrG9pkvP+6UrIt5W8DI9npUVvgzxHAJYBnE/PeLMhYt8o16BgW9ViDHMRIBSmZ6OC
         u9wkJs8ObNd/Bv+wCn7M7iBjrM9INGx8fgJKNTtaOKxTMUqRupTUEBj5lM9zKrShdoFi
         40ev1QEyFKRrzq/LUdlRhKyZCb+Pg8Hz/SQl4X9lmhvZxH0zVmCbUNJFTSly18yjbPFN
         nDbQ==
X-Gm-Message-State: AOJu0YyuQkrL2RSd2yZfyGtLKzgWpX5TIwHMeBc8xLi/7OK3tM2emHDe
	Xl9Lnc/NiqJLecy9QdEsTEijf+Q0HTLry4/iURpYRrMXzCJFCh9z/Oa7IkREc7X4
X-Gm-Gg: ATEYQzzbKf0tr5fNPQX1EeUKln/JBq6dWc710Bmj88EqU1OZENPTKkuN2KnuO/6pGPD
	Q2OWL/u65hy/Xma9EMG7R3A/+oAGCnOWId13SMckD++w5bmxDLx+v3CSbpHWNOm4G6ReNE52hXr
	rJRkQU4fdNtySaPKIy5a0yQcGqH3rfCFGCeklLThSUb7N7nytyQ+bskYDGtnw7RvBUJgO3cx+MN
	YommMY5qpZdsDvQiQLCGSsZjr1aH+qrYBXA4Uz5pyf580mOVnAHeCQ44Jl7veJqeHSAlni+uEt+
	OM4jK7g09aLsAqQ4G6DqdsjXdo+ZpdnP6IsGH2edBRr1+OBDF0axMEhN9AVy+KUjm/XPCYUm2rT
	szexYnDYK4DfwnUZCJYNm92kPrTZUFJEDgYd2k9kzDn56UPSjWQ+IY1WED0QVHCA++pvHHepQ3p
	olHhc0GbZtgWIJhPlPWx6rjLHaoiXAU4SssDpsjIa7PB4CArX/VtB4mi4=
X-Received: by 2002:a05:690c:e3c6:b0:79a:65af:7f4d with SMTP id 00721157ae682-79a90aaea1dmr13698267b3.1.1773966002555;
        Thu, 19 Mar 2026 17:20:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a294fsm6866627b3.8.2026.03.19.17.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:20:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu, 19 Mar 2026 17:19:43 -0700
Message-ID: <20260320001943.19443-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56432-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.940];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49CA82D46E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..8d8ee1b3076b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,24 +459,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {

 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;

-	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
 	if (!isi)
 		return -ENOMEM;

 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);

-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;

 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0..99532efa4e41 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -286,7 +286,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;

 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;

 	struct media_device		media_dev;
@@ -294,6 +293,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;

 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };

 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
--
2.53.0



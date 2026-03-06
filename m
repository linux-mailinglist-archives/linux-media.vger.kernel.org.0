Return-Path: <linux-media+bounces-54689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oyaWLhBcqmmkQAEAu9opvQ
	(envelope-from <linux-media+bounces-54689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 05:46:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600221B817
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 05:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B6C3053752
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 04:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24970280329;
	Fri,  6 Mar 2026 04:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGXNTXEE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC0323909F
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772358; cv=none; b=RZXCbr3Dmf9UPuSqVpAeVPmYzu1tdLd71RzYspmnz19ANAPLOIkEnK2znili2atQXFDOojxoo9phbPRtwsWGxUxXSkoTIWBXZ8KGd/Bq9rGKK2uVO4MZW0bIlMq+P9fWlub8xRwKYmsRmqvUfFZlXf2XeWplP72DqfdQ609Bpxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772358; c=relaxed/simple;
	bh=xA8aQuqO9+A2QlChUKxhqBmLi0Md/XKikSYMta2cMfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aq8Rteej75CVnuvmfAo9FhU09icnxldIkNr4tNyKJUL7bmfV4xRWSIcfR3yXb99bvay+xHLLwmJwWeKWzYxiqZ+sQnO5LhrIWcJnZhNxRy4Wss89tQM6pRQw7U3mvINQVINxtKO5A8jzEsLBr06Gmndik+2UrOn6+yRrIYivcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGXNTXEE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae505619baso31284195ad.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772772356; x=1773377156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=QGXNTXEEp+6TbSuG2mJQ0eARDtM9y7nHSJ1EpXOtE7S85N8LjBCOmxQ6XIW7bl6Z8T
         tvBm4MTXnoPmTTDOdblvhzRVs9Q/7Zf8HZ//E/DyIIonLT51fV4DCNXTN2tVgVIQWpRk
         LkfanMDlHDtFt7DYo35EuNemHn7vQcHBkR4pjRQMCdJVl7SaM5+/Wq0PoSOfcZgE9NZF
         M2rC2YvQji5FhJt1oscFAucBKZhrNyJDnHH9LCUSovqfxXn9h8wX5xpJj8V7/D3jEN4p
         6sXnXFKfy+mo5cx1iI23OGXmjBj/XWmGW0ibvjY3FsB8w9JZQLqUYNNCRyu42WQkgv2B
         CyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772772356; x=1773377156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG3UCHbICIKoqorE0OwQsqzoYP9iJFn4dnjoO73bdjs=;
        b=eZqNFaiIEFWdRsS37fW4z2CFvFuBONxiX040Ckk9jlg1kt/fZrfwxLEEq+iKJ2NWUp
         JvG4WeRV0RlWB3dG5uVesDl35ZJX5pGkKe7tDyO+V0j+WSe0BTkz+VKbRPdBDS2e2t1t
         3t97Q+1GNOAmU71Tuja96fF7yNxh6Td27Rx4OdRUZMgJOtk0UDqQRv9odDDWdbNnCPEv
         okWcGk/R7KDpT3h9uE7kO72NMKfjzXvjRzhxoH0Tlz6e3l9wentOAvz66kFBUbT2EBT7
         CWy8uqu5IwnQKIum2os5KjeJJ/lKQwFn4jomh8S9iWkOyld/pjp1+Yk5UN39OokyEgCY
         8EyA==
X-Gm-Message-State: AOJu0Yz3DzJtXg1yC6sIv5b8HgpuUo1ZR5jcfvTFWJZcz5cNUhL0j/s4
	i7LwZukT0a/gQU7iXE27uw1zeFMmZkN4gAjgdyyOI9eRpWxa8x73ootjmwpo4ZrrcGA=
X-Gm-Gg: ATEYQzwjHg2UFAB/9Sn4tM53TigNlSs2hKYSX+jC+LQkWaqA2MloE07j3L0Y50ReGpl
	mFgAD5D5JXsGMDdgs0hhfpnN3BMTyujfDW/+Sg6Gf+hrLF0EPWOl3YYIVH7fR7RMT1QxPH9yeRt
	r1IUbmxDyd2Y5tn6BuIsbpWtEoInBZEFcjYlkb9NUt2vAcl6tdW4QnSogDgatyH4JHwhHofv6l2
	nptTAhC/+mZ1uTdr/dBLPsJIgxrSGXd6t4zBc/4UAiHx1JaUkqpeH77W5KQ4+0jwOxkBpDf6Crs
	Dsrl2jFunOvPxQPGaz5u9m/ZSa5KBFyXnTHPIgR2gQTGVeaKZHvzT0IKgc1FQQyGXKLUw2V4T9B
	/6CPSUP7Z9dtCdUSiaH7N6/WFB2qJk2JwPfAgG/MP7KAg6bqvtgAqxJa/aABW5UE5P6CsyxBypj
	7C9/5d3kif6mzgM37T2SCkknlkcOPToijypoJ2w2YtPQd/AbTe11bYSWg=
X-Received: by 2002:a17:903:2986:b0:2ae:8092:e212 with SMTP id d9443c01a7336-2ae823ffc26mr10568555ad.8.1772772356318;
        Thu, 05 Mar 2026 20:45:56 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm3927375ad.9.2026.03.05.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 20:45:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu,  5 Mar 2026 20:45:36 -0800
Message-ID: <20260306044536.149204-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1600221B817
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-54689-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Use a flexible arraay member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..657ffecc4d7e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
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
-
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
@@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
 
+	isi->pdata = pdata;
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
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



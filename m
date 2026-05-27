Return-Path: <linux-media+bounces-62854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BBV8DkenFmrAoAcAu9opvQ
	(envelope-from <linux-media+bounces-62854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:11:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780C5E0E15
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFB7E300E167
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24843D091D;
	Wed, 27 May 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="bRBsSZFs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57E3CF69B;
	Wed, 27 May 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869504; cv=none; b=Eh3DHbLfQSs0PwjRF1HBwtBT+tF6nt9RRA4iqt08G0KCNeM6mrBMI53rRGQcQMAoOQKN5ns8SqMegEKHCcDcA7QSmPJRTNFLm4LpG0Au/Ht4aG0ftP2NNlscO+a/8KH4vz7ff4UD6jD1uJq7C7UYpqkX4XH73zGZo6Bk1AjNsFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869504; c=relaxed/simple;
	bh=W0kvwb9oYI7nmafkyR4U8Vul+N3DYx3OERr2MYEtH+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hd9UI9w6p4quuJj7ufQBGQYWW1N0DtXHlDz9xxNbo0v8Ncc+s6++uUue1Px6uZ0eJQ8Cs1yYnzo/pHyqZaoDFRT9GNsZi2g/BAvQDTORT22+n217VLZ0S9Z+aN5q4O+st0yagWCmrxAepa7KyxSy2i80yAo2Wr8pBV+SLl0TKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=bRBsSZFs; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4001c3292;
	Wed, 27 May 2026 16:06:26 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: mchehab@kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Frank.Li@nxp.com,
	martink@posteo.de,
	rmfrfs@gmail.com,
	kernel@puri.sm,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: imx8mq-mipi-csi2: fix memory leak in imx8mq_mipi_csi_probe()
Date: Wed, 27 May 2026 16:06:24 +0800
Message-Id: <20260527080624.1717938-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6878795a03a2kunmfa06458432849
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh0dVh5ITEpOHkxLSE4aTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bRBsSZFszClz8dqsA7AGBJppPnp7fWke1w0tluA+26XTIxjYs+d8dTxAVzw+3pc6tiUY8xvlmReUh1t7yuNOCNpTVQFLLoQm+mXHwmjC9IVFK2W5sb2Ni7snC/rNg95oVgSQzedjjMoJ9p8VmxogeJQdZVlotcNMHZpdMK9VTeQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=u8Wo8LLSY0pPyy+dyeSotUY0OkUOTz16hb7bl4GVtIM=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,seu.edu.cn];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62854-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2780C5E0E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If imx8mq_mipi_csi_init_icc() or imx8mq_mipi_csi_runtime_resume() fails
after subdev initialization, the function fails to release the
corresponding resources, leaking the subdev state and media entity.

Fix this by introducing a dedicated subdev cleanup label and routing the
affected error paths to it. This reordering is safe as the consolidated
label chain preserves the correct sequence without affecting other
execution paths.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do not
have suitable i.MX8MQ MIPI-CSI2 hardware to test with, no runtime
testing was able to be performed.

Fixes: cd063027c304 ("media: imx: Unstage the imx8mq-mipi-csi2 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 04ebed8a0493..e5a062cc0788 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1016,7 +1016,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		goto subdev;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -1036,13 +1036,14 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 
-	media_entity_cleanup(&state->sd.entity);
-	v4l2_subdev_cleanup(&state->sd);
 	v4l2_async_nf_unregister(&state->notifier);
 	v4l2_async_nf_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
+subdev:
+	media_entity_cleanup(&state->sd.entity);
+	v4l2_subdev_cleanup(&state->sd);
 mutex:
 	mutex_destroy(&state->lock);
 
-- 
2.34.1



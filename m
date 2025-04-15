Return-Path: <linux-media+bounces-30285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E502A8AB5B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 00:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D98D7A92B8
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 22:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6350129DB7F;
	Tue, 15 Apr 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="g/2Ue5F9"
X-Original-To: linux-media@vger.kernel.org
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9542F85B;
	Tue, 15 Apr 2025 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744756768; cv=none; b=RGPWPRkQQw37FtcP19wLdIKyvaFi1Gx7EyfJY6mlp+bdnxyR41GPt61w3WAEBDeKjkaRPPSqZWw+heMaSvLoqWUqRhl2M/jeDIyC8ghd83+c29XqrxoP2hK3ALtyHtKaxOVIASKcbF9PVU8j0cZ3fkuOMLWQSZDvIuJw95E28a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744756768; c=relaxed/simple;
	bh=HGgiTKuz6fTkn2W1Nij7sZrx5fu0Hev5BRI3MpGp/tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AF2lEHyhUnqapDclPRG9psP9jqjaeSug8rAwS63YH4UytddU7GiR2M7PySgXHQrTYdSCEQnnIOI09f23eNARi0w5z5V2keiK5O691yGFuzda3N6tXTfAZ1E/cv8GYvpnOEym69q7KLlUzJo+dez5ixIP/o7a0C8AIkprL/8NLNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=g/2Ue5F9; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2ea3:0:640:da3e:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 81D1360B58;
	Wed, 16 Apr 2025 01:39:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id EdQWjM7Lj4Y0-TaeBD124;
	Wed, 16 Apr 2025 01:39:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744756756; bh=lIDEcloucTOb7Mqq7+pHMqI2mzNKrIQezOUzsqaaDzs=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=g/2Ue5F9j9lSxSNruMnmCAhFYXGpIOUv9xYr2J+2OSaEB5bt38GAv8ISb2CoLmDK5
	 gmqER7ueb43Vq+cqVzYaNYiOOmdBgevSdjiXavXA/TR3BkT7rwjiaj9QJ6eAoHY4DS
	 xCkTLDPCT/LWBDS1hZ3x21S4B35JKm0FqSspPx/4=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Dmitry Nikiforov <Dm1tryNk@yandex.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Johan Hovold <johan@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: davinci: vpif: Fix memory leaks in probe error path
Date: Wed, 16 Apr 2025 01:38:20 +0300
Message-ID: <20250415223825.3777-1-Dm1tryNk@yandex.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If `of_graph_get_endpoint_by_regs()` fails, the probe function currently
returns 0, skipping cleanup. 

Also, if an error occurs during the initialization of `pdev_display`,
the allocated platform device `pdev_capture` is not released properly,
leading to a memory leak.

Adjust error path handling to fix the leaks.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 43acb728bbc4 ("media: davinci: vpif: fix use-after-free on driver unbind")
Signed-off-by: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
---
v2: also fix of_graph_get_endpoint_by_regs() error path (Johan Hovold).
 drivers/media/platform/ti/davinci/vpif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index a81719702a22..4839e34e5d29 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -467,7 +467,8 @@ static int vpif_probe(struct platform_device *pdev)
 	 */
 	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
 	if (!endpoint)
-		return 0;
+		ret = -ENODEV;
+		goto err_put_rpm;
 	of_node_put(endpoint);
 
 	/*
@@ -527,6 +528,7 @@ static int vpif_probe(struct platform_device *pdev)
 
 err_put_pdev_display:
 	platform_device_put(pdev_display);
+	platform_device_del(pdev_capture);
 err_put_pdev_capture:
 	platform_device_put(pdev_capture);
 err_put_rpm:
-- 
2.49.0



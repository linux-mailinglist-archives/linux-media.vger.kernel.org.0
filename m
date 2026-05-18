Return-Path: <linux-media+bounces-61995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEftDHYQC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:13:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8A56D633
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADED63036700
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28F6480943;
	Mon, 18 May 2026 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUWkxgus"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB53A33C18E
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109396; cv=none; b=s/8Idzm4TmGin8gCkgZbQKpl5cRsjnMKzyswz3zIH9U2jugPubOhBN4NGGkJjtEWCdKHS+44UXdo3NNvC20WWnyPZu8NCTRhhqiFrAnVl/By2FQuAhk8uI/dIieFhJZZaSFz/2QEZT4WilHgkj6SChgdj58CbC5jIrQlngoSWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109396; c=relaxed/simple;
	bh=wssxgGrG4IDoGJpbDk8e0YhsxqyFUXYrnmnvjioRl3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUZW5lu5/p1Pppc3E+6TMgr7PQjzQ7FABXSu+fCypsVxooIKk9Jgg/Ys+doopPWda+USgwPUgb1NUDQDWTrEML6Ozn2aRrA5DFSAzjVEFKq7MiYU6ROQtWbk6c6tD39lyUoTkMed3wFaL5a1Y2b/8K/owScOmtBTkzGP+EyTBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUWkxgus; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bc85eda6b6so9995125ad.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109394; x=1779714194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=kUWkxgus8M7tfQnXCNl4dgbQeXAmoi6TzUR9/RqzdGDJ1ViQUrnkwIXLChEhcJa3Ax
         oxL6V0QiiibO6tc/DTLQs2iMVndIgJCNKpDFL7yG0/tIIBcDGMDJOw0phBPwuJPNTHD/
         WoGRMdOaiMabOY3ZpMukG4L6Aw5kz9nXWmswhZcQJpLVLSClOZfLadJx/A67ZxEfQYd0
         BHah9GCrVtMBSC3uhJ1c7pxDDckTmtej7QkrP17YyaQcoj0lpvfudmd6FB/Pwo/Kol9N
         HezlFV6qiGalfXdmElkYEjrdGvR+M2vrHqJU7mauhwGQwkmj0cN4OUUxd3bzHKvc0Aqz
         JDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109394; x=1779714194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IrfhLvzq8OFRdclHXEtAh9TYJ/Z5qr3AsT/nk30p7k=;
        b=nX4KFDy9GdjtXGcXoIfaF2aNpoSj0s6MX96EArVtTEJF573qu6uQf/CFE2ll5Ebu/Q
         onid31Y/DjAZ3ultujIj4LwLBL0dXpjIWrXOGvx8BVAMzuMwoJMO+8CwBDoWgqufQ6r9
         bmvXUJwrNIexbPmrIcNH6h9lAb7Nb3tVeF5zv0DLoXkEiSoaDbgQzwqlCzIuelgu8BSK
         ZsXfucME1sLs7c+Xmxp4b+1rdXOIfVTlo6WhBL1w9LxQ5BqLZxn+ATLoq2Msk7/C2LTb
         V+ejVNUjAJUYuurpkQxpPPFjjD9eS5vr498oiGa0qtTKwoCmpeSH310cz/ffKl8X3Jei
         6BfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/l0CZc0PJDsCxOlua8GFWYBllAKWrkNxjvtXXtk6NkvZb7A+r1OEJOdyENVeDYU+tks5Y8hoaLrO2Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQlGJOiBPqMqKodQIqRm9PpgADcfsBZ9KYsC6pBMCygssi2Ap
	FWHujt9I79cElTxK0aqdciaBdiCgz5ykaGdnU5rA2+5unBUedhZzUxLg
X-Gm-Gg: Acq92OEtp6QeynJZbyh1VGmypIxYERtNaR9bFGzCadvBZeOU1icxs4OG/PXcafGXp0r
	5QS3EemCcSTrU2cX6twKZoFnw38bN1O1O9MpuKSYr48m/WnwxBaTAA/vA6+qEBjA6B8mo/IX1bV
	3/TYJDjoDCqk6Z8m7vGxMOUJ4mexbHkUBqQlPNOA4L1QXxiJ0rhXG6D9ki9BEPAq42mUxFAm5o/
	uK/QcKsS1M8mnmURZc4vaHbCV4SBwoIwuj0k6OUKDfFEFtCoiH9EZDs5bddO7elT1SROnxzA1BX
	17LghPOrZp0vgPzrQbc2sYqmThXcL+aI+YqKc695e461u174wgqyT611HodykOPIccDNBuoA4VE
	5V+HiI09HE1EyMGvocXwOLTfv+N8jpr148iyyXSWqy3aNJEV8T61eGld2mfzEh+iudKABnsD8Yl
	IqtaQqN22VDFhb
X-Received: by 2002:a17:903:28c:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2bd7e8fdd1emr162494125ad.24.1779109394031;
        Mon, 18 May 2026 06:03:14 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm159283565ad.82.2026.05.18.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:03:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: imx-jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 21:02:59 +0800
Message-ID: <20260518130259.1001956-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3D8A56D633
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61995-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_register error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  mxc_jpeg_probe()
    -> err_vdev_register
       -> video_device_release(jpeg->dec_vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free jpeg->dec_vdev through
vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
once from err_vdev_register. Restore video_device_release() after
successful registration so the registered device keeps its normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b442dcba02e7..fe8a373576ef 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
 	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
 	jpeg->dec_vdev->minor = -1;
-	jpeg->dec_vdev->release = video_device_release;
+	jpeg->dec_vdev->release = video_device_release_empty;
 	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
 	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
 	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
@@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
+	jpeg->dec_vdev->release = video_device_release;
+
 	if (mode == MXC_JPEG_ENCODE)
 		v4l2_info(&jpeg->v4l2_dev,
 			  "encoder device registered as /dev/video%d (%d,%d)\n",
-- 
2.43.0



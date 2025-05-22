Return-Path: <linux-media+bounces-33147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F228DAC0E1A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564851BC186C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4F213AA3C;
	Thu, 22 May 2025 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E4ciBaxd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EE33F7
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924220; cv=none; b=ZbBJ491aEQy1XD+4CR8BXPNspMVBn4RTmYrcJPbU7b1kG5T4WysZW6DZunClreJTcUgM8vMrr4UooDLO2OXNcEery8TuEwnYij9fcIt3khzbnFy2y67W5IOXs6W6foZWD7u03enBQKe6kQ6XlV3oj7uXD08dPVqrdpSlsMid6f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924220; c=relaxed/simple;
	bh=wckcvoDCtVYuVQ45Vmpb0HC8Y3wDYK2Ihiq07qgCo8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nJtJWHmocI7s5cSbtx40mAyUpNoUQLHiqltnmxAmQ/E7W1gNl97jCKE0hNDfUeq1TlT+MM0UG7vH5D7K0B0Qa3xyx1JREQwckwoEd9glkFG0aAgAyE4tdbVUzbrKx5osg+3WDupL/VhwS8J2C/6gAc3Dzy8oMuRD3VwIiHl27iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E4ciBaxd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1249605;
	Thu, 22 May 2025 16:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747924195;
	bh=wckcvoDCtVYuVQ45Vmpb0HC8Y3wDYK2Ihiq07qgCo8c=;
	h=From:Date:Subject:To:Cc:From;
	b=E4ciBaxdzUuNJthh5HtadlpLiY6WWDFJaR06D3BNyJhoWW66pT2iogyLDfu35es+H
	 a+/e+NTZ7pNXO7CFXvFyhJsX2Oehmt8QscKoQ/WsAPTws8Vup2ZcMUrslJWAiWP7kR
	 jd1n6zVMQmXobR7TcR4ufw4JIcnnk0opFkK/YK7E=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 22 May 2025 15:30:08 +0100
Subject: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAO80L2gC/x3LSwqAMAwA0atI1gY0UBSvIi60TTXijwZEEe9uc
 DkM7wHlJKzQZA8kPkVl3yzKPAM/9dvIKMEaqCBXOCIMc1LfL8uNsl41GsAoFytGDhQqH+NQejB
 +JP6H6bZ73w8V4gWbagAAAA==
X-Change-ID: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=wckcvoDCtVYuVQ45Vmpb0HC8Y3wDYK2Ihiq07qgCo8c=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLzT4FA2xMRgW+1iOA/DWAUW2zv16JdLFCB8IL
 NAHJxAkUCeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaC80+AAKCRDISVd6bEV1
 MhrlD/wJW0XoG+ZwSn2u/l3SJPS1irfWIGnsuG4FaEnkWe5S8ViGOT1uKTAIWOX5Ih9j6Ab8kuD
 LryH9KAoBz7efLTDwE9EqkD77giZk2gmrzf1AQ14TGlLBygcXPi9eQY9VfrD2gKnCQourpIWLoN
 5G3tbE7tmnBIGGVX1Pq5SswUOElRNc4TKt4aq5jZqsVeKxESFpUWWTG4atsDhDqmjy6mWwqmZWF
 NddgYNAteNafnzejnyNlG7MeENDeLWaamGDzJ/+hH/AlTdDO0tz4ud8aqrNnkAeCrMHn/knk8mC
 ze/uj+K0XbPwkqQpgeo6tiNrVWpGfk+NRuL63XBlbEjC1XGbQmbnxQbYNNqc2hXChbwe6v6nxY+
 vdA8MRfvsjo/Ogz8x7eEzmoABmYnkjUbp0kA8vpc13wb+RdxKjz62WrFKI94a9pqgql9rRl9O+n
 egMZi/M/tkdEzH4f6W2HuWUPLoe6Gx8SxvZu2xFPYugnP4Yg7Tta8ukr01pK0fno2EYWK/+ahkN
 AWmKW5LM/XlLaR3G9BN9pQ2RWy9miU/xLQXNdbOHG6lWEG4+LaExrsej/DfHFGH59fB4AtAw/iU
 fMw2boDIoA43LCRsXDgx2J3MhGy4S3yMs5WF3FCmG8N3I+ZI2kPwH2cMLKJ3YbC+UBmVG4Al8Ma
 3cZ72ap908l1L0w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
the video devices are not cleaned up in that function's error path
which means they're left hanging if it fails. Update the function
to clean them up properly.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603a71f0427e82a997787110f7e4ac..4a74b988217f504a03dfe330a7bac76cdecc933c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -154,7 +154,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 		if (ret < 0) {
 			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
 				ret);
-			goto err_v4l2;
+			goto err_cleanup_pipe;
 		}
 
 		ret = media_create_pad_link(&isi->crossbar.sd.entity,
@@ -164,14 +164,14 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 					    MEDIA_LNK_FL_IMMUTABLE |
 					    MEDIA_LNK_FL_ENABLED);
 		if (ret < 0)
-			goto err_v4l2;
+			goto err_cleanup_pipe;
 	}
 
 	/* Register the M2M device. */
 	ret = mxc_isi_m2m_register(isi, v4l2_dev);
 	if (ret < 0) {
 		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
-		goto err_v4l2;
+		goto err_cleanup_pipe;
 	}
 
 	/* Initialize, fill and register the async notifier. */
@@ -212,6 +212,9 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 err_m2m:
 	mxc_isi_m2m_unregister(isi);
 	v4l2_async_nf_cleanup(&isi->notifier);
+err_cleanup_pipe:
+	for (i = 0; i < isi->pdata->num_channels; ++i)
+		mxc_isi_pipe_unregister(&isi->pipes[i]);
 err_v4l2:
 	v4l2_device_unregister(v4l2_dev);
 err_media:

---
base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
change-id: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>



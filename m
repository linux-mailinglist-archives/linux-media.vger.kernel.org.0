Return-Path: <linux-media+bounces-16168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CE94FD6F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 07:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 381EBB2111C
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 05:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5348364CD;
	Tue, 13 Aug 2024 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HaqqZoMg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420822611;
	Tue, 13 Aug 2024 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723528336; cv=none; b=aORho0Yn1AmpXhvfqB0rRe16BW+cBhL3gvzN4TkY/Zyv4a5KjlT0Pl0xOtIzGhE/4kp+uwNVxZ2gz7lkgFP+5lBxLs6k3dCjF1KpuT5ywVAgT13uTw0wTnI1o6YIeToNqa9DKBgvTW9zYrF8198SiA2lTBvvU8sORxco4J3bXs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723528336; c=relaxed/simple;
	bh=fZo2f64SMoI4I/G46zBjcduVGqepf50nkJW+RhmZ57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CWbcNK66/y9Yn9XR6DmIf1TspOyGCtP94wrvvb23E3dbKSMpD0may5+vK+bQqpFAY1GkOA7Pc3NmOFEK8zl9VpjKosIHqyo33QMojeWdvEoC5QeTt+WnyhfcwMbopNSOUKeTDjNdG/BEPUTBEuEAGuuCzJZEGZH/M/YrRhCvrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HaqqZoMg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99D4563F;
	Tue, 13 Aug 2024 07:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723528275;
	bh=fZo2f64SMoI4I/G46zBjcduVGqepf50nkJW+RhmZ57U=;
	h=From:Date:Subject:To:Cc:From;
	b=HaqqZoMgEizQXNtfluIabrUr660RoyiNBazwFiH/YVIZ7olYnNxcTSyMSgYR9p3VA
	 awv/uy8i+Dj3w/lWUZA+fIVonjmivopB6+vFUIz3WsUCnspdq2RNqKjLMD/yAzQ1/Z
	 MrDasMw1cKghyZ/8NOQrSgg4a5cTWkXvs32ju2JI=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Tue, 13 Aug 2024 11:22:00 +0530
Subject: [PATCH] media: imx283: Add 3/3 binning mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-imx335-binned-mode-v1-1-edbb3718ab0f@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAH/0umYC/x3MOwqAMBBF0a3I1A7ERPGzFbEw5qlTGCUBCYh7N
 1ie4t6HIoIg0lA8FHBLlNNnVGVByz77DSwum7TSteoqw3IkYxq24j0cH6cD953VtgUaOyvK4RW
 wSvqn4/S+H6TMTKVkAAAA
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umang Jain <umang.jain@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723528330; l=1506;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=fZo2f64SMoI4I/G46zBjcduVGqepf50nkJW+RhmZ57U=;
 b=3Ceac+iv4dl5X+iY7USVMlfU1seDCfnGPMxxv/ClZkJ9oHZ1Nfw3c5gbzVVQVygNr8CV5wqEp
 d/7DKnYzzgfB42ckhNxfs5KrlUc6CY/bOwa5T2ymblwd0GMzG8xcNma
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

IMX283 supports 12-bit 3/3 binning mode with 1824x1216 resolution.
Introduce the mode config for the same.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Patch to introduce 3/3 binning mode - 1824x1216 12-bit output.
---
 drivers/media/i2c/imx283.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8490618c5071..94276f4f2d83 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -465,6 +465,39 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.horizontal_ob = 48,
 		.vertical_ob = 4,
 
+		.crop = {
+			.top = 40,
+			.left = 108,
+			.width = 5472,
+			.height = 3648,
+		},
+	},
+	{
+		/*
+		 * Readout mode 3 : 3/3 binned mode (1824x1216)
+		 */
+		.mode = IMX283_MODE_3,
+		.bpp = 12,
+		.width = 1824,
+		.height = 1216,
+		.min_hmax = 1894, /* Pixels (284 * 480MHz/72MHz + padding) */
+		.min_vmax = 4200, /* Lines */
+
+		/* 60.00 fps */
+		.default_hmax = 1900, /* 285 @ 480MHz/72Mhz */
+		.default_vmax = 4200,
+
+		.veff = 1234,
+		.vst = 0,
+		.vct = 0,
+
+		.hbin_ratio = 3,
+		.vbin_ratio = 3,
+
+		.min_shr = 16,
+		.horizontal_ob = 32,
+		.vertical_ob = 4,
+
 		.crop = {
 			.top = 40,
 			.left = 108,

---
base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
change-id: 20240813-imx335-binned-mode-98b2b7ee5ba0

Best regards,
-- 
Umang Jain <umang.jain@ideasonboard.com>



Return-Path: <linux-media+bounces-9276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E98A4554
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 22:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7CA41C2048A
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 20:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84220137767;
	Sun, 14 Apr 2024 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="0ZdcIHfy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta254.mxroute.com (mail-108-mta254.mxroute.com [136.175.108.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDBA137C4F
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713127303; cv=none; b=OOv6URKCv2Qz9Ei7KlvHDcT879LceTqHLSUVzTjXvR2lc9svjpld9Rhv6v0U3t8eAjWevKfzH8bIaA1m1NUVuAJBjGMU8AxWUM5FACgi3TAiVT4+xNgIQUwolsR2KcSN6HNz5ButBF60Ygo89mmEasO+QIWFuk5F9PpYlGN0o4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713127303; c=relaxed/simple;
	bh=t0DpAm14I63PD+zKjpelnQ5UomdKi3PfstUiSulsvmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLOkK/qIVSG3G5XwhepFbIrKJw2bQfmumbV5rZl+mqMaR1R6Hoc0Jz3two3vZg96VWDWG0QO/2u/C0jFE2pajo/zyVmKk4Viwthx+hlGm6Sqv3GfJi1sakFa1mRhfOYT9lGK0HFcw4SxW1gHnBpFeRaoetbKDjDgBrfrW+/KMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=0ZdcIHfy; arc=none smtp.client-ip=136.175.108.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta254.mxroute.com (ZoneMTA) with ESMTPSA id 18ede52a0a20003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Apr 2024 20:35:40 +0000
X-Zone-Loop: 1960c7703bbafae61d0f7db60cf65ad2603be78f905e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mc+RbIL+DgqYcfe/mLvPif24eMzEBPY7cltm4NspsTE=; b=0ZdcIHfyqjWZ83Se9/aB+qVxIA
	lqMCH77aoDsBdApo4joS2n9HTe9uKxYDJ6p7FPqPYzWyasQJJk8ekIPP9Nx7ReaToySHBVSln75dq
	gsnGwnj7FqHm4a6UYh1hmhYBL0mx+PV3g0TZMbPzZLN5uyCe/BWghOk79MpwcO0KpJDguWQbpj2GI
	gO8qQdOUyBR6aSnlbNMJ5wfMviAq1W5c6Q8bePXL6Kek9PjqYA4wG5vorFw30nzYjzGO44mmHLpCr
	8Vbplzv4brPiAd7qlGBiOdGmlhyl+KssXJKQZ6IZ9MvXW9VkedBDAZODtTmgZ4Vk87QNmQ3jZPUW+
	8uUUwyzw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v4 14/25] media: i2c: imx258: Issue reset before starting streaming
Date: Sun, 14 Apr 2024 14:34:52 -0600
Message-ID: <20240414203503.18402-15-git@luigi311.com>
In-Reply-To: <20240414203503.18402-1-git@luigi311.com>
References: <20240414203503.18402-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Whilst not documented, register 0x0103 bit 0 is the soft
reset for the sensor, so send it before trying to configure
the sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index c1a2c2406aaa..9c83ba1232fa 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -20,6 +20,8 @@
 #define IMX258_MODE_STANDBY		0x00
 #define IMX258_MODE_STREAMING		0x01
 
+#define IMX258_REG_RESET		0x0103
+
 /* Chip ID */
 #define IMX258_REG_CHIP_ID		0x0016
 #define IMX258_CHIP_ID			0x0258
@@ -1052,6 +1054,16 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	const struct imx258_link_freq_config *link_freq_cfg;
 	int ret, link_freq_index;
 
+	ret = imx258_write_reg(imx258, IMX258_REG_RESET, IMX258_REG_VALUE_08BIT,
+			       0x01);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to reset sensor\n", __func__);
+		return ret;
+	}
+
+	/* 12ms is required from poweron to standby */
+	fsleep(12000);
+
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
 	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
-- 
2.44.0



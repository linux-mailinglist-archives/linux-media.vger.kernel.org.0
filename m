Return-Path: <linux-media+bounces-7999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777188F1CF
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B951B1C21762
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 22:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0032F15443A;
	Wed, 27 Mar 2024 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="u0ItyWUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta49.mxroute.com (mail-108-mta49.mxroute.com [136.175.108.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47E154435
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711578370; cv=none; b=B0pdS9crFzQ2Hq0aV10aXZbo/4Rq74QikIID6CTCuLH7MynLozuBQ76BtvAg9CDJFwzITp6UsQJueFWfv9F3hqUi0WqV9xp7+uYiwUUZGVaSunUW7Pf/rQ5kpg0STOoMg/yuGIK4z+3Pi1swrp4a2b0IkoVfSulY542loiZcpwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711578370; c=relaxed/simple;
	bh=3Os/T7XYPPuIQ9wkr2Su5Kx7M9odE7Rv2QP5TKP3BkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaADIRyNbdSVHcC9XaSJiEIuEvkSBJh+lgawFz2mAFcPTNqjZjwok8QAGkg2xtwoN/ufSJc2GqhgQah3bVOXCMGbQ+IkT7SUU+5m+0G6Skb0t/EAlyHxoiScnfPTztELM0twRt6ld6v2oJxutm2QXGzTCLTlpcZjfXs4Vsc58ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=u0ItyWUb; arc=none smtp.client-ip=136.175.108.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta49.mxroute.com (ZoneMTA) with ESMTPSA id 18e8200738e0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 22:20:51 +0000
X-Zone-Loop: d8b053442ad62904a278918700941c46136e02bad003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KW1mmB+UsQBWu80vviFCvkS83K6yY9xI4ffO4IjmdFk=; b=u0ItyWUb09UfcJxkaIveclCfXh
	xBOlan1n/02oKFXfvTm1s80u8WWKXF/2XsJUUc4r04bycRw+nrXanaRi7LA2/Z+7uDZuwITZ4GL6r
	4qTyvTEAjeIK2t8ofXNg0LY70w20wWaA/XjhhuLGvRgBKErQYUJxED7hV8L/fXTUSAAfvVlCtHrCz
	Qg5CGjGpOw85bi9JkaxzCc/eRQ0rw6fA6//7GKM8TU/phxx7ueujmMi3hEq0tuIuY2TJqIVyL4HIt
	oVNl5uQnN7uFT377WZaE94XlhJKX1nyBNotWQ0/7mZNmOl5EwrezJ+QQ/+bSW1Hux86eWwrorPB3l
	s2jHPlmw==;
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
	x@xnux.eu
Subject: [PATCH 03/23] media: i2c: imx258: Disable digital cropping on binned modes
Date: Wed, 27 Mar 2024 16:20:15 -0600
Message-ID: <20240327222035.47208-4-git@luigi311.com>
In-Reply-To: <20240327222035.47208-1-git@luigi311.com>
References: <20240327222035.47208-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The binned modes set DIG_CROP_X_OFFSET and DIG_CROP_IMAGE_WIDTH
to less than the full image, even though the image being captured
is meant to be a scaled version of the full array size.

Reduce X_OFFSET to 0, and increase IMAGE_WIDTH to the full array.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 4a7048d834c6..0ae4371940ca 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -340,11 +340,11 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x20 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x02 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x6A },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x06 },
 	{ 0x040F, 0x18 },
 	{ 0x3038, 0x00 },
@@ -459,11 +459,11 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x40 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x06 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x64 },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x03 },
 	{ 0x040F, 0x0C },
 	{ 0x3038, 0x00 },
-- 
2.42.0



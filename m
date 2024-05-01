Return-Path: <linux-media+bounces-10546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732E8B8D04
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 17:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77FBD1C20AFE
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5E712FF64;
	Wed,  1 May 2024 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="rn3vLPxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta89.mxroute.com (mail-108-mta89.mxroute.com [136.175.108.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16C12FB18
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714577433; cv=none; b=nrkDrf1p//SwSf5e+0aOJZrbZcVDSqrkwt2gklpSMJWnjmn/usxDFoCcLnfpAD3716q0ZE4CZpvFY6OVo+q/ejBKjqP4dpDL3BQx9XkvZWkXXPUs+5xwY3e0tWK1dHfaH9g2UjJC4keac0KVO0YaJpf6r8q8TN8B3tt57e8lKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714577433; c=relaxed/simple;
	bh=pWHVLRfYub4vLHZQ82uqXL9w4o6X1xxrAcCbjuVxJt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCnq75I8ciPi6cTZR1JIz56qx0YFyXBZ7hO5BjOLgE8DYaQsbF+omNtX2l/bQJGv7LmucGdd+WOq+/QvYr5LMhy3nav75hkd9Pz3Emx+yXpzTVTkHQVDTid8FoonzLXlKOhTlNcrmAoShFhNpIJTJwkdQiIbA7JO48lLKEaB48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=rn3vLPxU; arc=none smtp.client-ip=136.175.108.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta89.mxroute.com (ZoneMTA) with ESMTPSA id 18f34c2497a0008ca2.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 May 2024 15:24:59 +0000
X-Zone-Loop: e373a67bc7b2c5d89d2d11250cf181c0825672b4a859
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cGenqqyPt/Fp5kIA6u0AGK6xiTKXiqyafdjUpgpFSv0=; b=rn3vLPxUmeNM0pNho0lEnMMp3J
	A2BOPtoDTwcU6fjILsOSsbz5b0lhGEoK4BPDcmLE+HWN0rRfuqhbfR3VGZk/ii2EKILBM/wpWNEC+
	tP9w4SyX6uetYiPkgUZ5/eNS11QMWUbDYih9E/h8mqYy37eCWdxkNAgVddDe1YDjcEUVm+152BDsQ
	/CIj7CgNTGwoWek8gwwX7cFCfpO4eLcDEwRIk7Rc3rytzxJ4PapPuxq43IC866VaGDcy+nLx2fXPM
	UWhNY1ewsbXwYSOZH5mqTv6K3UD6O74N5CbJNjj+IGg92Y/g2L7OQ21YXTMgv0Y6XaxKKSfACFOmS
	A6BzEd8w==;
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
Subject: [PATCH v5 04/25] media: i2c: imx258: Remove redundant I2C writes.
Date: Wed,  1 May 2024 09:24:21 -0600
Message-ID: <20240501152442.1072627-5-git@luigi311.com>
In-Reply-To: <20240501152442.1072627-1-git@luigi311.com>
References: <20240501152442.1072627-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Registers 0x0202 and 0x0203 are written via the control handler
for V4L2_CID_EXPOSURE, so are not needed from the mode lists.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 0ae4371940ca..df7ed4716762 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -237,8 +237,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x034E, 0x0C },
 	{ 0x034F, 0x30 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x0C },
-	{ 0x0203, 0x46 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -356,8 +354,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x034E, 0x06 },
 	{ 0x034F, 0x18 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x06 },
-	{ 0x0203, 0x2E },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -475,8 +471,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x034E, 0x03 },
 	{ 0x034F, 0x0C },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x03 },
-	{ 0x0203, 0x42 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
-- 
2.44.0



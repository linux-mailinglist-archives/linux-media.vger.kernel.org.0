Return-Path: <linux-media+bounces-44454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E70BDACEB
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0F774E64C1
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BA0305079;
	Tue, 14 Oct 2025 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3I89KlS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ADF305056
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463651; cv=none; b=l4xNcs+XdRNNgJffNzQSxQafgFf8UtMmaGB38AqS4AADJefuNfi2plb08Qvz00S+PjWlYSNfMsG8qgRTYIP1cuFSQ5bZ0X65Sx0yxAYrOAQb0VNXc/J37lDgdOfNZ8Q2dbrv+Kb6267aLn8n6KDuWjG9zSeV5uvPvc89YZam0PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463651; c=relaxed/simple;
	bh=clNfsBdERsynZ5rDOaBcKTnb2VCISrq8BtXh+YwakJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STchI0cJCDNt3glp4dad9oc9/KqejC9E1toisoObtkrVZIETze+N7CY4xu28mYc2NCiXPUQXuuK5YaLAD6mXuw3cYimtH+r4oII+xdGe03KIeD5E0iafZ4LPkKTO2Ik+t7cBMixNgLiXfNQ8flN9PYGFD2hs881kJ9FopDBkRDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3I89KlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75004C113D0;
	Tue, 14 Oct 2025 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463650;
	bh=clNfsBdERsynZ5rDOaBcKTnb2VCISrq8BtXh+YwakJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y3I89KlSySgzmYi20PowTYDVDmCFEssozuyG/Mecp1Lq7G7Fr4mzJc7C9gB2hShuh
	 +v16zTXFa51AYYDvfSb9x6KqTK1qj1rkFJdq48wTaeuN9077SbGJSbWcm8TDg+Xpr3
	 /7yp/ozjCNunylYbYcgNC4akuz4kFYvewZTmhuEGlJ+YmQwrjbOQbjJ4xvz8OPBmGX
	 /9ZD48oYcE2ooAREU6LGX1WECPECeqrkjAuYXlwP3lF8YjN/koqV8J6oIjKzma1lTG
	 kceyEPrPb3GqWSEakchI67ustCZA+UGPnEybWcg7bh1xbXgAiaGYqYmAsgKl/v6NRx
	 weHSndbuMqrTg==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 07/25] media: i2c: ov01a10: Change default vblank value to a vblank resulting in 30 fps
Date: Tue, 14 Oct 2025 19:40:15 +0200
Message-ID: <20251014174033.20534-8-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov01a10 is quite a small sensor, which does not capture a lot of
light, increase the default vblank so that the sensor runs at 30 fps
by default, doubling the default exposure.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 733e5bf0180c..0ae23d435a65 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -34,7 +34,7 @@
 
 /* vertical and horizontal timings */
 #define OV01A10_REG_VTS			0x380e
-#define OV01A10_VTS_DEF			0x0380
+#define OV01A10_VTS_DEF			0x0700
 #define OV01A10_VTS_MIN			0x0380
 #define OV01A10_VTS_MAX			0xffff
 #define OV01A10_HTS_DEF			1488
@@ -191,8 +191,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
 	{0x380b, 0x20},
 	{0x380c, 0x02},
 	{0x380d, 0xe8},
-	{0x380e, 0x03},
-	{0x380f, 0x80},
+	{0x380e, 0x07},
+	{0x380f, 0x00},
 	{0x3810, 0x00},
 	{0x3811, 0x09},
 	{0x3812, 0x00},
-- 
2.51.0



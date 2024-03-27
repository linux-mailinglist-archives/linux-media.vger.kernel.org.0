Return-Path: <linux-media+bounces-8037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC788F31F
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E868CB225CF
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECA415696F;
	Wed, 27 Mar 2024 23:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="dLhz1N/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta35.mxroute.com (mail-108-mta35.mxroute.com [136.175.108.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FB15572E
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581812; cv=none; b=Vm/Y+cJ7Vm1rSMagPBxo2OcwgdYRHDTqjJw4hiX8yv/Lu6uHL0aJs1fLZtTG1CQzq0rkLrrTjtVSxEuY4jl6u7oLNHQVX8SYgIZsiVO4TWk09UVDxFF0CrQMzkF+9N/1c3Po+d6lgUKNan7BjWBVcSqI1vsvo0ObfN/IxFjwxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581812; c=relaxed/simple;
	bh=x58t6k8EokPq4aAnaC2oATm/gQ5TdBN5BQeF0p+fL0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLBUpAkUTKE3xQY4zftDh3Vw9avieH8qi60cUxMyYzzIgu6mSkJe0yibaJz7Njibn5P8ZnV4e7ZwJ8pWqy3lKZNuq3XDW/uIhB519vdjZSStSctr1vUPGURI/6dUablI9N8GXL4MA7bndqTgPG3c0D281VwH0m3WGhER+c2hAvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=dLhz1N/8; arc=none smtp.client-ip=136.175.108.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta35.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234abc60003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:53 +0000
X-Zone-Loop: 5a14760aca38ceb8f79ec7559eaf0d8f5ec0085eea6c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UNQcRvC+BTJmcFMUv7/581GlzybaY7yH1KloLiIT/SI=; b=dLhz1N/8XTD0i1MlofJeNmVnd9
	KNK0xCCp/l+iZzxi0rYKrbFjimMoRnkkze42ULyiXwsQaivKWjnVPo/aY+g2TXhKbYDvpmQK91rJZ
	QgVVze3hO+RXJIv2dxPal421YStiXvBnnNHFf3oi+nArsRoxo8S9VUaoe/CCF8c0mpt8hs9ClNP3H
	VJYeVDiw7Si5GzR9tTHr2tYsz7nYmdzE9+BsTRsf1gd6bsPAw4pt8aav1Vw0X9MwTA+cfmY8qmJxt
	TEEkKQGeYM5wkg3Adq30woS3FPIGOSxl8LO450RCfdmQDQYP1w8/m6vyh0R3Rc2DZbU80ScFOJ17o
	UGSrKYBQ==;
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
	Luigi311 <git@luigi311.com>
Subject: [PATCH 18/23] dt-bindings: media: imx258: Add alternate compatible strings
Date: Wed, 27 Mar 2024 17:17:04 -0600
Message-ID: <20240327231710.53188-19-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There are a number of variants of the imx258 modules that can not
be differentiated at runtime, so add compatible strings for them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luigi311 <git@luigi311.com>
---
 .../devicetree/bindings/media/i2c/sony,imx258.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index bee61a443b23..c7856de15ba3 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -14,10 +14,14 @@ description: |-
   type stacked image sensor with a square pixel array of size 4208 x 3120. It
   is programmable through I2C interface.  Image data is sent through MIPI
   CSI-2.
+  There are a number of variants of the sensor which cannot be detected at
+  runtime, so multiple compatible strings are required to differentiate these.
 
 properties:
   compatible:
-    const: sony,imx258
+    - enum:
+        - sony,imx258
+        - sony,imx258-pdaf
 
   assigned-clocks: true
   assigned-clock-parents: true
-- 
2.42.0



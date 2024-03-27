Return-Path: <linux-media+bounces-7997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D223488F1C8
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BCB9B21272
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 22:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB5C153BDF;
	Wed, 27 Mar 2024 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="vV8EWvL2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta153.mxroute.com (mail-108-mta153.mxroute.com [136.175.108.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E311B153822
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711578364; cv=none; b=r5m6YpJ1EWfIBJ6PIzv3B7ivuIxIquUUnMJ5PX/RkXG2QeXbhmfG+VIZd+3/iaVvQMW4jc7BKEKudLR9DLVHYnkZp24pJjihRibS4qt2ngK9/F8goEhPo75uI04ytxgErfUAJRu0il2ET1Em5gXDfQnq9gz7uIl88Zq+vDc9l1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711578364; c=relaxed/simple;
	bh=AdHweroZnT+pHzZ/vSg+ukBfbmEglEx27aSOBLZQSiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVprE+jJM9gMnx6yP+rrSuJSpHql8DRUGAjfCTaSTJ2PHcVZNG5CzZiwDyMVS4O9qbdgE172FZt3YeKwIEo3fRPIP2onr7eaiSbR615LtkFbtkBUrJDirVoBUn6jSYF72HLsotnbBIMeBrurEzoQtcmre7xIwLf7Mfs/u0SK4wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=vV8EWvL2; arc=none smtp.client-ip=136.175.108.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta153.mxroute.com (ZoneMTA) with ESMTPSA id 18e82005e750003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 22:20:46 +0000
X-Zone-Loop: dbe4589b9bb3ff4af3fc74c05b0c159edc397f62b769
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oPBK+fqL/hsM837Y3buk53bLBMvRdlTlsTvv2J3d9qk=; b=vV8EWvL2zYFXA8MhOAwfFxeG+E
	L2VmoRtonsoQuddXRSAw/GDqP9EFVH3uJhmHP6EpLVj+HjqWj9saXiu9Jel8fKvQBJSh5e1iQt4sh
	iLjeACpLqvZHEoCBOWFj446zlj44PVwhLJWmSdlbiowcNZ4OQzkwaQKPHkO1g3qfOPzQ/UYTtlxvS
	VxwZCTIxw21NVEcmYva5FNHxZaX91loxdzAdR1KYxvX7hJrdjgb7HqMjztZwRzkiNzFuBP58biA37
	jQybOfZKAXMBcpY3glnEXik44CUYLCQxJXEga39pkvRgT+fvwiwjNQgH5dhpc0nN7wnxsEk43peeO
	k4st52Gw==;
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
Subject: [PATCH 01/23] media: i2c: imx258: Remove unused defines
Date: Wed, 27 Mar 2024 16:20:13 -0600
Message-ID: <20240327222035.47208-2-git@luigi311.com>
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

The IMX258_FLL_* defines are unused. Remove them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a577afb530b7..2dbafd21dd70 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -29,12 +29,6 @@
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
 
-/*Frame Length Line*/
-#define IMX258_FLL_MIN			0x08a6
-#define IMX258_FLL_MAX			0xffff
-#define IMX258_FLL_STEP			1
-#define IMX258_FLL_DEFAULT		0x0c98
-
 /* HBLANK control - read only */
 #define IMX258_PPL_DEFAULT		5352
 
-- 
2.42.0



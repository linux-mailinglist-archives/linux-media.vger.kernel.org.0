Return-Path: <linux-media+bounces-8553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E88973C0
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C015928ECA5
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B5614A4EB;
	Wed,  3 Apr 2024 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="fV06Zg9W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta21.mxroute.com (mail-108-mta21.mxroute.com [136.175.108.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92AC149E1B
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157228; cv=none; b=GPYeIhp8iguAt9H5rXWo0RCdRXhxY7+1VNlGw/MnVmPNC2TYU0ndGPLWnIRR6EL87mlUzbPfIAn5rxymyFPhiVt6kZD39Jpj4wEledK1kUfbj/vykuTT7hojfdc0SLLtfMNVwtQIvb3+Uy0OWgzGMr0whVG5iEgPOOeEAccgsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157228; c=relaxed/simple;
	bh=7PlAfVztKQMARKBbcpVjFWXyV1tsnHi7QOOFhMQbxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lubHmwHcfyESgshCeuo8z7g+ctIfePXjsLBTVMiz5cwtY4Pdii9StW4oP92QhbJuskY5DpIdpyJRsw/sy/xgOtKdBHDVpyQ01qRQspDdbe88u8Hm6GCwKzeL4p6f0HdyuAQL1ydFWXycOkoZwHZ5RTmJGXvIVqJ/kimqlInBhD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=fV06Zg9W; arc=none smtp.client-ip=136.175.108.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta21.mxroute.com (ZoneMTA) with ESMTPSA id 18ea4806d450003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:43 +0000
X-Zone-Loop: 1331736824414a24795c2ae4506f90515d3b7d7b3ca1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A5USQN4/h/HmEuUVVMz6q8rv2sJt6lF+TSZcmadaFDA=; b=fV06Zg9WcJDysEv6YoDTj10Wkb
	8EbQWsa+xhaFRiNbrerrWg3hcn0p7dt93VMDkYCKxXhGwvsKu7+TSyOse0v9Hg7CphoTZVRStKZIy
	d9Zncoinm1XODf+3oLTE8n6IHnFVgG3HHnMtwR6xrwSwjN39eSRc65gpwpu2Nb8VIYL4HbXJaoJaA
	MwjO0HexoawzdiDk0Pow1cD8E0LoVLP8Gn6ARvhW2bh07bpce+s1n3QEw3m/4DAcr8xWguLAOJlBJ
	3fUuk8+Mie8d1fqYpOdzzASFkZ7tD0eJHdKowPsLIbsolPA6MKpFl+so0qvy4obaT4gdSaJkKXdYs
	e0XT39Hw==;
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
Subject: [PATCH v3 13/25] media: i2c: imx258: Correct max FRM_LENGTH_LINES value
Date: Wed,  3 Apr 2024 09:03:42 -0600
Message-ID: <20240403150355.189229-14-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The data sheet states that the maximum value for registers
0x0340/0x0341 FRM_LENGTH_LINES is 65525(decimal), not the
0xFFFF defined in this driver. Correct this limit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 692a5aeb7941..5a5bf2b25bdf 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -28,7 +28,7 @@
 #define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
-#define IMX258_VTS_MAX			0xffff
+#define IMX258_VTS_MAX			65525
 
 #define IMX258_REG_VTS			0x0340
 
-- 
2.42.0



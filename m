Return-Path: <linux-media+bounces-26377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BFA3C0AB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798C617B9D1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CA11F4612;
	Wed, 19 Feb 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FL2RRBUk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C11EB184;
	Wed, 19 Feb 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972997; cv=none; b=V/dDV8Tv2dvmgwwoNgNPqLSsv/EO7eaVxlHgqsuH0s7aTxr9L9ezn+D3di38xNDxTowFdZeleJx17EGTLKwyAt+RQKJYoxt8JVzHeCRzsngFBIIrYW7/7O40go/YjoVkvBjy7ENCdaRJl222P0OPGqsu4g//KGhowslNKKO4Wrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972997; c=relaxed/simple;
	bh=ePInWZswxQnSaLKmHVVpKwsATVLBmrczu3ZBpYlw44Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgBcO6NOwoOXY2FDfGhVJmFrzYQYaRbdTi1mHM5ffbG9Rj0tH2y/uOozAkubVXSYzRVPXmNW+H9iG7O42ctrd0yIbpBmbGlsvkcoITWJd0PYWRq8Ak2/hbXeQWupyaej9/BcXCPcnPaWZM68nDMip9uq+6s9DuDhjwKwp7q+mRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FL2RRBUk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D3D713E2;
	Wed, 19 Feb 2025 14:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972906;
	bh=ePInWZswxQnSaLKmHVVpKwsATVLBmrczu3ZBpYlw44Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FL2RRBUk1GLAl+iT0MRGO+WXCOulsi/6qzbO2YD2vEaoDru72b+SA15gCKJM6OMVt
	 X1s1RP3pyrSJirXZ4Ch5/DFz7bADOBLvZuuNMKJQz6+sqKCsKi9VfdCip/bcfLbeJz
	 08GmtdbOcfgfqfO6Cb65kgXHPquRlEwrhzNI7oGU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:01 +0200
Subject: [PATCH 07/18] media: rcar-csi2: Fix typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-7-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=ePInWZswxQnSaLKmHVVpKwsATVLBmrczu3ZBpYlw44Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFyQImVhcQz/A/9tqJdqiSEq3t8qnXOubnLO
 cYH6VCLieiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcgAKCRD6PaqMvJYe
 9QwgEACUoQ/DNCqQm8DsHidCyPTo5JTNRM+YWkBDShJyjLJIIHQm9KAbQzkMDG8c2G5OOWLx5Jh
 pCw/iTnxWaP2UTeBYAId0TY9twAEZF4r3nYlardAQ85pQtcurd+Vhk8/TxzbiN+xcQqK5+yb8Z/
 3lWpgWiQQFonYDdaY+TZWvMLLzLzcRm8Qi1EuSOpcldM6R+4cl0CmmplAJlE9h+aLczWfrgNVgU
 HdpTm59yL+QsPbkTr0/JC+e1boAtMEWBkMEZRWkgg7LnKCeWPVEeggAc95Hxk6u0ZYPxjmw+iJW
 e0xeTO+0OziP6FwQBjV92XZy8hbGuEll+Xvn1m0a8xwD7RTpDeJDVisrQheb5+6EX9qSHK7pxne
 9otpohLUhQN/CQ2+rsgNwoMpcSykvHEQgj9SMsXkp3bDjN3cpLRvGwKdn77RCuJPVl+4aMdclmo
 tXGFKHYVh/m4KD2gNfOydxk7NCHyQYr+AO+t5QYb/du7dcGZRU+gtgxq5K9URU9NTu7Wk9HTSJ5
 KMT87LUkZ0jCYWJ+LcRlUJsQBi1PtkVdhCjOp/jPp2ZEfN5cJ/xosFFW1Od+AtXQjQvrmt2RHrE
 yFTbdlD7/1GnV+Tv+dFhI/ZU9g4DcFwMSr9uiA1/YKI+za0aaJqqrK3cjwBNAmvardI/TpZNOeH
 IoQBSP3E2oM5d9A==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix typo with variable name 'msps'.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 845fb3e155f1..92697ea3df01 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	const struct rcar_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
-	int msps;
+	int mbps;
 	int ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
@@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	if (ret)
 		return ret;
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
-	if (msps < 0)
-		return msps;
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (mbps < 0)
+		return mbps;
 
 	/* Reset LINK and PHY*/
 	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
@@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
 
 	/* C-PHY settings */
-	ret = rcsi2_c_phy_setting_v4h(priv, msps);
+	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
 	if (ret)
 		return ret;
 

-- 
2.43.0



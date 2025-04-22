Return-Path: <linux-media+bounces-30711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE124A968FE
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2020117D580
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 12:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A07B27D761;
	Tue, 22 Apr 2025 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NSkzP5ny"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2A27CCD9;
	Tue, 22 Apr 2025 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324461; cv=none; b=Mxmqvw/oNqHwhlr0OEESZQUqzPtm5uLB+jBDlLfKhnhryc0DXHtT6Rf/LT6OAFsnNHCOleG36MvE01fVrG2JmKpMUhKRSH4LVW3zuyYwYJ2j63mL7FLoyqMuDNgQYGwqTjrLll0itmPjHkdkSYCJL11e4qST4D6lxwSxBkr00R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324461; c=relaxed/simple;
	bh=7lH35Md+Fot7UL9DGAXTqi++xW7U60PpYcKhID8f2Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEAW/vOFGWFs4uIi5EIX2/dJq73BpIw2WjUJiTNhGUNT8m3WS3AiBab2wi//LV3Msj/9Wc3t6QAFs3rLfm6qubERGflXR/sQmbJgXyBRYVfk1+ttXxupFDt0xknwYwBM7t551qYHdV36psgUQyFckbp0KFqqDOZQV3YE59LejJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NSkzP5ny; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.hippo-penny.ts.net (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39CC1250;
	Tue, 22 Apr 2025 14:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745324331;
	bh=7lH35Md+Fot7UL9DGAXTqi++xW7U60PpYcKhID8f2Z0=;
	h=From:To:Cc:Subject:Date:From;
	b=NSkzP5nyuh9z8/qXuJHwrGJuKVBt2WVxKqRWv4WFx1LylcW0WSAOW0MpneoCAlJ5U
	 6UExbpMuFOeaoajKGQJ53SKbnKbUjVkJvyz7dD8eq+LMmtJ3vv3D8s8+apn8Z3b6YO
	 QWRitnCECGPnsMSxNrEHJNQkG9CJaJxDzahfCgqk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: sakari.ailus@iki.fi,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Umang Jain <umang.jain@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: imx335: Use correct register width for HNUM
Date: Tue, 22 Apr 2025 13:20:52 +0100
Message-ID: <20250422122052.12601-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Umang Jain <umang.jain@ideasonboard.com>

CCI_REG_HNUM should be using CCI_REG16_LE() instead of CCI_REG8()
as HNUM spans from 0x302e[0:7] to 0x302f[0:3].

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index db424b178e98..0418875e996c 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -31,7 +31,7 @@
 #define IMX335_REG_CPWAIT_TIME		CCI_REG8(0x300d)
 #define IMX335_REG_WINMODE		CCI_REG8(0x3018)
 #define IMX335_REG_HTRIMMING_START	CCI_REG16_LE(0x302c)
-#define IMX335_REG_HNUM			CCI_REG8(0x302e)
+#define IMX335_REG_HNUM			CCI_REG16_LE(0x302e)
 
 /* Lines per frame */
 #define IMX335_REG_VMAX			CCI_REG24_LE(0x3030)
-- 
2.48.1



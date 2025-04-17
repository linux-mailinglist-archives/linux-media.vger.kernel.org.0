Return-Path: <linux-media+bounces-30416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9CA9148D
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E518F5A394B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C30221F0C;
	Thu, 17 Apr 2025 06:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TruIrevw"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6734C21518B;
	Thu, 17 Apr 2025 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873027; cv=none; b=TbIlQjuxWq2zp3/uHId24LpQjbSBUQTdrARtUhWW9g1ol7ALWIaD8GnTjAFiBiAQ9mzRrmwFrAjgLnyveFbAyymDLg2+ferSrtEcb2j4s+YVBMDlvw1iANHIAHZThkFpKwUEhrUXR+tYHxUYmjYIlMnr+RJyKNNrLMEFOyJFfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873027; c=relaxed/simple;
	bh=MKC4CDYjs8E3icSyQCVz5I8mt6GX02Hd+uMGAZ4otgs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAdbwcxbn1qnSoW3Pc63ReRNhgd8aK32iuzA/PY5JKIU1nzMrUneQuQkZD++9EyLnGlh6Fmy4juLVN+go6sYmTmCR9kZz8jT71ehkU2hxqHWcZ4Plee3M6m78zRmylvsAyj89L7rURsER8Q42uoV0xzkn1XuHOBkoGsIulwL+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TruIrevw; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6usKG3003856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 01:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744873014;
	bh=GI9OuM2PYhmFROm0ZtO31rzwj3acjT3mk5SqozHUYEU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TruIrevwDe4b/Ggqu6nyb5CyOmEVaurvb9q0Qzdj9+gREaiTIh6JWPiZGc0N1YKx5
	 X9NcOkYZd52AFWs2rl6KMKnscvzsciozdxd8fJZT586l3m4Uys8Gsj5RW2egCRv3ux
	 z0FJRFjqaZxpHGW0TMjstr/QJsfkgYFbFLu4tg0c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6usLd004269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 01:56:54 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 01:56:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 01:56:53 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H6tsx9035403;
	Thu, 17 Apr 2025 01:56:48 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <mripard@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <r-donadkar@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 09/13] media: cadence: csi2rx: Use new enable stream APIs
Date: Thu, 17 Apr 2025 12:25:50 +0530
Message-ID: <20250417065554.437541-10-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417065554.437541-1-r-donadkar@ti.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jai Luthra <j-luthra@ti.com>

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev instead of
doing s_stream(1) to start all streams on the subdev at once.

This API is implemented by ds90ub960 driver (FPDLink deser) and thus the
caller (cdns-csi2x) is required to use it. For now we only enable
stream0.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index b7e9225f66a41..df05d278df379 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -224,10 +224,18 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 static int csi2rx_start(struct csi2rx_priv *csi2rx)
 {
 	unsigned int i;
+	struct media_pad *remote_pad;
 	unsigned long lanes_used = 0;
 	u32 reg;
 	int ret;
 
+	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev,
+			"Failed to find connected source\n");
+		return -ENODEV;
+	}
+
 	ret = clk_prepare_enable(csi2rx->p_clk);
 	if (ret)
 		return ret;
@@ -311,7 +319,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
+					 remote_pad->index, BIT(0));
 	if (ret)
 		goto err_disable_sysclk;
 
@@ -339,6 +348,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 {
+	struct media_pad *remote_pad;
 	unsigned int i;
 	u32 val;
 	int ret;
@@ -367,8 +377,12 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->p_rst);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
+	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
+	if (!remote_pad ||
+	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
+					remote_pad->index, BIT(0))) {
 		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
+	}
 
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
-- 
2.34.1



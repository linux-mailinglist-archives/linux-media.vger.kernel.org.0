Return-Path: <linux-media+bounces-14249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16391A787
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629822813D7
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E6118FDC3;
	Thu, 27 Jun 2024 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AK6P6MZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C692318EFD3;
	Thu, 27 Jun 2024 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493852; cv=none; b=B1KBTg+WgvPSinmcFoUcTVxVggKugS6cTozziPE4MZ1LL3tb9tmnUySUMYDZxKpIe97z/VZJISVIl+sLeBYBTU76DuIlrzXkPVNQ9h5QS+BV5zeyyd1AAio+oeWzIsuK4l7Gt/O5brbdMqPvZ5UFZWt0JuiyDoGaIJ4xCuhms5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493852; c=relaxed/simple;
	bh=+/EnvUrM4ZPWCtrpdzk+4GojwCIuX8pMK1WphzTTUK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T2CNEc5uiTfcn9xD0AJE4D+30iqkbAuK6QBWKx9wopdRe3MMmCfaAVGyCamR2PFX5nG/ShDp51OjF6uxkcWKoXuzFfBVQkbXm2J8sawhUmS7STDszyOC9PDfaBB6awR7IoKb3EpSj2dPcB7UFOlkPMMDAPELHNPwoPOXq0jn8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AK6P6MZ5; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAe84024343;
	Thu, 27 Jun 2024 08:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493840;
	bh=8pnwDRf5zvvCFyhKGj1stRmE7TXO+7c8UQvSNtofPhk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=AK6P6MZ5/S9muQETiJGVJMfBtz23yMC3UT7CJv3WFoYWviekUUCjiUMXdYDOmzXcw
	 wjo8151R7qvjkhXUGuaVJo0+CMbZv67MxXQAsBO7vbqVjA6LmJcrjQE/SKSaqpMrjH
	 2OgzFUR8jqfHUw6pFEpugSdKVtBaErk5GuGjrI7s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAeNu117673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:39 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAdNC038728;
	Thu, 27 Jun 2024 08:10:39 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:05 +0530
Subject: [PATCH v2 10/13] media: cadence: csi2rx: Use new enable stream
 APIs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-10-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=+/EnvUrM4ZPWCtrpdzk+4GojwCIuX8pMK1WphzTTUK0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS7OfDqioXJZI8fnZEa4wpgqbGgmassDG72w
 BkOFF9PVH+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kuwAKCRBD3pH5JJpx
 ReDmD/9/dyPzxoCU46hjGnzhJDbl7cAwBkarMeyvjGS7RDbRZ2rETX2ad7BbzyjlZ90YAAHq0Pt
 bFGFI7TCyZ+QSwjSW7e/sLCyvQNBji5kMya00DHU+mjIDCJOKYame5x//s3pVQWu6lob3vU7QPG
 e/6+GilGLbiWo7yavhg5r05LPpGIxSXJXcmjVVyJtbse/LdTmRU+5oy5eEa8Varlvs/QLSialJe
 zzGbloHrktXNfg8lNyRbRMn1LQU+jmmF1/vZectyVO0gxbUGliINOAQizZgViI77C4o6TI0cXyc
 5Fo1huXY/Bn4QEp1h7TrKHmBRaR43k0bPC8tdW5C9nhrpxaYpzoKX1rVTW0RedZ6LYSyalfGbXj
 FyXZm3sFyioCLpv5pqoEXHd/Geqmb0NPixVlTNLKdrLQ2D3FVypptuw5z0KkcrjyXHId4fjLNdi
 /Xe4Yp1iTru9VZXsqXetHrp+la1oSJSCmVxT2A7VcynPsIJzd7B6cxdTzJSZOjeXq5+AaMDfpDX
 Tyi8A85NLCJYMPk5ay/ufm1LfCJBALDJop8P5Tv3HbfWv+I2ZisgF4qftrcMagAUGVlrULUb9TL
 WECbgkUUZAwU5i5rKC3mHfmWqmQiRK+X38dvpN1rUBB8cwfntHfoyG6an6ZiCFVEDLebaiYYU2q
 EMAFjJaoJXoTkhw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev instead of
doing s_stream(1) to start all streams on the subdev at once.

This API is implemented by ds90ub960 driver (FPDLink deser) and thus the
caller (cdns-csi2x) is required to use it. For now we only enable
stream0.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index b6054d62c799..2ec34fc9c524 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -222,10 +222,18 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
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
@@ -309,7 +317,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
+					 remote_pad->index, BIT(0));
 	if (ret)
 		goto err_disable_sysclk;
 
@@ -337,6 +346,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 {
+	struct media_pad *remote_pad;
 	unsigned int i;
 	u32 val;
 	int ret;
@@ -365,8 +375,12 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
2.43.0



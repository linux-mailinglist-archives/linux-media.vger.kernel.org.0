Return-Path: <linux-media+bounces-48236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D7CA48A9
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6285330D1715
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36062FD69A;
	Thu,  4 Dec 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="madw//cp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F62F657A;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865967; cv=none; b=i3jZrs15oNZnA6Yo6cFUZdTqfzk9E/CjHWzTdQsd4XI7HpPIcLMUnci5h76/tdM/D9A21HJQM4Lc8hWK8OkasGFt+XIsQ+2asOTbGwbWrkiP+SaiIcGPso5Qw3LQ/6RVdVAFMGc2Tyrjj48wGzCZLEop5/D19nhjaE+EH8yzDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865967; c=relaxed/simple;
	bh=O0VSdYVLQ03hNWa2dtSXZv8m0AqnGu38C6aAyY/kdv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXQIolr0ZcirkIeKi6hTVxm1r1jf07T6alKfD7Ch61CQPCdyEUs4JQCjBF4khbYW7fJrnbE27zL9O2MuTFtJCrRX9sD9G7T+j/+GMrZe8U8KbdxdpMVBfGUUkVcfjYYgEEz+h05qldQbUBoQEyb+jdfDfhNkUAXghUbGUTLs3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=madw//cp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE449C116D0;
	Thu,  4 Dec 2025 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=O0VSdYVLQ03hNWa2dtSXZv8m0AqnGu38C6aAyY/kdv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=madw//cp3zydh2bdEhoexF6p52XH7ddI54fzH642dLuleNsUljQ8jV64CFyb4Cwl7
	 4Uaieccz6DJbo7O882UvgZC5FkckiXmZ1MdYXe/Ag+D9fCc4TmOxnsnK7imQm2GAHg
	 lByU4fCCmBxsxT4IXLTzpBDZRkJmZBLpgUNZLAcr3Rq2rZlRqplbDQfUC9VxuqGoqV
	 KQr83/6Orze+/hN+LihARHL8EIhfxjmMsp/FKbqAk6U5mSuRH12b76YcaVxPgPFyIH
	 O8iMMg3PDSVGc/K7R6sZ4kfMhNvT2caah9l7xtH1TjOeUPPsIUScPfRRp6855jgOwu
	 4ihjH5ZePl+NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCEAD216B0;
	Thu,  4 Dec 2025 16:32:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:35 +0100
Subject: [PATCH WIP v2 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-1-6b35ef8b071e@ixit.cz>
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
In-Reply-To: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xEPoDiy43IGVbS6hFNBkYfzUa5KA1Mw5KmgqffUeD6M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbesc0tnVqr8cwPWlSiKcumYfxuzqIBw0NK6/
 RHWgXEXgRqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 csg0EAC6bEUcxHMUs9HLM6R7beX56GcmLnId0ppw1WPOdqf3B5rCR0rMjXEXmEYW254tKeV2wdj
 QcrZc0xPVZcJGBq/+dfR8bA+Ox32uTRuxRbB2OiTGgDlNtGbjdsK50gJuKcpL7wuJvy5XeVsJL1
 ZrUvTTRJph4LkgfbnTk0uqM6np3ZnnGn65pKFAMU2IxiaDFCAM7xIrgTTQo9H2Y7IwnMtag2PGR
 yXDUKaasAfStJWB29TV1xdx9x7ExXrhAOrIMRpkW7c1pejrpjiaftdR0HgYADUGpyVkRgJCpo06
 pUNXLecS/Itf1woDLgQhgfLss6zzjce2YhoVqKbAKhq+SyKTyXjsLEGrJM9e10iCID8WMb2O02n
 /yL9ku9xRuKY631d1Ix4CipAfCGo36Hi/jgvMpKIeo3Fqg0AGDPJT6FrGDl9SPeMx10OMUwPdeJ
 4WNxDBkKr2CnfUm5o90iwv8bwFTYDLlukEguerLjBa42HLLhyLLpofjxIYsOnr48bqvePxwWNwM
 TlawIvsVykbZhVEXNrqLB76L0cfV0RT6DGfhlse7q9j1jdwEYuouTXB++uT3CIud3eb+swP8VT8
 cDebvDNWJWwsWXq+KSuWM0munN1LcUzcSt7rsgAH2bGGGxm4psk1GkAluTyrwy4k85CFB5Pfgjs
 slK4G+k3Ig6NZKA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Read PHY configuration from the device-tree bus-type and save it into the csiphy
structure for later use.

For C-PHY, skip clock line configuration, as there is none.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 ++
 drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441..8dcd933b151ec 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -28,11 +28,13 @@ struct csiphy_lane {
 
 /**
  * struct csiphy_lanes_cfg - CSIPHY lanes configuration
+ * @phy_cfg:  interface selection (C-PHY or D-PHY)
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
  */
 struct csiphy_lanes_cfg {
+	enum v4l2_mbus_type phy_cfg;
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba07..414646760ae6b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4043,11 +4043,11 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
-	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
-	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	switch (vep.bus_type) {
+	case V4L2_MBUS_CSI2_CPHY:
+	case V4L2_MBUS_CSI2_DPHY:
+		break;
+	default:
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4055,9 +4055,13 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
-	lncfg->clk.pos = mipi_csi2->clock_lane;
-	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
+	lncfg->phy_cfg = vep.bus_type;
+
+	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
+		lncfg->clk.pos = mipi_csi2->clock_lane;
+		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
+	}
 
 	lncfg->data = devm_kcalloc(dev,
 				   lncfg->num_data, sizeof(*lncfg->data),

-- 
2.51.0




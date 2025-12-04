Return-Path: <linux-media+bounces-48237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA7CA4849
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3EFE300D5CB
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6B92FE577;
	Thu,  4 Dec 2025 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQYoRliI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6694C2F691D;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865967; cv=none; b=K+t7574JV/1fLiraQxMWUPVGg1b0eAWVKEpVL9Gzdq+zyEM1mXYKwMWgdPiWpzvq+Ct5VsoIO0D1NyGrbnzoVJH2gM4rpIGcXfPcTg1P0qn3/B4IEjQi8aJ2oSH0Cu3V8TUxHp/ZIcGeMI6LntWwgz0emCiNHKWMoQp/IU3G+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865967; c=relaxed/simple;
	bh=a4NXDITr+EQVolKt0VViL75gY4duqtA6zQfnMB2YTQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeTSOJM1MNPWX6X5EB2u8AAob5udjFnPdCNySaKdWrkwX7tjdZ5p78Egd7z7jr//bPa3oP8aQUJCjGS/UVgqsYan6UfQWRinDJ0yUvtM5EQgYH7B4ht2Cmg9/BzXIdGJSQeESuQBeMqT0jD7cvQvTOoyYOkMcLpr0HfeJJ2vRSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQYoRliI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B0B0C116C6;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=a4NXDITr+EQVolKt0VViL75gY4duqtA6zQfnMB2YTQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PQYoRliItjqou9zpY1RDvMU30AdLsp5K8vabknIRapNUbYkujkJQ8waQozluQac+G
	 RqU9PdLyXcTP7oUK+BV8se5T93EDLW8zK6lYFTNlVQHBTEV47xLCkWPNe8asrjMSlm
	 cihgr3tzASdmpSEw+ob3dtA7BBqqRprysMKF0D782hYT7XnF2oxlJdSCn4De3Wlny5
	 9cc5bnYC1hYDMBsTNkg4cw9SCgTWes/eD4dW+z8BtlWPFY/7XsML0XEw0nYs6Eem18
	 KpLGBjl81sQ5wb1ASCZu4SaIHsoCICZXVt5JJXBdqxmL7V1O7Va+4SNukCRLR/GGv0
	 1JfOeAkxPfATg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1045BD216AE;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:37 +0100
Subject: [PATCH WIP v2 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YHgfSaDVk+a2Lqw1ZwLVeEXKLVx1/k08TjKR7W1kIA8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbesFQujztf3KdNxWDVcx5BHVMJOVNjPLdozA
 0n6IuihTIiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 chziEACs9Snvcu/70HqB/xfrUyY3IdKXqz3buIP/QGbF+uU4ohHFMCDw04h2OBL8z6SxKjAevPS
 U5qRWOxiH3fX8iDOihzM5QRpfu1ZOYgO0TNWvFiJtWYQH5dFZx93eO2fGVHhZ5cFCI0Gtl7yYCW
 Uli34WXEpuunLt1DfkPZuwuJdogo6/QUI0UpoTfsJsPuIekkRw653h65ZXjeVr5Z9m2KJ6Sb/Ib
 NlIXMlO6jZqP7vUdN6CFV/wOR2ADlccMDZV38Wst8faQmd+sq982fQUQKq7ld95KkW5D7qIGLjd
 uEpEs/MXfAXIuFaRLeJwiy1XVj7HidtmM9bto7tZOpHG8v9Kq8kGWp2N4z3Q4aOPWjXIZCdowRS
 1bckbeBGFMF9DFlIA+LTRVz09izmyARIJJt1b3JYY4ZHKvd9cpEAXtr7W2Lgtts1+D3I6SaA4nH
 ptmTmtqkt5h+Q4r9Hm3HHT59xqI2BK/cI7QVby86ppwoVnIaA9ZLGShftOG1ZuWN3lTH88iBq5k
 tmLexjGt0JH6h/SW9Ua3nJ6h69SOl63rv3yIKzNOULTFm7E9dJ/wYscFou0RBgf880KjMb8oTw9
 jQdW3XS78QBqCPhNXWAKu2WLb0CWidyq8PFxLY7Wzbdr0+Fn4cb7zhw5IrmS1ygUkijzWweEIJq
 Qjlh/RXP6JyQBOw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
 drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5b..033036ae28a4f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c..d9026fd829d61 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1287,6 +1287,7 @@ static int csid_link_setup(struct media_entity *entity,
 		csid->phy.csiphy_id = csiphy->id;
 
 		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 		csid->phy.lane_cnt = lane_cfg->num_data;
 		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2f..a82db31bd2335 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -70,6 +70,7 @@ struct csid_phy_config {
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;

-- 
2.51.0




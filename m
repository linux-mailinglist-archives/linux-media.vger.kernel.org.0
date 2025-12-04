Return-Path: <linux-media+bounces-48241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E902CA48C7
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 436AE30FCCF1
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D749D2FB989;
	Thu,  4 Dec 2025 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrRtTlRU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7BA2FBDE6;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865968; cv=none; b=nydG/EOrEVOs3P7tBO5Ax/0ORr2RpqqdCoQ+xfv/eoMftI7Q5ykTuh2Xgnf6V11FXJRvzqaMIdMNknriM8C/iTbLCTFoOBWkyW/vAPLGZzZCxB2AVsXxJ/eQVDod8ZDnmoPi0UZ8727T3AtCE8x6fGAjZ6IJlyhFTmaWKux0HYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865968; c=relaxed/simple;
	bh=YMgqEtiUsPA4rIArmhajnKPWs2V6m0wZLbcmi30x3uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmepODacTm6SqCjWbnuHvBp7nAJ4+v4fsvxSNgvi/30MvgIshCm0glzIs/QxJQvWg6+b6dKHYvXJBXcQ4IfGHHCNkUjdEnT5ndis2086YqqwMpFh+2CReRVnIxnSWFB2cjfEYuPwn8uLpdQ9km2657v5GNRM1PBk0MxuiP1IIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrRtTlRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49722C2BC86;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=YMgqEtiUsPA4rIArmhajnKPWs2V6m0wZLbcmi30x3uE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DrRtTlRUTKogOREVDBvjndHzUHMTBdKLBGdTVRlaoitWJR7t1srK+3I4BKI17AbaJ
	 ahu0UvszeJNiidRiFdCkt00d+eWKmamyRsjjEsOu9NC4A92uLK28oHQiXvCVNUClH0
	 9IW053n4GscKR/ylq3QofwC5shBc5FA1YfHB2M8QhpqX4tq2Zxb2wnlZw8oj4vYfML
	 VoVSLi52P6mf84ZPhItLVyVQLteLhT1CY5hKh4U5KyMtUfSKTOOTJD95LaWGjBJKBo
	 BkQiVjGcIIK+htQyNIUrsIyyM8BFHt6uQ9B21A+pOBHTF+l2gtm5EjWQtz9azpITLc
	 Hpe7vonzeurNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD50D216B4;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:39 +0100
Subject: [PATCH WIP v2 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4969; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XIxy1H6f80i4ZHYsZCBc1KsNt8SCsiT99rGndun6BYw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbesuV+jhPt7PP/tktYtTPdKnAY1jmWKp6xfH
 qGroTmbkiCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 cir/D/93anvt5eypSL+c+2c4JtuQ1XnIuJx9J1HSVN8P9U8U90QSj7U01Bq7w5sCDqtrKWHRUIE
 YWjzvUQ6LceW9f3YUCx+uTzCmDdNE2g0nOa0ETd2W0kU7BPvuX49Pj11QLwfSJyChygLYYt2Rut
 QpvQOROFUgMRJt/FZkv3MbP3gGL4OWxoHoY1vnU1TNKQvVR05wzt31mAtc1DRmhfi1mCfKz5mi1
 IB7s9t0iyLYAB8EqEelL1bPb5WPmjcQDpcAZX0NIm3O1NXpZ9AWGzM6LjlWQu0fcDBQ342XSSF3
 fBzx9YcZW7fhN/F9PFm72cwc7PVd9CvvS7jNzZQLgbXdgw0swgpFJQrKJAUKZ7b2JZPMnsyK+g2
 PpoPwnKSzwXM88rlOQhQsYo3PUHc8pD6QmTlTjE2I6C8Yg9m95ywZXykKP48eP2eCDU6+03ojZF
 a8KF4L0CBhKPUxXSFOUoicUm1yXDM4Vw8qHTUkzaSIRAHDAmxmAOHQSttyCTALkwVZ2pUmBrYHZ
 I9wRC8WJKAHrnVyPeVu3QQvhLQ06y/cNpHsVW0iL8Amak5Jda8dhjhpK+U18Z/akvN+l5tyLMbk
 89xeAmCKAKmyWES47fvzbpI1e3bNLx11DcHEYRUbXFMP8dkx+cdndLiUnby7Vvtye6int2mGqGT
 31z/K3i2pFKhoOw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports three-phase C-PHY mode.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 74 +++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 3d30cdce33f96..7121aa97a19c4 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -145,6 +145,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 };
 
 /* GEN2 1.0 2PH */
+/* 5 entries: clock + 4 lanes */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -219,6 +220,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.0 3PH */
+/* 3 entries: 3 lanes (C-PHY) */
+static const struct
+csiphy_lane_regs lane_regs_sdm845_3ph[] = {
+	{0x015C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0168, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x016C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x035C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0368, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x036C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x055C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0568, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x056C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.1 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sc8280xp[] = {
@@ -1043,8 +1107,14 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = &lane_regs_sdm845_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
+
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sdm845[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		}
 		break;
 	case CAMSS_2290:
 		regs->lane_regs = &lane_regs_qcm2290[0];

-- 
2.51.0




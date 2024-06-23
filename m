Return-Path: <linux-media+bounces-13999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFB913F29
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99FE1F216E3
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A761891A3;
	Sun, 23 Jun 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuJUm3N2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C4185E6D;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=Nr1yU7vAXLcNYxESmxEri4g2QP3kXzFEAhKIBZcg7b4DXsKiA07yvIo5fhfkksj+SV7/H5wPj4EmDifF1K4U3uMdSqY0IZ7soVo8tPmZr2awJ3ImjeUVmYRl3jaA6l//MAELI0yh0Q6XNq6yMbq31pwlOdvDvpR4u0cGCJeNx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=8XHIxXgmyi9PXqWnsdofzNPYeRAVxi5WAtPZZFw8FSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5Qi2r+Ol+P2hS+MeApvrgZ6/wfqaM5LCKBiNNsiHVCS4sNQdllD5poH8baJWOHznNTB9VhaAQotPlV18Rf1fIVWsQucZrGhjwE5gvbHSOsAmFUtkanHxeAoel5o1YC6JqCRz221IeHX2BwAEtygne3qGOhxr451Ux3f87JbGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuJUm3N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5BDC4AF0B;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=8XHIxXgmyi9PXqWnsdofzNPYeRAVxi5WAtPZZFw8FSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KuJUm3N2X1AG6OcZhu4lmvZElmjNzn3v/WqdwUaOvX4v4zFfYcsw3xatrCNvAnh7f
	 KMZTYOw0jkaAH3/q79UBPZ8il/HH6pzuhvjkH2jf9ebJDvTC3Ezp6gDuPt9KMgh5HW
	 gNFeo3ybweMHziL7xrXYdctxHV11BDiSh3Y99Cw7xqIantMy7xm0WQx/0GBxGm9bTg
	 Q6mbXEN03qP/Hoyn9kckIditnW5yYk4OgoYOP66NDoln+YbWgD3m9/MdCuTCYUd0eV
	 naCavdH2y3UMkbWrMpSh+l0B6QzPlnYcCPTTs9unARK9wni6gs44HBRXbR1AOSSp9l
	 15E85rWsz4ZXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B926C30653;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:41 +0800
Subject: [PATCH v2 2/8] Add Gen2 v1.2.2 two-phase MIPI CSI-2 DPHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-2-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184973; l=7706;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=HW/e+55Yhxnsc82eoJwFhI5h31x5/hKFq16FY80+iOg=;
 b=JyT7Zc4jrDrJaXOp7YgvBRiCFuQqSA/iUD7c18vYULpsW2qryn9SpZQ5FpSZ+WQViVNmaCldY
 w6b6CwzOlKFDeCUkVZngMtnn0AOsnGCtttfKYOG9nD9ChA9WS7N6qAp
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Add a PHY configuration sequence for the sc7180 which uses a Qualcomm
Gen 2 version 1.2.2 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports two-phase D-PHY mode.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 135 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 2 files changed, 136 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index df7e93a5a4f6..e2dd9b23f857 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -348,6 +348,136 @@ csiphy_reg_t lane_regs_sm8250[5][20] = {
 	},
 };
 
+/* GEN2 1.2.2 2PH */
+struct
+csiphy_reg_t lane_regs_sc7180[5][23] = {
+	{
+		{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0900, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0034, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0004, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0038, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x005c, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0060, 0x0d, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	},
+	{
+		{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c80, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0734, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0704, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0738, 0x1f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	},
+	{
+		{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0a04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0a10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0a00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0a08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0a04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0234, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0204, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0238, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x025c, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0260, 0x0d, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	},
+	{
+		{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0b04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0b10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0b00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0b08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0b04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0434, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0404, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0438, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x045c, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0460, 0x0d, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	},
+	{
+		{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0c04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0634, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0604, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0638, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x065c, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0660, 0x0d, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -509,6 +639,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		r = &lane_regs_sdm845[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
 		break;
+	case CAMSS_7180:
+		r = &lane_regs_sc7180[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sc7180[0]);
+		break;
 	case CAMSS_8250:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
@@ -558,6 +692,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		ret = true;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ac15fe23a702..5e750c481b74 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -76,6 +76,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_660,
 	CAMSS_845,
+	CAMSS_7180,
 	CAMSS_8250,
 	CAMSS_8280XP,
 };

-- 
2.34.1




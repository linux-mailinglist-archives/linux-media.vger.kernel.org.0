Return-Path: <linux-media+bounces-50954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84CD38F7A
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7673930445FA
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8852638BA;
	Sat, 17 Jan 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnkTiKrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138522192F9;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=oL6U8zIB0G8D3U2J51sSXhrylKfzCUFUnY1DcNvusc+Z856+8mPRh6RT1PMm1wggH82QBKFtoirr7ot5LabqKZt4EiMZe9xAEJQ1gBoUfzygKeDfaxUM/MzqNHSRLFyMmXMRF1/pDdMVZHbZxZDO0cUS/TNebmTx5BJYOh1RAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=clIh0jPXBf7Gcy6bBhCSxpyeB/+TpW2LOb2F/F9Qj50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjIhD274HOE6oOY191NHqmZOsLqjBcCOeWr8WTkz7asVW6nQG6IfLsxSSLYqEuhlCpD7FVPCKCQERSziUXemcxbzTS2pr6FNthdrpYus8AX5PO+ei5nGfuhXnJ+0wtUsyVSNAS2yyjn2nOqgojnrEfCaBFPGX2rcvE5AW22STTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnkTiKrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D55E7C2BCB3;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664181;
	bh=clIh0jPXBf7Gcy6bBhCSxpyeB/+TpW2LOb2F/F9Qj50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EnkTiKrJgCvUNLNzkkZzhm5ohtncl+YlaW+bME2neMlQ13X1E3jR+mbluL4T1HTf+
	 ZUZC5qv4PFhGq1q1v6YZewJ5E4n019JEmmUcXlimDMYaUXrftZn25t1OctRBomQgQJ
	 f/fozj/wm6YNo+x16qtGIfgnXp82kZgFruMI80Ux3ZxL+WSKl7Zk1BCA4DW9VA4URh
	 jgzqv9YbOXqH6UwnHfuOQB4Jr5fh7EiFpmTPGW1rXwnKQF3krHo7cyn4EyyK3lSOlJ
	 0WCdPs7KdP5bkWi8gQYcEhoHOzlEhYOSaK9CCNqGmIMFXqDGN+gvJdI5m5y3/LmPlP
	 T98/B7qbFkaWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7AEC9832A;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:20 +0100
Subject: [PATCH v3 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
In-Reply-To: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kjpuzxq/baxTX0/t//R00t7SKTfnhMZ+RrKmEOyVIXI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzpPrXzbmQho3g3JkEXedHr28OJ4AspwdzY
 sBkyIsFTTaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 clhDD/sEkC8zwJJ2UIqIrm0kx3YWvXPL2cB+F3a17EWoYWQtnzBKFwDivafUqk2aKCG22LcUTvX
 vZAFBgUeO05yCwm1g488SdnMsF7H97NLWeLG6AiblusttRx0xSNmtRVWJtV8I3h78VijRwBdYY+
 NudeeMSBA6DqFwUPwumYXMaS3hgA0AvkCb+d7o8paKjm0tR2ws+uQCDlgm79wKqw7SavICrj0W+
 o5QYt1cuVIPddWgwihZQ5i/LpWRRTnY2E71odoa6zX23cWrOkDS3ydV54r9l5VAbCBWfl/si80C
 +Ap5Lr5YU7ynG5sKrcR/u7Pw9nHENpo4CdDOsQrwX2lRzWE7BjVFz/eXHfKDdM2efzkY/Bh79ie
 0DoDqCe9uJpmfwoFaiwJ83/dWlGfykNY8vFErCAtnhdSrKwZWVUOdyfsJG0Lgf399OPRJwKeATQ
 D66Yw5dQjF6DsT3KtKpbbmWG8HKq9/NVq+6z+Pfw74Jp8uWuOa0VxftIddJhOBAtiTE0Z8Dt/SG
 kj2A5ONESpcRIqLN3xdJ6DMsBPlgY+phPOUXj0HBTYDDaMrxRANr9XYddENEF6zBblLClego5Pu
 NaiQh4b4fTdZVsH78Z2mkdyFWeyrc9Ag9yyKHlu/IFfr4DdeL8DWyyKgcWXn3OtuGRnUHk/dTlk
 ObJ4jkbymKqgEPw==
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
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 +++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 9e8470358515f..f819472511823 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -146,6 +146,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 };
 
 /* GEN2 1.0 2PH */
+/* 5 entries: clock + 4 lanes */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -220,6 +221,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
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
@@ -1050,7 +1114,11 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-		{ /* V4L2_MBUS_CSI2_DPHY */
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = &lane_regs_sdm845_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
+
+		} else { /* V4L2_MBUS_CSI2_DPHY */
 			regs->lane_regs = &lane_regs_sdm845[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		}

-- 
2.51.0




Return-Path: <linux-media+bounces-50951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E82D38F74
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B1BB3038346
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C920C2505AA;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0232HHI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397E221FC6;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=O1Joupagjl0l++8PLr3eA4Ku+gLis5r8b5FvwcJNMQlAHc4t3h1SUKjU8y4XvYHnISUH54RSL/JQXvVKx96Hfl9vRhVwUkjFAhDAuTNfDXTYyZ9F1Wy53g3KePQlPqe9SRkJteuJByn2zfk8GSUfjbbJ0Sby6PTctI1+uIm4QOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=/uadSS85/MPVjwqxP7KTAwdkLax6oKXXxEdPj9V+T9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHAa/qzKGmvdbuSuhSjUqKEXp4Etbif1AkLVr42hXHAG+27eZja1fKTy9LzYgoMbt/pHm2+bfpy6b2D7sIDjzdiaYyhOh04/fJWBipZ4Mk7nfhyy5h0qfqwDUYPn/gwooT4KV6LU9TzcZ+2Gzc9edjUOjhPwSnXZJnyFAwFQNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0232HHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EEABC19423;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664181;
	bh=/uadSS85/MPVjwqxP7KTAwdkLax6oKXXxEdPj9V+T9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c0232HHIOwJglfX7dHf5f6iXvkifN62mZ3sQXXHDsvIMVgTOp4qZWzpeYj+v32J4w
	 7mN5n0wjHZP0W/vX8tO1moRSPcSex3+44OaFdWegsjNqjxT9L2yfkn3PsDV0o+ZqFR
	 JdBbY3XXfN2ml/rXjWFJG5B7Pn0d81xijcvRZpMy/w/6m2Ikaw8phrcxBApIjEFsBP
	 6wIYwYVz/1JpPhkFSLSHQNDZx8pJV7PEzc2PZ0iONqFebF45YP4/Xg/JglVViGMhyu
	 flyuzAZVUGiLMEub/VAXWxLCVrhgV7vmwsQu3uWl+J6Wm26A1lFgYGbr0PPV1XGdsQ
	 9BXsS5+YVNzxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE68C98315;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:16 +0100
Subject: [PATCH v3 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mQVMyUAqZChIt7A9c/SYnHbFFHnHmz7GAPKyVmtGOoM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzxGDJZ3mmtQVncbRDgsQ27+lgn37KiiyGu
 wyjz8yF7bOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 crN+EACuLya4+/XMUY4t0rfm29bG8EUuGEpch/rxS82NT+XxNaLj4lhD0FAb6GHnIfaC8s7U0pa
 G3cvhmXPilXzTwV4C9F5cS2s4kcr4Rsu35IHb4UnTqO60NPdqzkQiCpg/PLE/mlFCcKa7vb1kb8
 lWxk307bhFzbXxsEV47dF8uB2u0LgowgLOk2jU6DZ+XE1CzEBXgM7a8BsUvmDEnxzCkA7RzYdVM
 +HdXzsgaFhmmBdRT+3pUsAEtBbWfuX2LH6Utnc/y24UxFKeDwuz8maKARdEx7fbcxCwuv8UTC3a
 +mCzj5v7uHcPCBCrz8Eqhl4MiIg4PkjnzO7DuI6rJ00y4aEnb/VI9vFx7hhJO6h79c4zLSbRRtD
 Z4HneoGvQ6kOczplakt6N4/FwVui0KEdzcF/IQhzHXHyUA8alJBRK8t86u7OFYgEmK1326UtJx+
 XFrikQGY8F9lZQSU4ccExX9gzrBK4DlgHisaQ29MywbxLfjrAPHAGke7uSb5z7q/t+hZ2UWG9cA
 H7cbiQVeZNfLt9MQPVcjt1cRYpFxn2pBNyIfatSCCv2qs3xBeaetLivDTApxGI5vmWK/u3AUyie
 vqurtHIIMboXc9M8FITR6Q8LZLITjq/hRNXt4lxUxmJkk/iQaJR8nzu8fMGq0ZpDtSskVn7BM1H
 2AlR2FYn/k1Yggw==
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
index 2d5054819df7f..d198171700e73 100644
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
index 00b87fd9afbd8..ea0c8cf3cd806 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4411,11 +4411,11 @@ static int camss_parse_endpoint_node(struct device *dev,
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
@@ -4423,9 +4423,13 @@ static int camss_parse_endpoint_node(struct device *dev,
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




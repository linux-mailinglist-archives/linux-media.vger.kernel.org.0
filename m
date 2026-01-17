Return-Path: <linux-media+bounces-50955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3595D38F7B
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66CE63017347
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBDA265CA6;
	Sat, 17 Jan 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCdXul9j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D921239E7D;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=EmoY9sgZNwEWWXoqyKvlQaZ5xefWlw0QuWEn1cPZwNspcejJfXMuMRHTZf1Qg06XKYPPNhZS0zwtubXjRqhPXp5bsGHM+/1AqG4O5YkrPYYkVHAQhjjQrknvewTA7bm1Q64+HGzp1Jvqh0HGX95+X+stpgbJvYSvdeRVMF3XNDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=swjP02ArFw1/TBbF8H+vZAaa3tb0Gg880fO6IddHcyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdWK3/ky3QiIFxqu07SYAv0Ld/7F1DCRTerH2BvnGpOD52L9nV5aYAjhKdkN5Yvp5+TJCAmcBrJECfVrK/cly+lm4T9ltQ/Uyj/pIMf7BxFHyqUD78enFr/4UboO/gJ8SP7FhGI/dxCPFaQQT48ljCCv2RL2daLU7Jp3E5H96mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCdXul9j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3093C2BCC4;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664182;
	bh=swjP02ArFw1/TBbF8H+vZAaa3tb0Gg880fO6IddHcyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCdXul9jPMhu5DrXDkAmSIZ675riItHE84tIqI8jtiatAyWDfvzJ4Yw3GriCIIEFi
	 lMZUO0LU4yePj5WN6ZqIHuZADG2vWnXjkef1jfS6uVlnqHslvPzEZ+iHd69QrZcDmN
	 rHpfFrzJwUYVh7PoXxhgN2xssJrgLC1Yxpzm2YJXRMwyWSOxO0kk4SqA/Ri3OFf6Px
	 q+egaXM7kfF7T4XXo+w71YiujWNRvQkoYkRmcPVA5EJISM1iHQnm91BGMbiRTTzcvk
	 HDs7mHkmwZbC+fHQlntu02xKsgwn6U+xQKwc4NFUF8SatMglAkUvpt55ewCcIJJq2/
	 z8OLYHsYnmtMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C6C98316;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:22 +0100
Subject: [PATCH v3 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hi1draDMnwPdDs8jfyuKlJLJyRCchlejwfH5kHTkrC0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzZuyGf/U/5S0suMcazfP+fy+n3xT4JQXGi
 wskuX13a+WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 crGDEACQZprBdLGE9LREwg8hMB/wq0tHg4YCWXxyzX33J01v1AJUB1i4khpdVVL3qAcidGggzU6
 +IveUeMakwoJNLE84/o4QYn2f02HgarO/jQj36QzSWr+Gb9cDuDP1MB65fhLqm4e0vqkyVwRwHw
 tfFFow8Y0HA0q2qJKUpPZfsi5xzbyyPOMhTGMGovppknucM/Jrpdpen6+/DsptVH2bPfcI8yhw4
 u47ouLfkeLlO+OY48mXuZv/8BD4X/r6unw2SHpvs1EePASC9BSKRqSkgAmHZ7PorGN60nTdIuvI
 O4tcvbEnTMkcL3HkWYmkLjAVKWavRA9BcvbawAS/TLjhiWqEhtAfTVVLf6mw+ytUR4OkCO5bEER
 6+Jhca+WiZSnKqKJv6kW5xlItDaesvLqj6WH01OjLr+qqVLUB/B0rOTpdYOukdxz56jQ4YkT3D8
 ZxegJJA/PJGosiXAIySa8h5XMZr0tQPkPYjPw5AaSRpsczoAHDuXT8UzbNUT+zra3IBlY3zG+Cm
 ORxOrAOayzJz5gVw3OFczQhMGhRLhUzQxL32VsF7ne9J79GYkjWXlmBJWjeSCa1D+JMSFdXSYwq
 rKS/7M1qntBKcJqo856fDhvm9VWp8hcwCxcSJWbG/d9ZGa/pbf3XjqhdNNCpzbyi9+CfIltzhwV
 nhTeejkhGbVrJCQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Catch when C-PHY configuration gets used on SoC with CAMSS missing C-PHY
configuration lane registers.

Hopefully this check will disappear as these lane regs gets populated.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index d82a88dad74b5..89bfe3710fc3a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1217,6 +1217,22 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 	u8 val;
 	int i;
 
+	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+		switch (csiphy->camss->res->version) {
+		case CAMSS_2290:
+		case CAMSS_8280XP:
+		case CAMSS_X1E80100:
+		case CAMSS_8550:
+		case CAMSS_8650:
+		case CAMSS_8300:
+		case CAMSS_8775P:
+			dev_err(dev, "Missing lane_regs definition for C-PHY\n");
+			return -EINVAL;
+		default:
+			break;
+		}
+	}
+
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {

-- 
2.51.0




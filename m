Return-Path: <linux-media+bounces-48244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3ACA4852
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 770D230084BF
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B833002CE;
	Thu,  4 Dec 2025 16:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKIH+Urn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19B2FB999;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865968; cv=none; b=SMiTCPIvjInZ8k00K8lomAlX8scHoxEKuekff9bXMTg2cNYypQqqY+g+aNDRoP9xeOerx4FN+1d0tQwI1ngGwuOLed46uRe2pFcU7m0c6E2dXVCVOW8Is6NsXqQP/6KCNdBuXijJ2TEutjTfkkU9cLnczd0cuFUs49O5+muFQyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865968; c=relaxed/simple;
	bh=/4vQnLjqXbS0OUEsPXE7m19WQVUTtjSry7GVyIJfsdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrgPI4IPL40ipw5pzdX7w/TSgncSEeJWz0nu1xZIxtMvByZu5jnizJd4hTk5DEls52e83+pBLdKnUWreYSp+vg1Popekw/9vMa7d3IynPF4E0K89KnTMoGjDVQQtt16zwtRKHp30iXX29LHjlYA132O3T1eOU8RBsm3Cv1CnSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKIH+Urn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74CD9C116B1;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=/4vQnLjqXbS0OUEsPXE7m19WQVUTtjSry7GVyIJfsdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eKIH+Urn+PUmoBYTkRxl6GqHTwmhNszbDC+ZszQrRDFz+l88yvVg+tSaON2iZVrme
	 fu1HnhkM3WZhpAI94nDJ/WSeptV40GNq+vvKBmDvD6n8aee+FoBt8iec2OFjZvx33M
	 uy3ND1HZ/CNMfIUqdXft3nyMicnyws4IvBRWKwK4ehxcR0SCHyV9yX8oc92jzTZ9gC
	 cfjwL+ug2O9eipqqOysPkjDRNytFkNaAkgiX9n2R/y2s0JcFkTTd8dHMvdx7slFRvx
	 e8KsJHPCD20fpdT2hj/tw/xOyuiO0yt8OdIDbz5wsrbMlUI36GWyq6REW+9hpK8gBR
	 N6YQmDwfLdVpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C05BD216B2;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:41 +0100
Subject: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wbIQ6Ecj4wb9GDskxbpQu5QF2zKRS8sSbJFfBe0x2TA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbetd8v/yjEvP1o+sLSzIMRSIM9tVDlys2CAf
 3lSHLzUfEyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rQAKCRBgAj/E00kg
 cgpgD/sFQSUlh2CaJiY5XFpIXxppoSIWoQgAvO3hMY5mdfUIY55IKkeSZDBqRgxMaFtgrpALS3r
 qi1iZ6bk7EiheUcWnBkx7KDigWFLg4mbsvp8vCahVfXt7PKy21aLml/JCk6IV0yPX6CTpTY6Ltj
 M4WbXA3TYQCur68zkVmRbGwei7gtJfZd9K/ZNq7KNDnQSkcZCVJB8OM5HLlEU+YqOx/LTS3FMn3
 yaTCg1gH/iRdQa/DO8+QCHZ1xvyha11RwDr1hMBK3OHAfdh1FmEP0gxebuh853g19q5tuXpZcRE
 FUi/Qnj+PVRcZZHJoK7W2kVhaYslZe0XgSq8oVGtVb16TgtwvQMcx1SKjct28Y8emb3yJ/bQ8Bz
 SnTRiT2sCwTTXUF/67+Y/3seWi5YWgE5eWXmES1YltVANR+iaMF/ZIMtUj5x+52tuftdWMDVDvU
 HPu9j1EHxIj1KuNFHmvwlJ8C1o9+X5aZt/CuXyQyCAcNmvZgSxNOtuS/kDYjiX0K44HZPlvpcQa
 2DZpBeMDIzsQ+KwzxZ6sgz3F527SuwUJhcEjOnZmlOI+O1xy0Ybs2J5WspEser5/D68iC52FfkF
 sPbyFtIxvH9oeORYi5M0KJ0ZbscElbi4DjU4/r2wSGDtviVHA7LvEwZH/5Yv2eQ4p83idIQTa1r
 aXRttiHa8qR2Tsg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Make sure we have proper lane registers definition in-place for each
generation, otherwise C-PHY won't work.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 6d6dd54c5ac9c..c957f7dbfb243 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		}
 		break;
 	case CAMSS_2290:
-		regs->lane_regs = &lane_regs_qcm2290[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_qcm2290[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		}
 		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
@@ -1236,25 +1240,45 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		}
 		break;
 	case CAMSS_8280XP:
-		regs->lane_regs = &lane_regs_sc8280xp[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sc8280xp[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		}
 		break;
 	case CAMSS_X1E80100:
-		regs->lane_regs = &lane_regs_x1e80100[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_x1e80100[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		}
 		break;
 	case CAMSS_8550:
-		regs->lane_regs = &lane_regs_sm8550[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sm8550[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		}
 		break;
 	case CAMSS_8650:
-		regs->lane_regs = &lane_regs_sm8650[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sm8650[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		}
 		break;
 	case CAMSS_8300:
 	case CAMSS_8775P:
-		regs->lane_regs = &lane_regs_sa8775p[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
+		} else { /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sa8775p[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		}
 		break;
 	default:
 		break;

-- 
2.51.0




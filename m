Return-Path: <linux-media+bounces-48240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D0FCA4855
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 17:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9DC33044E2B
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 16:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA82FE592;
	Thu,  4 Dec 2025 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCxQDUKO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607C2F7AB0;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865967; cv=none; b=SxruCZqJp5/osHhudO/64eWnzTUCr8jTG7hShhu4cLdTfeC/jMk9i7pxaqwmQa+JzJlkOsEmQbnW3QjLFMtNxrE/iOmzohZgx8le7lrymK5Pb1UJdkNcY69J86sYP+E4CPDFWjCi5ZdceTqdO4/ASTUiNoOIfsg42w/NrZmWhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865967; c=relaxed/simple;
	bh=6aIxYpZiMLa3OaekRnpWMLZNEm8lGyRMl8tuCqf+has=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuXwai2jWxOzAWZsHfDznyhzaGnIB7EGmGNcDwScrO3pa+DpexqrKlpb6vUrE2aiR6inW4JzT9hW4wAdpOrjck3b/VWXQ0Z7t5NOeGExyqX8gI9hvtRt7s6ymMRqWHICd2NUBMARxoEIg6kitPZMdypqz6Udep7tne/Zt2Y8Jgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCxQDUKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30275C16AAE;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865967;
	bh=6aIxYpZiMLa3OaekRnpWMLZNEm8lGyRMl8tuCqf+has=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HCxQDUKO7wwQopzyHaybwx8dXPqBHkRGJ2kqCbQFSAblQcAbaaOdoME9Bf36bup5I
	 wMuAfhirrBnyGPAYLqq91vUlxic0zu804vYrMGvug3xZYit7XS7v4f/x4gIjqPpsaE
	 KdXn5OnIWRPGelxVqZ0A0i4eRA9SVL4tllCZcelquClPs/lBV3/zBUX4/LeFD6Vz2+
	 KfjNer0MAkpV3dx3Z5G2PeR9ZD2TlMdxmhIYiEb7dL36sOx4I9kYavMNn2A/ThSDS8
	 cVcWB4uaW0rgK41MwMhVXuRDt+PYSd0dcL1jHlZ/wd1mQOztEywRUYktLHnPxisOPG
	 QvsEzmvRjgvkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2585BD216B2;
	Thu,  4 Dec 2025 16:32:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 17:32:38 +0100
Subject: [PATCH WIP v2 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcom-cphy-v2-4-6b35ef8b071e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3716; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DkOotaipM9pBA7RbX/eKCATzczHp/kS7bChskx461cE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMbeseogR/3FRNARfncsun4nAI8wmIE9Ht6XOb
 P6+uT+L6ieJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTG3rAAKCRBgAj/E00kg
 cqqhD/4uurFApFZLgxflxfWkJf6YiX0GwQ1iQjTCQtWf5nENz1XuRbMAmM3uBvnAwR27Wd9dQ2/
 0v+tyGF3Nxd7MYL1wmXB9aBuuteU7OaCTGntNNvuYyII2j8EJ4/LC2ArbTzkDEWzlzAYYGT6Dc4
 sn2EYLSrJI/ln/dt+ANUvOvHHR4HcJv8h40QZ2ky5ZYaTgExSl+LW5+gVS3FgDNm41OjupZ1Qdf
 Z+L6ILvjXfNE1qiSWSNCPLlzXJ0xkzniUgYVNCeAaDSPsYLJ7w7ilFZQ1BrDoUypCSn3eg+XSjy
 yGdks8tBS3j8MCAXvgnLWjCJ50XiW20igSjFsxSbV0aCKVrsBASoOW3uTNB2mtjOzkVmC0qudlR
 l5JIA6E1VmMrzqaPuTtAhl4T3yzsGnm51EP/rDGzgd1UmWo0GXWhGRLi3E0TmyPSnEw5+dPACtS
 ViXII1OsURuOJ1bqqnWLqPhtMDn4yg4sGXrSVMuptu6vsfsWNoM3c+0TR77c52hd58XTgt1KqCc
 0++daRh7YyXxXzJvIY4PmAXtZKUoUdfzwK8yL/zvlvZTYj8zsDqFEh+DoIJJBjPk+8ysvCIoEcP
 kl0JMdKWJLXwsMeqHlDloQNXFA7QGEISPLJ4GrSr3r40Ov2UNWVVSLVzNQjKsBwjjFhp8ECMjU8
 fWD+AwdqmAiH8Cw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <phodina@protonmail.com>

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to a later stage where the
configuration structures are available.

Signed-off-by: Petr Hodina <phodina@protonmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 73 ++++++++++++----------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 9ff79f789fa06..3d30cdce33f96 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1041,6 +1041,45 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	u8 val;
 	int i;
 
+	switch (csiphy->camss->res->version) {
+	case CAMSS_845:
+		regs->lane_regs = &lane_regs_sdm845[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
+	case CAMSS_7280:
+	case CAMSS_8250:
+		regs->lane_regs = &lane_regs_sm8250[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
+		break;
+	case CAMSS_8280XP:
+		regs->lane_regs = &lane_regs_sc8280xp[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		break;
+	case CAMSS_X1E80100:
+		regs->lane_regs = &lane_regs_x1e80100[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		break;
+	case CAMSS_8550:
+		regs->lane_regs = &lane_regs_sm8550[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		break;
+	case CAMSS_8650:
+		regs->lane_regs = &lane_regs_sm8650[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		break;
+	case CAMSS_8300:
+	case CAMSS_8775P:
+		regs->lane_regs = &lane_regs_sa8775p[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		break;
+	default:
+		break;
+	}
+
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	val = 0;
@@ -1110,47 +1149,15 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		return -ENOMEM;
 
 	csiphy->regs = regs;
-	regs->offset = 0x800;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	case CAMSS_2290:
-		regs->lane_regs = &lane_regs_qcm2290[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
-		break;
-	case CAMSS_7280:
-	case CAMSS_8250:
-		regs->lane_regs = &lane_regs_sm8250[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		regs->lane_regs = &lane_regs_sc8280xp[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
 	case CAMSS_X1E80100:
-		regs->lane_regs = &lane_regs_x1e80100[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8550:
-		regs->lane_regs = &lane_regs_sm8550[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8650:
-		regs->lane_regs = &lane_regs_sm8650[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
 		regs->offset = 0x1000;
 		break;
-	case CAMSS_8300:
-	case CAMSS_8775P:
-		regs->lane_regs = &lane_regs_sa8775p[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
-		break;
 	default:
+		regs->offset = 0x800;
 		break;
 	}
 

-- 
2.51.0




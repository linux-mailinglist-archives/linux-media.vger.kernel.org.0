Return-Path: <linux-media+bounces-64506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hHYOMC+tKWqEbwMAu9opvQ
	(envelope-from <linux-media+bounces-64506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:30:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB766C438
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:30:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=MwuXagvy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64506-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64506-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50F2130CA17D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F97035E1B1;
	Wed, 10 Jun 2026 18:28:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574D29C328;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116106; cv=none; b=m+BrpyZBNzKrmxSWjjhMJKKLs0aZ0c5VuNLBBICbgYRR0K1cE2Uf4AXzI9B+zzDg5s5QwfQNxHewP5XVXBEj/rkXWzkzJECuff2qWUVedL45XB+jfjojKuCl63UcLlJVAxaCEBdQGnT8PovP4pFqT6PVJf9KY3kqV9xlMnmluCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116106; c=relaxed/simple;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QspCyad/oXRnh8eY73YRxy/hEr+WsKSDZtziZXq0Z5GpOZbE0y6AmpMZt+756HCTO9Gol+GfsBH3XRR42hra8HTSJr9FOBbld2qD9RaqR1LqXz3aI+y2ZR39RsizlxdUqh6ix9VmGDi16vJrfGw2lJkJmfR7DM7DndTTyE4DiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwuXagvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33DE1C4AF14;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781116106;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MwuXagvyfCAaKiyA+gNGbYnvJyI8wKX5GJktLB3QlDl+lyvjIVggr3VitYODzzT92
	 zwez1o7m86yUWy/K0ESzA6nKnEyFWfrFPNVqthV8RpKyQKaHju0pX2XkIUyHV3La0Y
	 Y+9HTEfqlc2mrTvDfU81pN3rSbkUBzaG9ttOybD2PcCXAeOl6PyAL1R1elcfW63c8I
	 277EKMeue5qD3dHOBphakJ1r+oxekQskRT7KD3owvIwRxVsIlxprfxbX9LteqelwmO
	 w2fvsaDtax8yMf0MS4qZVWIBNj6j9NO9Vu/FIJmhhaYdP7zBfXee1GnV9Mc1KoRTNd
	 NhYTVkDP9JSOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B34FCD98C7;
	Wed, 10 Jun 2026 18:28:26 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 10 Jun 2026 20:28:23 +0200
Subject: [PATCH v8 3/9] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qcom-cphy-v8-3-cd4387785179@ixit.cz>
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
In-Reply-To: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TVUoRIJn5ULvYNpapsB4ZItCc34ZCZTZby6Hd3C8I2o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqKazHq88a544lmWGFAghH+C0vt7VXhKfnt2e9A
 1TmU6njwsuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaimsxwAKCRBgAj/E00kg
 co9jEADH1IKGSsgWZ3amcuuM4I389OIuoXYOCheH/7IRPVmwg6zd6Rnd4YPkQ5DpYLr6uSBcg5f
 gNINwEmj+Vsu4bbel09NThpVotELMHwBTQwQjZaIugQ5s07Rsuap6tXm8OUqbG0gzuAL5EyU5yI
 Ybks+ND1iq1zu/qcdaaybCnKHKTqQd5iIkytn4gigEfEsgAZlFT1ZjL6+41BebEuDIBAay3YT+c
 qTzb8zL+n1MPaY+iu1RCQhzTIadZ3AdXUAAfUEJJlRbF/kgmyYUO0G1cy8ApsHaGg5d0+cnR3/c
 2JTbUp6UgnM+caWS+JbhbXODltXepef7kwDhm47kgkrZGR+HffV+ta7rfri7SwywIg4hKqFfd6f
 shesCqbhQsF3KqZxrmXMGST6yZ5c+VJ+qMfrKhnKGHQ/Uo3JzQnwjhfpoyHMqsyXnnXvfj2CHQ2
 HPF1XFnY+ceKVDUEGgNvIZCa1bIR4X8sq7Y6Q86kqD72V6eyFfdsBJWtNe6wzBgpNoW3rXD1wg1
 hosDAS3vGzxiMFEZVn3ZF/8TIp+Od+OE0huIicF1rG798Fh2+yUH9WEj1IC9ek3wdciTfGl9zfe
 AUKZ6LlMvaaUOQsuTyu4HF82RQQvZav/HpSTRr9cS7xftCnlL5adHpO2WyUWVd7XiaiU0j0YsqJ
 UiW7YA5DHZN2VgQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64506-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35CB766C438

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Since there can be unrecognized configuration allow returning failure.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 7c8c0e41bc62f..dfcd9ed2eb7a3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -9,16 +9,17 @@
  */
 
 #include "camss.h"
 #include "camss-csiphy.h"
 
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 
 #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
 #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
 #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
@@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		writel_relaxed(val, csiphy->base + r->reg_addr);
 		if (r->delay_us)
 			udelay(r->delay_us);
 	}
 }
 
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
-	u8 lane_mask;
-	int i;
+	u8 lane_mask = 0;
+	u8 offset = 0;
 
-	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	switch (lane_cfg->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		offset = 1;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+		break;
+	default:
+		break;
+	}
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
+	for (int i = 0; i < lane_cfg->num_data; i++)
+		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);
 
 	return lane_mask;
 }
 
 static bool csiphy_is_gen2(u32 version)
 {
 	bool ret = false;
 
@@ -1155,20 +1165,17 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
-
+	val = csiphy_get_lane_mask(c);
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	val = 0x02;

-- 
2.53.0




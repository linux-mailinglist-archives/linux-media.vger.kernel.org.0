Return-Path: <linux-media+bounces-65088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nS5iLQpcMmowzAUAu9opvQ
	(envelope-from <linux-media+bounces-65088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38682697961
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:34:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Q2Qk8Rtg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65088-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65088-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 581D93081291
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED023C37A2;
	Wed, 17 Jun 2026 08:32:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745231A813;
	Wed, 17 Jun 2026 08:32:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685145; cv=none; b=clYPoZPN7gCk/PKuRA6UQvNCz1quFYhs2Y6MyVhyZ9JwRYXi5RGosOAgkYvqLXXMlGWfgM8R/C6SWBWX1l005r3qE6atiidiLfgzeha7AJb90/A0X4XYQ8OrkUCBE4zw8Kzwafa40Bg+Vgap4rJVAVG4FEsMN2Y50kxsB4NgYaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685145; c=relaxed/simple;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmOAu3X2qEfa6ssUDOGARt8orn+kjmYc7e8amvhzP3xIHbORO+RDmr8C4MnAifn7ffh7nntzhNKo2Ay6YMi07R3zOZSEg8KXx2ISVm9NU91lELXLqOpEPRzyHF3ab+6DKxqCOwMT6dUGYrEVh61eHSwYRaourWkxWAlfMXnrOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2Qk8Rtg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02860C4AF10;
	Wed, 17 Jun 2026 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781685145;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q2Qk8RtgTJ8MmIkDWSztRbTuyq0pn7PNLSBkOPFZLNcCgHNuLu+nE6IAyxO3HTOsL
	 +FPl5dEtjoBIqKjFTbDZiQvmM8IWVf5Jhw1erxiYS+jv+CaCySowQL83E8ZzkDzTWj
	 OcnSLJbzEER8OXJDAe0pUcsxwYle+CEziaEVkPbDjZhuaEyg2BuDWH1gy2i3KOG1A2
	 vskjgXhR5uSUx5e7Jtmk9MWNerp8kFu3BW5Szj1/AEtvgdwJGkOVtsJlaVtZ58YfdI
	 PC2WjhYhO8i9XaPnUuiQBSIy+cE9M23qlCwdKw9anI53qNSiUZL5NcuC53d6X69BJZ
	 AAjk3sU8/cXsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA057CD98F3;
	Wed, 17 Jun 2026 08:32:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 17 Jun 2026 10:32:21 +0200
Subject: [PATCH v9 3/9] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qcom-cphy-v9-3-83da8a8e4e44@ixit.cz>
References: <20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz>
In-Reply-To: <20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz>
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
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBqMluWfUjjVHlJpHyZz+U52zgc/28encT5gyJV8
 k3wzOiWasWJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCajJblgAKCRBgAj/E00kg
 cv0ED/dLTzOO2m/vnWueadTUMzsABVmaeM3cQyuPE3xVZY137KcC7VvNmurVXuJN8leYMABbPpB
 A0iyzHSA1bIldJQhsgmZEkhI5nS1oiqNtkxaap2sorwUfWsMe7c8ev4tAh449rKMyj6Nt0XewSe
 q2WJ3Qq58H5SasqvQLjd5S31hF0E+zdShsGHGuk1yEPY2pSTmYYcJexROICPw31y5XPE9Y+MpvT
 Vz9DpBcKy8fPbsaCgBOmQqCewcA0Ry/+3odyFDQwH3SDYtFSIHmIWbWAvUJ2ffJ2EwsbQprt/38
 2ghVRtlOVA3YIYUyvw+xyGp7DCKUvu5H0Mx2sCmjxR2OV2YHHPLpp5Ztg4pxYik/6IR84MbkDtU
 5zhjbRIQVzuGBeDCf95b6UqJivDNtJkYt1hJrFe2jMhurluGntWIT9ltwS8w/uleRQ8D0vZqVx7
 zDC6YdeiNtXB3Aezpf52p42WmB9lGwwd6hqWXntJsk92ilnqmJ0wj4kbNwqQL0QIiegPouV5sni
 qHztPAIam7CSSwDx7PwKzjsE+pUYXeRSyTf9EWsVVZCuUYlA+RJI/XU7DK2q8tfgTWQjUhJWi/E
 Wo6+zO9X7zRM7O8QITvfG1AVKraXqGkI5DC0awLb1siJMNPK+TFpPcQlI0scb7DmgkaNh+BY5nj
 97dx7Oh76xwIw
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65088-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38682697961

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




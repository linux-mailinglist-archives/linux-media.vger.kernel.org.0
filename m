Return-Path: <linux-media+bounces-63901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0n5fHfjMImpgdwEAu9opvQ
	(envelope-from <linux-media+bounces-63901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:19:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53E64878D
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:19:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=hCyKQ3QK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63901-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63901-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7E1430BD8DA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67CD4F7987;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD983B14BE;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665285; cv=none; b=r/7Y+Pn2ncS7HtPJEjoT2vaoaWh2Fk8NzaPiXfW1235CfsqsXHuX5nEMQmsFok1Zso0QzZkWirsvIZ1LowY+uJoiCkd+O8YZthih0DPCfaND7cLLOBu/nPD0tHTHYnSaTjpt3fGRWGziAkNj+48k18EnD9b6hR1+LRvNbNNavtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665285; c=relaxed/simple;
	bh=q3ZNsBCNgVNefxq5CdDB+JWgBOfQxYyBCbEen6rgQWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPyrDR1+yfek2u0utyRf1ezYReCpwSPXDQ/CINilBuIeK0tjYVW1bZDl3aG/wp101EvhGdXatPJslF4AQI8GN8C4t8qZeOm8U7Fvbrm3R8+B7HeJw9KMrkXRW5wkF7PNiTCm6yryYwHk5NVf2ibQyhY8f6B5rjrdK6FqgJc4Kcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCyKQ3QK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3323C2BCF4;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665284;
	bh=q3ZNsBCNgVNefxq5CdDB+JWgBOfQxYyBCbEen6rgQWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hCyKQ3QK0RlyBqxluNBsXsW7eMQPbYFpdvHdv8we8BRrnqp1s44j9RdkpeJC2qOL0
	 W3rBLVCkQjVBFmAW/pXOWNb1CCJ69B4HwnxDY8EnBUvqoAL2UPVoKTxQV1aOXGi4a8
	 FyMBrHudmYoMRQ4EEm4UHfFRWXDEFRw6D+SU5vgU3/sk+ZKat6kcmarfZ3k2JGjw3u
	 GIiBNhCzWFEB0F0c62yJ+dmANKQKUj24qdcKKWEA7Jo1K/obJnKfk6FAPSHPXa/fc0
	 0Mnt/+wmsfmecdwF4IJf7Gpv6odsg2zENIQBkZ7Ua1XNDmHrHWOmJgrC9WNJx4sIKw
	 d2x6xCv004bpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6383CD8C81;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 05 Jun 2026 15:14:40 +0200
Subject: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
In-Reply-To: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gNGls6uvVNWNZfEwprBXiLdADNtKq3Hax/Bn32z5N40=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqIsvCP3OpNuaAWYcLDEbDg9Y06UpRXZtvbJjxO
 qlT786wrIWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiLLwgAKCRBgAj/E00kg
 coETEACl4+9Lu2v/iNhU6bdE9Vo3SAbLrBjvDl5gwYp3w6rXndXgVlOWtmeLUghnp2w27y0cUfj
 zcnEP3laAnt/Sn/wIsg0bJEHXzX9ohN3b6zHj8bR1Z1FdyKd1HZYaG7KOGLUZ7ludNFhJabjgHy
 Tmi0YGMz3yEtFZMkVy6OUyYOPiLXCLPuzZ25QA5VOdk8DktVgpJOBiK/mG2q5g/Ewod8Hr+Nyxe
 cjUWRyVS3C9UMu4QsKoqauakJd/2i6LM9zaalWCR7HT3+UHi0bz56hFG8vI/f20eX3+7R5pGtMD
 +SWTXKTkKz7Ip/7wWJL4X1rUE8B8K36u9KK4Ha9MhjWkG3KbezsNShWKmuJs9lK7sEM0WyVwEvn
 p2TgAaazZcT/ZCswYXH0c/FZbwZnOvqrmVhIzZ49gIKGghvxmTiet0BBlQ1y+tVmWHmGEYpy3Mv
 k+lzF6Z3Qoug9zemJTFJp70Tl2+PzoODOjpC9z+KRnbmOBaD37DZ6K9vXx/SKx0IqxeHzp7lc9r
 7sPk5fII+EWllT2Diq0fAfLGplqSOr2d9UHcQ95X+Swipkjr141cAfhpHf+sszxdvdUJOUPoXQo
 E2D18RuMfV02z4XMwX+5enBFhgEMUarppQznr8YTH+4++yYo9ZDrfIlUXP4t69sm+ka5ZvdSwPx
 xgwPpshsKMw6eQw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63901-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C53E64878D

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Since there can be unrecognized configuration allow returning failure.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 39 +++++++++++++++++-----
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf7995..fa24fc9706748 100644
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
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+	for (int i = 0; i < lane_cfg->num_data; i++)
+		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
 
 	return lane_mask;
 }
 
 static bool csiphy_is_gen2(u32 version)
 {
 	bool ret = false;
 
@@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
+	val = 0;
+
+	switch (c->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT((c->data[i].pos * 2) + 1);
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT(c->data[i].pos * 2);
+		break;
+	default:
+		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
+	}
 
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 

-- 
2.53.0




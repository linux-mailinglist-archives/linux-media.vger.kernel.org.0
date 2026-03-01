Return-Path: <linux-media+bounces-53859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFz5F82No2keGwUAu9opvQ
	(envelope-from <linux-media+bounces-53859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DD71C9E41
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43071300F5EE
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC3242D72;
	Sun,  1 Mar 2026 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6M9lW+z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAA3C465;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326283; cv=none; b=eSHsr7p/4UtchXj6NRhB6uTGg5V5HBJXO02uHZNu9P1euv+r4IVn/cu+WyCZco4Blv6+I62oRxRvAv/z7DJFxYXwz7MDefBGoKBMSUUzgIJur5vrepWkhbzFYpoKMqlQKvvpa9wNoSbDgBsR9RjK3LVlE5529Haism1lYZ85S88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326283; c=relaxed/simple;
	bh=Uz6QZP7yrFfNujd7Te8dRhcRZJAQIGe3Dv8OgOy8FUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVvZmz49yhROOw1jfRjqnhFnC7w7mbdIe6/ipw0e/5dobjxrFdm47EImLhE9hmpXdp1M4k7ZTk7UuXuzkLBondA/ZgdZO9hEFFI0mwgAa+bbqU+QuFTMWc7MnSbeqeLeqoyUxQL9Voeg55e9KICrRP703RTcgwltZ8c6RE8wmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6M9lW+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53477C2BC86;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=Uz6QZP7yrFfNujd7Te8dRhcRZJAQIGe3Dv8OgOy8FUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u6M9lW+z0FR4CJhJ34Gzt4XAUz6+FLeViVzQVcqFjsklvtXY6gcOxVq9iqDoeWXzN
	 nuqVUMO8PzocbYfbvKF1egsE70y3X+XIw7whJHtSzmaEl7cX1/gtgefy35dyGvZsoq
	 Y9KgqG0gpUs/ehucHC9NuYBxy2ah/RmqDI+egFodU6AYTuUChRGIvdz7bJaoCzUfxj
	 vw+IqYrN53bWJ9eU33rxGl4hw6I6jPmntz4jf/V4Gc0Hj7ki24+PNbOkw+r4RdsrWC
	 uY+qo0MwIC0gffNeZ6aRRpIJJj5vBMANY5Cwqdh+cREJpAhHd60ZogNhz167vrGxC6
	 Ryew3pDPnNQYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EFBFD0040;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:21 +0100
Subject: [PATCH WIP v4 2/9] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-2-e53316d2cc65@ixit.cz>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
In-Reply-To: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6462; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rTZ6J47ECLprwfYBbP1bL6C5zsfu9IOrZXbtNtbAtRE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42Ia0lUzfipazsv1Oav0fS036ikiRXyb0U8Y
 a45SqFWpZqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiAAKCRBgAj/E00kg
 cnKyD/kBcPvEkQr9EKloaXvPwIsl0uMcHp6YzzE1Ck34Q0csuq02ujan3aNTR8YbK7ArMz2wE2k
 80IBOAHRwejUoGfEiYxDRMhR+Wmxs3t96mDYkxcD1CSr0cKA4SZPdceK5Ik0fXqhGHdWmsFjvtM
 04Fq5A5+Oam7oV7lgmejAwf6MhStkZ2leBAWdFa81BBlIulej/cBNwqCoPf+T64QSrkF237rXJx
 yj1Fi1j6qcaThqd/6uj5W0WNdFemRueiHPUkRs3Iaf+H6nBQIlSJB02CjIXkCjIMnhw5ekt57lN
 1TRnCa+Vl84ZMfzHysDdDnTL6nSmG2IiYwbdQ025LmjW48PYty9XNBcDAOHudB9MausQ6QiuJ6K
 i5WUstgD/Zrgx/kR2lh8PYu8VsyKELuaBcvTditWk50JqTXZ7oZVhS/KYxMvUJ9LQnLw00hBeGn
 EwVnH+U321xcHj1ZtY2M1dY5IOYlamruykDRkJIuruptTACYeQTyk6gLVyN3wcqycTOWkpCU/IN
 sXhX+aKKP3B/+N5Z22A1szFhcJZNuek0nkECTuB/TjBEXV1lRwPCN2MnvpLCTbTOIuSkEWiTCfX
 l4HAEOqOIRhX29PkL5F9j1zZcuftrd6YV4ATfrbn14lVyXAowSJ6qKaY52RO33lh+FY5KGrLoXx
 xmRrXZRfIzK74Ug==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53859-lists,linux-media=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: F3DD71C9E41
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Since there can be unrecognized configuration allow returning failure.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  5 +--
 drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
 4 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 9d67e7fa6366a..bb4b91f69616b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 	return settle_cnt;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				s64 link_freq, u8 lane_mask)
+static int csiphy_lanes_enable(struct csiphy_device *csiphy,
+			       struct csiphy_config *cfg,
+			       s64 link_freq, u8 lane_mask)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	u8 settle_cnt;
@@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		writel_relaxed(0x3f, csiphy->base +
 			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
 	}
+
+	return 0;
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 4154832745525..cf83c9e062b81 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 
 #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
@@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
-	u8 lane_mask;
-	int i;
+	u8 lane_mask = 0;
 
-	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	switch (lane_cfg->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		for (int i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= BIT(lane_cfg->data[i].pos + 1);
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+		for (int i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= BIT(lane_cfg->data[i].pos);
+		break;
+	default:
+		break;
+	}
 
 	return lane_mask;
 }
@@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
 	return ret;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				s64 link_freq, u8 lane_mask)
+static int csiphy_lanes_enable(struct csiphy_device *csiphy,
+			       struct csiphy_config *cfg,
+			       s64 link_freq, u8 lane_mask)
 {
+	struct device *dev = csiphy->camss->dev;
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
@@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
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
+		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
+		return -EINVAL;
+	}
 
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
@@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		writel_relaxed(0, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
 	}
+
+	return 0;
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f4144..938600f3defe1 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -265,6 +265,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
+	const struct csiphy_hw_ops *ops = csiphy->res->hw_ops;
 	s64 link_freq;
 	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
@@ -295,9 +296,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		wmb();
 	}
 
-	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
-
-	return 0;
+	return ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index d198171700e73..21cf2ce931c1d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -73,9 +73,9 @@ struct csiphy_hw_ops {
 	void (*hw_version_read)(struct csiphy_device *csiphy,
 				struct device *dev);
 	void (*reset)(struct csiphy_device *csiphy);
-	void (*lanes_enable)(struct csiphy_device *csiphy,
-			     struct csiphy_config *cfg,
-			     s64 link_freq, u8 lane_mask);
+	int (*lanes_enable)(struct csiphy_device *csiphy,
+			    struct csiphy_config *cfg,
+			    s64 link_freq, u8 lane_mask);
 	void (*lanes_disable)(struct csiphy_device *csiphy,
 			      struct csiphy_config *cfg);
 	irqreturn_t (*isr)(int irq, void *dev);

-- 
2.51.0




Return-Path: <linux-media+bounces-63456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lrmiFCNoH2rTlgAAu9opvQ
	(envelope-from <linux-media+bounces-63456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:32:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA6632EB7
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:32:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=GASBQfPr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63456-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63456-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45A3530A0B18
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59883CB8FB;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406DE280CE5;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443053; cv=none; b=kbmgc+g3DL2BKD8cnvMPqxywhgBNHKEwLcbtC5psnK5/vO6yFoqkXdjNRmzGXQKyH0XMQtOSBVtd3hbNQjsJcef0fTbsSZUIhr+zCbwJJTCQlByGc5h4D+O+XxeRoVR5atavuKp1QTcliha5Nj3gK77RBAPvX5WGbg4j0ooDPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443053; c=relaxed/simple;
	bh=CjfCagTQLI8bBi6i3IWnIyNxNKAECGht+E/xZ9ED7So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkyPbjxCan7nH+6w8yn8YORMR349JEL9bnhoxs4qRkXpMi540PGvKWC5nqvqzX4GMms/D1C+yycNgGo8ZbuxuNKrbZU1A+36MeUOkaGPG9HkX9MTVUdQ1H1zkHgY5PEFwZFhPOgjeYJ7bcq3xDJKh/sQPZFtwcUXi9eOZsmxbcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GASBQfPr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D05FC2BCF6;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780443053;
	bh=CjfCagTQLI8bBi6i3IWnIyNxNKAECGht+E/xZ9ED7So=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GASBQfPrkQRwc51MZGFbUzqZk6jA1NmWR1zCBEUyCEvLgOMi0qa3T1u0p0H6PVqeq
	 PrQFPALYSb1xTSjyikhN6vi9S+twn8bdWkbfEOch6QdSbfaSQALXf6PdfLF2qpU4vn
	 5DLvUGQVKwPBGe6NcB334iMXbuBd73JblfaUrwG8WMTX7wb0ivmJbyTZmK8J2epSqS
	 Bm8E1C1QJh+yCbbXFUpajqx4ib11Tu/0ZmxS2QDsYXeH37DmmmS/ujBXEJOHyMuzey
	 mK/zVRnEc/U6l+i/9Uov/C6FWeOG6k+JeXxc+5owHzINvz6WLvzwESAhnv9J32GErL
	 KswkRQ3P3ZnSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9DFCD6E6A;
	Tue,  2 Jun 2026 23:30:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 03 Jun 2026 01:30:41 +0200
Subject: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
In-Reply-To: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=S/NCEpJ9Qg9rdkYHEby0/Ggz1JWYH66XExTkL5xCQFM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqH2eqmiThGqOenOAQV/pT5wh7aaQ+uc23W6WCc
 W45LO893pqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCah9nqgAKCRBgAj/E00kg
 cusYD/95uE6PTfjvRU0xvq+WTCLJjA3pdhBhpXuNoZB5+KoawdkbIRN9lOyDY3Ks+dW+z6Tqom8
 kIKKPySLiBR9dOXzeMLP4soTk0J0eKUZa0dSXc0XCkVOWgKEPD70GvE3X9aE+Lp13UzVu07+KHJ
 gYRdy0oYb98OaBaJEDLIuu67eNNjGaRUrv/g12dTbbJgxj9g88nW0omvb/kw1aCNKvDqxNzj1Kf
 BqQrQm5Qi3b9Blal/huvec1tkx/9chP3oNSIB2PKWC/xy8LuExpE1JllMlclSQQOOSfwDVrInXw
 KfoS4oEcHAjDzTdd53UouVhurniU1q6ocqHfqQ4RppgVGWzkZyFz+X57yq9G5sh712y45gsLS5X
 7Vbku/+G7QiL98WQOudmk1NYQjPhFdRQHUptC0IY8K9z3UX3I4WpYK2PEV3ctyypG8AoZ07TlyT
 cFAxvOBeaTPKPCDeuw5ZDRKrWYFVM/Y5hH0Unpm+9lNtvXUbjmOLI67AvFkShve7zKLrTVD/fIY
 ofIQBZsA68sCtjRiZIT4/TU2bCy0YWTBh0b5e7CO/Mpwl1PwI1y22MrRLUT7madBlg11elX5yyK
 /fzZ6eEsSw3lRQTCQ8vRwUa4shzVihIjdLcVlc60xNWd36zo+90lzlgF05D5uYg3dC8prU2JXiF
 r19/OgJHHk/Od6w==
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
	TAGGED_FROM(0.00)[bounces-63456-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBEA6632EB7

From: David Heidelberg <david@ixit.cz>

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Cory Keitz <ckeitz@amazon.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
 drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..52ef730b10553 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
 	int val;
 
 	if (!lane_cnt)
 		lane_cnt = 4;
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	if (vc > 3)
 		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981b..8d5c872f84ed5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1286,16 +1286,17 @@ static int csid_link_setup(struct media_entity *entity,
 			/* do no allow a link from CSIPHY to CSID */
 			if (!csiphy->cfg.csi2)
 				return -EPERM;
 
 			csid->phy.csiphy_id = csiphy->id;
 
 			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 		struct csid_device *csid = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..00e2669db64c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -65,16 +65,17 @@ struct csid_testgen_config {
 };
 
 struct csid_phy_config {
 	u8 csiphy_id;
 	u8 lane_cnt;
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;
 
 struct csid_hw_ops {
 	/*
 	 * configure_stream - Configures and starts CSID input stream
 	 * @csid: CSID device

-- 
2.53.0




Return-Path: <linux-media+bounces-63457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2miICzJoH2rYlgAAu9opvQ
	(envelope-from <linux-media+bounces-63457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:33:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 953FE632ECD
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:33:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="T9466c/6";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63457-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63457-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4B7030A4CBE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7123CCFB8;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A92BEFEE;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443053; cv=none; b=ap2MScmCys9oIJZemXZNJ+PMZpsrVJaWL4P1aviC37UswliTCQUINTHzqUxXYqc2kHNRe+LWNGi7mF+sVSFhXZJ59S9iJSkb2dy+tZZHqqhBBHYcnRxa/ylfgBHQ32GDYPH+fuxeQuINkY8oHugUm1VG6Y2RhWOCoN5MF6exDMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443053; c=relaxed/simple;
	bh=1Vh82qJGGC1Heb5rOQYS8il+RuoY07KZwVTHU9an9fA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKgTxzveh37HT1iXWKFfdTw7CptBp3ngLzWDL569c3+seDsNmFTai8nzHcRy7ojMAqSD+oW4mYDZxcfJnpFspdWhd7Pk55yEvIpPOAqbYkjK20GDFF5mGHx1FH4qxAHE+q08M3uiDP9ZjhpJGDgadQtbStTDYF5JgBSfvPqUZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9466c/6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E48F9C2BCF4;
	Tue,  2 Jun 2026 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780443053;
	bh=1Vh82qJGGC1Heb5rOQYS8il+RuoY07KZwVTHU9an9fA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T9466c/6A6xUMQf1Gq5okxGICntUYRLuu2cawGJQmrDxE2LAQkObGCTgguOIHUaBz
	 zdZcDpfyjw5E2qWDtQFf+5vJR8Ki/V0AwDRD9zTFk73DJvFAQq9jdI8PO5xi392wSJ
	 39JyhG49HBCNk3CItuLaQjzQWnH0yrhGs/BpZ8RIRXfatjY2X4WxF2zRQ6HRoC8two
	 wKWdvP+HKgjTwpH9oLznnzjdimbG1jGR4peEPB/ljPHGzDnEm7/Zeg+UuKUsr8CcSU
	 6cFGYw5xXH2Zcg0y4bsA3CHQUTF8RNJDreo+ThjfR+4iHczwpUGrIddd9VZ5JPrE+i
	 UmzvCqzhiWeeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE564CD6E5D;
	Tue,  2 Jun 2026 23:30:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 03 Jun 2026 01:30:39 +0200
Subject: [PATCH v6 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-qcom-cphy-v6-1-e50de0b557a8@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KqK7CczWYX/iIrUS5Nv8VtWWkWE2d7OmmtIR810fNRE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqH2eqIY7n1nYt0dC+7KaI6/rvWxHbk90teL16L
 FoElXc/9iuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCah9nqgAKCRBgAj/E00kg
 cqr6D/0UyrGMxN8RIkODM7OEU3BX1HeqrVc+JAqk+QGldd6wy9xOFU/c/Gz/r7NqtKrnClDOcbI
 8kNaOSWQDX0BqcKEBm5XUDbuA2TkNyvxQa14B3JYwHKz4heijzwhdktrwA6Feu3rRnHRtmY4irb
 bCV51YZmrisDh/Xnjp2JyFVDA7vo+ZLY7WRGaARbmhr0hZde3ITLReVnYa0jWkm5Voc3eNp4NpM
 jAZXWcSQunJuTeg/Yz7mmJJsvD4RLm2M3VTT7beqHjVtr1XeCXhvBzlPU8bLb6JuiC3Z0wWXT+q
 /iTTO2TLxmYPGF/U9aPIyu7K6Aq8cEE2KLDTb3JCuCYph8Q1qV6cFSQTnV6+jTYXGnQCUFM3pvE
 BYFl6XICOTH6un+DQhlKUV/nNL0kZ+8/sHoiVkFECPr+EQYL+Ra6uW2e5BcrPr/LIvoIso0CbVI
 HwNSYlWC6WKIF1+8l+j3/FH2Yte9+b4GPR8V/lIn1CLyv9eAcCxJHvUwlzLLJGZoF0BAicF02sY
 z5zP7tk8ayL6FaJay6Y86vlQ4yJB+FC9PlAQ+5ZHBaTU704k8bMB/vV+3dE/9dSYGGmYoHlcUyc
 vU1LGbaoAtzQ9J4R8OwDPAA6mdzla1BfB9j4thYecShQT+pcAYfUBfTq0r3nzQIlpL9Oa6fVPim
 t3wxbakRiryAFLw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63457-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 953FE632ECD

From: David Heidelberg <david@ixit.cz>

Read PHY configuration from the device-tree bus-type and save it into
the csiphy structure for later use.

For C-PHY, skip clock line configuration, as there is none.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f748..2ebb307be18ba 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -25,21 +25,23 @@
 
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
 };
 
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
 };
 
 struct csiphy_csi2_cfg {
 	struct csiphy_lanes_cfg lane_cfg;
 };
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..072c428e25166 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4761,19 +4761,23 @@ static int camss_parse_endpoint_node(struct device *dev,
 	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
 
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
 				   GFP_KERNEL);
 	if (!lncfg->data)
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {

-- 
2.53.0




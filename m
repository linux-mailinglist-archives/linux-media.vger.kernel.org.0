Return-Path: <linux-media+bounces-53860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG6bFtCNo2ndGgUAu9opvQ
	(envelope-from <linux-media+bounces-53860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF01C9E48
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EC15303C291
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AF4243968;
	Sun,  1 Mar 2026 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6oAewxH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE376026;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326283; cv=none; b=ro8IhR08xzI4qRv5UGLbENrSB04/WAzZkAiLIzI0VqVl/bQe7ZjHrGnWRfZbd3VPpfaep2aFMvduE8J5VXqqRIVNa15+N17/rHGCrhMC7bMn02PJ1q9Cg9SDX/A4NDjH6TEp0K6StD1NT/Jp8exeWxOYcA6EgcAGb0sNbzFikys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326283; c=relaxed/simple;
	bh=j2gLoXXt9hZztDsLFyfrf5Sqyggp90svuyVYO7gSSHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUfOt4MDgNiF29eAISLM/SkYQyPM6/B4RhQvu2KSIw5ddIqW4JrjaSNCxDekC8lcxPuKbtq1oOiBzUBmT2ULknE6+ef414E51gyXMb/SUTfqjgQOGarn8r7yVx3xbh8ld9A3SKZaJxS1lcI6VJ2b8PBDSNARSqHYjiXoyp4y4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6oAewxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46956C19425;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=j2gLoXXt9hZztDsLFyfrf5Sqyggp90svuyVYO7gSSHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S6oAewxHR7sizza3/KZ0Q+JukbnqzZbPsQXALxsByWVyXHClIB0kW4imiJC8u09aP
	 zrLIYK7xFp0mXuIWz1tyYuS1s/yp9OcYfy0JV8cxAyItQygYsW5PJKWodHKbUa8Fgy
	 Mc4gbqakeKekWaIvqBUEGtyQrfdtWP0MReIQyKOc+diBj86eoq3ETbyJP/kKVDm1WM
	 PDTChrP6iyLGKY7sxTPHcSIinZ3xEcUknm4RwpZ/sV0aye5hnSHEHXHXE2ZGumWr9J
	 j9472kHjRMPEoTZzAHNwomGAlJL0kpZrQ5rAzvDleeCYvqmEftpk2IjqBTkRB9aZ9Q
	 mfMWbjXVREWTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3530AFD0048;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:20 +0100
Subject: [PATCH WIP v4 1/9] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-1-e53316d2cc65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fhIzjHIhntdawDvw/VMdM6pBEENvqjYRoy0HoF3mVWw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42I6Y/aJq6dhwi6AWhqxIqqSSAg9MDiUQ6Z7
 w2eVnWyC4WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiAAKCRBgAj/E00kg
 chmmD/9EXYIok2Wx8kEYQRiyPR6DvpnA3q42iNGQ6YoEFAQQ1ldoIDM2xlig9HGdFHYzOScGn5w
 qatBjeQhr4T76qFgHq5CJ5VeoNNbkNZFt26uc3CyD1kO2KP41BhtJtJneRywbZ8ixUUQaozy93k
 KyN+cZejjcLPwCyfIZKHx8Echcv1SxGo5S0+klqUXg8DIqKzyqrPSWEkrreKGuQOUE1j7VyKScT
 IGcWzYN6TieHngJEdseApXKzkubAT1ukVNSZr/VHAqxfcrvHMKiVLdZcN548h6y+UPcD+rFN0Yh
 wkc86PfSC9Vx2vqa0RkIfNIGON2SjtSeyGG5ak0kuc9ihsOc/E93DH0EajeuXGf2/7AKiDsGPQ+
 h9RTLHpAHeeUa7dNerApyz6U6d55rtDBRmW3MWQ2pLKp12+V2buNxp0QBKjQJ1zZxG24ZTtOiNe
 BKcCJuh47oSutsQwxUpjcuVD2ViICIaSVtyoh6F9e/9GfhIp4tsu7WPxUZhqfPufJam3ULxnhms
 s+6li9EqNO2mrWWtfJNvsKEvSGPx2zSk9zaI8FRFBjGP6EKEzqHS5l7yQ84sRLLUYI0qx1POTac
 1OKmo7mc8x8wr7QThN41s0CMXxUmxBhTytO6HbD1QHWthyTBU6wVtEm5ibNm8aM25OF8+tcL+jf
 AhlHcNSA/jx88dw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53860-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: D0FF01C9E48
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Read PHY configuration from the device-tree bus-type and save it into
the csiphy structure for later use.

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




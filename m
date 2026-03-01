Return-Path: <linux-media+bounces-53861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPvGMdmNo2keGwUAu9opvQ
	(envelope-from <linux-media+bounces-53861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD3D1C9E56
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA78302E30C
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D47D244670;
	Sun,  1 Mar 2026 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLvh1uVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0431482E8;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326283; cv=none; b=ew6C6cOjTFqo+eLGOJLvHTyEjpnZZcfaXYxY0w7enDGXeU0EL6e/MMJhiMgbsXiCrF2idmszhbPJ6YmOvBfRenVTusLl/afGpfH8AqDRI+h8XOWUMg7gyA4Hb1BioAnu5fQXIPdCjEL1CQ7PKGQsP9tk//SZGDxWz7GH2GUO17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326283; c=relaxed/simple;
	bh=V/kaEQX6C9SzR/d+NfS8UjTNWsrCLCWH8jNuXnCCVxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwbvTV8EUVzP/jD+SHQYYaEYewTEJk5D64licceWCC9P5naAtqlbHgX56y414o5Fu2v8yIbXQtV55UvmEa1a9UTOwJI9lqKMK9+dQzdYEKCA4sVFZF6GgIQI346D5n0zApBn31PsW8VmUfxoaU+1RNshKqij79ckJT1+V/zwuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLvh1uVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FE4DC2BCB0;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=V/kaEQX6C9SzR/d+NfS8UjTNWsrCLCWH8jNuXnCCVxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nLvh1uVZM1UXpIXjvmOZ8eqW19b0Pbzatg9VAfWrreeKLIHZzAX92D9wnA/JB0zp+
	 MgDNBY/RqWN3GAtgLaeRcdscB67JaUFl7PANRNzXnxUFggXv4QNweIyLtxgVYf+/XE
	 UnJvfjtcXBYMc6cguKUP/2lYCH+20WJ41CNIIORcrofNL4dpiwooj9sFgUt2r4a1JT
	 w8gtDEmawfHNrRP6qLAsdxyfm/SS5XlA9JDp/OvhGDP3mpie3OK3wo0fTylXNxfyo1
	 Q95qY9r2h8pOR3ywDOjd4kTp9MKqtFWOD/NHdggiBRa12k8YRjGI8x2x96XudxU2wq
	 WF4I/GkpVnCng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5819AFD004B;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:22 +0100
Subject: [PATCH WIP v4 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VE5OUEM0X//rg3dmLrS4SJXKFfJ1U9PcL8DiivLtXg0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42I49cCzgz9a1iEZzYEzT800pShZjkIyRzT8
 9ClYGl3pyeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiAAKCRBgAj/E00kg
 cp9uD/9t4vqsgoKkGQC54Qqxi9WS+6D9RT4VTCOiO1cKBCcARAmg75XqmFtZ+Le6RsdZwA0JgzX
 xRfnpM791q0ktfoQkuCWV+HHrToLx9GH0qa6l/vE6twum06ypp+Q9QSfRKOBHE78o1eQ1hRmVAy
 KUxBCsjmuU9oVZUsEXrHWsIeiIiT0lJCRSTA5G0TsmizpzhV7fFmBd5AqpnH8Ecw+2ZznzqXtE8
 iWlrA3Lx283fTilleNYC9KbBu/gC1nL/w+XXXVEKTEZ/YpasNc1I30Ibw1TwrRo5GN/DbHr68uP
 IeSGkDTg7sJsq1LlWcBhLssChBFMbfGHXyl+mBeZjutobRkgIIzt+tXhe9XwLrAUGf9+dsMYlZY
 vWgvDLJa1pufeMR9ej8zEe5wRXFbED9+79tyo3jhLjdhxpGjT9ZV9If42W79qJbMRFhBbVJlJ4s
 sXDMCKxY6cZU2+7ELksLXNexpQM6QZ35UEDLr9VyN8rEXNUAfDxaH9Yp4xG8FkrMsNBe4rpJaVX
 BsfVuRI+8h294p/NRIPr+cfZbsSHt0Uccg9i4xV23EHckSuBbABJuXPrFy8SFd8JelUSiUwlLI1
 C6Dsp5/NK2Z16aBqKHTBOEeS5ffZNN29PUu/ROwVWPMmN78fCvJ6YPv3j2t4rbTGhL0oxsedpKL
 0nXgdjA9earRARA==
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
	TAGGED_FROM(0.00)[bounces-53861-lists,linux-media=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: 6AD3D1C9E56
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
 drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5b..033036ae28a4f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index ed1820488c987..b50b0cfe280c1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1275,6 +1275,7 @@ static int csid_link_setup(struct media_entity *entity,
 		csid->phy.csiphy_id = csiphy->id;
 
 		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 		csid->phy.lane_cnt = lane_cfg->num_data;
 		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2f..a82db31bd2335 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -70,6 +70,7 @@ struct csid_phy_config {
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;

-- 
2.51.0




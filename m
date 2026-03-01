Return-Path: <linux-media+bounces-53867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJiFMkKOo2ndGgUAu9opvQ
	(envelope-from <linux-media+bounces-53867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:54:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1B1C9E99
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57DF330528A8
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D390275114;
	Sun,  1 Mar 2026 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8wUC1hE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E321B191;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326284; cv=none; b=TTuCfZ9nZwwB3bKC+/hAPZutXCejyDUx3LmdOzfVUfTKHfFD8bdQZPovnu7xdP91hl32oeoP/ciMrAC0cK7VAtfeQ9ZpaDHgMdN2U0ljFimd44uSUVn+Cc/wZYrhodkLJ+yg1k035q0oNo8IqX6IF+mrL7rzf//hkLJbBBHI4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326284; c=relaxed/simple;
	bh=rhGfNydoUOkdRXybUMyg+yWuVRmt64y1v5Ezv+TIJqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeULTK3SMI6vQ7Oh7e/dOrkayHbo0H83AhOdtC7yg7wwzvJ8Ff6W56JQZHfrSj8EUVj4Tbx1gMkRX5J0zv/y8OyNMFZA2zxhEDMZJKG8yIO1ihMWQeENg2wHB5CY2pyfaCgkVGds4+Isppc7IUyPvsACCJftJZrBKaPhVNPcPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8wUC1hE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE441C19421;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=rhGfNydoUOkdRXybUMyg+yWuVRmt64y1v5Ezv+TIJqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k8wUC1hE2CGt/6iET7MjaHg6hFW+IRGpA4oDadJ19QwcpkzdX0FzewRamQVEIFHS+
	 4vIlqbS7cbNQWRi8+J1CdMtWDGGDWufNTsuWhowEVg5f3WhX+7VSZmfu+/5QZD7D9m
	 BwfKGa9kTfMFEu46vOeK4Pm34rabLT4+PW/d4+f7unJ3ABEEzkDT0VrhmrCPPzkVi+
	 VgLNuTce6E+goXsUxUyyBfHx4RQ7H4fak8uHE9qhkglMYWZ3/HF3XdFR8BR5p6RNIL
	 NcueZTUwc784E3xWMlIp6hNahJ4X3ks699uj+eWuD2VnjUscmZXdNkOcv39Zbp8/Hd
	 zeq5p9WuBVrqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B2DFD004A;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:27 +0100
Subject: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xJUXUtwBIhekrOdLKRvTP/J2Ey1JhDpeic7sPTFnqSI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42JBwEFoFHmRtNt2RnACQuIFO0B25Bk1KcHL
 LCMYuudgouJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiQAKCRBgAj/E00kg
 ckb2D/9QD2HGudr+0YjoFLjEVf53a3ZwgZGfpLQBVrLFg4AdFWKoLg8EjGd2FpVxlSPdyQ+ObPz
 2Uj/1Xz5yUgtRSuBQYjcgNkOSr6ZPQvDTSxLIQ7Wicu18wZRl3aWb3QlH7IfOpFnpLTKU78z5MO
 CB+zs7PcSfmQFwc8zdru/6n7xSjlptL1QjSLb5Jcy9lbel4vnM64Jv8sOJLK0pYJdGZbyxvzbIN
 IOj0sBQ7Ll2H3l1nwC6+wBNKf7ySLyaN5t1lS1A074AlKfvvtpTLXw6Vf4RQpefdX9raTB4ujD3
 9BlGZQzqwgr4c7+Xaab1xhkYOTq43qoIlbohsSi1DKlIHvU8kGhBflQiDlZnNNzsLiX27BwuqGB
 S1mVgkcWXF2D0h4PBY2cPjkEPDXE3d3M7pqpMZzNnhZI1woevOOl6R5FVpHEwMGxueN+USnptPa
 ygHA17qun12HUtZfptjtyY59Vm6AztwRPc1fHUMlytTTkaaabkDIdvQmkG4aMR/AcccZG1RUcd+
 A35YulDU26Tz/DHrQN6Y1bIdHDxGN5btZCmHLJXesPpuMIQIaYaVNKFTYeafjCNFnnpVOocbsA3
 FdgaaSclrd0bQBWJBHOm7u9q7cmX82vkZ85V5eVN3XL9R0UoS5h+k47EvaRWe4NtUHp4d2oFReb
 czcWyDXMz2zV6zA==
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
	TAGGED_FROM(0.00)[bounces-53867-lists,linux-media=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: 79A1B1C9E99
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Catch when C-PHY configuration gets used on SoC with CAMSS missing C-PHY
configuration lane registers.

Hopefully this check will disappear as these lane regs gets populated.

--
@bod
Proliferating special cases in switch statements on a per-SoC basis is
verboten.

Please find another way to do this, you already have a bool to indicate
cphy in struct csid_phy_config {} so at some level CAMSS already has a
bool to indicate what to do.

Please make that logic accessible to logical consumers throughout,
in this case the CPHY code.
--

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e48f5c1290173..2164647211c8d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1221,6 +1221,22 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 	u8 val;
 	int i;
 
+	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+		switch (csiphy->camss->res->version) {
+		case CAMSS_2290:
+		case CAMSS_8280XP:
+		case CAMSS_X1E80100:
+		case CAMSS_8550:
+		case CAMSS_8650:
+		case CAMSS_8300:
+		case CAMSS_8775P:
+			dev_err(dev, "Missing lane_regs definition for C-PHY\n");
+			return -EINVAL;
+		default:
+			break;
+		}
+	}
+
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {

-- 
2.51.0




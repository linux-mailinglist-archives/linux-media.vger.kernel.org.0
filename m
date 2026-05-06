Return-Path: <linux-media+bounces-60612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNUyHhVG+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:45:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA304DB437
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD49309731B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2C747D947;
	Wed,  6 May 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Erbupagc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACAF47A0BE;
	Wed,  6 May 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074952; cv=none; b=h/jbraw/XsYBdbTbdRHjo92Sbfws9XyHPfwPGcyvG8J8J9Ztlp/jyXura34jc7+XrghDpJIooiIpmqFaYZbfnKZ4JKAs5Nm1lxtb2eZqNkzmbfcYjM6d11piPHlO5ICgOl6pyZcmrs/R10fw2Kj+/kKbnqfxIZO/LtG15/FbzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074952; c=relaxed/simple;
	bh=/Dwzo/puqQx4aqXdp4eoDtcbjc2mbw6uNmOMRrS8AgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfKD4iwdMlP+NCUiPYrJ1StIjSXs05Nt8buy3YhPEnhBhEVeN1NmOpd6S13Ua5X26TwaKL4q3HzGeTdzoo3wX+PxWhlUX4gzNoF+tf9bKsiRqo2KEjy8SUMdGiwg/QppLeB/jC2z+ZPYVZGt5LAWbIpd2lTE0QUDvUpXOvrY2rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Erbupagc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDF1C2BCC9;
	Wed,  6 May 2026 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074951;
	bh=/Dwzo/puqQx4aqXdp4eoDtcbjc2mbw6uNmOMRrS8AgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ErbupagchoYysG/5Mic6W9/FxVP4EkCRqNgj+nOQ5/oyyIOvAu9y+jVntJiX4EOWP
	 qX3YNOXM3J11a2ggGn6Ob0wSGX+TIjNi2MH9uBjZNnbidRL3mqa9yTAi6I/FvrJk8w
	 x36BP8Ze9RLEHu8WwXMABmJ7MyBUhPYA4LAOL3krDNc6IoJoq0r6AcLOhpqmhKmL2B
	 spxjC5z7Jyh7jtfFugqRgDPIEaTGe5YAxbdsfJJnRg1a1Tu556HOEwMSZc3k3q+YJX
	 3b9ADud9BuNiwSy9DSkbuOMsOU8AOPk9RbhBoSLgvO5dLWDL3SKRS6qxwpaUs0pvKE
	 7SVHAC0lazJjw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:56 +0200
Subject: [PATCH 5/9] PCI: tegra: Explicitly specify PMC instance to use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-5-a6de5da7216b@nvidia.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
In-Reply-To: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848; i=treding@nvidia.com;
 h=from:subject:message-id; bh=CYr96E6ms2Tk8ZDR+mP5HFZviPNyyl97Fe72pEjoZuw=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwxL3VvzItqN2RUEDLi5k9l0Y21sq4kNtrK
 qnl9jDEtjmJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 ofMMD/0eaFvDXeIaU/iJrk/ytzSRyQdrahoL/bFCGo1OX82cfER4LwQC6h01yPnCRfaPgB9EMy6
 +CH8w/uVW2W1ZBpIrcfsl3kPKaLOlVeLXbY+A0iqY6vjxo2bH2AqnxpprUK/G9AO7oDeTZaOvdT
 LpzXOyzMOgr0YNTTI8iGg4OoRuz6al8myVgv88eBTdI18op304dE7dpjFbxgsxe+CVcUhm05Y9j
 X/HuIvzVGxaOkhFIYUpLZfaSOeufkfxOjyAhi4j0XWIyGJ2eqk+/rZujKIWWnZCNbj5CQbp7GIB
 8DjffrNzntPo2TtFqM4ENhBu0r6UowLe3t3sEoqrAS7wBUGCbVAztRG2g6vkBpy3GfozfpWp39y
 kSULfGPUuDg1khofowoLEXTS7RZEOX1KyEBKtqyONnNbIGE8CIVYBsvnJtDoF7p5b2BBc1sigjR
 OZ5o/S78nK668Kr/PM99OCnDkKnjB3F/bmoQAL0TP7OUBKnrWRm3At6SgRTGNE1pGtEhSWvPKZU
 pfAk9gELQMzSyDhljS1nNXbScYiUSki26vIewOMAde0XnFIIUga2sFx2L0pgkLH1wEwe6I2k7U6
 fC5CfKU9DjCPQ9mu8mSYRof9LHRFnqZzmU19VFET7c5hkSuDzdjy6KSMYmoI+DXV5BgVYTETzNG
 fgN6bB+QAB/82/g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: EBA304DB437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60612-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>

Currently the kernel relies on a global variable to reference the PMC
context. Use an explicit lookup for the PMC and pass that to the public
PMC APIs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 512309763d1f..2c6c521e6901 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -340,6 +340,8 @@ struct tegra_pcie {
 	struct reset_control *afi_rst;
 	struct reset_control *pcie_xrst;
 
+	struct tegra_pmc *pmc;
+
 	bool legacy_phy;
 	struct phy *phy;
 
@@ -1165,7 +1167,7 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
 	clk_disable_unprepare(pcie->afi_clk);
 
 	if (!dev->pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
+		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
 
 	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
 	if (err < 0)
@@ -1183,7 +1185,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 	reset_control_assert(pcie->pex_rst);
 
 	if (!dev->pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
+		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
 
 	/* enable regulators */
 	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
@@ -1191,12 +1193,14 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 		dev_err(dev, "failed to enable regulators: %d\n", err);
 
 	if (!dev->pm_domain) {
-		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
+		err = tegra_pmc_powergate_power_on(pcie->pmc,
+						   TEGRA_POWERGATE_PCIE);
 		if (err) {
 			dev_err(dev, "failed to power ungate: %d\n", err);
 			goto regulator_disable;
 		}
-		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
+		err = tegra_pmc_powergate_remove_clamping(pcie->pmc,
+							  TEGRA_POWERGATE_PCIE);
 		if (err) {
 			dev_err(dev, "failed to remove clamp: %d\n", err);
 			goto powergate;
@@ -1234,7 +1238,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
 	clk_disable_unprepare(pcie->afi_clk);
 powergate:
 	if (!dev->pm_domain)
-		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
+		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
 regulator_disable:
 	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
 
@@ -1432,6 +1436,12 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
 		return err;
 	}
 
+	pcie->pmc = devm_tegra_pmc_get(dev);
+	if (IS_ERR(pcie->pmc)) {
+		dev_err_probe(dev, PTR_ERR(pcie->pmc), "failed to get PMC\n");
+		return err;
+	}
+
 	if (soc->program_uphy) {
 		err = tegra_pcie_phys_get(pcie);
 		if (err < 0) {

-- 
2.52.0



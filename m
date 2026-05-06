Return-Path: <linux-media+bounces-60613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G2HB2hG+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:47:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D24DB4C0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315B430AEC40
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F7647D951;
	Wed,  6 May 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8VZAc1j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321547D934;
	Wed,  6 May 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074956; cv=none; b=XsIh849Pu1n+btV0Eq7CofDCK07D6kXLrm6fmLlyK/diisR7uFLo5c8tusVkMZQF0YWKumBHpbbHqYLlMFpyH0v7TClRaqamtYBjLbGkCGZEBlddTNGu+1APrnpzRqzAJVvpQnSDLsI3L9AnvdtCkh+PqbK3sy26bGCbuYcW1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074956; c=relaxed/simple;
	bh=YMBtIgkv/0vd1T2Q/REmFWl7B9kwD1JjOym1CYgrerA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuJkdovncR6Pm8PFfbboui+Tr/kQnMl78/AUyZkJJhZDaDDv/B0W0D70c5FVupq0ClhnV96k73hHEgVPNXf5sPmhbA947N8TDMqhAlB02LxDG/QJYCKYMke44VhZdz7lcJVwHAguM7P9WXaAYcYxbKzShCZDCYe2iyKcJrH05j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8VZAc1j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DFCC2BCC4;
	Wed,  6 May 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074955;
	bh=YMBtIgkv/0vd1T2Q/REmFWl7B9kwD1JjOym1CYgrerA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q8VZAc1jKjhYkUce5aTh0zexq4y8C1u0/kYwDMq/fi4b5/BGgGyEcabyeYJr2ikps
	 tbpHkK4690619IA7Seo//dI++5K1FUI3MmCTv0/vzsBwZEXPOqSrLvrdbiVu7Mx8gh
	 6yKGnfFXcHTtCbFFKM/SjKiOJJvhnL8mk4DfpMTNViV3MWj0ZemPBcQT4+6rZv3khS
	 3oY/zdjZjDFl89TJNF69XmL51iMVurwGfhOUV6G88SCgKYU99B7tsnIhky3MMB8qLU
	 nWnHmzlT8Dy78VVc2SxQV8y/kc8NqAZVOezC+KtmDYUdzgjp6Da2lA63wKF4f7Z+je
	 qJzoK1/Nxy0PA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:57 +0200
Subject: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100; i=treding@nvidia.com;
 h=from:subject:message-id; bh=59LKaPbdXc/3cXqAypoqqQT4hvZBv70PYCPPUxuHdSE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0Uwjf/7ylsfyp/FAMe7OvIMjXJRmECcGvqVZ
 UdgOe3ty+OJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oUr/D/oDRCFAmlPpPBjksDR0c4WYjTIIgAxZyXVTwR/BZIayR2+hDUes+Ers37L4X+dcwam6dP1
 Mh/NYLYivVsc8JPA2s4Sh8AnPMZDnR73dmYHAkjioFdvHKQ9kCPf6VDL9LuJ8iHM5ml+5lNy1Cd
 LEE9AWIbrzoUTUxwgy4XQVyUOomYhY3vukCkUqteP4y4BGfUhevwYGzQFbHCV4vyZAT4+urTydX
 2b2k1jShmK+uEkkYXm7WUTIF5BUVdAn6d/IKzSBt21YmXtDXpaX6Tzn+8a17jB3R6wsdi2kNpnH
 MLP4k1/ipPn21FyY5bWaNkTBeOkW+rF3KSSf7E99TqvZQCJHFEvtGMeDxq112bFWeAu6Vim9TIP
 JivdrWQUbK2iZb+US3DF3Hiey/aSvj1ttSAQPOoMG6CdRr19XJZKfufMvYkjowSHTfwbwhNMeTj
 RDh7pJoTmia0m+gfXVGJyvu/1iWbTk0kWTQWuPqAwsCmQUJaArldYdeLColaKSwzr4p14oLhGeE
 +9jWHeQtlhstICfUV296Vsv9hYdp7inn9h/qimHAe24rzHd8Zszs7xDWkcgxHPZkNIUOna/FwXp
 +7hy6gArw+JwkdIuoFtay+dwoxXVMNRoYw+h/Nta0GmCYAqeutmeXlwpl2+fAHui33MG3YOA3iE
 pWK00Z5pZRkvs6w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: AB3D24DB4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60613-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>

Currently the kernel relies on a global variable to reference the PMC
context. Use an explicit lookup for the PMC and pass that to the public
PMC APIs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index d2214d309e96..122b711929ef 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -292,6 +292,7 @@ struct tegra_xusb {
 	struct reset_control *host_rst;
 	struct reset_control *ss_rst;
 
+	struct tegra_pmc *pmc;
 	struct device *genpd_dev_host;
 	struct device *genpd_dev_ss;
 	bool use_genpd;
@@ -1188,20 +1189,23 @@ static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
 			return rc;
 		}
 	} else {
-		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
-							tegra->ss_clk,
-							tegra->ss_rst);
+		rc = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							   TEGRA_POWERGATE_XUSBA,
+							   tegra->ss_clk,
+							   tegra->ss_rst);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB SS partition\n");
 			return rc;
 		}
 
-		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							tegra->host_clk,
-							tegra->host_rst);
+		rc = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							   TEGRA_POWERGATE_XUSBC,
+							   tegra->host_clk,
+							   tegra->host_rst);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB Host partition\n");
-			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+			tegra_pmc_powergate_power_off(tegra->pmc,
+						      TEGRA_POWERGATE_XUSBA);
 			return rc;
 		}
 	}
@@ -1228,18 +1232,21 @@ static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
 			return rc;
 		}
 	} else {
-		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		rc = tegra_pmc_powergate_power_off(tegra->pmc,
+						   TEGRA_POWERGATE_XUSBC);
 		if (rc < 0) {
 			dev_err(dev, "failed to disable XUSB Host partition\n");
 			return rc;
 		}
 
-		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+		rc = tegra_pmc_powergate_power_off(tegra->pmc,
+						   TEGRA_POWERGATE_XUSBA);
 		if (rc < 0) {
 			dev_err(dev, "failed to disable XUSB SS partition\n");
-			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							  tegra->host_clk,
-							  tegra->host_rst);
+			tegra_pmc_powergate_sequence_power_up(tegra->pmc,
+							      TEGRA_POWERGATE_XUSBC,
+							      tegra->host_clk,
+							      tegra->host_rst);
 			return rc;
 		}
 	}
@@ -1733,6 +1740,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				err);
 			goto put_padctl;
 		}
+
+		tegra->pmc = devm_tegra_pmc_get(&pdev->dev);
+		if (IS_ERR(tegra->pmc)) {
+			err = dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
+					    "failed to get PMC\n");
+			goto put_padctl;
+		}
 	} else {
 		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
 		if (err)

-- 
2.52.0



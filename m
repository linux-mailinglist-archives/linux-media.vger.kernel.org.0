Return-Path: <linux-media+bounces-60611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFvfE2lF+2kFYwMAu9opvQ
	(envelope-from <linux-media+bounces-60611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:43:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C724DB303
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E23043007B26
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3FC47AF65;
	Wed,  6 May 2026 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVDFM1lj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4EF4266AC;
	Wed,  6 May 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074950; cv=none; b=bdvHNA8NjGtJWgZ5Foxnro9DBXQ2KGnu7i9QMdDzsnKVM/FCBjPcu7+eHmD1kNunESzxm3YRi1wj0QDODA+mcvQOR0MNTa7BIR1oUI+5AHrLrcd3Lg+0IUX+BWSMyVlxCAA4Ej7X07/b+nCnPDblLsBipn/WJu9+oqZ1kFe769M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074950; c=relaxed/simple;
	bh=lM5/bP9mU6uA47yq2TORb0MSyMeH+anPQDvkVAb3Yl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gku2CG+nR+kVtRh832we2Z7DQ184hy0ble7GBj+MnJukxSW1XHPHIta2oKOV3hl5+o1t8/Dn0yqfu6IclgoeIRQHlEo6xtGOvYj/2cTdTwxsG2MefM+oUjkHhynksyOjM3HmLLJf9X6jko2s+LrPdR339o9/d9zH54zDg9ZYs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVDFM1lj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73FEC2BCB8;
	Wed,  6 May 2026 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074948;
	bh=lM5/bP9mU6uA47yq2TORb0MSyMeH+anPQDvkVAb3Yl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jVDFM1ljm+D1MKK68jui0ASR3iLVHmVCa2NlaEZmehVgV2UY850Uy8Rp/vm5Haw19
	 8Dv8RarP+XK6DLm6ackSxohnieuchFCiIFXxEIePWOLdMcuP9IBAHJm7bN28UWxXk0
	 j3sbQXznWOJzhaimVtsG/K5aFI2C3mil0qhkcafoZmhORbOhMez9KRK5j2cGcGusyz
	 /1oZsZuYE8cmSmFFQhMdXVeztrkwVcMuX+pyVVuM1Ql3kQ3xDIY/X9sXhKlKcFi+oH
	 ZbcXxxW8RxGdcevHMyZPApTCzCS7plevx8NISmFh09Z4L1AIsIMldYMizxuoF2ztGa
	 PeqXOkBz0DpWg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:55 +0200
Subject: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554; i=treding@nvidia.com;
 h=from:subject:message-id; bh=+F+ps27/gnJ3VnvU71JsyKx65gpxKzUbon2OBL1Lc3o=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwSnUbmWcBCoWZiLfTGYBiCZlAr3oKcuDi9
 DR4XL10BtSJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 obUwD/wN3jLuZ4txgWlc5UZCnKsseYhyfQYSaJ+z4eIgUuui8P1iNG/qMKUUM1qBuuOO294iza1
 DA/hK1jsz/rRCppDEwK9/Uhgb8hYyaiSZkKMFgDvHbpowPlQK8BI+D35vDIox6+vpC0I5viYo3f
 idcAaQTwAqLeLU+49H7GvmPV603Uju/CHCZMX5ZamDJYHIze/4cCVig85yf1tZjmP/+AfQmrph8
 aFWqOn5ttLW4YWivLFKm9q4ziygXiqZj2g8W8p6V/SaYERB+gOE8tRUGHXMl+GEKCtUAnlMl3gZ
 aRbjZdY+qYT0Ddnc7NCn9ZcTn7+dp9nA2VcUnDHhnJb8A4P02ij9T+EzQILCx7heG/cH1aXRAVu
 lvhZGQahIx1ytl7ASTTnSfQKglmsIgoZ15OK42+kDYrUxdE+hUUul8gWgCRddRzFpERykGK/v+Z
 t8hDXVnCyvk398jt48SvExynU3WVPfKZkpHo5UTFkVNwtusRqzc/CRoTwfI/k9ver+6h1vmTmrA
 yFudRUWvcYT3Z1j5nrJCOHv6fdhzKNZnccm4KwEnQQ84u2TXvlw+Nc3Y9ezkzb+wobLaJeZOlPv
 lIGrTuRzMCYmoqsd49vf2fPApaeMOpuimym6P82BZ8Dd16B3MjcNXbCG6+4x2a/vMrfo3ty26eo
 XaZ+fJSoiFqb4HQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: A8C724DB303
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60611-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Thierry Reding <treding@nvidia.com>

Currently the kernel relies on a global variable to reference the PMC
context. Use an explicit lookup for the PMC and pass that to the public
PMC APIs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/media/platform/nvidia/tegra-vde/vde.c | 15 +++++++++++----
 drivers/media/platform/nvidia/tegra-vde/vde.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index 2b3898828304..c3097085ad9d 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -161,7 +161,8 @@ static __maybe_unused int tegra_vde_runtime_suspend(struct device *dev)
 	int err;
 
 	if (!dev->pm_domain) {
-		err = tegra_powergate_power_off(TEGRA_POWERGATE_VDEC);
+		err = tegra_pmc_powergate_power_off(vde->pmc,
+						    TEGRA_POWERGATE_VDEC);
 		if (err) {
 			dev_err(dev, "Failed to power down HW: %d\n", err);
 			return err;
@@ -193,15 +194,16 @@ static __maybe_unused int tegra_vde_runtime_resume(struct device *dev)
 	}
 
 	if (!dev->pm_domain) {
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VDEC,
-							vde->clk, vde->rst);
+		err = tegra_pmc_powergate_sequence_power_up(vde->pmc,
+							    TEGRA_POWERGATE_VDEC,
+							    vde->clk, vde->rst);
 		if (err) {
 			dev_err(dev, "Failed to power up HW : %d\n", err);
 			goto release_reset;
 		}
 	} else {
 		/*
-		 * tegra_powergate_sequence_power_up() leaves clocks enabled,
+		 * tegra_pmc_powergate_sequence_power_up() leaves clocks enabled,
 		 * while GENPD not.
 		 */
 		err = clk_prepare_enable(vde->clk);
@@ -293,6 +295,11 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	vde->pmc = devm_tegra_pmc_get(dev);
+	if (IS_ERR(vde->pmc))
+		return dev_err_probe(dev, PTR_ERR(vde->pmc),
+				     "failed to get PMC\n");
+
 	irq = platform_get_irq_byname(pdev, "sync-token");
 	if (irq < 0)
 		return irq;
diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.h b/drivers/media/platform/nvidia/tegra-vde/vde.h
index b2890484b7c3..abac0221d6e4 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.h
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.h
@@ -107,6 +107,7 @@ struct tegra_vde {
 	struct list_head map_list;
 	struct reset_control *rst;
 	struct reset_control *rst_mc;
+	struct tegra_pmc *pmc;
 	struct gen_pool *iram_pool;
 	struct completion decode_completion;
 	struct clk *clk;

-- 
2.52.0



Return-Path: <linux-media+bounces-60609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHtOKE5F+2kFYwMAu9opvQ
	(envelope-from <linux-media+bounces-60609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:42:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E154DB291
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E77FE3019465
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE2C477E4F;
	Wed,  6 May 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pm9Rnq6K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA3477E37;
	Wed,  6 May 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074940; cv=none; b=Xu+80xQCIubf9sOdsIri+CX9baVteKmHvt+nPXeLpc1WubQ/g9fvWigzoimfHQi1iYELT+U0862frsIbZqSfWfQgyDkxQ6ZpQPbU333vFgH0iLWkflK1G18FcCOeKUuq7kVTJjB5/9lkHaNFRfOcaxekxpTA13Avznk7Y6ndPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074940; c=relaxed/simple;
	bh=yAYc840Jzox92Oy7x86kKq1dkgwkDjAdvn1/sg+lx58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6m9GaGAJ74Lslyv5kilMhHklBVQ2rZo6x0jHfbYa7baRYo9RqddN/Y3GAChwcysio9uCkPMNHzhirjViibVLZsLMQX3+9ZiIbfvV9MLJ7/oFBMbfs/wm8EF8QlJJ1A+GYpkqCVhsYkC05P0B2uWbjzKuSFLo/L4ynywSZRkz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pm9Rnq6K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29468C2BCB8;
	Wed,  6 May 2026 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074940;
	bh=yAYc840Jzox92Oy7x86kKq1dkgwkDjAdvn1/sg+lx58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pm9Rnq6K9gJJMNXIWLrgyFOp68t+rA2iV/LHBaqJKRCAsPQCeM/ZAEWs6vAwLlZGJ
	 d9z+KkaMzo55TamZ/uLbZtAxvhH+EIiCH/F1X//24cn77f+JSN3VYwpzEUKdJUyjqZ
	 hW2neer6M21yjLAD2atOXu7qbVlI7QrlBdwoiWyXYhiH53m1K4CCl4uFSWz+rj+rVb
	 wdIGyT0llWeOZMvuOd3gym3r0l8MxBH1OLwVk3Dx++Yebh4lVvgdn7qP2TqjRkXXJA
	 40mWCdHBvWGbXP71vf3PRqUXO2Zy7PK8Bal4/vfx6aAB3cp2rFwakpoy0tYXhQdBM2
	 OhzjoTpF0J+UA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:53 +0200
Subject: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance to
 use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=treding@nvidia.com;
 h=from:subject:message-id; bh=8+nv7sk7Akwz75J9dY7T6KYUmn88Q/uMOZjp/QVHnwE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwWa1SvQWmP/QpBTIYpH/p5BjW/vNe3PQFW
 PIJtKK0Yc+JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oT55D/9UlLXiJUGNHvbif1WyheZOPAmCfQiBGs4tT3nSsGD8ADVsjiCwxXPwjZLNPbJHn7cbFVF
 ysSL8Eu8nGtZq8uzRoV48KFaDU2hheMMjC32m/Vwlqq6Mi8HTtbd/pAxKNJcHFebCHCNQSQiVZ9
 Hj7RPGo7EE++sFH78dSJyxFS26Ls+O51QEGh2GT/2M05Jn/N8WPHdGRZ+tvKf9wSmj7yljpcxeq
 hxs7zZgwaTxiMPqux14/8a+wyfC9qKiOWYvrqyYa6QVd7ox5OMLOgHc3eWp9oE7JoWpmuz2RCkv
 h4Z12oUWR2Zb9JGgeaQ9uazJ0gnRmI4qiC6hvI6O/znhvHL44z1ys/MJ23jNaeIREOGj926+qTU
 U+HYS42RwN6q01vAYwbcmp/2b/gCcXxnZBvtBzwvFQaIqb1AI4Qyfs1OBgcQdI+xTeLYbmTWcSg
 mP8/kKzYvqzYROVlX7OloVAR68X4SESXFKM9MA0v+iojV5I9JNsxVdXYW8BoQ1J8sZAA6dOwm3u
 vWFxSpJuLw6Du+t0ET3+7dhymYxHiw7SbgfU+Bev3DIvyNfwTNXykX02Vrh2wqblBVnIeMKbnVt
 kK7TY61hKlczNad2u16XUyDACkaE64sjKVfPoc0d6TDZEL+BaGgM2SBtoMNSrtEsGc2aNeSxahD
 TaS1nZNuBTY0KJQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: 96E154DB291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60609-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Thierry Reding <treding@nvidia.com>

Currently the kernel relies on a global variable to reference the PMC
context. Use an explicit lookup for the PMC and pass that to the public
PMC APIs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index 57bc542780bb..6aaa30ef167f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -18,6 +18,8 @@ struct nvkm_device_tegra {
 
 	struct regulator *vdd;
 
+	struct tegra_pmc *pmc;
+
 	struct {
 		/*
 		 * Protects accesses to mm from subsystems
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 46bb55a1f565..3c8d0878891a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -54,7 +54,8 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 		reset_control_assert(tdev->rst);
 		udelay(10);
 
-		ret = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
+		ret = tegra_pmc_powergate_remove_clamping(tdev->pmc,
+							  TEGRA_POWERGATE_3D);
 		if (ret)
 			goto err_clamp;
 		udelay(10);
@@ -307,6 +308,12 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		goto free;
 	}
 
+	tdev->pmc = devm_tegra_pmc_get(&pdev->dev);
+	if (IS_ERR(tdev->pmc)) {
+		ret = PTR_ERR(tdev->pmc);
+		goto free;
+	}
+
 	/**
 	 * The IOMMU bit defines the upper limit of the GPU-addressable space.
 	 */

-- 
2.52.0



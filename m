Return-Path: <linux-media+bounces-60607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOZZD1FF+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:42:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D14DB2AE
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AC27301A1FD
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6798447A0C4;
	Wed,  6 May 2026 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKJ4RV3L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FF477982;
	Wed,  6 May 2026 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074932; cv=none; b=iXnhc+SU/tnYxsPm9n9XeesxW8FQ2VF21a8ZQ3KwWMAA+fbN4w+fSqY3Lr233cRVAbJ8oDRGlbYvwWg75Rfv5Pa238XVY185cCLImeY95tM3L/yPave/o/C/81wxGoNmfrtsVJF5b//mB15Zl9KeWXFG0cQ8lj0ijqaiKvKvUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074932; c=relaxed/simple;
	bh=c3IdukSqkdizYR+nvOsMFSfRacrCTihLpGMwf0DytCw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEtyFQzO4O6AA4LjXVzlBEYb7dTDuy8AwTzceEtJYelPo2GWmrprMI7x38knuiFste0EIuBZCvEX7apnyAkXLJr/TPOdPf0rtMLcd74uZcmTM83qbou9K5gdEUTa4JHVFPN1E1eaXRZxc0NDZQ2Fcl1Q/aRH80YiJefDsn05l/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKJ4RV3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA64C2BCB8;
	Wed,  6 May 2026 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074932;
	bh=c3IdukSqkdizYR+nvOsMFSfRacrCTihLpGMwf0DytCw=;
	h=From:Subject:Date:To:Cc:From;
	b=IKJ4RV3Lyv8oxdqtjJC6OIC/6rXY29IuJvTiT4NZTUHacP2c3bEAL5u8IO525gAAd
	 GdHYJPixovH2tJ8+/ccpTRSbFwSioKJNQ0jfXXpXj62CSlxnJLfRrzPvFFZbyJH94k
	 rmpOM5pmePtSKhc8yDNIiM9V0/1k6GFBaDGv+RMER+VjW6gNDG+AWSkPQLUlP3inFG
	 uR9VwrRzsa+NntueV5w8T5/9dFLPyDU2dBoZYPsGuM40wjmmpeFzNxHoRadZPM8Hyv
	 n3WTP6W9EXxusJxeDt6+bufGSq2+lKWQI3Lah8LnOBM4/ec9qAMzlA6hhQ83qfsP7o
	 KCbzR1+7uhdcw==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/9] soc/tegra: pmc: Clean up legacy code
Date: Wed, 06 May 2026 15:41:51 +0200
Message-Id: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBjF8VfRd201iymvIhfMwafM2pCSdzdc/
 up/zkUBnhGoSi7yODjwaiOyNCEztXaE4D6alFRaFlILtxiRK/S5QamBgmLpPAY+v5e6+R32bob
 Z3ind9wOZhJpCZwAAAA==
X-Change-ID: 20260506-pmc-42ed4ce76ee5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907; i=treding@nvidia.com;
 h=from:subject:message-id; bh=c3IdukSqkdizYR+nvOsMFSfRacrCTihLpGMwf0DytCw=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UviFY8FRKErx+gWaVIw1aQqo3vpgLFBeSK2
 QOwKU74fluJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFLwAKCRDdI6zXfz6z
 oSXDD/91cqDJQm1CmiDEX3o7Unl38MlUu/CfFtYMDWyUZ7eThkCtVRzHXCEt+Z5P92fpge0puXf
 aQpRSV7kenNh18JhSWj/5+XyhAf6NgIP1IC7KvnU9Rb0ttmUPc44abwaGNIdl9JUY2P8a8DFwUb
 B8olNHLzudEKDrxFtwQJuA+LbBT/B7LjdtvVTmjg6Hgpz82Lv4IwUJIIB9/rvGBz07pKPtvqNlF
 8AXnGwpWBSmJBVD/Bg5tMVlTFcI8CuWM0uSfqF7Fe8QjWgyPcAQ17+anPVPDUeflenhlEOrB8FH
 d4hRnk3mE3bAsDflRt/8LQpkz4A6Vs/zwwcBVKwRDCXALnqI6jcpsUotp/Ub16lFCK5KYYd7VIa
 uVd5k7E3ku4W5EFiLk26KGUyi6WPtbHXM8YphtwwrXaB9bNDnTUcKXG8o2AERJLO/9hKSqMys43
 NtPtcMZXCS6SKQIFNR3QTOVTGrj+Bri3RAfwXpBeI7WXUuYjQLsKSe1sdC7fJfWfOusR7pdXLYA
 zIVEx3IjPndD4GaTjdKJTopPr1a/M6afg8r63ZXCO4u6fwxTaC854gRdvm6J/yhFnE2JPjqRKK0
 MSLNxv5xE1gMA37VuJq0jspEaXgC2N1nXEOBBMofoTN/HpGi8XfvXqzpfkn6YgWci9bGIj+8rZg
 oJJjuQE+3aztG1A==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: 917D14DB2AE
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
	TAGGED_FROM(0.00)[bounces-60607-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Tegra PMC has accumulated a bit of cruft over the years. Most of the
legacy code has since been replaced by standard APIs, but for certain 32
bit platforms we cannot get rid of all remnants, unfortunately.

In addition, future SoC generations can have multiple instances of the
PMC, making some of the old APIs unusable. Preliminary work was merged
recently to allow passing a PMC instance to the custom PMC APIs to solve
this problem.

This series of patches is a final cleanup pass that makes use of the new
APIs in existing drivers. At the end of the series, only some old 32-bit
support code will use the old APIs, so they can be made exclusive to the
32-bit ARM builds (which is about as good as it's going to get).

Note that the first 6 patches can be applied to subsystem trees
independently since they only rely on patches that were merged into 7.0.
Patch 8 depends on these patches being applied, so some coordination is
needed. The simplest solution would probably be to merge them all
through the Tegra tree, if everyone agrees. Otherwise, maintainers
should feel free to apply patches to their subsystems and I'll monitor
things and apply the last three patches once all others have landed.

Thanks,
Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (9):
      ata: ahci_tegra: Explicitly specify PMC instance to use
      drm/nouveau: tegra: Explicitly specify PMC instance to use
      drm/tegra: Explicitly specify PMC instance to use
      media: vde: Explicitly specify PMC instance to use
      PCI: tegra: Explicitly specify PMC instance to use
      usb: xhci: tegra: Explicitly specify PMC instance to use
      soc/tegra: pmc: Create PMC context dynamically
      soc/tegra: pmc: Remove unused legacy functions
      soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard

 drivers/ata/ahci_tegra.c                           |  17 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   9 +-
 drivers/gpu/drm/tegra/dc.c                         |  14 +-
 drivers/gpu/drm/tegra/dc.h                         |   1 +
 drivers/gpu/drm/tegra/gr3d.c                       |   9 +-
 drivers/gpu/drm/tegra/sor.c                        |  16 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c      |  15 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h      |   1 +
 drivers/pci/controller/pci-tegra.c                 |  20 +-
 drivers/soc/tegra/pmc.c                            | 412 +++++++++------------
 drivers/usb/host/xhci-tegra.c                      |  38 +-
 include/soc/tegra/pmc.h                            |  81 +---
 13 files changed, 305 insertions(+), 330 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260506-pmc-42ed4ce76ee5

Best regards,
--  
Thierry Reding <treding@nvidia.com>



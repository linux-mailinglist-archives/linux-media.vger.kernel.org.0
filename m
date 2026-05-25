Return-Path: <linux-media+bounces-62697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AP5I+TwE2pLHwcAu9opvQ
	(envelope-from <linux-media+bounces-62697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:49:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E95C6BC4
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BA53036428
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 06:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838153A9DAE;
	Mon, 25 May 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsRfe9Jo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B73A9D97;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691677; cv=none; b=US3FDlF1sgzwFrsQ4u3C/vR67eq1PAeQemV8oFJdGmbfpOSArvTvnjTxeSmLvGVXtNdeJreQ3rZ4O7FZF8fz+p4JpSd9xEQi+LMEq+6a4JnjuwR1a9wTfZbBxgJelbleJ7pOddZvKj91eUeBSDIra8TAfMbE7smCdxQpy7gtQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691677; c=relaxed/simple;
	bh=kj5kq9WD/UeIGGomDPvQJ5qz0l33I6XGMyKKg4VQXdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UhAzRNZpBO7exf7P8BokrZE88k5ldKOmpZ4LEAnkAgBG0LroQbWOl8j5QOAxHIFx1MtdcF01RAwnB5DyvZqyYZg3CFthE1TsO+Q2+4xl1yh4vxb7ca/rqZCDHOKtK1ETdlJmRYW/nhNtoJRs9nddsLXyGp6PkaUYZOLkf2MYDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsRfe9Jo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ED05C2BCB7;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779691676;
	bh=kj5kq9WD/UeIGGomDPvQJ5qz0l33I6XGMyKKg4VQXdc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UsRfe9JoPHyRpOhu0zxGGR0t97QML2dwoGLwM4dpJ8dWLCzm0m3q1kqwk6OW95e8S
	 B096Rb/bSoFz31uu4JPQDf4o7ShLNqvQbGjcz3j0dPWK+GSP4FGHVxZUrXK7aw7WT1
	 6bKX3n2UYWbMuGrUQSjSQdikX1YK0bI2qwF/O4KbHlLGRF14RIRGdaA8xr2c23JgXJ
	 dvHAp2niUkkqCC7GdVkpiy3ZhQk4b2VjNSEt4doOgon36BbwYrttI4cpBo9tz5Ua0q
	 T81REJt2CwjFSZ0IaUID/+IBQEeBsQI5V0nat4zSWwO6VqyCfRNPC9+ACCvDyaGGCp
	 7qAtMPPpy/sfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BACCD5BC0;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: tegra: Enable DMA Support on Tegra194 QSPI
Date: Mon, 25 May 2026 01:47:43 -0500
Message-Id: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RgKbY2uvIdhge0UJrEUW2w0h
 LtbOYDL95L//gqJIlOCS7VCpMyJw1SgOVRgxn4aCNkWhqZudK2EwoWG2IuzxGeaGTl4/0KSJLW
 UVjnroCznSI7fe/XWFR45LSF+9pMsfvZ/LwusUZ2su+vW2Nbq6+B7fhxN8NBt2/YFvaqvCLYAA
 AA=
X-Change-ID: 20260515-tegra194-qspi-iommu-e4e4644d5fdf
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779691675; l=1598;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=kj5kq9WD/UeIGGomDPvQJ5qz0l33I6XGMyKKg4VQXdc=;
 b=FgtyycY/WO9UF+dLOgSpwlPMx83PaD2wpdDr/spM/8ugUqsL+0skVAlc7O0wcEJkKGlESI3Kw
 FBcCnN0pvl3BDr1dCFTbv6fFITPSScZWnGo/y30gVf/9lkMVfN50TJU
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62697-lists,linux-media=lfdr.de,webgeek1234.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,nvidia.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E76E95C6BC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The reason for this is to properly support the spi nor chip on the
Jetson Xavier NX module. Prior to this, it would time out on all
transfers and sometimes even trigger a cbb fault, locking up the entire
unit. With this, reading and writing to the flash memory works as
expected.

This also fixes the tegra210-quad spi driver to properly use the dma
memory space instead of the spi controllers. Without this, enabling dma
on the controllers results in mmu faults.

The driver change has only been tested on tegra210 / p3450 and tegra194
/ p3518 as that is the only available test platforms. Tegra234 and
Tegra241 should also be verified. I have p3766 for tegra234, but the
qspi flash memory is firewalled by mb1 on all publicly available
bootloaders, and no other spi devices are part of the devkit.

---
Changes in v2:
- Drop bindings patches
- Add patch to use dma memory space instead of the spi controllers when
  dma is enabled.
- Drop iommu properties from final patch
- Link to v1: https://lore.kernel.org/r/20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com

---
Aaron Kling (2):
      spi: tegra210-quad: Allocate DMA memory for DMA engine
      arm64: tegra: Enable DMA Support on Tegra194 QSPI

 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  4 ++++
 drivers/spi/spi-tegra210-quad.c          | 29 ++++++++++++++++++-----------
 2 files changed, 22 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260515-tegra194-qspi-iommu-e4e4644d5fdf

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>




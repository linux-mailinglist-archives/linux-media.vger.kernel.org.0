Return-Path: <linux-media+bounces-59613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yxNyBp1W7WmziAAAu9opvQ
	(envelope-from <linux-media+bounces-59613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 02:04:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD546868E
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 02:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59846303C027
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 00:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59334315F;
	Sun, 26 Apr 2026 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJQp0/4O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F53B2AA;
	Sun, 26 Apr 2026 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161799; cv=none; b=On+e2MPueRgQCxngNvVsi6yhKt5NjYAoHd4cxEZbfGnWmzYOM2pORbpGHW8EsY5VpX+3wY7TBgi+FIm+phr7JhLJQv5QaC0Nthj7isBlaJEjZD/NgnlVoypPUDxNrrvd4tWuaLo2npiApjApBifxWtG+egOV3VgUKTeUsLHPhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161799; c=relaxed/simple;
	bh=fRUVeoN8uvXw7MHUq4fqZfehszDdVoUoVfxpW6ndWIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrjhrnmIi+j5xU7Ct3k6qnfGb2mgWjGdlkGEY9BSYp02RUwEitpU+BCCOc7Hkoc3JS/bL76a0XRaosIgPo9696whAGktmsB09ak+wJ2x/syBAIj5JbcAUC7ark7lPDVGRLznZdfCaj38X60iq5xUoSdRRsbtc+/WhN9X4fP2wGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJQp0/4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DA5C2BCB2;
	Sun, 26 Apr 2026 00:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161799;
	bh=fRUVeoN8uvXw7MHUq4fqZfehszDdVoUoVfxpW6ndWIk=;
	h=From:To:Cc:Subject:Date:From;
	b=CJQp0/4OO4rWyi4pC9SdeJ/kgRi0DiG4k/ULR0Y6jZSwArk/Z9LC77E47ZGDpr1xV
	 tLc2PQUcrzGejG6hvR5fW54tCy6m7mLQSSMqHaB7mAXWZpNJlAKrfAUZD4hAhW3aeL
	 S8JFyhqvhkJe29AQKdS5pLHb8RXtWZ1KSblubfAhAZtPyKchRgCQpxdZJo37Xy3IXl
	 Mm0I2yB/R5e9OFbWJgzfJn8uRHORaN2sQeblN7aBOf/OdyMxplGFET/45iRD27fS16
	 VZBQdhZiLr6LuYVCnixACEhpoHGg8SOk5mkwk0ttFI/M5gXzcvrbimwP+UXifh5OUY
	 lcfhBUJz+KOFw==
From: Sasha Levin <sashal@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: tegra-vde: Add HAS_IOMEM dependency to match SRAM select
Date: Sat, 25 Apr 2026 20:03:16 -0400
Message-ID: <20260426000317.55689-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92FD546868E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59613-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kconfiglint reports:

  K002: config VIDEO_TEGRA_VDE selects visible symbol SRAM which has
        dependencies

VIDEO_TEGRA_VDE selects SRAM, which is defined in drivers/misc/Kconfig as:

  config SRAM
      bool "Generic on-chip SRAM driver"
      depends on HAS_IOMEM

The NVIDIA Tegra video decoder driver was originally introduced in
commit cd6c56feb591 ("media: staging: media: Introduce NVIDIA Tegra video decoder
driver")
as a staging driver with `depends on
ARCH_TEGRA || COMPILE_TEST` and
`select SRAM`. Since all Tegra SoCs have HAS_IOMEM, the SRAM dependency was
implicitly satisfied for real hardware configurations.

The driver was later de-staged in commit 8bd4aaf438e3 ("media: staging:
tegra-vde: De-stage driver") and relocated to
drivers/media/platform/nvidia/tegra-vde/ in commit 9b18ef7c9ff4 ("media:
platform: rename tegra/vde/ to nvidia/tegra-vde/"). Throughout these moves,
the `select SRAM` remained without a corresponding HAS_IOMEM dependency.

Under COMPILE_TEST on a hypothetical architecture without HAS_IOMEM (such
as UML in some configurations), the select would force SRAM on without its
HAS_IOMEM dependency being met. Add an explicit `depends on HAS_IOMEM` to
make the dependency chain complete and prevent this misconfiguration under
COMPILE_TEST.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/nvidia/tegra-vde/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nvidia/tegra-vde/Kconfig b/drivers/media/platform/nvidia/tegra-vde/Kconfig
index 2fe13f39c95bb..f05fcc94decaf 100644
--- a/drivers/media/platform/nvidia/tegra-vde/Kconfig
+++ b/drivers/media/platform/nvidia/tegra-vde/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on HAS_IOMEM
 	depends on VIDEO_DEV
 	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA
-- 
2.53.0



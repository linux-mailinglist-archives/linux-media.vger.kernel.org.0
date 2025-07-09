Return-Path: <linux-media+bounces-37211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFDAFECF7
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 17:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6707D188AC9A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D64F2E613B;
	Wed,  9 Jul 2025 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUNJb+dj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8265B2E0411;
	Wed,  9 Jul 2025 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073060; cv=none; b=ppn4q8LuCsUwPl4WbzGjbnZnb/+W6Jl4Ep0aJcFejsSHPw558XF49w31KpVDl68SEJhtpYFtGFnt5mquhmGB3cqf/R/VE+fU/X/fPHRtzmmjfv3ZQmhnk9Q12N2A0GEszCZ9JrYNRrW6hbc4i2sUEVrHOatMv9HIUdAjbpWVGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073060; c=relaxed/simple;
	bh=aZq27U35kyCl3DjSJJoQtxZMuJFPED+9y35xHCD4Bzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sfu9I6weBEb9h+Roact7tYZnX6GlihUtY94/LdhCGfbQaWP5hIlDBc/Tr/Z65SFdAmWYxI344lABnPv8o/MNvkMUKpgXZDwFi3gFUQzr6pscWqzRbyGiu3UdYUIBURlvWlySQDf6Z4nbaApcWGErfCjzztjXOsEkIZq75ABYe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUNJb+dj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AABC4CEEF;
	Wed,  9 Jul 2025 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752073060;
	bh=aZq27U35kyCl3DjSJJoQtxZMuJFPED+9y35xHCD4Bzg=;
	h=From:To:Cc:Subject:Date:From;
	b=BUNJb+djTuHuOXhxH4UsU2lr+foiwBanSve5vNsX32C3u3bWU2jGW3mD2ApMyK6KK
	 ftuYhmc1UrfdS3QMym67zhc+VlzhsH4uaVzE+u2WLRFEavntCBjN4oxMM+IJ8j2hmP
	 2rsSraYaubfQF0RAsv+/rKUTQ4Pwm1cF7JfPYbnivd+zUResXSiK9dRnskGlg7HQP4
	 /UNP3TDMhZDnE2Pqz0kEyOpBXbw6cobWZeQCY2v31azSeMHVr8ivqdq0G8drJO5h6y
	 Jjoe7I6Gf10Lw7jSeRwXxvZZYAAgNYZmFD/Rc01uqlQwLtFPD8UM9Fxh5lLq7VVUFA
	 ivQ/4RPI4yobA==
From: Arnd Bergmann <arnd@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging/ipu7: add CONFIG_PCI dependency
Date: Wed,  9 Jul 2025 16:57:31 +0200
Message-Id: <20250709145735.126674-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This driver fails to build when PCI is disabled:

drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_pci_config_setup':
drivers/staging/media/ipu7/ipu7.c:2260:15: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Wimplicit-function-declaration]
drivers/staging/media/ipu7/ipu7.c:2775:1: error: data definition has no type or storage class [-Werror]
driver(ipu7_pci_driver);
drivers/staging/media/ipu7/ipu7.c:2764:26: error: 'ipu7_pci_driver' defined but not used [-Werror=unused-variable]

Add the required Kconfig dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/ipu7/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/Kconfig b/drivers/staging/media/ipu7/Kconfig
index 5b800e9b09c4..7d831ba7501d 100644
--- a/drivers/staging/media/ipu7/Kconfig
+++ b/drivers/staging/media/ipu7/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_INTEL_IPU7
 	depends on VIDEO_DEV
 	depends on X86 && HAS_DMA
 	depends on IPU_BRIDGE || !IPU_BRIDGE
+	depends on PCI
 	select AUXILIARY_BUS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.39.5



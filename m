Return-Path: <linux-media+bounces-15142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC3937635
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 11:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBCFA281015
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93868289E;
	Fri, 19 Jul 2024 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv52VZam"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF642076;
	Fri, 19 Jul 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721382851; cv=none; b=eaM8xGwmblqh7im73M1KAY7kiGSnuUDCVDa/+VWRX6MpVonLzO3ZjBM91bWbST/61gJ9Dmm9O5HBRRwfoKZAhnhD4JGFuOoh+pIjEkkSAYxbc5xfPTP7P6r8A5k0hlsua5klXl7sEA1UTF5encQ5KHfnVYeCuH2d5D9lkLuA4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721382851; c=relaxed/simple;
	bh=niZib1HcaOrI2sEdXNc7iDEHTFdo9nKts5v1CLx2JNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lujv4kmXJfldlBh64uh5jSkaVQL/Y0nE/7gvASjDYdu6TgqJ+5js1rlZJO+VBuZOE3q7wWmtG1fKSzkTVLhoE/9FXU2OcjhNVNFC7SF6baT4r0tKJjSdSvDSqCDhyrg0ELfK7OGmlzCMHmJUpWRhVesTwgB+B6s4qlFz5awmyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv52VZam; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BA4C32782;
	Fri, 19 Jul 2024 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721382850;
	bh=niZib1HcaOrI2sEdXNc7iDEHTFdo9nKts5v1CLx2JNU=;
	h=From:To:Cc:Subject:Date:From;
	b=kv52VZamhp90GfsUSvPtC5WOF71NrQ+mrALWCKDnM2W/6jnLmTLhWyKNyHLbUJM8/
	 HhJ5Hek5OyGnzvWu9WJo9yEZm7LAVOYE5Mrkst/tBKonv/uLsxAWM/6cvzdABQUA08
	 1uZbBTIOLGA1rnKNgrq8ROeiU80YhCHSpiWsJffbmOq4mhTYgRGtkGzhCeayB18Sk1
	 uN0cBiF4piFfwVoUOmqko61TjkoqYXVTIDD8PKVoT0+FMKXCgZSJxmyiV87W0712dX
	 nSQ6cgYeZ4iVcV+DARPjDbWXRxg2GDz4sYczN30j6mocCWrcCdL6kw6oPZ1+13w2BQ
	 J1sB36f7GVVYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: fix ipu6 Kconfig dependencies
Date: Fri, 19 Jul 2024 11:53:50 +0200
Message-Id: <20240719095403.3607027-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Commit 4670c8c3fb04 ("media: ipu-bridge: Fix Kconfig dependencies") changed
how IPU_BRIDGE dependencies are handled for all drivers, but the IPU6 variant
was added the old way, which causes build time warnings when I2C is turned
off:

WARNING: unmet direct dependencies detected for IPU_BRIDGE
  Depends on [n]: MEDIA_SUPPORT [=m] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && I2C [=n]
  Selected by [m]:
  - VIDEO_INTEL_IPU6 [=m] && MEDIA_SUPPORT [=m] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]

To make it consistent with the other IPU drivers as well as avoid this warning,
change the 'select' into 'depends on'.

Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/intel/ipu6/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 154343080c82..ffadf03478a8 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -3,13 +3,13 @@ config VIDEO_INTEL_IPU6
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && X86_64 && HAS_DMA
+	depends on IPU_BRIDGE
 	select DMA_OPS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
-	select IPU_BRIDGE
 	help
 	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
 	  and used for capturing images and video from camera sensors.
-- 
2.39.2



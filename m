Return-Path: <linux-media+bounces-3150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5C821818
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 08:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A9E1F21F3C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 07:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8E54435;
	Tue,  2 Jan 2024 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YS2S6QZW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04540CA6B
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-111-240-nat.elisa-mobile.fi [85.76.111.240])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDBF4D53;
	Tue,  2 Jan 2024 08:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704181451;
	bh=P2+UCimmoI2bWxfBdiOAfPWHXG8MY+dUwJELTabbO7M=;
	h=From:To:Cc:Subject:Date:From;
	b=YS2S6QZWSf2BwfGCe8KKQlDj631wUl6k7BU0dKVgBBx4gip7LKFaF1pjsYW8NJtn2
	 CPGxwjw3UbkdZMDHe04mogNfDFjjZBpk/i/0Lsz+SkWp0Qu2CRufKfqgMSm+48w7tK
	 iPDCz0MBPouP6xCXgWBQxTOKOD/1cNH/PHhKOqLY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH] media: i2c: thp7312: Add dependency on FW_LOADER
Date: Tue,  2 Jan 2024 09:45:18 +0200
Message-ID: <20240102074518.24968-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thp7312 driver uses the firmware upload API to update the firmware
stored in a flash memory connected to the device. The API is gated by
the CONFIG_FW_UPLOAD option, and is correctly stubbed in
include/linux/firmware.h. As firmware upload is not used in normal
operation, the driver expects to compile and link when CONFIG_FW_UPLOAD
is disabled.

While CONFIG_FW_UPLOAD is a boolean option, whether the firmware upload
code is built in the kernel or provided as a module is controlled
through the tristate CONFIG_FW_LOADER option that CONFIG_FW_UPLOAD
depends on. This results in the following configuration being accepted
by Kconfig, compiling properly, but failing to link:

CONFIG_FW_LOADER=m
CONFIG_FW_UPLOAD=y
CONFIG_VIDEO_THP7312=y

Fix it by adding a dependency on FW_LOADER.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312312134.tnFH0uX1-lkp@intel.com/
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This is a fix for v6.8.
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 78a87331686e..ce5494dd8e99 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -673,6 +673,7 @@ menu "Camera ISPs"
 
 config VIDEO_THP7312
 	tristate "THine THP7312 support"
+	depends on FW_LOADER || FW_LOADER=n
 	depends on I2C
 	select MEDIA_CONTROLLER
 	select V4L2_CCI_I2C

base-commit: 02d4e62ae2452c83e4a3e279b8e4cb4dcbad4b31
-- 
Regards,

Laurent Pinchart



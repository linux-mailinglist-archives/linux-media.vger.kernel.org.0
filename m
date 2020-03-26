Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA5DC1942E9
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 16:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgCZPVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 11:21:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:40504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727547AbgCZPVg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 11:21:36 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F3A62076A;
        Thu, 26 Mar 2020 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585236095;
        bh=UMtfIGx6fdWu311hAWHW7bkLL7PvRCE4kFcKr4hh+c4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u1Uek547uCCHiUothbggu0uDCqldxv4YobnED0ZyBkO8/jdAkZC3kV4qr8kZyplZD
         n2/DC7wya+PM9tPzRgBtkcohKgbEGiJ1BZZWuga4PL0XghjDTL6daxX0IJ015jgSu6
         xL2bvDv+2zad/qw0f7PVVhAcPGEHO4/Af4IqFGQU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jHUK5-003dii-Mw; Thu, 26 Mar 2020 16:21:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 2/7] media: Kconfig: mark other drivers as test drivers
Date:   Thu, 26 Mar 2020 16:21:27 +0100
Message-Id: <11575cad9a4fe2b4d6b929f29c6eaec6f978fbc1.1585235736.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585235736.git.mchehab+huawei@kernel.org>
References: <cover.1585235736.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neither the PCI skeleton nor the DVB dummy driver are real
drivers. They're there just as an example for a driver
writter.

Distros should not enable those drivers. So, hide them if
MEDIA_TEST_SUPPORT is not selected.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/Kconfig | 4 ++++
 drivers/media/pci/Kconfig           | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index a29e9ddf9c82..932fd88fdc12 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -944,8 +944,12 @@ config DVB_SP2
 	  CIMaX SP2/SP2HF Common Interface module.
 
 comment "Tools to develop new frontends"
+	depends on MEDIA_TEST_SUPPORT
 
 config DVB_DUMMY_FE
 	tristate "Dummy frontend driver"
 	depends on DVB_CORE
+	depends on MEDIA_TEST_SUPPORT
+	help
+	  Dummy skeleton frontend driver.
 endmenu
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 21ee43fd7d8e..348da044ec78 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -65,6 +65,7 @@ source "drivers/media/pci/intel/ipu3/Kconfig"
 
 config VIDEO_PCI_SKELETON
 	tristate "Skeleton PCI V4L2 driver"
+	depends on MEDIA_TEST_SUPPORT
 	depends on PCI
 	depends on SAMPLES
 	depends on VIDEO_V4L2 && VIDEOBUF2_CORE
-- 
2.25.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC7C192495
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbgCYJtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:51186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbgCYJtk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3A612078A;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129779;
        bh=r75CGhHuggkfdZX8ir10LW7XCTC74UJvik/L1BZeITE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Klf87/tdX9YI1Vci1/ELQg+sLDt/ko9lQbq7rOCCFkIWYRjyWkUiWxWngbA82YSqc
         CGcw585qzaoJVRWii4S5GbLoMYQnjTT2hMJ1ueQebOvOFYi5xb0WrPsEOKfFkDe6ap
         hRSoFO/Jtmufs9e1ki689H0QKEempBS/7cjO19Rk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HT9-1g; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 02/22] media: Kconfig: add an option to filter in/out platform drivers
Date:   Wed, 25 Mar 2020 10:49:16 +0100
Message-Id: <a0f04b4fa949ef09585b636e1b531009a4bd85bf.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most systems don't need support for those, while others only
need those, instead of the others.

So, add an option to filter in/out platform drivers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 9dfea5c4b6ab..03c295a2710a 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -87,6 +87,18 @@ config MEDIA_CEC_SUPPORT
 	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
 	  adapter that supports HDMI CEC.
 
+config MEDIA_PLATFORM_SUPPORT
+	bool "Platform-specific devices"
+	help
+	  Enable support for complex cameras, codecs, and other hardware
+	  that are integrated at the CPU, GPU or on Image Signalling Processor
+	  and don't use PCI, USB or Firewire buses.
+
+	  This is found on Embedded hardware (SoC), on V4L2 codecs and
+	  on some GPU and newer CPU chipsets.
+
+	  Say Y when you want to be able so see such devices.
+
 source "drivers/media/cec/Kconfig"
 
 source "drivers/media/mc/Kconfig"
@@ -161,15 +173,14 @@ source "drivers/media/dvb-core/Kconfig"
 
 comment "Media drivers"
 
-#
-# V4L platform/mem2mem drivers
-#
-
 source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
+source "drivers/media/radio/Kconfig"
+
+if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
-source "drivers/media/radio/Kconfig"
+endif
 
 comment "Supported FireWire (IEEE 1394) Adapters"
 	depends on DVB_CORE && FIREWIRE
-- 
2.25.1


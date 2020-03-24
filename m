Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884BD191323
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgCXO0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727995AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0720215A4;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=Z4NTAwq0iX+fSarX+OK5e9Qzq8rS5PhgyAmDd4W8YA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lYbMyOFG9SEKUpaBKLyjIFEgeq7VTAxCdjI+Pk2J1a1ayaDnTxL0oBdVgtu1w1WL1
         Djk1GtVR+Cayre2JfDuAYkvo1M4jInjGZYlF8gYJQ5kMYf6PDvxRQ7xRyKRYLb3/Wx
         s+Bl3cM9Qs6x4KCNCl4F4gHDDPDeuRoJG6MYIifU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVb-00267I-VO; Tue, 24 Mar 2020 15:26:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 12/20] media: Kconfig: move DVB-specific options to dvb-core/Kconfig
Date:   Tue, 24 Mar 2020 15:26:13 +0100
Message-Id: <05153eacab4ccb6cc2ca36dbd43e8c761c2d65c5.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to cleanup the main media Kconfig, move the DVB-core
specific options to dvb-core/Kconfig.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig          | 21 ---------------------
 drivers/media/dvb-core/Kconfig | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 2f4360faed03..44aceb5e5b63 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -164,31 +164,10 @@ config DVB_CORE
 	default y
 	select CRC32
 
-config DVB_MMAP
-	bool "Enable DVB memory-mapped API (EXPERIMENTAL)"
-	depends on DVB_CORE
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_CORE
-	select VIDEOBUF2_VMALLOC
 	help
-	  This option enables DVB experimental memory-mapped API, which
-	  reduces the number of context switches to read DVB buffers, as
-	  the buffers can use mmap() syscalls.
 
-	  Support for it is experimental. Use with care. If unsure,
-	  say N.
 
-config DVB_NET
-	bool "DVB Network Support"
-	default (NET && INET)
-	depends on NET && INET && DVB_CORE
-	help
-	  This option enables DVB Network Support which is a part of the DVB
-	  standard. It is used, for example, by automatic firmware updates used
-	  on Set-Top-Boxes. It can also be used to access the Internet via the
-	  DVB card, if the network provider supports it.
 
-	  You may want to disable the network support on embedded devices. If
-	  unsure say Y.
 
 # This Kconfig option is used by both PCI and USB drivers
 config TTPCI_EEPROM
diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 90e038d5ffd9..0f8e53692b86 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -3,6 +3,32 @@
 # DVB device configuration
 #
 
+config DVB_MMAP
+	bool "Enable DVB memory-mapped API (EXPERIMENTAL)"
+	depends on DVB_CORE
+	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_CORE
+	select VIDEOBUF2_VMALLOC
+	help
+	  This option enables DVB experimental memory-mapped API, which
+	  reduces the number of context switches to read DVB buffers, as
+	  the buffers can use mmap() syscalls.
+
+	  Support for it is experimental. Use with care. If unsure,
+	  say N.
+
+config DVB_NET
+	bool "DVB Network Support"
+	default (NET && INET)
+	depends on NET && INET && DVB_CORE
+	help
+	  This option enables DVB Network Support which is a part of the DVB
+	  standard. It is used, for example, by automatic firmware updates used
+	  on Set-Top-Boxes. It can also be used to access the Internet via the
+	  DVB card, if the network provider supports it.
+
+	  You may want to disable the network support on embedded devices. If
+	  unsure say Y.
+
 config DVB_MAX_ADAPTERS
 	int "maximum number of DVB/ATSC adapters"
 	depends on DVB_CORE
-- 
2.24.1


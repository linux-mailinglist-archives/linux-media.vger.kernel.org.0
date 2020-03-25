Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE5F19249B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgCYJtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11D44208DB;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=pFcfYvyZLSzWLSnkR7ut1yN9lgAxWkwExI0DNfpmq7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dNbZonf/4JAoZpb0OIphLu70a8NcrosBFPwXLxt5rx8REzHiUtJq1pJ+Nyx+wdxzB
         C6L3qyekDIAAHQiaj5AP7Sh1uw4a/TPSliAalLpoHaMYO5f8x9Jkv3Gy86NRF1spN+
         DYo1EzVRlR2ju99S3b0sa3kPNRIDhrtEoA8KB4s8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HTy-BX; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 12/22] media: Kconfig: move DVB-specific options to dvb-core/Kconfig
Date:   Wed, 25 Mar 2020 10:49:26 +0100
Message-Id: <18822760462f61040b9dae09a22c0fbcca2a6479.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
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
index cbf8073c43b4..a9fe9574a057 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -168,31 +168,10 @@ config DVB_CORE
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
2.25.1


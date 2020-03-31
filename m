Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 551981994EE
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgCaLMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730629AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D50A21D6C;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=KeQkR9wDH5eMFc0ynrS4FJg9WqIqItWZvn2kIG/4+Rk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CCj+bhviShRLaznsXsDRIl2wP1pQvzggHOzQ0zISr/ikR7RtcFBJaaaTkSs4V1xFz
         9TvBukO0Qe7Pmlt68pE9riou2MKBp4VMA+9AJX42Bm1MzoWg0x0wbsNvwvcs0lmr8w
         XkAe2yZpBmPcLLivM4PXyjejG7RTSTp1gLnTGpIE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bro-Qx; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 25/33] media: Kconfig: move DVB-specific options to dvb-core/Kconfig
Date:   Tue, 31 Mar 2020 13:12:01 +0200
Message-Id: <081caf33c73f9cf6f76b5c7aa83ff7b4cca2e087.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
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
index 9cc528e0b120..dda449556f22 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -161,31 +161,10 @@ config DVB_CORE
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
 
 source "drivers/media/v4l2-core/Kconfig"
 source "drivers/media/mc/Kconfig"
diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 61f9e1ce99cb..6ffac618417b 100644
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


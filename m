Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9CDE192494
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgCYJtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbgCYJtk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2DD42077D;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129779;
        bh=jKk8NJkL8qKsao2SH+PCcYFQbx6OBkK9bW1uRkwhuSQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=blreX2PushWRTrc+A5/Jutmpx+dMsdtixJuoU7Uef3UfIs70e67yN4SmxJkmTkT6L
         22B5Ldn08imAlR9u6ecr7fzwOoj5lp0a9la3tGO+4GZjNhNYAti+F2v2GRXmjj9O83
         sLddyXTgY+UOgmGXB/gGZTYdKUGw6TPhHlekVC+g=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HT5-0V; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 01/22] media: dvb-usb: auto-select CYPRESS_FIRMWARE
Date:   Wed, 25 Mar 2020 10:49:15 +0100
Message-Id: <712ca59ba2e1185fc505b52eba9eb3575467f393.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least some of the supported boards by dvb-usb
driver need to load the cypress firmware, so select
it, as otherwise missing dependencies may popup.

Also, as the cypress firmware load routines are needed
only by the dvb-usb, dvb-usb-v2 and go7007 drivers, and
those all (now) select it, there's no need to ask the
user for manually select it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/common/Kconfig      | 2 +-
 drivers/media/usb/dvb-usb/Kconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index 1990b7f09454..4ea03b7899a8 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -14,7 +14,7 @@ config VIDEO_TVEEPROM
 	depends on I2C
 
 config CYPRESS_FIRMWARE
-	tristate "Cypress firmware helper routines"
+	tristate
 	depends on USB
 
 source "drivers/media/common/videobuf2/Kconfig"
diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index 1a3e5f965ae4..42334a02cdce 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -2,6 +2,7 @@
 config DVB_USB
 	tristate "Support for various USB DVB devices"
 	depends on DVB_CORE && USB && I2C && RC_CORE
+	select CYPRESS_FIRMWARE
 	help
 	  By enabling this you will be able to choose the various supported
 	  USB1.1 and USB2.0 DVB devices.
-- 
2.25.1


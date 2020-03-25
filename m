Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF58192690
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 12:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgCYLCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 07:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgCYLCh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 07:02:37 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D16FE20772;
        Wed, 25 Mar 2020 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585134157;
        bh=Ab/s+c57n8qJ+u1zHrMWfjLxuK8ct5xN5/FpaCnn02c=;
        h=From:To:Cc:Subject:Date:From;
        b=Lz9b2VNy+W4iFA4RS/UqzLx3i0ACz6LuNNeDI5RQqfi5vyXFa7n3bEB45KTqJSx3y
         l1LFmo3FKchxJo7snzgqdOlYmikip2CL1YRi5vybRzYR64FAFd8darfQE6jIZg44o4
         +nioRByxVk2ifjwMywupYdqDDmbuU3anOfiF8TzU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH3nu-003Iag-5X; Wed, 25 Mar 2020 12:02:34 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: Kconfig: Better organize the per-API options
Date:   Wed, 25 Mar 2020 12:02:33 +0100
Message-Id: <b983213738af1457a4366bf22dde8fa60188e8be.1585134039.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After this change, the menu is displayed like above.

1) When filtering is not active:

    --- Multimedia support
        [ ]   Filter devices by their types
        [*]   Autoselect ancillary drivers (tuners, sensors, i2c, spi, frontends)
              Media core support  --->
              Video4Linux options  --->
              Media controller options  --->
              Digital TV options  --->
              HDMI CEC options  --->
              Media drivers  --->

2) When filtering is active:

    --- Multimedia support
        [*]   Filter devices by their types
        [*]   Autoselect ancillary drivers (tuners, sensors, i2c, spi, frontends)
              Media device types  --->
              Video4Linux options  --->
              Media controller options  --->
              Digital TV options  --->
              HDMI CEC options  --->
              Media drivers  --->

The per-API menu will only be displayed if the corresponding
core support is enabled.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

This patch applies after this patch series:
	[PATCH v3 00/22] Reorganize media Kconfig

And, IMHO, makes the org of media configuration items cleaner,
as the per-subsystem options now have their own menus.

 drivers/media/Kconfig | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 2a69b8024a0f..1bfe61a75fc2 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -184,10 +184,27 @@ endmenu # Media core support
 #
 # Extra per-media API core functionality
 
-menu "Media core additional options"
+menu "Video4Linux options"
+	visible if VIDEO_DEV
+
 source "drivers/media/v4l2-core/Kconfig"
+endmenu
+
+menu "Media controller options"
+	visible if MEDIA_CONTROLLER
+
 source "drivers/media/mc/Kconfig"
+endmenu
+
+menu "Digital TV options"
+	visible if DVB_CORE
+
 source "drivers/media/dvb-core/Kconfig"
+endmenu
+
+menu "HDMI CEC options"
+	visible if CEC_CORE
+
 source "drivers/media/cec/Kconfig"
 endmenu
 
-- 
2.25.1



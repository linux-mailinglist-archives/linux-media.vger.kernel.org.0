Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE8891994E6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbgCaLMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730636AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9CD6221EA;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=/aAgcjSIop8glFXprRxhOmTmMcrZBQWFbThIdkc1ZFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AjrGuCH7zYGC3ZpiSRDAzTXvkbX7VoF4kDH/xRHPJ7VptaV85JGIEhdWg2UDpEkRO
         w9cKwrqWpNgQEwTczwYxnmX0C5QJKAMwjZgTmDGFUadb+/ky5+HW1W6YYwMDdi+E3p
         ZpIDaYLmouyBGzlPXylycJq+gHUfvTbY7JGlrfN4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoW-002bsI-0k; Tue, 31 Mar 2020 13:12:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 31/33] media: Kconfig: Better organize the per-API options
Date:   Tue, 31 Mar 2020 13:12:07 +0200
Message-Id: <0bf342ef48f5676b61e98baed192af9e9822d4fa.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
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
 drivers/media/Kconfig | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 913903c8e942..382366b8ab46 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -191,10 +191,27 @@ endmenu # Media core support
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1727719950B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgCaLMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730606AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75EE521744;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=bPRfqQ4xcllot9ahDrF1mcivZLob/4AZxgD+3hA+VLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G5asgzz2GprXEJIVvBX5ooMT1nFLK1tlH52WTm5G5Ox2NkBLZ6aP6kUL92xeE6Lm1
         VFzRSsP3Fs67sxwUWq+DWKy/YGPWNxEPffm9ZTDCyWbc5gPVHPth/WRoVICWUH0Uf8
         M8tqDjt5owPG/Q6+XytKn6gRrHEHE2fyQGXWhVxM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brd-P0; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v4 23/33] media: Kconfig: warn if drivers are filtered
Date:   Tue, 31 Mar 2020 13:11:59 +0200
Message-Id: <1f246a17a838c1835ea3fd0798848c2bc7f5228b.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per a tester feedback, add an option to report when
the drivers are filtered at the Kconfig menu.

Cc: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 8b070fb703f9..79aa83a966db 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -28,7 +28,7 @@ menuconfig MEDIA_SUPPORT
 if MEDIA_SUPPORT
 
 config MEDIA_SUPPORT_FILTER
-	bool "Filter devices by their types"
+	bool "Filter media drivers"
 	depends on MEDIA_SUPPORT
 	help
 	   Configuring the media subsystem can be complex, as there are
@@ -203,6 +203,9 @@ source "drivers/media/cec/Kconfig"
 
 comment "Media drivers"
 
+comment "Drivers filtered as selected at 'Filter media drivers'"
+	depends on MEDIA_SUPPORT_FILTER
+
 source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
 source "drivers/media/radio/Kconfig"
-- 
2.25.1


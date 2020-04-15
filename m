Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2071AA8E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 15:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370724AbgDONjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 09:39:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2633377AbgDONjo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 09:39:44 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0913F2078B;
        Wed, 15 Apr 2020 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586957984;
        bh=/9X+pbgREQrpGcmh8IfXXzxrVJwD2DkJ0M6jwUJulAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iLmbggsVLFdFrgtfbvFa4ZI8I8JmxqnPgFSCsOFWd9uXDL1voocVcxXgKCSCacWVP
         dJXLGQoqR4PKAE9sR6/UcUlgcKvFEjF1bueYm77X37aRly5CYu2vwGvOtu4mnqJjYA
         SgFT7DY1wwe+X3M5KK8YzfhVYdJzRE9feh3nwywg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOiGU-006iy9-21; Wed, 15 Apr 2020 15:39:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 2/2] media: radio: don't use a menu just for wl128x driver
Date:   Wed, 15 Apr 2020 15:39:39 +0200
Message-Id: <a2d2f2c68c8b36da691644bc7dc5d2b5c3ae9cca.1586957976.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <f58e97b9c766d714a3189666a70dbb1aeed2611a.1586957976.git.mchehab+huawei@kernel.org>
References: <f58e97b9c766d714a3189666a70dbb1aeed2611a.1586957976.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It doesn't make any sense to have a submenu just for this
driver. Drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/radio/wl128x/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/radio/wl128x/Kconfig b/drivers/media/radio/wl128x/Kconfig
index 7b45222730aa..d5ae3388d3db 100644
--- a/drivers/media/radio/wl128x/Kconfig
+++ b/drivers/media/radio/wl128x/Kconfig
@@ -2,7 +2,6 @@
 #
 # TI's wl128x FM driver based on TI's ST driver.
 #
-menu "Texas Instruments WL128x FM driver (ST based)"
 config RADIO_WL128X
 	tristate "Texas Instruments WL128x FM Radio"
 	depends on VIDEO_V4L2 && RFKILL && TTY && TI_ST
@@ -14,5 +13,3 @@ config RADIO_WL128X
 	  that are compatible with the Video For Linux 2 API.  Information on
 	  this API and pointers to "v4l2" programs may be found at
 	  <file:Documentation/userspace-api/media/index.rst>.
-
-endmenu
-- 
2.25.2


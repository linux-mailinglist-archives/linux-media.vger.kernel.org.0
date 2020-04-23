Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDF51B5E42
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 16:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgDWOsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 10:48:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728538AbgDWOsa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 10:48:30 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82DBB2087E;
        Thu, 23 Apr 2020 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587653309;
        bh=g1OxLm5K4A8iUELkRsSCIe++SluYtlQGXvkIkN27w+Y=;
        h=From:To:Cc:Subject:Date:From;
        b=sBHASEJkd9LRbYAsnloiTOPO5+GkQQ28kCoQr7/eOjYsWhrczCLW1A4fJsPJ/8D13
         m4KS8emGMy8ztKLPpc3bwPDs9Bj0MK9dhCIl6nDMxeHJCmuRpOakMCqwCfVsGxlNUK
         J8jDVzPUDW9FpIhziQS4ZZ+j/jj+p6+KRlSjOaYo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jRd9P-00EaM9-5X; Thu, 23 Apr 2020 16:48:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] media: platform: fix VIA_CAMERA dependencies
Date:   Thu, 23 Apr 2020 16:48:26 +0200
Message-Id: <324efc704352ad728ba5aa77dd81e4f35bebc3c2.1587653301.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As detected by a randconfig:

	WARNING: unmet direct dependencies detected for VIDEO_OV7670
	  Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=y] && VIDEO_V4L2 [=n]
	  Selected by [y]:
	  - VIDEO_VIA_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_PLATFORM_DRIVERS [=y] && FB_VIA [=y]

There's a missing dependency on VIDEO_V4L2 for VIA_CAMERA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index b1ac9c6c9cdb..8110373fb0e9 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -14,7 +14,7 @@ source "drivers/media/platform/marvell-ccic/Kconfig"
 
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
-	depends on FB_VIA
+	depends on FB_VIA && VIDEO_V4L2
 	select VIDEOBUF2_DMA_SG
 	select VIDEO_OV7670
 	help
-- 
2.25.2


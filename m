Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914841B1224
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 18:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgDTQpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 12:45:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTQpz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 12:45:55 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF7C42082E;
        Mon, 20 Apr 2020 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587401154;
        bh=fv/lZWyp1Aft98ogIw8t/4eMXXzbCLcv2G1lVAOZ1yc=;
        h=From:To:Cc:Subject:Date:From;
        b=FytvsLPO1qjDOsqBLmjS8rlHk5u6Gxu6b5ozlwazJJeDui4mL32amBn+k9YBU8U2T
         pfKXden7VKuQf0iELAMaXVMV9xFy7OvI1Ho3k+bTh9drJVPqqGbQGSAJ5YYWO0hLFp
         lT/HuYCyrzkf2HcIXNMC/l170xqFXQD8aXh0SPTM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQZYO-009jWn-V1; Mon, 20 Apr 2020 18:45:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] media: staging: rkisp1 Kconfig: depends on OF
Date:   Mon, 20 Apr 2020 18:45:47 +0200
Message-Id: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

building it with a random config causes a warning:

WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
  Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && OF [=n]
  Selected by [y]:
  - VIDEO_ROCKCHIP_ISP1 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && VIDEO_V4L2 [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/rkisp1/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
index 5ecbefa0f5ec..07e4a6e4458e 100644
--- a/drivers/staging/media/rkisp1/Kconfig
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -2,7 +2,7 @@
 
 config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
-	depends on VIDEO_V4L2
+	depends on VIDEO_V4L2 && OF
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.25.2


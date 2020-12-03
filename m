Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DE72CE27E
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 00:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgLCXPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 18:15:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:36532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgLCXPv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 18:15:51 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: add remoteproc dependency
Date:   Fri,  4 Dec 2020 00:14:58 +0100
Message-Id: <20201203231505.1483971-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The SCP firmware can only be built if CONFIG_REMOTEPROC is
enabled:

WARNING: unmet direct dependencies detected for MTK_SCP
  Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
  Selected by [y]:
  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])

Add this as a dependency for mtk-vcodec.

Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ffffef2267f4..295f74c3c04b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -276,6 +276,7 @@ config VIDEO_MEDIATEK_VCODEC
 	# our dependencies, to avoid missing symbols during link.
 	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
 	depends on MTK_SCP || !MTK_SCP
+	depends on REMOTEPROC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
-- 
2.27.0


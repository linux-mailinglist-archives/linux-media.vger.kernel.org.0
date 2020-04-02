Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7F919CA73
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389112AbgDBTpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:45:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46388 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBTpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:45:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B971128A9AD
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/3] rkisp1: Fix wrong PHY config dependency
Date:   Thu,  2 Apr 2020 16:45:04 -0300
Message-Id: <20200402194504.5331-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200402194504.5331-1-ezequiel@collabora.com>
References: <20200402194504.5331-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of depending on the Rockchip PHY driver the ISP driver
should really depend on CONFIG_GENERIC_PHY_MIPI_DPHY,
given all it needs is the phy_mipi_dphy_get_default_config() symbol.

Fix it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
index b859a493caba..e3ba6826fbb0 100644
--- a/drivers/staging/media/rkisp1/Kconfig
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -7,7 +7,7 @@ config VIDEO_ROCKCHIP_ISP1
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
-	select PHY_ROCKCHIP_DPHY_RX0
+	select GENERIC_PHY_MIPI_DPHY
 	default n
 	help
 	  Enable this to support the Image Signal Processing (ISP) module
-- 
2.26.0.rc2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 631B319CA70
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388995AbgDBTp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:45:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46380 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBTp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:45:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AA618295BF1
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 2/3] phy-rockchip-dphy-rx0: Drop unneeded CONFIG_OF dependency
Date:   Thu,  2 Apr 2020 16:45:03 -0300
Message-Id: <20200402194504.5331-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200402194504.5331-1-ezequiel@collabora.com>
References: <20200402194504.5331-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver is perfectly capable of being built without CONFIG_OF.
Remove this dependency, which is useful for compile-only tests.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
index bd0147624de1..fb74df829371 100644
--- a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
@@ -2,7 +2,7 @@
 
 config PHY_ROCKCHIP_DPHY_RX0
 	tristate "Rockchip MIPI Synopsys DPHY RX0 driver"
-	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select GENERIC_PHY_MIPI_DPHY
 	select GENERIC_PHY
 	help
-- 
2.26.0.rc2


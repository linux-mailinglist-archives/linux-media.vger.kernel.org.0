Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001C419B7BA
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 23:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733109AbgDAVhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 17:37:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34562 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733087AbgDAVho (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 17:37:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C791929769C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/3] phy-rockchip-dphy-rx0: Drop unneeded CONFIG_OF dependency
Date:   Wed,  1 Apr 2020 18:37:20 -0300
Message-Id: <20200401213721.24173-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200401213721.24173-1-ezequiel@collabora.com>
References: <20200401213721.24173-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver is perfectly capable of being built without CONFIG_OF.
Remove this dependency, which is useful for compile-only tests.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
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


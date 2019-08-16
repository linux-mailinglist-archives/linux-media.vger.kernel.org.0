Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBA28F9DF
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 06:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfHPEZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 00:25:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43946 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfHPEZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 00:25:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3A69F28AA21
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: rockchip/rga: Update maintainership
Date:   Fri, 16 Aug 2019 01:24:51 -0300
Message-Id: <20190816042451.6681-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update Jacob's address and add myself as co-maintainer.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Note that I have a few minor changes in mind for this driver,
but frst, I'll need to fix whatever is wrong with gstreamer
not probing it anymore.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69d3fa86cf18..7dfe381c8b43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13760,7 +13760,8 @@ F:	include/linux/hid-roccat*
 F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
-M:	Jacob chen <jacob2.chen@rock-chips.com>
+M:	Jacob Chen <jacob-chen@iotwrt.com>
+M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/rockchip/rga/
-- 
2.22.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A62B431D0F
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 15:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhJRNrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 09:47:43 -0400
Received: from comms.puri.sm ([159.203.221.185]:41028 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233644AbhJRNpm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 09:45:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id C67ACDF65B;
        Mon, 18 Oct 2021 06:43:00 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dfhyj4HWaJBO; Mon, 18 Oct 2021 06:43:00 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, sakari.ailus@linux.intel.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] media: hi846: depend on OF
Date:   Mon, 18 Oct 2021 15:42:46 +0200
Message-Id: <20211018134246.383594-1-martin.kepplinger@puri.sm>
In-Reply-To: <20211018095859.255912-1-martin.kepplinger@puri.sm>
References: <20211018095859.255912-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since other device enumerate mechanisms are currently not implemented,
make the hi846 sensor driver depend on CONFIG_OF.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reported-by: kernel test robot <lkp@intel.com>
---

revision history
----------------
v2:
* added the reported-by tag

v1:
https://lore.kernel.org/linux-media/20211018095859.255912-1-martin.kepplinger@puri.sm/



 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0e56489c97fb..53268f1f761f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -746,6 +746,7 @@ config VIDEO_HI556
 config VIDEO_HI846
 	tristate "Hynix Hi-846 sensor support"
 	depends on I2C && VIDEO_V4L2
+	depends on OF
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
-- 
2.30.2


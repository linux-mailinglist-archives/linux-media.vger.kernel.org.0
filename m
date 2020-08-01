Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10162235483
	for <lists+linux-media@lfdr.de>; Sun,  2 Aug 2020 00:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgHAWCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 18:02:24 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33657 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgHAWCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 18:02:24 -0400
Received: from localhost.localdomain (unknown [178.240.22.159])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7B83E200008;
        Sat,  1 Aug 2020 22:02:17 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     andy.shevchenko@gmail.com
Cc:     cengiz@kernel.wtf, dan.carpenter@oracle.com,
        devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: [PATCH v6] staging: atomisp: move null check to earlier point
Date:   Sun,  2 Aug 2020 01:01:02 +0300
Message-Id: <20200801220101.2783-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200731083856.GF3703480@smile.fi.intel.com>
References: <20200731083856.GF3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

`find_gmin_subdev()` that returns a pointer to `struct
gmin_subdev` can return NULL.

In `gmin_v2p8_ctrl()` there's a call to this function but the
possibility of a NULL was not checked before its being dereferenced,
i.e.:

  /* Acquired here --------v */
  struct gmin_subdev *gs = find_gmin_subdev(subdev);

  /*  v------Dereferenced here */
  if (gs->v2p8_gpio >= 0) {
      ...
  }

With this change we're null checking `find_gmin_subdev()` result
and we return an error if that's the case. We also WARN()
for the sake of debugging.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
Reported-by: Coverity Static Analyzer CID 1465536
Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

 Please do note that this change introduces a new return value to
 `gmin_v2p8_ctrl()`.

 [NEW] - raise a WARN and return -ENODEV if there are no subdevices.
       - return result of `gpio_request` or `gpio_direction_output`.
       - return 0 if GPIO is ON.
       - return results of `regulator_enable` or `regulator_disable`.
       - according to PMIC type, return result of `axp_regulator_set`
         or `gmin_i2c_write`.
       - return -EINVAL if unknown PMIC type.

 Patch Changelog:
   v4: Fix minor typo in commit message
   v5: Remove typo from email subject
   v6: Remove duplicate Signed-off-by tag

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 0df46a1af5f0..1ad0246764a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -871,6 +871,9 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 	int ret;
 	int value;
 
+	if (WARN_ON(!gs))
+		return -ENODEV;
+
 	if (gs->v2p8_gpio >= 0) {
 		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
 			gs->v2p8_gpio);
@@ -881,7 +884,7 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 			pr_err("V2P8 GPIO initialization failed\n");
 	}
 
-	if (!gs || gs->v2p8_on == on)
+	if (gs->v2p8_on == on)
 		return 0;
 	gs->v2p8_on = on;
 
-- 
2.27.0


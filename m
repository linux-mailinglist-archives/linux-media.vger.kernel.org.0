Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE217231FAC
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 15:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2N5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 09:57:47 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58753 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgG2N5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 09:57:46 -0400
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 758C61C0012;
        Wed, 29 Jul 2020 13:57:42 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Cengiz Can <cengiz@kernel.wtf>
Subject: [PATCH] staging: atomisp: move null check to earlier point
Date:   Wed, 29 Jul 2020 16:56:37 +0300
Message-Id: <20200729135636.9220-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

`find_gmin_subdev` function that returns a pointer to `struct
gmin_subdev` can return NULL.

In `gmin_v2p8_ctrl` there's a call to this function but the possibility
of a NULL was not checked before its being dereferenced. ie:

```
/* Acquired here --------v */
struct gmin_subdev *gs = find_gmin_subdev(subdev);
int ret;
int value;

/*  v------Dereferenced here */
if (gs->v2p8_gpio >= 0) {
	pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
		gs->v2p8_gpio);
	ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
	if (!ret)
		ret = gpio_direction_output(gs->v2p8_gpio, 0);
	if (ret)
		pr_err("V2P8 GPIO initialization failed\n");
}
```

I have moved the NULL check before deref point.

Caught-by: Coverity Static Analyzer CID 1465536
Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 0df46a1af5f0..8e9c5016f299 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -871,6 +871,11 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 	int ret;
 	int value;
 
+	if (!gs) {
+		pr_err("Unable to find gmin subdevice\n");
+		return -EINVAL;
+	}
+
 	if (gs->v2p8_gpio >= 0) {
 		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
 			gs->v2p8_gpio);
@@ -881,7 +886,7 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 			pr_err("V2P8 GPIO initialization failed\n");
 	}
 
-	if (!gs || gs->v2p8_on == on)
+	if (gs->v2p8_on == on)
 		return 0;
 	gs->v2p8_on = on;
 
-- 
2.27.0


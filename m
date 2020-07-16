Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606432221B5
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 13:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPLvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 07:51:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:43528 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgGPLvY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 07:51:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2FADEB931;
        Thu, 16 Jul 2020 11:51:27 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH] media: atomisp: fix NULL pointer dereference
Date:   Thu, 16 Jul 2020 13:51:22 +0200
Message-Id: <20200716115122.15909-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am currently seeing:
BUG: kernel NULL pointer dereference, address: 0000000000000002
...
Hardware name: UMAX VisionBook 10Wi Pro/CQM1018CWP, BIOS CQ1018.007 09/22/2016
RIP: 0010:gmin_subdev_add.cold+0x303/0x312 [atomisp_gmin_platform]
...
Call Trace:
 gmin_camera_platform_data+0x2f/0x60 [atomisp_gmin_platform]
 ov2680_probe+0x7f/0x2b0 [atomisp_ov2680]
 i2c_device_probe+0x95/0x290

power can be NULL and that is properly handled earlier in this function.
Even i2c address is set there. So this is a duplicated assignment which
can cause the bug above. Remove it.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1af9da8acf4c..246742f44d84 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -574,7 +574,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 		gmin_subdevs[i].eldo2_ctrl_shift = gmin_get_var_int(dev, false,
 								    "eldo2_ctrl_shift",
 								    ELDO2_CTRL_SHIFT);
-		gmin_subdevs[i].pwm_i2c_addr = power->addr;
 		break;
 
 	default:
-- 
2.27.0


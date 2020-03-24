Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994A5191AE4
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXUZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:25:59 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:57633 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgCXUZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:25:58 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B7973100011;
        Tue, 24 Mar 2020 20:25:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com
Subject: [PATCH 3/4] media: bcm2835: Register sensor devnode as read-only
Date:   Tue, 24 Mar 2020 21:28:43 +0100
Message-Id: <20200324202844.1518292-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324202844.1518292-1-jacopo@jmondi.org>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bcm2835 bridge drivers controls the camera sensor configuration through
direct calls to the kapi realized by the v4l2 sub-device operations and
does not allow userspace to change the sensor parameter through the
sub-device devnode.

In order to expose to userspace the current sensor configuration,
register the device node in read-only mode by using the newly introduced
v4l2_device_register_subdev_ro_nodes() function.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/bcm2835/bcm2835-unicam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
index 89bd1c842d38..5001976dcebc 100644
--- a/drivers/media/platform/bcm2835/bcm2835-unicam.c
+++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
@@ -2875,7 +2875,7 @@ static int unicam_probe_complete(struct unicam_device *unicam)
 		goto unregister;
 	}
 
-	ret = v4l2_device_register_subdev_nodes(&unicam->v4l2_dev);
+	ret = v4l2_device_register_ro_subdev_nodes(&unicam->v4l2_dev);
 	if (ret) {
 		unicam_err(unicam, "Unable to register subdev nodes.\n");
 		goto unregister;
-- 
2.25.1


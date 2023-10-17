Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED037CCDB3
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 22:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbjJQUQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 16:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbjJQUQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 16:16:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376364EE6
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 13:06:24 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96A26896;
        Tue, 17 Oct 2023 22:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697573126;
        bh=nd7rHyBKUfldOwcG/wXZdy58DTZYnnBemMWna4eYMUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYm8Xo90ibGFok6hP+jW8+PRHKU9pPiZwYXhW56pCAgVyGRGM9J5Ql6ak1lFYXajr
         6ZFCfoBUyUDApFT5VprrMstRaxEdKJRil3NOTzbrAyNAt5c/D0ba1etcsK9iK287A2
         e1JyB5brKSMiW3MAy+k5d972sSw14HL16VpNDm1U=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/3] staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS
Date:   Wed, 18 Oct 2023 01:35:11 +0530
Message-Id: <20231017200511.678223-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017200511.678223-1-umang.jain@ideasonboard.com>
References: <20231017200511.678223-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
alias should be picked from there.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index c873eace1437..3c18376003ff 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1995,9 +1995,15 @@ static void bcm2835_mmal_remove(struct vchiq_device *device)
 	vchiq_mmal_finalise(instance);
 }
 
+static const struct vchiq_bus_device_id id_table[] = {
+	{ .name = "bcm2835-camera" }
+};
+MODULE_DEVICE_TABLE(vchiq_bus, id_table);
+
 static struct vchiq_driver bcm2835_camera_driver = {
 	.probe		= bcm2835_mmal_probe,
 	.remove		= bcm2835_mmal_remove,
+	.id_table	= id_table,
 	.driver		= {
 		.name	= "bcm2835-camera",
 	},
@@ -2008,4 +2014,3 @@ module_vchiq_driver(bcm2835_camera_driver)
 MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
 MODULE_AUTHOR("Vincent Sanders");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("bcm2835-camera");
-- 
2.40.1


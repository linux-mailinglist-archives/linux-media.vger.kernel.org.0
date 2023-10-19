Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1D67CF36C
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 11:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344936AbjJSJCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 05:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbjJSJB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 05:01:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362AE129
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 02:01:54 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3C06276;
        Thu, 19 Oct 2023 11:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697706105;
        bh=0LdC8+GAY6U97gZ4OULmQjk1G/wf/jcpQbWa7v6paPw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vj9Qqk+pN56pV/YrmMjvSVJGUMYlp/0VGxs58NMXJwe+30ogcT2iZ8mksbY9sLP2l
         fDfqFtOcA48Y19y9NNEVsTkHvITVMJiJ24Kg4/ThFfzRY7maAcG+0sf8EizKw9k9Fg
         5cMhFrHsjCM04vPQjQSHE9G42rUZV2MKkvoAXirY=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 3/3] staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS
Date:   Thu, 19 Oct 2023 14:31:28 +0530
Message-Id: <20231019090128.430297-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019090128.430297-1-umang.jain@ideasonboard.com>
References: <20231019090128.430297-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
alias should be picked from there.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index c873eace1437..e860fb89d42e 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1995,9 +1995,16 @@ static void bcm2835_mmal_remove(struct vchiq_device *device)
 	vchiq_mmal_finalise(instance);
 }
 
+static const struct vchiq_device_id device_id_table[] = {
+	{ .name = "bcm2835-camera" },
+	{}
+};
+MODULE_DEVICE_TABLE(vchiq, device_id_table);
+
 static struct vchiq_driver bcm2835_camera_driver = {
 	.probe		= bcm2835_mmal_probe,
 	.remove		= bcm2835_mmal_remove,
+	.id_table	= device_id_table,
 	.driver		= {
 		.name	= "bcm2835-camera",
 	},
@@ -2008,4 +2015,3 @@ module_vchiq_driver(bcm2835_camera_driver)
 MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
 MODULE_AUTHOR("Vincent Sanders");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("bcm2835-camera");
-- 
2.40.1


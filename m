Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBBE7D4F1F
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjJXLoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjJXLox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:44:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5482610C0
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:48 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60D1C128D;
        Tue, 24 Oct 2023 13:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147874;
        bh=jSv8c12sL4oMPyAZcET1tDHpval4s9kiQ9zFZpRPihc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P/NRRwqgtAfElWoi0HI9dCDw4kLi4saLHw1RNxo4klLhN8N3EgwfS+vcCj5Nmji+C
         5qt4ZzNFrwLdA1PXE9YKs4spoXjhoGEU6JgkFyCGFJrwMQm6ClpCgtokPRdBcmq1zu
         pyxZLXaZFrl0Oi8CnU6dwPl/U5xytOOfWs+kwPvk=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 4/8] staging: vc04: Convert vchiq_log_warning() to use dynamic debug
Date:   Tue, 24 Oct 2023 07:44:24 -0400
Message-ID: <20231024114428.443528-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move vchiq_log_warning() custom logging wrapper based on printk to use
dynamic debug. The log category is dictated by vchiq_log_category
which will become the part of the warning string format that will be
logged to dynamic debug (for grep).

All the vchiq_log_warning() calls are adjusted to use the
modified wrapper.

While at that, remove the extraneous "----" from few of the
warning string text.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c              | 16 +++++++++-------
 .../interface/vchiq_arm/vchiq_core.c             |  8 ++++----
 .../interface/vchiq_arm/vchiq_core.h             |  5 ++---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 2c760cf734f1..8e8c6ebfa0c8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -695,7 +695,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		ret = -ENOTCONN;
 		goto failed;
 	} else if (i > 0) {
-		vchiq_log_warning(vchiq_core_log_level,
+		vchiq_log_warning(state->dev, VCHIQ_CORE,
 				  "%s: videocore initialized after %d retries\n", __func__, i);
 	}
 
@@ -1696,17 +1696,19 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(vchiq_susp_log_level, "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
+		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
+				  "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
 				  active_services, found);
 
 	for (i = 0; i < found; i++) {
-		vchiq_log_warning(vchiq_susp_log_level, "----- %c%c%c%c:%d service count %d %s",
+		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
+				  "%c%c%c%c:%d service count %d %s",
 				  VCHIQ_FOURCC_AS_4CHARS(service_data[i].fourcc),
 				  service_data[i].clientid, service_data[i].use_count,
 				  service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count %d", peer_count);
-	vchiq_log_warning(vchiq_susp_log_level, "--- Overall vchiq instance use count %d",
+	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d", peer_count);
+	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq instance use count %d",
 			  vc_use_count);
 
 	kfree(service_data);
@@ -1822,7 +1824,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	 */
 	err = vchiq_register_chrdev(&pdev->dev);
 	if (err) {
-		vchiq_log_warning(vchiq_arm_log_level,
+		vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
 				  "Failed to initialize vchiq cdev");
 		goto error_exit;
 	}
@@ -1833,7 +1835,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	return 0;
 
 failed_platform_init:
-	vchiq_log_warning(vchiq_arm_log_level, "could not initialize vchiq platform");
+	vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vchiq platform");
 error_exit:
 	return err;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 12fcb229124c..5f535003f25f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -475,7 +475,7 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 	status = service->base.callback(service->instance, reason, header, service->handle,
 					bulk_userdata);
 	if (status && (status != -EAGAIN)) {
-		vchiq_log_warning(vchiq_core_log_level,
+		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
 				  "%d: ignoring ERROR from callback to service %x",
 				  service->state->id, service->handle);
 		status = 0;
@@ -1622,7 +1622,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				vchiq_service_put(service);
 			service = get_connected_service(state, remoteport);
 			if (service)
-				vchiq_log_warning(vchiq_core_log_level,
+				vchiq_log_warning(state->dev, VCHIQ_CORE,
 						  "%d: prs %s@%pK (%d->%d) - found connected service %d",
 						  state->id, msg_type_str(type), header,
 						  remoteport, localport, service->localport);
@@ -2921,7 +2921,7 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(vchiq_core_log_level,
+		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
 				  "%d: close_service:%d - waiting in state %s",
 				  service->state->id, service->localport,
 				  srvstate_names[service->srvstate]);
@@ -2982,7 +2982,7 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(vchiq_core_log_level,
+		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
 				  "%d: remove_service:%d - waiting in state %s",
 				  service->state->id, service->localport,
 				  srvstate_names[service->srvstate]);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 219d5db9df0e..d1e5c50170da 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -66,9 +66,8 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 	do { dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_warning
-#define vchiq_log_warning(cat, fmt, ...) \
-	do { if (cat >= VCHIQ_LOG_WARNING) \
-		 printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while (0)
+#define vchiq_log_warning(dev, cat, fmt, ...) \
+	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_info
 #define vchiq_log_info(cat, fmt, ...) \
-- 
2.41.0


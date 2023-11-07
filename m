Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E367E3833
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbjKGJwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbjKGJwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8081C124
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:35 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A89099CC;
        Tue,  7 Nov 2023 10:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350733;
        bh=GemfAk188bNFxIbnJFAl/gIGobTxdHdNVJ+YSaVm23Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NzdPLcuXphcXu5vbTkK7Jc8ZohQtYTkHVFmZ4kNbeJyRHepD+hhh2WAH97CMxVl6N
         2LfZoyRFYy607o4369WP0jBtyM8qDHE5TJqlCjNuTMZ44s82T/e/MmyNtR0EqgELtL
         y+LuH9kLyvDX8a7YqrlZtBjnqa+pXg17gm6MBRHg=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 7/9] staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
Date:   Tue,  7 Nov 2023 04:51:54 -0500
Message-ID: <20231107095156.365492-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107095156.365492-1-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop vchiq_log_warning() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 35 ++++++++++---------
 .../interface/vchiq_arm/vchiq_core.c          | 33 +++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |  4 ---
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 2cb2a6503058..bc0ee8b9d1c3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -690,8 +690,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		pr_err("%s: videocore not initialized\n", __func__);
 		return -ENOTCONN;
 	} else if (i > 0) {
-		vchiq_log_warning(state->dev, VCHIQ_CORE,
-				  "%s: videocore initialized after %d retries\n", __func__, i);
+		dev_dbg(state->dev, "%s: %s: %s: videocore initialized after %d retries\n",
+			log_cat(VCHIQ_CORE), log_type(WARN), __func__, i);
 	}
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
@@ -1705,20 +1705,22 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
-				  active_services, found);
+		dev_dbg(state->dev,
+			"%s: %s: Too many active services (%d). Only dumping up to first %d services with non-zero use-count\n",
+			log_cat(VCHIQ_SUSPEND), log_type(WARN), active_services, found);
 
 	for (i = 0; i < found; i++) {
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "%p4cc:%d service count %d %s",
-				  &service_data[i].fourcc,
-				  service_data[i].clientid, service_data[i].use_count,
-				  service_data[i].use_count ? nz : "");
+		dev_dbg(state->dev,
+			"%s: %s: %p4cc:%d service count %d %s\n",
+			log_cat(VCHIQ_SUSPEND), log_type(WARN),
+			&service_data[i].fourcc,
+			service_data[i].clientid, service_data[i].use_count,
+			service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d", peer_count);
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq instance use count %d",
-			  vc_use_count);
+	dev_dbg(state->dev, "%s: %s: VCHIQ use count %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(WARN), peer_count);
+	dev_dbg(state->dev, "%s: %s: Overall vchiq instance use count %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(WARN), vc_use_count);
 
 	kfree(service_data);
 }
@@ -1833,8 +1835,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	 */
 	err = vchiq_register_chrdev(&pdev->dev);
 	if (err) {
-		vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
-				  "Failed to initialize vchiq cdev");
+		dev_dbg(&pdev->dev, "%s: %s: Failed to initialize vchiq cdev\n",
+			log_cat(VCHIQ_ARM), log_type(WARN));
 		goto error_exit;
 	}
 
@@ -1844,7 +1846,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	return 0;
 
 failed_platform_init:
-	vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vchiq platform");
+	dev_dbg(&pdev->dev, "%s: %s: Could not initialize vchiq platform\n",
+		log_cat(VCHIQ_ARM), log_type(WARN));
 error_exit:
 	return err;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 5bc7c66e71e1..20055aea29f5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -465,9 +465,9 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 	status = service->base.callback(service->instance, reason, header, service->handle,
 					bulk_userdata);
 	if (status && (status != -EAGAIN)) {
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: ignoring ERROR from callback to service %x",
-				  service->state->id, service->handle);
+		dev_dbg(service->state->dev,
+			"%s: %s: %d: ignoring ERROR from callback to service %x\n",
+			log_cat(VCHIQ_CORE), log_type(WARN), service->state->id, service->handle);
 		status = 0;
 	}
 
@@ -1611,10 +1611,11 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				vchiq_service_put(service);
 			service = get_connected_service(state, remoteport);
 			if (service)
-				vchiq_log_warning(state->dev, VCHIQ_CORE,
-						  "%d: prs %s@%pK (%d->%d) - found connected service %d",
-						  state->id, msg_type_str(type), header,
-						  remoteport, localport, service->localport);
+				dev_dbg(state->dev,
+					"%s: %s: %d: prs %s@%pK (%d->%d) - found connected service %d\n",
+					log_cat(VCHIQ_CORE), log_type(WARN),
+					state->id, msg_type_str(type), header,
+					remoteport, localport, service->localport);
 		}
 
 		if (!service) {
@@ -2917,10 +2918,11 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: close_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev,
+			"%s: %s: %d: close_service:%d - waiting in state %s\n",
+			log_cat(VCHIQ_CORE), log_type(WARN),
+			service->state->id, service->localport,
+			srvstate_names[service->srvstate]);
 	}
 
 	if (!status &&
@@ -2978,10 +2980,11 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: remove_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev,
+			"%s: %s: %d: remove_service:%d - waiting in state %s\n",
+			log_cat(VCHIQ_CORE), log_type(WARN),
+			service->state->id, service->localport,
+			srvstate_names[service->srvstate]);
 	}
 
 	if (!status && (service->srvstate != VCHIQ_SRVSTATE_FREE))
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3583604430b3..80d0100094e6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -71,10 +71,6 @@ static inline const char *log_type(enum vchiq_log_type t)
 	return types_str[t];
 };
 
-#ifndef vchiq_log_warning
-#define vchiq_log_warning(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s warning: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
-#endif
 #ifndef vchiq_log_debug
 #define vchiq_log_debug(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s debug: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
-- 
2.41.0


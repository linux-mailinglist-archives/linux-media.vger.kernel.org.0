Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F277CF25B
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 10:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbjJSIWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 04:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbjJSIWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 04:22:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048A211F
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 01:22:09 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0CDA10FF;
        Thu, 19 Oct 2023 10:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697703720;
        bh=SrlHtWHnfGRcdHe45S7JL/Ai9MaT3ufKb9ELlwaPiZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SI0hd6MybBn6SIFh8GlPhSFPjerxaAAiGf00EjXnVkOldWsjQsm2bHH7Ia/efSYQx
         VOLcZX0uCvOXTKjJsrv/Lahtr22uDM/zbXcwlwXo6BMD+tg3rOso0qBoea3AYXt7sm
         sVlrOCe3DlUW8BIoszBC9NFJVwM3lSvSMx13Mokg=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v1 2/4] staging: vc04: Convert vchiq_log_warning() to use dynamic debug
Date:   Thu, 19 Oct 2023 13:51:45 +0530
Message-Id: <20231019082147.384723-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019082147.384723-1-umang.jain@ideasonboard.com>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com>
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

Move vchiq_log_warning() custom logging wrapper based on printk to use
dynamic debug. The log category is dictated by vchiq_log_category
which will become the part of the warning string format that will be
logged to dynamic debug (for grep).

All the vchiq_log_warning() calls are adjusted to use the
modified wrapper.

While at that, remove the extraneous "----" from few of the
warning string text.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c              | 16 +++++++++-------
 .../interface/vchiq_arm/vchiq_core.c             |  8 ++++----
 .../interface/vchiq_arm/vchiq_core.h             |  5 ++---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index fa4463bfc117..cfc06ca2e228 100644
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
index f6032c6022cb..43e292512491 100644
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
index c74c3647ef60..3dbb1964839b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -69,9 +69,8 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 		pr_debug("%s error: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
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
2.40.1


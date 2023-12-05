Return-Path: <linux-media+bounces-1640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A13804CCA
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B131F213E0
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBE826AEA;
	Tue,  5 Dec 2023 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n4nA1r4p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4705FC0
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 00:42:14 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C637BEEE;
	Tue,  5 Dec 2023 09:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701765693;
	bh=aSv/iT0rAGa8PYeRYI5GFXLojnqyjgqwrMf742rX9+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n4nA1r4pJjV0X8riT0t0tZs0Zku563xPXW4IvCLPdziOX99kn+joN4xSbDPuYwor/
	 pCcr0IQSJp+gJCGeyEkwhOBciPKVakqPLtSER1HNvsLvQ7npe6cqi1llcA6rFdswD+
	 +4j2ARDlegRJpFbbm33raf5dy+M7Z7pIXnmsvrps=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 2/4] staging: vc04_services: Drop vchiq_log_warning() in favour of dev_warn
Date: Tue,  5 Dec 2023 14:11:55 +0530
Message-ID: <20231205084157.73819-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205084157.73819-1-umang.jain@ideasonboard.com>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop vchiq_log_warning() macro which wraps dev_dbg(). Introduce the usage
of dev_warn() directly.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 30 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.c          | 30 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  4 ---
 3 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b403400edd8e..56326b59a718 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -687,8 +687,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		ret = -ENOTCONN;
 		goto failed;
 	} else if (i > 0) {
-		vchiq_log_warning(state->dev, VCHIQ_CORE,
-				  "%s: videocore initialized after %d retries\n", __func__, i);
+		dev_warn(state->dev, "core: %s: videocore initialized after %d retries\n",
+			 __func__, i);
 	}
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
@@ -1644,20 +1644,19 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
-				  active_services, found);
+		dev_warn(state->dev,
+			 "suspend: Too many active services (%d). Only dumping up to first %d services with non-zero use-count\n",
+			 active_services, found);
 
 	for (i = 0; i < found; i++) {
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "%p4cc:%d service count %d %s",
-				  &service_data[i].fourcc,
-				  service_data[i].clientid, service_data[i].use_count,
-				  service_data[i].use_count ? nz : "");
+		dev_warn(state->dev,
+			 "suspend: %p4cc:%d service count %d %s\n",
+			 &service_data[i].fourcc,
+			 service_data[i].clientid, service_data[i].use_count,
+			 service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d", peer_count);
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq instance use count %d",
-			  vc_use_count);
+	dev_warn(state->dev, "suspend: VCHIQ use count %d\n", peer_count);
+	dev_warn(state->dev, "suspend: Overall vchiq instance use count %d\n", vc_use_count);
 
 	kfree(service_data);
 }
@@ -1771,8 +1770,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	 */
 	err = vchiq_register_chrdev(&pdev->dev);
 	if (err) {
-		vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
-				  "Failed to initialize vchiq cdev");
+		dev_warn(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
 		goto error_exit;
 	}
 
@@ -1782,7 +1780,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	return 0;
 
 failed_platform_init:
-	vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vchiq platform");
+	dev_warn(&pdev->dev, "arm: Could not initialize vchiq platform\n");
 error_exit:
 	return err;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 63f412815a32..2fd793954001 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -465,9 +465,9 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 	status = service->base.callback(service->instance, reason, header, service->handle,
 					bulk_userdata);
 	if (status && (status != -EAGAIN)) {
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: ignoring ERROR from callback to service %x",
-				  service->state->id, service->handle);
+		dev_warn(service->state->dev,
+			 "core: %d: ignoring ERROR from callback to service %x\n",
+			 service->state->id, service->handle);
 		status = 0;
 	}
 
@@ -1609,10 +1609,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				vchiq_service_put(service);
 			service = get_connected_service(state, remoteport);
 			if (service)
-				vchiq_log_warning(state->dev, VCHIQ_CORE,
-						  "%d: prs %s@%pK (%d->%d) - found connected service %d",
-						  state->id, msg_type_str(type), header,
-						  remoteport, localport, service->localport);
+				dev_warn(state->dev,
+					 "core: %d: prs %s@%pK (%d->%d) - found connected service %d\n",
+					 state->id, msg_type_str(type), header,
+					 remoteport, localport, service->localport);
 		}
 
 		if (!service) {
@@ -2903,10 +2903,10 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: close_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_warn(service->state->dev,
+			 "core: %d: close_service:%d - waiting in state %s\n",
+			 service->state->id, service->localport,
+			 srvstate_names[service->srvstate]);
 	}
 
 	if (!status &&
@@ -2964,10 +2964,10 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: remove_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_warn(service->state->dev,
+			 "core: %d: remove_service:%d - waiting in state %s\n",
+			 service->state->id, service->localport,
+			 srvstate_names[service->srvstate]);
 	}
 
 	if (!status && (service->srvstate != VCHIQ_SRVSTATE_FREE))
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index d7dcd17e4bff..bc980a001711 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -53,10 +53,6 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 	return strings[c];
 };
 
-#ifndef vchiq_log_warning
-#define vchiq_log_warning(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
-#endif
 #ifndef vchiq_log_debug
 #define vchiq_log_debug(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
-- 
2.41.0



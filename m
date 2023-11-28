Return-Path: <linux-media+bounces-1293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9677FC529
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57492282E73
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA1E41C7B;
	Tue, 28 Nov 2023 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DpSKqcu9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382C010F4
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:19:43 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936DDBEB;
	Tue, 28 Nov 2023 21:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202746;
	bh=Vt1GCkur2CxCDelJ5vZ440ua/A976qlXZRmml5A+pEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpSKqcu9rNmuaFiOP6K/+/H+/v6nYfIxKvD7NQWUIhxrEzJIxmnZodq8NZpqmcdqn
	 s+U1KhNNceCVidHmqakTkpry4LkHcL0o/AkUftln1QirzUe2FrukZPR9/EtpKElGxj
	 ILeRU8kgAiXvjA6FnMcWvU1BS+ZFaKdmUp6QLCbM=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 3/5] staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
Date: Wed, 29 Nov 2023 01:49:24 +0530
Message-ID: <20231128201926.489269-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128201926.489269-1-umang.jain@ideasonboard.com>
References: <20231128201926.489269-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop vchiq_log_warning() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Meanwhile at it, drop the usage of __func__ from the logs.
Dynamic debug supports this via the 'f'  decorator flag.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 29 ++++++++----------
 .../interface/vchiq_arm/vchiq_core.c          | 30 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  4 ---
 3 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 348b7dfd76d8..963b7845001d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -687,8 +687,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		ret = -ENOTCONN;
 		goto failed;
 	} else if (i > 0) {
-		vchiq_log_warning(state->dev, VCHIQ_CORE,
-				  "%s: videocore initialized after %d retries\n", __func__, i);
+		dev_dbg(state->dev, "core: warn: videocore initialized after %d retries\n", i);
 	}
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
@@ -1643,20 +1642,19 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
-				  active_services, found);
+		dev_dbg(state->dev,
+			"suspend: warn: Too many active services (%d). Only dumping up to first %d services with non-zero use-count\n",
+			active_services, found);
 
 	for (i = 0; i < found; i++) {
-		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "%p4cc:%d service count %d %s",
-				  &service_data[i].fourcc,
-				  service_data[i].clientid, service_data[i].use_count,
-				  service_data[i].use_count ? nz : "");
+		dev_dbg(state->dev,
+			"suspend: warn: %p4cc:%d service count %d %s\n",
+			&service_data[i].fourcc,
+			service_data[i].clientid, service_data[i].use_count,
+			service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d", peer_count);
-	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq instance use count %d",
-			  vc_use_count);
+	dev_dbg(state->dev, "suspend: warn: VCHIQ use count %d\n", peer_count);
+	dev_dbg(state->dev, "suspend: warn: Overall vchiq instance use count %d\n", vc_use_count);
 
 	kfree(service_data);
 }
@@ -1770,8 +1768,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	 */
 	err = vchiq_register_chrdev(&pdev->dev);
 	if (err) {
-		vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
-				  "Failed to initialize vchiq cdev");
+		dev_dbg(&pdev->dev, "arm: warn: Failed to initialize vchiq cdev\n");
 		goto error_exit;
 	}
 
@@ -1781,7 +1778,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	return 0;
 
 failed_platform_init:
-	vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vchiq platform");
+	dev_dbg(&pdev->dev, "arm: warn: Could not initialize vchiq platform\n");
 error_exit:
 	return err;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 025526e06242..cfd0caac216a 100644
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
+			"core: warn: %d: ignoring ERROR from callback to service %x\n",
+			service->state->id, service->handle);
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
+				dev_dbg(state->dev,
+					"core: warn: %d: prs %s@%pK (%d->%d) - found connected service %d\n",
+					state->id, msg_type_str(type), header,
+					remoteport, localport, service->localport);
 		}
 
 		if (!service) {
@@ -2902,10 +2902,10 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: close_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev,
+			"core: warn: %d: close_service:%d - waiting in state %s\n",
+			service->state->id, service->localport,
+			srvstate_names[service->srvstate]);
 	}
 
 	if (!status &&
@@ -2963,10 +2963,10 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
-		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
-				  "%d: remove_service:%d - waiting in state %s",
-				  service->state->id, service->localport,
-				  srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev,
+			"core: warn: %d: remove_service:%d - waiting in state %s\n",
+			service->state->id, service->localport,
+			srvstate_names[service->srvstate]);
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



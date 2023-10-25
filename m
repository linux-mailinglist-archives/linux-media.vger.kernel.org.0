Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DB27D616E
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 08:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjJYGHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 02:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYGHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 02:07:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02983A6
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 23:07:28 -0700 (PDT)
Received: from umang.jain (unknown [103.251.226.9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32DBF02;
        Wed, 25 Oct 2023 08:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698214035;
        bh=kRevHTa7BZHVFPA+Hf+dDECTd8huXuyVAfMpaVPbt60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M1/OhVqLymPE27MZ8wGCtx1pLpWdE1Ypxaq9vfnKHMQjul3x1a7ClnK4Y/GaT6jH0
         l4uZky0qzSbe7MWDGq0Gv944Uhw5XR10fy7s+9ghVSh/ldE5SheFU1tHW1zzBpcS6K
         SD49u66UC9M124mMhR4lcrgdknZx5X+I4uS5KNMY=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to print FourCC codes
Date:   Wed, 25 Oct 2023 02:07:17 -0400
Message-ID: <20231025060717.71895-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025060717.71895-1-umang.jain@ideasonboard.com>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
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

Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
modifier to print FourCC codes in the logs.

vchiq_use_internal() and vchiq_release_internal() uses entity
character-array to store a transient string that contains
a FourCC code. Increase the length of entity array(to 64 bytes)
since %p4cc requires more bytes to hold the output characters.

Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
 .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  6 ---
 .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
 4 files changed, 33 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index fc6d33ec5e95..de6a24304a4d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 	int ret = 0;
-	char entity[16];
+	char entity[64];
 	int *entity_uc;
 	int local_uc;
 
@@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		sprintf(entity, "VCHIQ:   ");
 		entity_uc = &arm_state->peer_use_count;
 	} else if (service) {
-		sprintf(entity, "%c%c%c%c:%03d",
-			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+		sprintf(entity, "%p4cc:%03d",
+			&service->base.fourcc,
 			service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
@@ -1497,7 +1497,7 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 	int ret = 0;
-	char entity[16];
+	char entity[64];
 	int *entity_uc;
 
 	if (!arm_state) {
@@ -1506,8 +1506,8 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	}
 
 	if (service) {
-		sprintf(entity, "%c%c%c%c:%03d",
-			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+		sprintf(entity, "%p4cc:%03d",
+			&service->base.fourcc,
 			service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
@@ -1713,8 +1713,8 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 
 	for (i = 0; i < found; i++) {
 		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
-				  "%c%c%c%c:%d service count %d %s",
-				  VCHIQ_FOURCC_AS_4CHARS(service_data[i].fourcc),
+				  "%p4cc:%d service count %d %s",
+				  &service_data[i].fourcc,
 				  service_data[i].clientid, service_data[i].use_count,
 				  service_data[i].use_count ? nz : "");
 	}
@@ -1743,8 +1743,8 @@ vchiq_check_service(struct vchiq_service *service)
 
 	if (ret) {
 		vchiq_log_error(service->state->dev, VCHIQ_SUSPEND,
-				"%s ERROR - %c%c%c%c:%d service count %d, state count %d", __func__,
-				VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc), service->client_id,
+				"%s ERROR - %p4cc:%d service count %d, state count %d", __func__,
+				&service->base.fourcc, service->client_id,
 				service->service_use_count, arm_state->videocore_use_count);
 		vchiq_dump_service_use_state(service->state);
 	}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 45ba8f509a84..39b857da2d42 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1112,9 +1112,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
 		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-				"Sent Msg %s(%u) to %c%c%c%c s:%u d:%d len:%zu",
+				"Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu",
 				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-				VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
+				&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
 				VCHIQ_MSG_DSTPORT(msgid), size);
 	}
 
@@ -1206,9 +1206,9 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
 	vchiq_log_trace(state->dev, VCHIQ_SYNC,
-			"Sent Sync Msg %s(%u) to %c%c%c%c s:%u d:%d len:%d",
+			"Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d",
 			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-			VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
+			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
 			VCHIQ_MSG_DSTPORT(msgid), size);
 
 	remote_event_signal(&state->remote->sync_trigger);
@@ -1449,9 +1449,9 @@ abort_outstanding_bulks(struct vchiq_service *service,
 			vchiq_complete_bulk(service->instance, bulk);
 
 			vchiq_log_debug(service->state->dev, VCHIQ_CORE_MSG,
-					"%s %c%c%c%c d:%d ABORTED - tx len:%d, rx len:%d",
+					"%s %p4cc d:%d ABORTED - tx len:%d, rx len:%d",
 					is_tx ? "Send Bulk to" : "Recv Bulk from",
-					VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+					&service->base.fourcc,
 					service->remoteport, bulk->size, bulk->remote_size);
 		} else {
 			/* fabricate a matching dummy bulk */
@@ -1485,8 +1485,8 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 	payload = (struct vchiq_open_payload *)header->data;
 	fourcc = payload->fourcc;
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs OPEN@%pK (%d->'%c%c%c%c')",
-			state->id, header, localport, VCHIQ_FOURCC_AS_4CHARS(fourcc));
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs OPEN@%pK (%d->'%p4cc')",
+			state->id, header, localport, &fourcc);
 
 	service = get_listening_service(state, fourcc);
 	if (!service)
@@ -1498,8 +1498,8 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 	if ((service->version < version_min) || (version < service->version_min)) {
 		/* Version mismatch */
-		dev_err(state->dev, "%d: service %d (%c%c%c%c) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",
-			state->id, service->localport, VCHIQ_FOURCC_AS_4CHARS(fourcc),
+		dev_err(state->dev, "%d: service %d (%p4cc) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",
+			state->id, service->localport, &fourcc,
 			service->version, service->version_min, version, version_min);
 		vchiq_service_put(service);
 		service = NULL;
@@ -1632,8 +1632,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
 	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-			"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
-			msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+			"Rcvd Msg %s(%u) from %p4cc s:%d d:%d len:%d",
+			msg_type_str(type), type, &svc_fourcc,
 			remoteport, localport, size);
 	if (size > 0)
 		vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
@@ -1683,8 +1683,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		if (vchiq_close_service_internal(service, CLOSE_RECVD) == -EAGAIN)
 			goto bail_not_ready;
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "Close Service %c%c%c%c s:%u d:%d",
-				VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "Close Service %p4cc s:%u d:%d",
+				&service->base.fourcc,
 				service->localport, service->remoteport);
 		break;
 	case VCHIQ_MSG_DATA:
@@ -2044,8 +2044,8 @@ sync_func(void *v)
 				     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
 		vchiq_log_trace(state->dev, VCHIQ_SYNC,
-				"Rcvd Msg %s from %c%c%c%c s:%d d:%d len:%d",
-				msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
+				msg_type_str(type), &svc_fourcc,
 				remoteport, localport, size);
 		if (size > 0)
 			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
@@ -2462,9 +2462,9 @@ vchiq_add_service_internal(struct vchiq_state *state,
 	/* Bring this service online */
 	set_service_state(service, srvstate);
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG, "%s Service %c%c%c%c SrcPort:%d",
+	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG, "%s Service %p4cc SrcPort:%d",
 			(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
-			VCHIQ_FOURCC_AS_4CHARS(params->fourcc), service->localport);
+			&params->fourcc, service->localport);
 
 	/* Don't unlock the service - leave it with a ref_count of 1. */
 
@@ -3543,8 +3543,8 @@ int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 		}
 
 		len += scnprintf(buf + len, sizeof(buf) - len,
-				 " '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)",
-				 VCHIQ_FOURCC_AS_4CHARS(fourcc), remoteport,
+				 " '%p4cc' remote %s (msg use %d/%d, slot use %d/%d)",
+				 &fourcc, remoteport,
 				 quota->message_use_count, quota->message_quota,
 				 quota->slot_use_count, quota->slot_quota);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 10451d6765bd..161358db457c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,12 +74,6 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
 					    VCHIQ_SLOT_SIZE)
 
-#define VCHIQ_FOURCC_AS_4CHARS(fourcc)	\
-	((fourcc) >> 24) & 0xff, \
-	((fourcc) >> 16) & 0xff, \
-	((fourcc) >>  8) & 0xff, \
-	(fourcc) & 0xff
-
 #define BITSET_SIZE(b)        ((b + 31) >> 5)
 #define BITSET_WORD(b)        (b >> 5)
 #define BITSET_BIT(b)         (1 << (b & 31))
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index b6b5804689fa..0bc93f48c14c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -701,13 +701,12 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				vchiq_release_service_internal(service);
 			if (ret) {
 				vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
-						"%s: cmd %s returned error %ld for service %c%c%c%c:%03d",
+						"%s: cmd %s returned error %ld for service %p4cc:%03d",
 						__func__, (cmd == VCHIQ_IOC_USE_SERVICE) ?
 						"VCHIQ_IOC_USE_SERVICE" :
 						"VCHIQ_IOC_RELEASE_SERVICE",
-					ret,
-					VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
-					service->client_id);
+						ret, &service->base.fourcc,
+						service->client_id);
 			}
 		} else {
 			ret = -EINVAL;
-- 
2.41.0


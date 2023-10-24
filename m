Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C5C7D4F1C
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjJXLon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232461AbjJXLol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:44:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2615128
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:39 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 076EFB53;
        Tue, 24 Oct 2023 13:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147867;
        bh=EEmI146MNO9Guz2M5JYX2IrVkVYp8pkDrymbdqfznxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IZZVw/CPurN+QgdNImXsn7WDSe9/xfY/xaLd/FUm7MUJzQ8b3nocKztKWeNcBW/fe
         wGSHngqwFz9zhSsoSi1Mg07UC4E8zZf2gGoI0b/Cmyo+kEJMNtoDBtZDkACbo8Qg70
         FQnSpyBrelpNhdcylOFKaUlB9CvY8DbxBDkOooOc=
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
Subject: [PATCH v2 1/8] staging: vc04_services: Pass struct device to vchiq_log_dump_mem()
Date:   Tue, 24 Oct 2023 07:44:21 -0400
Message-ID: <20231024114428.443528-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
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

Pass struct device pointer to vchiq_log_dump_mem(). In subsequent
commits, vchiq_log_* macros will be ported to use dynamic debug
(dev_dbg()), hence they need access to a struct device pointer.

No functional changes intended in this commit.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c    | 11 ++++++-----
 .../vc04_services/interface/vchiq_arm/vchiq_core.h    |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 596894338cb4..a12afac95dcd 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1052,7 +1052,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 
 		if (SRVTRACE_ENABLED(service,
 				     VCHIQ_LOG_INFO))
-			vchiq_log_dump_mem("Sent", 0,
+			vchiq_log_dump_mem(state->dev, "Sent", 0,
 					   header->data,
 					   min_t(size_t, 16, callback_result));
 
@@ -1201,7 +1201,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	if (service) {
 		if (SRVTRACE_ENABLED(service,
 				     VCHIQ_LOG_INFO))
-			vchiq_log_dump_mem("Sent", 0,
+			vchiq_log_dump_mem(state->dev, "Sent", 0,
 					   header->data,
 					   min_t(size_t, 16, callback_result));
 
@@ -1653,7 +1653,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			       msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
 			       remoteport, localport, size);
 		if (size > 0)
-			vchiq_log_dump_mem("Rcvd", 0, header->data, min(16, size));
+			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 	}
 
 	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
@@ -2065,7 +2065,7 @@ sync_func(void *v)
 					msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
 					remoteport, localport, size);
 			if (size > 0)
-				vchiq_log_dump_mem("Rcvd", 0, header->data, min(16, size));
+				vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 		}
 
 		switch (type) {
@@ -3665,7 +3665,8 @@ int vchiq_send_remote_use_active(struct vchiq_state *state)
 			     NULL, NULL, 0, 0);
 }
 
-void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes)
+void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
+			const void *void_mem, size_t num_bytes)
 {
 	const u8 *mem = void_mem;
 	size_t offset;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index ec1a3caefaea..8b234cad24ea 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -600,7 +600,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 
 void vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
-void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
+void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
+			const void *void_mem, size_t num_bytes);
 
 int vchiq_remove_service(struct vchiq_instance *instance, unsigned int service);
 
-- 
2.41.0


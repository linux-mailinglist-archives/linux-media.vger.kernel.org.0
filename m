Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284701C3599
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgEDJ0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgEDJ0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:40 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4E891209;
        Mon,  4 May 2020 11:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584395;
        bh=E9H01W765i5eEsfdtVh7yWH+dX2/Uxq53FSkgDcRFoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e5iyAC44YKufoFCdEUa1rb5vpv6zumV7c7bjJW5C0GnjmEBM1ObDtbXC7HYveMMzw
         rsxBF/ogDmgOmj8JP3t5c6sIU92hwooBi4dh+wi2WzMd+5LFeOOsbkRlcaH+s8PG+q
         LCVlyiiJSpTwqFuxCR5L7qmR4gU8TSOUzjpX858Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 16/34] staging: mmal-vchiq: Fix client_component for 64 bit kernel
Date:   Mon,  4 May 2020 12:25:53 +0300
Message-Id: <20200504092611.9798-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The MMAL client_component field is used with the event
mechanism to allow the client to identify the component for
which the event is generated.
The field is only 32bits in size, therefore we can't use a
pointer to the component in a 64 bit kernel.

Component handles are already held in an array per VCHI
instance, so use the array index as the client_component handle
to avoid having to create a new IDR for this purpose.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.c    | 12 +++++++++---
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.h    |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index c65c262cffbb..5872690b404d 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -467,9 +467,9 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
-	/* FIXME: Not going to work on 64 bit */
+	int comp_idx = msg->u.event_to_host.client_component;
 	struct vchiq_mmal_component *component =
-		(struct vchiq_mmal_component *)msg->u.event_to_host.client_component;
+					&instance->component[comp_idx];
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;
@@ -1068,7 +1068,7 @@ static int create_component(struct vchiq_mmal_instance *instance,
 
 	/* build component create message */
 	m.h.type = MMAL_MSG_TYPE_COMPONENT_CREATE;
-	m.u.component_create.client_component = (u32)(unsigned long)component;
+	m.u.component_create.client_component = component->client_component;
 	strncpy(m.u.component_create.name, name,
 		sizeof(m.u.component_create.name));
 
@@ -1863,6 +1863,12 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		goto unlock;
 	}
 
+	/* We need a handle to reference back to our component structure.
+	 * Use the array index in instance->component rather than rolling
+	 * another IDR.
+	 */
+	component->client_component = idx;
+
 	ret = create_component(instance, component, name);
 	if (ret < 0) {
 		pr_err("%s: failed to create component %d (Not enough GPU mem?)\n",
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index ae6c69ba16ee..247521fbcc1d 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -97,6 +97,7 @@ struct vchiq_mmal_component {
 	struct vchiq_mmal_port input[MAX_PORT_COUNT]; /* input ports */
 	struct vchiq_mmal_port output[MAX_PORT_COUNT]; /* output ports */
 	struct vchiq_mmal_port clock[MAX_PORT_COUNT]; /* clock ports */
+	u32 client_component;	/* Used to ref back to client struct */
 };
 
 int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance);
-- 
Regards,

Laurent Pinchart


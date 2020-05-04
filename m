Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5034F1C35A0
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgEDJ0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbgEDJ0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E02D4304;
        Mon,  4 May 2020 11:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584403;
        bh=/RaRFa8mDihTo1e3nxmOzsrX/C1zqtEXblGZKnlGzS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NwY7Hf+qDg6lVICUFmLSTU085x6kIuz+ZSGDC3e4DtcbtbEpkfS2LRuP4X6gI2+cR
         I3V5PCkep6ucc5Y6zaBdTrENOQKAIpeXpWGRI0lMwcwdE3X1LQ6BFCSU7YuNegVeLq
         xbhE6T5WpT3vlddTlZIBujogqh+sTuVzOkpQC+0A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 23/34] staging: mmal-vchiq: Fix memory leak in error path
Date:   Mon,  4 May 2020 12:26:00 +0300
Message-Id: <20200504092611.9798-24-laurent.pinchart@ideasonboard.com>
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

On error, vchiq_mmal_component_init could leave the
event context allocated for ports.
Clean them up in the error path.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 95437d9c519c..4c89bc0bec15 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1842,9 +1842,26 @@ static void free_event_context(struct vchiq_mmal_port *port)
 {
 	struct mmal_msg_context *ctx = port->event_context;
 
+	if (!ctx)
+		return;
+
 	kfree(ctx->u.bulk.buffer->buffer);
 	kfree(ctx->u.bulk.buffer);
 	release_msg_context(ctx);
+	port->event_context = NULL;
+}
+
+static void release_all_event_contexts(struct vchiq_mmal_component *component)
+{
+	int idx;
+
+	for (idx = 0; idx < component->inputs; idx++)
+		free_event_context(&component->input[idx]);
+	for (idx = 0; idx < component->outputs; idx++)
+		free_event_context(&component->output[idx]);
+	for (idx = 0; idx < component->clocks; idx++)
+		free_event_context(&component->clock[idx]);
+	free_event_context(&component->control);
 }
 
 /* Initialise a mmal component and its ports
@@ -1942,6 +1959,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 
 release_component:
 	destroy_component(instance, component);
+	release_all_event_contexts(component);
 unlock:
 	if (component)
 		component->in_use = 0;
@@ -1957,7 +1975,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_component *component)
 {
-	int ret, idx;
+	int ret;
 
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
@@ -1969,14 +1987,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	component->in_use = 0;
 
-	for (idx = 0; idx < component->inputs; idx++)
-		free_event_context(&component->input[idx]);
-	for (idx = 0; idx < component->outputs; idx++)
-		free_event_context(&component->output[idx]);
-	for (idx = 0; idx < component->clocks; idx++)
-		free_event_context(&component->clock[idx]);
-
-	free_event_context(&component->control);
+	release_all_event_contexts(component);
 
 	mutex_unlock(&instance->vchiq_mutex);
 
-- 
Regards,

Laurent Pinchart


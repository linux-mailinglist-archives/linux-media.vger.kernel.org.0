Return-Path: <linux-media+bounces-6299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC986F5D2
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 299F2B25395
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206FF67C45;
	Sun,  3 Mar 2024 15:27:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAD267C62
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479634; cv=none; b=IulP1wsGaV+ASPfhf6yKLu8SrXmF8X31dYidqhlHhV3O7hiTuLSWKiUsEyQ7TKyJGKSk7cjZvnvWktT9xSA6o3vPZK01hiIxQ4ZK/poCrZjwXym+2bE2J04zm5XIfAo6jaXnfTMS5hcKZWlUUrhi9Dz33bN1SqxN7RGcfZuOoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479634; c=relaxed/simple;
	bh=Kem6Nj/jCDvAFRA+n151dQAdeZxHOavQgsqr1IUCZz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTKD9tF8SU21MKngwGArIsiyBmiUf6MB2YxwYeTBEoiaYtXX4tyLqqGCXy1X8asMZYShKBti/bW849/BbG8wYUzhOocB2MeBD/CooW3rxjMmVmpr1D88n3HVsBHFDsZlE/Wf0Z2v4WjH3aPtuBO5CLiJYbs1Apu7LllnGBfBVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 8D2F14C080;
	Sun,  3 Mar 2024 16:27:11 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 03/13] staging: mmal-vchiq: Fix memory leak in error path
Date: Sun,  3 Mar 2024 16:09:58 +0100
Message-ID: <20240303152635.2762696-4-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

On error, vchiq_mmal_component_init could leave the
event context allocated for ports.
Clean them up in the error path.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>

staging: mmal-vchiq: Free the event context for control ports

vchiq_mmal_component_init calls init_event_context for the
control port, but vchiq_mmal_component_finalise didn't free
it, causing a memory leak..

Add the free call.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 2e616604943d..1209b7db8f30 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1825,9 +1825,26 @@ static void free_event_context(struct vchiq_mmal_port *port)
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
@@ -1925,6 +1942,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 
 release_component:
 	destroy_component(instance, component);
+	release_all_event_contexts(component);
 unlock:
 	if (component)
 		component->in_use = false;
@@ -1940,7 +1958,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_component *component)
 {
-	int ret, idx;
+	int ret;
 
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
@@ -1952,12 +1970,9 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	component->in_use = false;
 
-	for (idx = 0; idx < component->inputs; idx++)
-		free_event_context(&component->input[idx]);
-	for (idx = 0; idx < component->outputs; idx++)
-		free_event_context(&component->output[idx]);
-	for (idx = 0; idx < component->clocks; idx++)
-		free_event_context(&component->clock[idx]);
+	release_all_event_contexts(component);
+
+	free_event_context(&component->control);
 
 	mutex_unlock(&instance->vchiq_mutex);
 
-- 
2.41.0



Return-Path: <linux-media+bounces-38399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C1B10CF2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB7C53BC21C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7892E9742;
	Thu, 24 Jul 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KldGWVzh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933022E8E08;
	Thu, 24 Jul 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366257; cv=none; b=iBjVFk7J84Etuf8SWbw027CGFuNlOUBpKTvqsUGihJhmUH/AWt2w3+ovCBbS3+827qIZv8x76gmaX9xLn66XB0PI3qQs8X/HCQbVprO1mFQho/7be59FehqjPd/9RWgtdrIcE14MgWIORQLRun11jHCnQRITEmiAKQtjPAeLlJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366257; c=relaxed/simple;
	bh=RMEJm/E/usNBixZcp+GBwmSg7HkpwQhhGNile6Mrpfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Re8j0F4Ww3udwl+Ho65navQ2cpLolB/0FefaSKbmYuXVtsmXMksfuwEe5kKVbs25Tdtl8ie+lJ6N6L5DxgzUAWv8ye07RO8OmVCJQ8l4+yA6Piw+aSsSJhtuMNZUkcJ7X3evlTu++ajU+D9heKOdnZWGyjCxzpCaEdt/+YeI8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KldGWVzh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D0D9190D;
	Thu, 24 Jul 2025 16:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366206;
	bh=RMEJm/E/usNBixZcp+GBwmSg7HkpwQhhGNile6Mrpfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KldGWVzhzELrAs96NQ9xfnzg0umN6bK5CgorjcgIdyNgJhUW7vG/LvV1YCSH8duET
	 LaSJGklP/fPcnZYJRaAGKJchQGM8T9xCbFXV9UVMUWrK/qAx5QUxzVQD7Fx5nB4zlk
	 C9TCugCnoeIO8mzUypMusl+C/3a24dd+XMNFyI64=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:22 +0200
Subject: [PATCH v2 15/27] media: v4l2_subdev: Introduce default context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-15-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=RMEJm/E/usNBixZcp+GBwmSg7HkpwQhhGNile6Mrpfg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7P1/MKU1Ktuh3wvx1qB/QU79/dRKxCfwG1p
 2Oo0BAz+F6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PCc7D/460AOKgiuGxo8oHW7UIhLM+ZqXE8WCJjPH6HxSRZm0imC+qVc+LJG8YwdZ7InirAUxNJW
 C9Gzu7a9wEZOtDl2dgVtgsMTKBq4NCk83bEnIz1hdbIpiq8xsGMCpJFJW34QOzJHXmvi2bcFcZd
 kIYJVjQ9nXdDLdPO0Hj1jqpI4noQ7q4cLaIRe+SxRdQ6lkK0fqmjrquYuoTBd4BqWfwBXO8gme9
 0EJXGZxMRTBtEOH+pfNYQV3n363wrs+smCkWubOKvSGmVffaSAntOqqT41zr9EiwJ9hBm3rZj1G
 k6vcGDe70r0hId4CKCXPBLOfT67qnphMJlOCQsFgZQyXo3wU5VYjFGG+P5F0XxA+1EMmMBwdX7d
 qlAXIx4YoeZKm+qKNZx1obWbWGSSQdu1CKZLnO96x00IiJ5CNr7fVi1Xr6MNvBLfl5MR3HRemmf
 2Xy30ENpV+uSdzsbUtFjOMXYwi/f56RnqR+L0xBKcQT9QnvM13hy3FBzvn8v8cN9f970tCueSFg
 JKnnhPGSP3CBSwDIJtl2hrPTp7VUJNONCVq4g7jh2b7TA/3WnRp5cEWwjxeZrT2yVwirDFlUUyt
 bTbxvDcc7wCzG8v+yZwZYQOV4XnA2Lt4vig1vJz6trijNEIxW3CGTO2IR0v4Wgk4D/Kz02GVHO2
 /niTwqVtIfEzVVA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce a default context for v4l2 subdvice.

Drivers ported to use multi-context support that used to work with a
non-context aware userspace (which doesn't call VIDIOC_SUBDEV_BIND_CONTEXT)
shall continue to work even if they are context aware.

Provide a default context in the v4l2 subdev and bind it to the media
device default context when the subdevice is fully registered by
providing a v4l2_subdev_registered() function.

Release the context when the subdevice gets unregistered by the core,
providing a v4l2_subdev_unregistered() helper.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 11 +++-----
 drivers/media/v4l2-core/v4l2-subdev.c | 50 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 29 ++++++++++++++++++++
 3 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 5e537454f5cd71b3c50a2a2864642f7d5548047b..bf3ebd77b7bb8b13c849a89d01e6d889e8a2e4fd 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -146,11 +146,9 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	}
 #endif
 
-	if (sd->internal_ops && sd->internal_ops->registered) {
-		err = sd->internal_ops->registered(sd);
-		if (err)
-			goto error_unregister;
-	}
+	err = v4l2_subdev_registered(sd);
+	if (err)
+		goto error_unregister;
 
 	sd->owner = module;
 
@@ -274,8 +272,7 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 	list_del(&sd->list);
 	spin_unlock(&v4l2_dev->lock);
 
-	if (sd->internal_ops && sd->internal_ops->unregistered)
-		sd->internal_ops->unregistered(sd);
+	v4l2_subdev_unregistered(sd);
 	sd->v4l2_dev = NULL;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 300f84317623dd082a4cd2caec97057f972e82a3..438f51980e5ac0f092ba6b0a979a376133968ddf 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1275,6 +1275,56 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 	.poll = subdev_poll,
 };
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+static int v4l2_subdev_register_default_context(struct v4l2_subdev *sd)
+{
+	struct media_device_context *mdev_context;
+
+	/* If the driver does not support contexts, return here. */
+	if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
+	    !sd->entity.ops->destroy_context)
+		return 0;
+
+	mdev_context = sd->entity.graph_obj.mdev->default_context;
+	return subdev_do_bind_context(sd, &sd->default_context, mdev_context);
+}
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+int v4l2_subdev_registered(struct v4l2_subdev *sd)
+{
+	int ret;
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	ret = v4l2_subdev_register_default_context(sd);
+	if (ret)
+		return ret;
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+	if (sd->internal_ops && sd->internal_ops->registered) {
+		ret = sd->internal_ops->registered(sd);
+		if (ret)
+			goto err_registered;
+	}
+
+	return 0;
+
+err_registered:
+	if (sd->default_context)
+		v4l2_subdev_context_put(sd->default_context);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_registered);
+
+void v4l2_subdev_unregistered(struct v4l2_subdev *sd)
+{
+	if (sd->default_context)
+		v4l2_subdev_context_put(sd->default_context);
+
+	if (sd->internal_ops && sd->internal_ops->unregistered)
+		sd->internal_ops->unregistered(sd);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_unregistered);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9d257b859acafb11cfe6976e906e7baabd0206f6..1fa42a9f322be0be44fc9308744f4f4ae0cf1606 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1130,6 +1130,10 @@ struct v4l2_subdev_platform_data {
  * @active_state: Active state for the subdev (NULL for subdevs tracking the
  *		  state internally). Initialized by calling
  *		  v4l2_subdev_init_finalize().
+ * @default_context: Default context for the subdev, allows to operate
+ *		     context-aware drivers with a context-unaware userspace.
+ *		     It is initialized when the subdev is registered in
+ *		     v4l2_subdev_registered().
  * @enabled_pads: Bitmask of enabled pads used by v4l2_subdev_enable_streams()
  *		  and v4l2_subdev_disable_streams() helper functions for
  *		  fallback cases.
@@ -1182,6 +1186,7 @@ struct v4l2_subdev {
 	 * doesn't support it.
 	 */
 	struct v4l2_subdev_state *active_state;
+	struct v4l2_subdev_context *default_context;
 	u64 enabled_pads;
 	bool s_stream_enabled;
 };
@@ -1286,6 +1291,30 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
 	return sd->host_priv;
 }
 
+/**
+ * v4l2_subdev_registered - Subdevice registered notification
+ *
+ * @sd: The subdevice that has been registered
+ *
+ * Notify that a subdevice has been registered by the core. This function wraps
+ * a call to sd->internal_ops->registered (if available) and instantiates the
+ * default v4l2 subdevice context.
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+int v4l2_subdev_registered(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_unregistered - Subdevice unregistered notification
+ *
+ * @sd: The subdevice that has been unregistered
+ *
+ * Notify that a subdevice has been unregistered by the core. This function
+ * wraps a call to sd->internal_ops->unregistered (if available) and deletes
+ * the default v4l2 subdevice context.
+ */
+void v4l2_subdev_unregistered(struct v4l2_subdev *sd);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 /**

-- 
2.49.0



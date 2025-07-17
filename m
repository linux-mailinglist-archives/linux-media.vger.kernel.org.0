Return-Path: <linux-media+bounces-37978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF6B08B18
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0494E16F17C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F22BE63D;
	Thu, 17 Jul 2025 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="je+6kEei"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBD2BDC14;
	Thu, 17 Jul 2025 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749166; cv=none; b=GLWsl+4lnRoYb+t0YG3aTNFwwKMUEh/FH4hXRPVirVieSMAGrQ+6XaZXN6Ps9nygOX0WkvTq12DLh8ZQtiznKjjIVgqZLx/FewLbV4sXMLO3tl8JkZ6oKblFkLc21LIp7vWLwRF6b2flQ53KYxBITj074fPAgyu+6bPbxAMrhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749166; c=relaxed/simple;
	bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehCWH8JyvqrNcfEY+0RNZJ9Ctd46XNJQ0lilteYt3BSaWJ7Xqw/n7yx7x1ZE9VHLtXuOL3Jlkgi2RSq+p6OK1OxfN5PBCPZF8p7cYZnCioYJ0wYdiQdbHfGjUT/Cpopax/4yCRaDMtT/zZIGqr3BoTqW782Dh5o1uBIi1W6/fH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=je+6kEei; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F1C8198D;
	Thu, 17 Jul 2025 12:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749126;
	bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=je+6kEeinJv8XEGNRkmbD17Kk5mbjzKPp0lVm1E+10+pjnpBe8/YW0a0djHMgCN7a
	 F7uXduJsjt2pwC42fT7utji23CB+VzcwWnHi02yAfzlzmIaka8rrqz81Urj2pOORIE
	 1tryJq4y01oXnCivQQr68c4NJCsZ8CQ7E9K4RmoQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:39 +0200
Subject: [PATCH 13/26] media: v4l2-subdev: Introduce
 VIDIOC_SUBDEV_BIND_CONTEXT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-13-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V4Bd2SEp0ALBPlJWG8EsVuj29YkOY/732hyVjUTvCTo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQ3HpHt0cfK1Rw4QO76tsSk1mTlN3701wEW
 iXhvqtbpiuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PFj2D/4lp8scJ2lbnr5pqbCOmJlJsoRtCUiKZjKW3aMvNUle89R342VeULHVHgfVXxzRGAWWxOK
 FsKCQz7RHzHAhKam0BiMPQWzEOSD6ZwwEPl8O5yAEANgxDJ2JVX/ino8+Jpol/frwRhPqshCx45
 X3isORwRd/+DwK9qf9MwlUa3A0k8YDP2wgMibMf6imvD2Xnr7KNQxlAh+mbWeg0JO2GvNpU4Enm
 V6DfKRgXyuCUL/JXuzDXQ6RpsW6E3PhhK1D4NFdFUYVVNxV7oR7dG2CWpHGbA4bvQrzHNKZR/yw
 rD4oLiwkQ0ueLlE4NOc3QjCQvzh/FUW1ts70dGDnH8bzX8tFqMaEjtltcEVhJdUiAL4UtXn+BjX
 /Xk0PUgM/IgYs4bhOCIpkMj2WgvQncpmfG0f+05r6bIhKm3Czunzl2cYHiCM8BWw9AMVnsi7gU1
 OkvJJa3y2Y9Xj7YpOahY5WZJdY7j6tSGGtA1q1YgxPGIk1/lkRzfvKSrjJXh6JUfe0XAVYuLzht
 vjz/uePhW1ID+SCx9VujYlD25AtS8H2B5ema9vG/4d493Mlfa2eEKRoBlYreQZ2yIaLhkBCim0H
 DL5x/PuzNmvKAWtulT0v3dX15MxOf4WL53AjSdbxLwTY0BhL7qzUAuJfTmwU8pOVzfZXoA8Oicf
 HQaJu+s7wBbsGWw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce a new ioctl in V4L2 subdev to allocate a subdevice context
and associate it with a media device context.

The ioctl handler calls the entity ops to let the driver allocate a
new context and initialize the subdev state there contained.

The new subdevice context is bound to the media device context
associated with the file descriptor provided by userspace as the new
ioctl argument.

The newly allocated context is stored in the v4l2_subdev_fh handle
that represent the open file handle on which the ioctl has been called.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/v4l2-subdev.h      | 11 +++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7307f57439499c8d5360c89f492944828ac23973..300f84317623dd082a4cd2caec97057f972e82a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -607,6 +607,46 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
+static int subdev_do_bind_context(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_context **context,
+				  struct media_device_context *mdev_context)
+{
+	static struct lock_class_key key;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	ret = sd->entity.ops->alloc_context(&sd->entity,
+					    (struct media_entity_context **)
+					    context);
+	if (ret)
+		return ret;
+
+	state = __v4l2_subdev_state_alloc(sd, "context->state->lock", &key);
+	if (IS_ERR(state)) {
+		ret = PTR_ERR(state);
+		goto err_put_context;
+	}
+	(*context)->state = state;
+
+	/*
+	 * Bind the newly created video device context to the media device
+	 * context identified by the file descriptor.
+	 */
+	ret = media_device_bind_context(mdev_context,
+					(struct media_entity_context *)
+					*context);
+	if (ret)
+		goto err_free_state;
+
+	return 0;
+
+err_free_state:
+	__v4l2_subdev_state_free((*context)->state);
+err_put_context:
+	v4l2_subdev_context_put(*context);
+	return ret;
+}
+
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			    struct v4l2_subdev_state *state)
 {
@@ -1089,6 +1129,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		return 0;
 	}
 
+	case VIDIOC_SUBDEV_BIND_CONTEXT: {
+		struct v4l2_subdev_bind_context *c = arg;
+		struct media_device_context *mdev_context;
+		int ret;
+
+		if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
+		    !sd->entity.ops->destroy_context)
+			return -ENOTTY;
+
+		mdev_context = media_device_context_get_from_fd(c->context_fd);
+		if (!mdev_context)
+			return -EINVAL;
+
+		ret = subdev_do_bind_context(sd, &subdev_fh->context,
+					     mdev_context);
+		media_device_context_put(mdev_context);
+		return ret;
+	}
+
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2347e266cf7516b4073c1edd43b97a3ddddb183b..6184cc0153a9dd9fbfa6729e1b6127ba4a961395 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -243,6 +243,16 @@ struct v4l2_subdev_routing {
 	__u32 reserved[11];
 };
 
+/**
+ * struct v4l2_subdev_bind_context - Subdev context information
+ *
+ * @context_fd: The file descriptor of the media_device instance the subdevice
+ *		has to be bound to
+ */
+struct v4l2_subdev_bind_context {
+	__u32 context_fd;
+};
+
 /*
  * The client is aware of streams. Setting this flag enables the use of 'stream'
  * fields (referring to the stream number) with various ioctls. If this is not
@@ -285,6 +295,7 @@ struct v4l2_subdev_client_capability {
 #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
 #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
 #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
+#define VIDIOC_SUBDEV_BIND_CONTEXT		_IOWR('V', 50, struct v4l2_subdev_bind_context)
 #define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
 #define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
 

-- 
2.49.0



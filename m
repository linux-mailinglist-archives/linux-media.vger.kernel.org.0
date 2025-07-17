Return-Path: <linux-media+bounces-37982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70135B08B66
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE0517BB00E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD32C3768;
	Thu, 17 Jul 2025 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OOff5Etz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC32C08D6;
	Thu, 17 Jul 2025 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749172; cv=none; b=IaOMFS14XmFtDndeFJ58m9aIO/w99OBvxn1eTLLzk1OCcmnjqXfasOYllBC6SJXKWWzA6TszjrEm7ZsQafZLjGyM995/1LEiWYHSWPiUFIIDUcktDr9pWKcUy6piPOxF+19SEfT5XY2yFhFkwnOKKmKEmWGCSXUDpUY6CN5aNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749172; c=relaxed/simple;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+EFg7YJpOzuD3KuVIhdL5JGzJknGjo7p4cpj3nSNhFImh9ShW8/2wJeniZPd8nOETWiDzzZpGraj04YL63QU/l2p1lEqHbQsQMr9hxJuU/b54NCCUlRhC/KDOfNd5Eao6H2vVZVmoR3CVEJ6mcMhkwrYQXfdioBdy9CV5UmcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OOff5Etz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BB31E74;
	Thu, 17 Jul 2025 12:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749134;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OOff5Etzj1BASviY7XteSLrji0sQ2MGJumgJuzBT90EpkcnHlYXDMiQwybMFvWJm0
	 Nj6o8RgXitaS2Zv2e2IMoWrNfqaVlZnvYqkbIvznkwhVTKWzvywG3NdwBxnq1sA+yx
	 uRitJwr0g1r4mSwKWwHNvnv+W4MD2cHGZhTWRD+M=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:43 +0200
Subject: [PATCH 17/26] media: v4l2-subdev: Get state from context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-17-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQd90DYybLMFBMGXEIc5XbdYrJwrR2tprN2
 gyuKk9WcI+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PBoCD/9SwqPLTbNwWfPpNqq9bJosyxb8HDVvloOV15iO71vhg1hePnB46b86CzelfoY+NP9Uq0v
 ANEIbTXjPUQMVqQ4fpg6pNRTrkOf+hcLZXlKURymNy7O0CcYFtB//rdeIhyQFOGaDSElURD0V2t
 ar3ixtgA1UsMDN+cwcUNqDkXBWP3jyPPLoKG5V0i3G4Mnyg6JlzqJ3p9oY4yyvyYc/fVHuNAJTe
 Z61yhJTEeMLTT/plbkrn3RURNh8CrRpwrkR1CG5h0/LSVG/rKeHrWl0MmHy48Q3yRP+AvOuO4f9
 sttWFV9NZdS+gXU26MAoXO1LI5/UEZVb+q/waqbQWRgqPfNt8SaBfYmGRtEu69tUxYvNrVdTYtw
 z9lxN0EsVWMf5BqAV3HpScpYnhuIl2fYv3ApP/4ikWaOiKJdoAYu4gZF2rPFvrhxOK/qyw8jXT9
 snmr1jrT4W5xcgaUHZZa85Om18QKEnFEEbxL753ZJuolLI9KkHxhWeSTudyrKlnoy5QIGCZvYQx
 UPFyx8k2PI+ELqyzLc2jAXl9STxb1MsLRMEZxxMSct9YYL9qlJfa+4R1ft6dEJxd5leFZNwptIq
 AvExURcpv2bxcRFCAOu6CW+nFgWuKV/05XPH1PgksNHGO3hDSznSW7aRfvqYZEli/sAQeSrvkjI
 QH6qPtpuaiyZG0w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The V4L2 subdev ioctl handler retrieves the correct subdev
state inspecting the 'which' field of the ioctl argument.

So far the subdev state either come from the file handle in case of
V4L2_SUBDEV_FORMAT_TRY or from the active state stored in the subdev
directly in case of V4L2_SUBDEV_FORMAT_ACTIVE.

With the introduction of multi-contexts support, there will be a subdev
state associated to each bound context. If we have a valid context,
use the state from there in case of V4L2_SUBDEV_FORMAT_ACTIVE, and
default to the subdev active state in case the context is not valid.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7372f61127c871cec44a3d1900e2b8bef34632b9..66c539d880127844893620d325a2b05ac4aa9e96 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -703,9 +703,20 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 		break;
 	}
 
-	return which == V4L2_SUBDEV_FORMAT_TRY ?
-			     subdev_fh->state :
-			     v4l2_subdev_get_unlocked_active_state(sd);
+	/*
+	 * If which is FORMAT_TRY return the state stored in the file handle.
+	 * If a context has been allocated because the subdev has been bound
+	 * then return the state stored in the context. Otherwise default to the
+	 * subdevice active state.
+	 */
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return subdev_fh->state;
+
+	if (subdev_fh->context)
+		return v4l2_subdev_get_unlocked_active_state(subdev_fh->context);
+
+	return v4l2_subdev_get_unlocked_active_state(sd);
 }
 
 static int subdev_do_bind_context(struct v4l2_subdev *sd,

-- 
2.49.0



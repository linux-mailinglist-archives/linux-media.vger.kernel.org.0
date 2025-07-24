Return-Path: <linux-media+bounces-38400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24BB10D07
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8E0165787
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060802EA461;
	Thu, 24 Jul 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZW7lFNdA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67D2E9EBF;
	Thu, 24 Jul 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366260; cv=none; b=Nfmsbx/pbQSqes6vvJCLOsuO8OEezb0MWZp2k7Iw6RbFf83Ttg/a8aXHrj1qQRrsWqhhd22HCeXOld+oBE2mH/8xjq2c4TOFlMMDeahSb9GKelMX2FdjxA9bnYlBiPdII8AfGIQtPVq/VbILx9pUer6aaMyb857YsRk0TKobTZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366260; c=relaxed/simple;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqETz/ZkwIbCp+JZgXmk9XmJjvwhCGs/ppR4Bq8tfcFMmQm/UsPisNBgVXTy5ltwyI0CYiGoNAB4HmRefpnQA/BvCZAF2BRHh3Xk5lcQgyUsUjtwZbPQcq7H7ZDRQ0VRyvbWaKqvS46GpugGGoowE1M6ClfhSBey525nwuA2WH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZW7lFNdA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3280A1ACF;
	Thu, 24 Jul 2025 16:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366209;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZW7lFNdA65XXY3ybK3Q73IoMYzD/RWIj+d+DrncsIh+Dqeyw7iP+SuaKMH2EbE78N
	 9Z5KWcqk3Jm3yGkHfMiv8wGCc9pzzOhf+IvT4qWCrQdDvQcL8No6/mmTCC6ZHX/UlA
	 1+TEp4oAHeC4mGn52A4ocO9NCaZWkZbTrLNhXhgk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:24 +0200
Subject: [PATCH v2 17/27] media: v4l2-subdev: Get state from context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-17-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QE00gkL8XXmeox2W9uHAwgb+JjO4ss6i47
 BwPdlK4VyqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PG3YEAC+9w342JKOCDxd2dM51MvvRVUhx/BFvFwL4CgpDaC7ZVi/oNGBmTGPo0X8SKnmhry1qvy
 u5C6hhd4a/ZMEmm+m6YmEMVMegZPpuZ0RloG1SLMBbq3ad33vSRnxn4FgUJS+VeuuAzA1Uy8aSc
 T19MV2LhqB5ruFUQbVX5U27vR5Bv1YJhmJPRaa+RXjR8+fUuCZzVKhc4CVk8O1m5yUhebZcKua+
 e/67zxAvx93NTRKexaP3zIqKDE6N2h2lD4zwh2NGMu54zNcA6cL7oHmONzC/4qXqflG2u0eUrMT
 PR/jJbHUxudATsUcsmFOLQknJuaRz4od1CZQQzaoWRR95Zlso/gv+mv0TOlcT0VYrP/ANeUZGnH
 gs+isw5mjA6D/d8J6zW3xjpJddjZKlPNVL19+J6ujlkcLzSH9Nc46vVwlYchjZD0KANFdIXfHTu
 eR10UwhiRG03ouAYmL+Q52iDwVEhuqbpWc8FQE8/N1QhRRQTeUsXpn5RKUTQ2q587I3zoMN3Kiy
 Sa6O5+eANcaExxIqOmmmXHpgMGKEqEAMf5598moofsRxYfoNFofIcWlFtwpGl4tliS2BxhUsgPW
 J7h64tP9GYKN3vTVDq0mxmCNWft/+7Fn4a4+14zzGjC1r3XxcczqAn2K1xpSnJR98xYd/Xj1Zko
 mz5/wj+gouL6BVA==
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



Return-Path: <linux-media+bounces-33274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A53AC261C
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98577A44BC5
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E85D296FCB;
	Fri, 23 May 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QXEFZOpu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A8296D2C;
	Fri, 23 May 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013279; cv=none; b=d1ZnvqYgG9Ynddk2DfmvGdvcHtAhQbHw86N3DdpNZ/af9WGCj8ml7DPtQqpXDtbBGU7sYiQ2XipmxXQGbbC6PX/mmcSCKc24M2MLhHSAZsGZcSA2XhkWrK0jRQo0CXiX34/jYgCLWXC85QQzgfMOaets0aDllmfufjy22s9ubTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013279; c=relaxed/simple;
	bh=uPGmW5BZEjqSxL72Eg9qbe0NAJhFfcaFI1Vo//ykHrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9RldiQw+KGFnfj3005GU6FDJi34DOKWk3q7404Aa2el5L8tcDsZMPeNqz1HwUfohaCU+v6uPgXpTW2gU8BSIPteA3f/UjmLpaPkbLKgn4ExVdIzCqLwR6QQB9WClC5JMEhHMonTbrRKEk+mBtDKZAR3vnoXw442cxSsUqlJH6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QXEFZOpu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C03A4A4;
	Fri, 23 May 2025 17:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748013253;
	bh=uPGmW5BZEjqSxL72Eg9qbe0NAJhFfcaFI1Vo//ykHrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QXEFZOpumio/6D6zu95bgODt1cAwPpdqxCwzA2yhHd2QBXDsVcvUbiJ9QVkqq680q
	 DO/9ygJB0wUWmXY06ndtGnPbR5UqKbmzVR6vWgVI9TriA/HryDcaRHNuu6hrTZwklY
	 6mBZKVI9Q0kpKPDg5FQ28gaEucrgscQkDVCn/nWs=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Fri, 23 May 2025 17:14:30 +0200
Subject: [PATCH v3 1/3] media: rkisp1: Properly handle result of
 rkisp1_params_init_vb2_queue()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-supported-params-and-wdr-v3-1-7283b8536694@ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
In-Reply-To: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.13.0

Properly handle the return of rkisp1_params_init_vb2_queue(). It is very
unlikely that this ever fails without code changes but should be handled
anyways.

While at it rename the error label for easier extension in the upcoming
patch.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Changes in v3:
- Moved these changes into its own patch
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..24a8de697f2b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
-	rkisp1_params_init_vb2_queue(vdev->queue, params);
+	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_media;
 
 	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
 
@@ -2777,18 +2779,18 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto error;
+		goto err_media;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto error;
+		goto err_media;
 	}
 
 	return 0;
 
-error:
+err_media:
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
 	return ret;

-- 
2.43.0



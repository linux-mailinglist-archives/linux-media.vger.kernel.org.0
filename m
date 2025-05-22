Return-Path: <linux-media+bounces-33164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F971AC0FA9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E434E68E3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C897E290D97;
	Thu, 22 May 2025 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GpshNTa9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A975D23C384;
	Thu, 22 May 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926745; cv=none; b=R8Bz3j5a6qs5P0xeyYP+ky3T08Bch8WyyTjCQSxnnxgOZzhOHV5GmVassAg2rXGZv4kmI72oQOrmqbggeLDCM6I7+FGtgtXhf9UCQDemfM4vBdWy2S7/6KWhR0xDwzdYfU/SVjPPqiDVlYFRSPXEXf+Y0EwD9Lc3iYX0Mlzfx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926745; c=relaxed/simple;
	bh=pO5u+KDpqe/wtFtfltLT6eyTFZ/IqJJk8xm76d512/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hb3DPofgt6C8onwlQFhFpMJOR+THYM0N76ffFyvIdDQPAs8mzfAivggzd8CLxB8XiF83VfXZebnDkqnvkqJin046IOm2e29rlH+S9scbtB+j5dUc2+EJWXEAni/I+D3QCBBt8DlsXveUggekznf4beaoGXpw8FdTbNsOBC9hsak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GpshNTa9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93D028FA;
	Thu, 22 May 2025 17:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747926720;
	bh=pO5u+KDpqe/wtFtfltLT6eyTFZ/IqJJk8xm76d512/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpshNTa9JHOJDRZHdtsC84v5/P02ueCLeCQNUEXgf3AzyBEwFBJjx7BkybbR65VBY
	 4pinIoeT8j5g1t1nZ6S9AwRdsXXgvB22AKWLW/N2mRlqLJc6Dzcx6DLwe2sfwcWHe/
	 P4tiv1afJ09/DpY5KEXmVW7dJjqqK6p0d3MIJEQk=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: rkisp1: Cleanup error handling
Date: Thu, 22 May 2025 17:08:38 +0200
Message-ID: <20250522150944.400046-3-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not call media_entity_cleanup() when media_entity_pads_init() fails.
As a drive-by fix handle an (very unlikely) error in
rkisp1_params_init_vb2_queue().

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..918eb06c7465 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
-	rkisp1_params_init_vb2_queue(vdev->queue, params);
+	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_mutex;
 
 	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
 
@@ -2777,19 +2779,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto error;
+		goto err_mutex;
 
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
+err_mutex:
 	mutex_destroy(&node->vlock);
 	return ret;
 }
-- 
2.43.0



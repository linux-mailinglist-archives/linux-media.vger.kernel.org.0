Return-Path: <linux-media+bounces-18935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A84998BF31
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED73328479D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09501C9B7E;
	Tue,  1 Oct 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWjwcPrC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7A11C8FC9;
	Tue,  1 Oct 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791788; cv=none; b=mNVRS4DCJ4H3bPL0mm7NT1bthTHC8IF/m4zBoF/od/CUULkQjU3+GKSeDYVbh/UKuDaMsgzfymQum1dygqwWBtX6ieTEUoFJp1N9nR5Jr05GVDRE+t+LQ210Xs6p8YrqqmolibjcD2d6QFzJm79ECd+QioawjCjsdndKmffdG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791788; c=relaxed/simple;
	bh=KQ4QalhK3wpJRxnxOQjibUYOzGHpyIlf0E5mu9OcT94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIMw8ZSSGiGYj8pX4a7P64X7HBLDqrjtNXOolSnGRe7fgHMIuvtqrpLSdNJlILuAxPtgkkxuKgtOhtoVfZBn386mCSWYJLie0EqSFTwD4NdOxxZrFZx+ny0N1c2MJa/5A1uRzvpVW6zWGUTkvksDT2a9ZH85ukITZ1KxuGgqLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWjwcPrC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a90188ae58eso710924066b.1;
        Tue, 01 Oct 2024 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791785; x=1728396585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boeqnJLmUzhRxfK8aueqwDu2CJTbHkxzx4cEwsCpLvk=;
        b=kWjwcPrCddMi/BOytETBC8HVb32i6Wt70U3yllqRBxIWbXtIPWGRjYSVI3Wrs1YLNf
         To/xk33VkCtZ+LiCz+deak4ngy6mJq6j5HMoHg0fkmJk149ytbLz1gNKkMzA489QDwWs
         sDHmgAObjcDVQ9PzYAPTFcAAeIfypCD6qu/8mWaQP+gRHO3OLmqWgaShZyxWYombCVKL
         iCx8n5BcNGXgDBIHYKpk3A0BRljw7qMMkGeqFRZbCJS7uJ2N/le3oZh0DrGPIYH2B6OK
         lYf8+6Fe2CeEKYJ52Dr74frcjfkebgspO5nQESyw2DOmEnDI1XOVeoJtfbB4WDs2gmz1
         D3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791785; x=1728396585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boeqnJLmUzhRxfK8aueqwDu2CJTbHkxzx4cEwsCpLvk=;
        b=HHgCbgFKo2WtJH5CG/NY/oJQqVltU2fKH9pBwL2pw4w8v6xIJpN2J++TTHvsQJ1aDA
         UxE8qcU8HGjWqQFmfE4Mq7qBz7JfjbAFX/HcIkoX6r80ii/2NP1PqlLuAO+Dl5eJgifV
         b9TQTQKOub1kygRxqMO8Q/a2pPV4Mz84Tpr9lCE5lrz4ctgIUdzzeGq0CFbh6NyTe1O9
         8NxAnVAgK7+i/bGJieLlXbHBOYak9blB2euLP0CouxOdE1UdkaZvJe4VWV0zFugpLHHu
         yB0w7jr0Ya9M0N/h718+evFDO285KipUC43Oo7FUBASu4TDW/2gETtxINnZtZnrLu+Gd
         5YrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKajhzrCcKbykXnY4CoxUlfp4qtfGuX7mjrLtN4HpJUWEfOF0rFTJGZ0debrnnlppU5nyjmJaDggO2oVw=@vger.kernel.org, AJvYcCVgmamlMCd4OwXPmN6sJ+mrfNO+XJTsjaJj1pXZdq2YTmQJ5YlzCtWVAsjq7QFM1+TsKIAggB61NrBsreu697ciTLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDEnmcI/vAJ3ed4iQd6+cJf9Xm4PxCJeIUWcrUfgtXtwf48a/
	+iNs22WSOup0votHByqBtXlgZVdWwzo/AEPieemJvctsqFZDjRQ/
X-Google-Smtp-Source: AGHT+IHM+YcI3JUJ7OhJuS3/lrXoocpKzgQqVNBM+xpqIUUr8AE7YD1cMIgqOhhQ4Y5vLatYFWVZtA==
X-Received: by 2002:a17:907:948f:b0:a91:a5f:c9ce with SMTP id a640c23a62f3a-a93c4c26890mr1596755866b.62.1727791784357;
        Tue, 01 Oct 2024 07:09:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 06/17] media: rzg2l-cru: Retrieve virtual channel information
Date: Tue,  1 Oct 2024 15:09:08 +0100
Message-ID: <20241001140919.206139-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
virtual channel should be processed from the four available VCs. To
retrieve this information from the connected subdevice, the
.get_frame_desc() function is called.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2->v3
- Updated subject line

v1->v2
- Collected RB tag
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  5 ---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 34 +++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 174760239548..8fbd45c43763 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,6 +31,11 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
+enum rzg2l_csi2_pads {
+	RZG2L_CRU_IP_SINK = 0,
+	RZG2L_CRU_IP_SOURCE,
+};
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 700d8b704689..aee7d4ba70b0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -18,11 +18,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
 };
 
-enum rzg2l_csi2_pads {
-	RZG2L_CRU_IP_SINK = 0,
-	RZG2L_CRU_IP_SOURCE,
-};
-
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bbf4674f888d..7cd33eb1939c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -433,12 +433,46 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
+static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	struct media_pad *remote_pad;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
+		return ret;
+	}
+	/* If remote subdev does not implement .get_frame_desc default to VC0. */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
 	int ret;
 
+	ret = rzg2l_cru_get_virtual_channel(cru);
+	if (ret < 0)
+		return ret;
+	cru->csi.channel = ret;
+
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Select a video input */
-- 
2.43.0



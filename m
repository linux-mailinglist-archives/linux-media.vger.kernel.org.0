Return-Path: <linux-media+bounces-19453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0A99AA1F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC3F2287324
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378511D0486;
	Fri, 11 Oct 2024 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXpnNt85"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B21C8FA6;
	Fri, 11 Oct 2024 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667867; cv=none; b=WvPohvgJFs4BsmOaJV0DbhSPdaVeScLojY8mvavic/lrgBh6bxEDgAFLSmvGevSgIdeJXo3FsihwFdHQc8o89NbHAN+AMJfokAVrzdCGG9OgtDwJzfgK7LhVU0J7Sa7PxHtQ3EwuHx3J2+Qcrk8pwfJzadfwBQHDoQJ+FDQiEhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667867; c=relaxed/simple;
	bh=7XriRKCpYwD8owVfe8+uQIfwJyyzecNO4HObS1ODUME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCYFN3mZmZ2VfFKwTsjlwDCs4R1Hw0e/Y1xTwGCZAg8eGRIzig4ITTA2yHOyaWMoowIRo2a0Sp+koHoty0h8CpJpIsy/VrpxTzBUPlMg67CpBUKXsiVIe12i0CU74eUdc9HcnYR5p65RqCGTE+iKMefYK8eX5eGIVOoriZSsCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXpnNt85; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso12379885e9.2;
        Fri, 11 Oct 2024 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667864; x=1729272664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuJj8iAoHYUBdDmpC5vawKODy4yu0kSUJX/hjCQJ+sc=;
        b=gXpnNt85zEVtO6mEiS1XhWr20p9HBuKqPxCgjEIeeqIICVY6gkrjWfYX0FM3lAoxEY
         Zw4hmJZyLUTjR2oFkswrIkL2kZLmF4vrNbibVRrmHIJOcdFfVNY3r0FCFm95CJA8MMNl
         T/vMTlXi4ljgvSL6/dYAcOr2AfmLdfPVBDXkdKBvflPCP3DQFq/YMSQh4CLNvYNWakzS
         4Oz2J4lEhsu3sWqIhhAJifeWi7vp3DC/lOQBIahY+CP4OEEL9MHe8POpY+RtvZzj0wka
         TCD2IJuCzW2Weg0EJ3RrIySyiNu44aFyr7Kfehrnk55/UIG+lXOVLw0JuLQ8AH/sOIHP
         czsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667864; x=1729272664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuJj8iAoHYUBdDmpC5vawKODy4yu0kSUJX/hjCQJ+sc=;
        b=k8MrfcLdLeA3pIURHtp6OptlSIfj4FVseBqzMx7aaWRj7EYt7nPVdGD+aHAw2Jxywb
         FgPEHKYOvkwHgxzAlqYIG4mpcf+/EmkiCzz6zXSqOUQtGPhhusEtWCFh8tAdoIkI1QLm
         JanwTObDu1GtrYC0eB9ECo3PRhBzz80FymajsCNjGBlRyeOOyYO8Oq8hIofivo1dxNL3
         +w/0yXLnkh4TQ9WOpnrMKK14/72LBaEoQqjsxV6YewRVdYMGKhG/GdUg4yMWS+hXo6i9
         z8g8jnRriapH4Rrc8u89ch3sAHo6Z6CKzeCA/dAuoFqUBWf3xwo1Tiqefzc3BgxwkzD6
         BBaA==
X-Forwarded-Encrypted: i=1; AJvYcCVHalBpUdDgmF5ZPxUIi7QQj62f5ivBb+ZeOZ0zBNO2Ub/O6SDk8aQ3Dx4XxYncXrLVFLQcmHgel03qp6c=@vger.kernel.org, AJvYcCVX6ymXjiyAX2MIWSV7KCOQnyJ5QivNAqDnfLH6DoZtGnixLXzSWrG8rGlivaVL+I6LfNsc7t8CLx09uLlS4S5qPiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wptXQtw3v92WOXsPr0Q0OSeXsoN5NAvwdS/S0z26IgnAIdiI
	PjZ/XheXLl4a9Qhol4uEF2zhfHdDVL4O0nxfOIS46MkNuDsn8YSo
X-Google-Smtp-Source: AGHT+IHObhAbzYvZnqkrLmUFgJdpmdtuLoDgBpZewIa6K9TUf5uZ1tJ8Cbd8vXQQDh8MFGszCfUjmw==
X-Received: by 2002:adf:fa8f:0:b0:37d:4956:b0c2 with SMTP id ffacd0b85a97d-37d5532cd7fmr1939515f8f.58.1728667863866;
        Fri, 11 Oct 2024 10:31:03 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 05/22] media: rzg2l-cru: csi2: Implement .get_frame_desc()
Date: Fri, 11 Oct 2024 18:30:35 +0100
Message-ID: <20241011173052.1088341-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L CRU requires information about which VCx to process data from,
among the four available VCs. To obtain this information, the
.get_frame_desc() routine is implemented. This routine, in turn, calls
.get_frame_desc() on the remote sensor connected to the CSI2 bridge.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index abacf53b944c..3fd0be6a3b65 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -582,6 +582,25 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				     struct v4l2_mbus_frame_desc *fd)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
+			csi2->remote_source->name, PTR_ERR(remote_pad));
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 	.s_stream = rzg2l_csi2_s_stream,
 	.pre_streamon = rzg2l_csi2_pre_streamon,
@@ -593,6 +612,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.get_frame_desc = rzg2l_csi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
-- 
2.43.0



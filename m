Return-Path: <linux-media+bounces-5320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 895598588BE
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 23:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465B6282255
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 22:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56CA14E2D2;
	Fri, 16 Feb 2024 22:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NYyTL+A8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73814AD20
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122779; cv=none; b=YLuQMuf6OSE9MsshOc91niapS96PZMgiFtv6wwF+n5N4dILM3UFYAvLQLTexkbbNwxyecpvDqMmclNl5nMmxlrz1co1iF2TB893g3R4H9+6LPgM42rLqYOQVSZnEmqsGemg/mZccY0LhhD8uQCkop4MpVGZi8jm43ieC1+rd5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122779; c=relaxed/simple;
	bh=P19sMu5Mw793sAFli6qeQdKWL0aNl8RDAnF1hhXeTh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kALBbTiqvKbm+3N2nO/2C0fzA0GkHJxYKDVY0ZVKoEUpCrLmo3UQuf2PwkiKqKyd8bIKz2JKIfBuV/xOFBFbTKNMOuGWreLXTvnDj81I7DBc7oq4fiJBaLeJ3IrImD8KHaN5sjKEQAF6pcO2/FqrvsDc0JEmrmzSqrFUtftg0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NYyTL+A8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nm9JzX61P8xPGOx5ZUZJ6Fe5CfbgZ7V9+WeLqtY3Zt4=;
	b=NYyTL+A8sPQbvoscbX+4We0dGuY349vQA7KvJEE3K7jRKNaiTz41hqwrQIgBk7hU6s9gar
	8RwzPt82n/glmqgaI+9k5CB4O8OvFPUPih0UUl6VL+yDB6ey8fRiMalCg3DLmOIhIIPyhH
	9HaURg3UG7gFohGjR9knjDbRTosmZZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-7uDxfdoWPjS3rtb7JKZWdw-1; Fri, 16 Feb 2024 17:32:52 -0500
X-MC-Unique: 7uDxfdoWPjS3rtb7JKZWdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECA62185A783;
	Fri, 16 Feb 2024 22:32:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 323A4C1EA63;
	Fri, 16 Feb 2024 22:32:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: ov2680: Add camera orientation and sensor rotation controls
Date: Fri, 16 Feb 2024 23:32:37 +0100
Message-ID: <20240216223237.326523-6-hdegoede@redhat.com>
In-Reply-To: <20240216223237.326523-1-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Add camera orientation and sensor rotation controls using
the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
helpers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index fef9e11ee141..bcd031882a37 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
 	int def, max, ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
@@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 		goto cleanup_entity;
 	}
 
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
+	if (ret)
+		goto cleanup_entity;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto cleanup_entity;
+
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-- 
2.43.0



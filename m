Return-Path: <linux-media+bounces-5319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0828588BB
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 23:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5837D281DDD
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 22:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C193014C5B1;
	Fri, 16 Feb 2024 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XQbJr+S3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912814A4EA
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122779; cv=none; b=Sm8jFh4gJV+v/sB+7fcl7pEuc6HFBDwsj5x+MXU0NIilcmyvk4fWw6ORD8MQL49kB6Xo0KOhUawqSJTQWIFBVE+NeytvNLgJEW7hDGYEnU3iBxyL70hWoVAKK0UJHOslOOaNiura2n99ysZK4eXGhFtfSZ53xb9mACvJ4Xh6PtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122779; c=relaxed/simple;
	bh=CdLn94WJTRnT8QpKaS+gxDotv4S4CpwXXMuu0LGIXrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z01jQP0w7BjzpL1pjcIzp0Jm5RtxUNbZ4XTqsoumtCoqvI/Z3qqpFZbAVlqoB1nwbZuojQhRnlCQqRGIUZQIL10h98JgJExNgtMPfuR+oROJTkWZd/GzPnLwCVQTwLIjhZWX2mqf22VR3ETFE3jD5kZ0JPaqtUP42zSNi+hRWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XQbJr+S3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehiuZOSCwa/5nN0kzj/3IYlshWEMl7MJbiok3219NZo=;
	b=XQbJr+S31y64TsEOrpemnh6y+NEzL3W5a1XCDfR9vmMRABDWwOgiHtQ1ad4k3372kPEJ5U
	I2DF8USeXBuNUGGBO48G5qwCwuAVEAdZ3ELF7Ee/51wO02Cj+pMJwwgHjphfDd2eObaC/N
	HwdNE7FE6yz2HxiZo3nGKKzUBs3/ezM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-5PG_bP3HNyORz-xx-_6t9Q-1; Fri,
 16 Feb 2024 17:32:51 -0500
X-MC-Unique: 5PG_bP3HNyORz-xx-_6t9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00D7C280A9AC;
	Fri, 16 Feb 2024 22:32:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37880C0335E;
	Fri, 16 Feb 2024 22:32:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/5] media: ov2680: Add hblank control
Date: Fri, 16 Feb 2024 23:32:36 +0100
Message-ID: <20240216223237.326523-5-hdegoede@redhat.com>
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

Add hblank control so that the sensor has all the mandatory
controls for libcamera.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 4c9db83d876e..fef9e11ee141 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -130,6 +130,7 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
 };
 
 struct ov2680_mode {
@@ -684,6 +685,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	/* exposure range depends on vts which may have changed */
 	ov2680_exposure_update_range(sensor);
 
+	/* adjust hblank value for new width */
+	def = OV2680_PIXELS_PER_LINE - width;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
+
 unlock:
 	mutex_unlock(&sensor->lock);
 
@@ -984,6 +989,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
 					  OV2680_MIN_VBLANK, max, 1, def);
 
+	def = OV2680_PIXELS_PER_LINE - OV2680_DEFAULT_WIDTH;
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  def, def, 1, def);
+	if (ctrls->hblank)
+		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto cleanup_entity;
-- 
2.43.0



Return-Path: <linux-media+bounces-9386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 851778A50F1
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D3A1F216D1
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0B1128815;
	Mon, 15 Apr 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pe1Q9HfU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5FE127E2F
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186224; cv=none; b=A+FCRj10y4zG1LFS+mOrS4CDmVlRVMGFpNTg4aDv2JM+7j3xBdn1QgEYswA0ByD+TASsD7z0dsXKMLuvtPTlO02GKfhDSXhZcq3KS/89/4THITeK53BuzGH4gp4VphQaGHrR+Dh+k+Udm3ftrWTachsesJI7RR4r0IctKrvarV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186224; c=relaxed/simple;
	bh=bEPArUTWrzamd6i5M0Ty67Hk9+jye2HDeJUrLCJH1cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqIrPy5iSPEHFE6Xv/SJLmavy4JQVUpD8tsvBu0v7tvnJfDZRmERxdV1bfn2vCeij841D1oNy4ejZuJwI9o0JVz0vrSbKnHTJFnoW9233kZBfgK9EGRhXtqPB6xc33wqoOpLIE3wIxgIc6+Rhkx6Hy10oZwVHHKDWaGPPT5Wk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pe1Q9HfU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/dDUfV6mf9MevbuSaMGXYeUfYIgBvEQc/2A4SKOMt4=;
	b=Pe1Q9HfUSt8NS+gLSVJ3DtEk11cejtPI334iABOHb7pXjW1oLE8VxJbTsjLzCiFINx5api
	hHuMlhmf4ooFtL0GELk1qi1rMsTOsvkIbcBEx8HOgUZ0Ol/mYx8P+qavI2XWAPAstvxBn6
	dIKynLn4gSQR7JmwmR7fMN5dKcgwYMk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-fWRU6yzDO9u2nScAv5dHIQ-1; Mon,
 15 Apr 2024 09:03:36 -0400
X-MC-Unique: fWRU6yzDO9u2nScAv5dHIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5706E3C0ED46;
	Mon, 15 Apr 2024 13:03:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C579112131D;
	Mon, 15 Apr 2024 13:03:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 4/5] media: ov2680: Add hblank control
Date: Mon, 15 Apr 2024 15:03:17 +0200
Message-ID: <20240415130318.234222-5-hdegoede@redhat.com>
In-Reply-To: <20240415130318.234222-1-hdegoede@redhat.com>
References: <20240415130318.234222-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Add hblank control so that the sensor has all the mandatory
controls for libcamera.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add error checking to __v4l2_ctrl_modify_range() and
  set read-only flag after checking hdl->error
---
 drivers/media/i2c/ov2680.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 1a246c87d289..e8ec2a6d27db 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -130,6 +130,7 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
 };
 
 struct ov2680_mode {
@@ -689,6 +690,12 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	/* exposure range depends on vts which may have changed */
 	ret = ov2680_exposure_update_range(sensor);
+	if (ret)
+		goto unlock;
+
+	/* adjust hblank value for new width */
+	def = OV2680_PIXELS_PER_LINE - width;
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -993,6 +1000,10 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
 					  OV2680_MIN_VBLANK, max, 1, def);
 
+	def = OV2680_PIXELS_PER_LINE - OV2680_DEFAULT_WIDTH;
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  def, def, 1, def);
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto cleanup_entity;
@@ -1001,6 +1012,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	sensor->sd.ctrl_handler = hdl;
 
-- 
2.44.0



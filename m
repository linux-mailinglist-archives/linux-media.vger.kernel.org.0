Return-Path: <linux-media+bounces-9324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A28A4BB4
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB50286027
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A195730C;
	Mon, 15 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MjxhiR2M"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715956B9E
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173847; cv=none; b=fbNaOelgNKisyw/qN1HTGevpUYoriXgVSQ1mL2k26gF1njd2d2vS/rcd3NkLARYvpLdLRDp2cF/i3H0/6Lb5weX7URenbcI6frWVUGBeM3jnPZppud/I5IkYvfX1seL2DwIDT5bl2p3M907N/fl5F9OBJxFSXRE+QD4FcD6EWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173847; c=relaxed/simple;
	bh=w+mjOADBtI8fKKh/480aB6G3rKnij0dxpE46BFW8xgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtDNa6kUnXwZj1IcXFchhyoyKtSNb7bzP1LGoo0WRYofT+bwodpFqOgVt1kVVtKsqDjQwZC8jy11dh82YEnhwvAMP67aE+KyyMnPrBRVLJorfIqIxKcpxvmSqjqVk9c7/LGSdWeQJ1X1AFoTM9iUHOTP5ZL/CH+0r0P11kP2IIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MjxhiR2M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713173844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bxajgGVbksObEUefBVztJZx2uli0cuRyhLcJDwDtpI=;
	b=MjxhiR2MuJ+NfAkCyCOJ2S4ojlIKX6DLsXplAtkxdWjIquv21IOSV5ldJvKncGrBK/Ff8p
	wca3u+6Go0dDYSTv76CsVz9/yYmSLbaT/oo3tow4hmwjYOq5aSB9y/ijZ6kbjbhrC0oZ3Z
	rhrPRpEcKgNmnkpDBnogC7kvzj+A2cg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-GQkMpy7XNdOXZD04YtSd2A-1; Mon,
 15 Apr 2024 05:37:20 -0400
X-MC-Unique: GQkMpy7XNdOXZD04YtSd2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8147838035AE;
	Mon, 15 Apr 2024 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 851B1C13FA1;
	Mon, 15 Apr 2024 09:37:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 4/5] media: ov2680: Add hblank control
Date: Mon, 15 Apr 2024 11:37:03 +0200
Message-ID: <20240415093704.208175-5-hdegoede@redhat.com>
In-Reply-To: <20240415093704.208175-1-hdegoede@redhat.com>
References: <20240415093704.208175-1-hdegoede@redhat.com>
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

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index d44e1934b25a..14a5ac2bbf8b 100644
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
2.44.0



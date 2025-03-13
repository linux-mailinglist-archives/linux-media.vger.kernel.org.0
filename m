Return-Path: <linux-media+bounces-28169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7287A5FFD6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6C6189E844
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169681F03E5;
	Thu, 13 Mar 2025 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CHNEkFBH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25001DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891457; cv=none; b=DRhPyzoyLOyGqvhITyH7TanmwOdlwiO/QnkYTX2puMEFoXep6GZ6aTC4fw+luejBeqafT91DGCwsr92e71Sct6sQEUDRRqwQWMfOc3gWevHn/FJgqDOHBBYMSr/Kzpjf794cC99QDOkWSUAZdqTFy+Ecl9m4oED9X+xb6nC6eeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891457; c=relaxed/simple;
	bh=4tvMhb6q6CdLQ8UKLamsrBJYdNROiCjOz8/xB3td5MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3TewEz2Odu551SW8effzQ3klo05FzTKWFoXbmEvhBlFWhjn0mXoitLl5JSmCkeAUoh7jhCYKGCUQ9KBy0GyjIenj/WsKPDnwWDNsDxBvCaRji/T3unC3ZVl5UZdRMWU3WzzjO1p100cOCS0BYJdcJKOG2dOguqsNqRACAsiAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CHNEkFBH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gtgjw51An2Qs6UfXdq/PlrAgwddsI3CBCPfkD4p9e/Q=;
	b=CHNEkFBH8iiaHn6kP5BekirKWT1amHH/KRPvL8y8KHHNUBX5vFZt5DmYwR5nVjWDOWhRHj
	Z2kqsO0Fuk0WUVVxhWKSRVl+AgVCIXUSmC5OBmxhBdebo/95C4HXzCS07hqA4pi9BapdGp
	GaRaGVJhwJyjTTbigoy2FCH3hT3rREs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-50MLQUuXOKaLNaT87mDtVA-1; Thu,
 13 Mar 2025 14:44:09 -0400
X-MC-Unique: 50MLQUuXOKaLNaT87mDtVA-1
X-Mimecast-MFC-AGG-ID: 50MLQUuXOKaLNaT87mDtVA_1741891447
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D50E19560B7;
	Thu, 13 Mar 2025 18:44:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C70E300376F;
	Thu, 13 Mar 2025 18:44:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 14/14] media: ov02c10: Use v4l2_subdev_get_fmt() as v4l2_subdev_pad_ops.get_fmt()
Date: Thu, 13 Mar 2025 19:43:14 +0100
Message-ID: <20250313184314.91410-15-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Store current-mode format in active-state format on non try set_format()
calls and use v4l2_subdev_get_fmt() as v4l2_subdev_pad_ops.get_fmt().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 42 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index c559a69140ec..5626aa2fe62c 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -710,36 +710,20 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 				      fmt->format.height);
 
 	ov02c10_update_pad_format(mode, &fmt->format);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
-	} else {
-		ov02c10->cur_mode = mode;
-
-		/* Update limits and set FPS to default */
-		vblank_def = mode->vts_min * ov02c10->mipi_lanes - mode->height;
-		__v4l2_ctrl_modify_range(ov02c10->vblank,
-					 mode->vts_min - mode->height,
-					 OV02C10_VTS_MAX - mode->height, 1,
-					 vblank_def);
-		__v4l2_ctrl_s_ctrl(ov02c10->vblank, vblank_def);
-		h_blank = mode->hts - mode->width;
-		__v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1,
-					 h_blank);
-	}
-
-	return 0;
-}
-
-static int ov02c10_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	else
-		ov02c10_update_pad_format(ov02c10->cur_mode, &fmt->format);
+		return 0;
+
+	ov02c10->cur_mode = mode;
+
+	/* Update limits and set FPS to default */
+	vblank_def = mode->vts_min * ov02c10->mipi_lanes - mode->height;
+	__v4l2_ctrl_modify_range(ov02c10->vblank, mode->vts_min - mode->height,
+				 OV02C10_VTS_MAX - mode->height, 1, vblank_def);
+	__v4l2_ctrl_s_ctrl(ov02c10->vblank, vblank_def);
+	h_blank = mode->hts - mode->width;
+	__v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1, h_blank);
 
 	return 0;
 }
@@ -789,7 +773,7 @@ static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
 
 static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
 	.set_fmt = ov02c10_set_format,
-	.get_fmt = ov02c10_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = ov02c10_enum_mbus_code,
 	.enum_frame_size = ov02c10_enum_frame_size,
 	.enable_streams = ov02c10_enable_streams,
-- 
2.48.1



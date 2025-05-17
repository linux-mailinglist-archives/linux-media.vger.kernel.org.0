Return-Path: <linux-media+bounces-32676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BDABA9D7
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C0147B3CBD
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6551FAC59;
	Sat, 17 May 2025 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvJON6XZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A81F8725
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482185; cv=none; b=co/8WGZy6INPUHZyx7zP1JInES0yU9VvzxnNfcJ0R7mvX1/kyLk2HbtaM5WeFNOPij8TRP49yUW2bQcfMC88G3r0fOnjGCztzrykelMPNWRT4qFKPGo5kU5YhnnggDuWM68/FAhi6UGZ72TYjDxcvnVAQmfj5HPVKfAKri/KvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482185; c=relaxed/simple;
	bh=1pvOBGMIBvOnifVinkfVbZB1mcrG7tVCdFGrAwYXUuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkoDNSc0220ia7FIySSvG4MPLk+KoATZDBqK0hcz+6ZhUfluGFZRnvlq32UD/xkGAV3DMg2G6hVGIX4vLtLCPUci0XqZl+O1Lfy9sC+XtEyyu6vcF9jdre1aVaFJW33qMhXkSsexZwwVWAVq1NeV5SC8vAlCDn6y4cyvInl0ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvJON6XZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YbksPC1M2G+24fipMsJQjSmp4IJ8x1pXdvo6sLoRXg=;
	b=QvJON6XZsKhwbGdo75y80XRV0cGhq78R1mpNEb+ncYSbKRWgpUjkrdjoEauXL5lj2tDELw
	JmSpZPFVdpy0F+sNaz8PpcI/ecEJzccLdgFkz5YmSmP/v4ZDvnPlj6OGzWihMMQooYK4jD
	luXkoMkfNqxrw6nC6r/DiJwcIFn63ck=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-v1BLtJe3NXOKy8YAoTKOOQ-1; Sat,
 17 May 2025 07:42:58 -0400
X-MC-Unique: v1BLtJe3NXOKy8YAoTKOOQ-1
X-Mimecast-MFC-AGG-ID: v1BLtJe3NXOKy8YAoTKOOQ_1747482177
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1904180045B;
	Sat, 17 May 2025 11:42:56 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62E5C180045B;
	Sat, 17 May 2025 11:42:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 18/23] media: atomisp: gc0310: Switch to using sd.active_state fmt
Date: Sat, 17 May 2025 13:41:01 +0200
Message-ID: <20250517114106.43494-19-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Stop having a v4l2_mbus_framefmt mode.fmt driver-data member to store
the fmt for the active-state, instead use sd.active_state fmt.

This also removes the need for gc0310_get_pad_format() since
v4l2_subdev_state_get_format() now will return the correct
v4l2_mbus_framefmt for all whence values.

Instead of switching gc0310_set_fmt() from gc0310_get_pad_format() to
v4l2_subdev_state_get_format() just drop it entirely since there is only
1 fixed mode. Otherwise the new gc0310_set_fmt() would be 100% the same
as v4l2_subdev_get_fmt() after this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 32 +------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index a9d0afbbe7ef..5936e25fb8c7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -91,10 +91,6 @@ struct gc0310_device {
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 
-	struct gc0310_mode {
-		struct v4l2_mbus_framefmt fmt;
-	} mode;
-
 	struct gc0310_ctrls {
 		struct v4l2_ctrl_handler handler;
 		struct v4l2_ctrl *exposure;
@@ -355,17 +351,6 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = gc0310_s_ctrl,
 };
 
-static struct v4l2_mbus_framefmt *
-gc0310_get_pad_format(struct gc0310_device *sensor,
-		      struct v4l2_subdev_state *state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(state, pad);
-
-	return &sensor->mode.fmt;
-}
-
 /* The GC0310 currently only supports 1 fixed fmt */
 static void gc0310_fill_format(struct v4l2_mbus_framefmt *fmt)
 {
@@ -376,20 +361,6 @@ static void gc0310_fill_format(struct v4l2_mbus_framefmt *fmt)
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 }
 
-static int gc0310_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
-{
-	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = gc0310_get_pad_format(sensor, sd_state, format->pad, format->which);
-	gc0310_fill_format(fmt);
-
-	format->format = *fmt;
-	return 0;
-}
-
 static int gc0310_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
@@ -585,7 +556,7 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = gc0310_set_fmt,
+	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_set_selection,
 	.get_frame_interval = gc0310_get_frame_interval,
@@ -759,7 +730,6 @@ static int gc0310_probe(struct i2c_client *client)
 	}
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &gc0310_ops);
-	gc0310_fill_format(&sensor->mode.fmt);
 
 	sensor->regmap = devm_cci_regmap_init_i2c(client, 8);
 	if (IS_ERR(sensor->regmap))
-- 
2.49.0



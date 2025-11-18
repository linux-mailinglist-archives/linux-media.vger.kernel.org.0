Return-Path: <linux-media+bounces-47287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B46C6943A
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E3C6F2AA46
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E823F35970A;
	Tue, 18 Nov 2025 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C9uijmVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0343F3596EF;
	Tue, 18 Nov 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467487; cv=none; b=NoMjvhIClz0HYXqb7K1wlIrhdJEzk8oCZ2mIvsNlKJwlog0sFCSHXPN1lTuIqzHUn27JSfxyoUpmxd4HuSDQjIuJsTf9Ij/D6VOhcfD09f4b9nmNq8R2YcoWkvkJZBPhcX70G55VFBcj8He59tKOcgt4vgjLgXX3K3AQcuh7kBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467487; c=relaxed/simple;
	bh=BpDORgbM71EJEbjswrJR7b3OCq74fh8zDCvCzLzXjb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxGDqIRukuFji71tgWOqc75Q9KM2jdE/51NtXH7DRZIQoo5fuTxmZ+InI6CDD1jdAJVAjRKpkjFukKcLNs5N85P1Ii2K1CQvlL2VBqVKXw9B8tCPQQARSTK+uvGHF8yM5UItVzYLPivSmRxwqiMNTyOJBL7txO5tue++Zs0l/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C9uijmVZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37191211E;
	Tue, 18 Nov 2025 13:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467359;
	bh=BpDORgbM71EJEbjswrJR7b3OCq74fh8zDCvCzLzXjb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C9uijmVZOd8UsSeMNSCI7KfZLrRYEKALTMedcPckGYpQ3cG39x+qJjLF+0xYsACLz
	 s2wfpLqqT4YBGrEWUwaZzsiBinN24S9AbCaffGAVneTSRmIgNIh8EDo9CGG1RA2b5B
	 3zx02kAhcRz5zEgY+lrdkR+5AfnlbKTTdK1k3qfE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:08 +0530
Subject: [PATCH v2 15/16] media: i2c: ov5647: Tidy up PIXEL_RATE control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-15-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BpDORgbM71EJEbjswrJR7b3OCq74fh8zDCvCzLzXjb8=;
 b=kA0DAAoBQ96R+SSacUUByyZiAGkcYIijDh5yI5Hv5/Tlgpk2AT/c1PfagZFouwVWHulWP18zf
 YkCMwQAAQoAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJpHGCIAAoJEEPekfkkmnFFDkwP/0tm
 IErMO6/s9hHe7I0g8md/TG2Nr6gbnTDtGBeh2y5eSgK/46vpEaLdGX3tG+5S6B8Y9iMvhA0+YOL
 1+vFlmPdVA4zXLCxv0ZWsB3LTwYVzt7PhZzAFU56K244s3eK3/2ZyTPqH0sjL7aTuSOICFDA0l6
 VMyLKZUin/YKJ0eyd3jZhi2dUYcWIfl7eBY9X33BozIxoEzuexjCRFuwDb7+4pl1fRl5/ENf51V
 u0SJP1Af6vuIfbGyi9zeWHtIYZxmT7xSuCs/Z54q9ZYEFk6OBCUxSji4uNUYLM9CpX5y2KO7/7m
 qd07Rh+QpYiytZqk6ZdQrBSpMF7kHkNzBcj4IZVNSfbfnw4UrLVddD8abj3rXYukhms92bK24Iz
 bVnR+OyqFeo4yUTvNAOU0+ZRntRRJec4Oiu6cW9wOkaKY8xvAb5fl/MiEa9ufKKrdhl8KnlErdG
 uXrhY1kVHaqTYWvCZ/gfiF3GCu3ekUJF9ejZRUfTjFUHArBmU0xF/vCUSwb4CK2gXV/jufdzt1t
 +8RIOTEv0j8J2ccCaemszBOQVGDSL+F1xYyaqyNBPnnwByAcZsHLwtOl4AgmHKiefcSXyjMrC4j
 tIaFDHy6t44ows4NOg8uSfLiR40DewlLVKQm3+jSiilsrHQlG5kJUigyZvW7Gndc5JSB4AdmIdE
 tto1n
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate control is marked as read-only by the framework itself,
so no need to mark it explicitly in the driver. Also, we can set the ops
to NULL to avoid checking for it in the s_ctrl implementation.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3a2c25a6b6808bf1289a2357ac5b79bf6bf99daa..71107d74f2900b39233a52b29a229282bd087963 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1195,12 +1195,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
 				   ov5647_test_pattern_val[ctrl->val]);
 		break;
-
-	/* Read-only, but we adjust it based on mode. */
-	case V4L2_CID_PIXEL_RATE:
-		/* Read-only, but we adjust it based on mode. */
-		break;
-
 	case V4L2_CID_HFLIP:
 		/* There's an in-built hflip in the sensor, so account for that here. */
 		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
@@ -1267,7 +1261,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
 
 	/* By default, PIXEL_RATE is read only, but it does change per mode */
-	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
 					       V4L2_CID_PIXEL_RATE,
 					       sensor->mode->pixel_rate,
 					       sensor->mode->pixel_rate, 1,
@@ -1306,7 +1300,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	if (sensor->ctrls.error)
 		goto handler_free;
 
-	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.51.1



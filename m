Return-Path: <linux-media+bounces-4372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1F841423
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 21:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95B21C24069
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 20:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568D4151CE0;
	Mon, 29 Jan 2024 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XkUCb1fm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777976031
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559819; cv=none; b=aBMDu+DEPvamA+j/nOvZ2zIBZSsd0WM57R5rYod8p+ylwUtrGMpAGK3DIcGMxl+fSk2CRkIRMc4kd0zHyMAH52iDJyj6VVfuZ8QXkZzQc3bsD4QgQ2I4XktNiR9rCEbpN45ceud6+H3vO2Ls7SN8Xfv8ytuxzwDBEjVeIbi0V4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559819; c=relaxed/simple;
	bh=KhRCSmDF0oZ/OZvfrCn77tU3k7BRNvexFdBiP7k7Bpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJPT+pc0hiyxhgkaaVo+JSesBKzGyzb/3sDFEMjAFddkUJ8/zbYBAgPaoGItjHhhet3+yWmSBh4kp5xIJ7ZvgXaQQpZphKAHmRYn5Z4B+PoBJ4gcHk7g8xaottr4NSDqf269+XywKSzXpK5sh2bK1Hrg8Stg/BMJag0ZpjLqgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XkUCb1fm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a315f43ecc3so303985266b.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559816; x=1707164616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+Y8mddvkdiZ6ddfM24jx/NNgzjj0UT3L8rY/aNqpTU=;
        b=XkUCb1fmmGusey3mzxLlZiTr2+Wog2mFQW+ZHvm9nXYcdl0TjShkNzpBzFqhr8szTu
         FIKQQRqms9vV1vqTcO4Qp/0YGoPN1NGoYjIvYbG4byju8501O+MRCd9QOK5KcjGrYQao
         Ua/BxlHCDv7LWbQHjZl0Vy5wvoepCdoxFQDanbj+A3NTsH5njADrmIlH2txz28nXEhy5
         BsUXVchTA7hJdW3hv1VRmYgS2NuzbLRaKvHNECsmVGiJSZCn2AGN5PlY9hL7nWsakDFV
         aN19ZM+TNW8QZsDuwxyuHKAhX91kTvy+72EbQTHVzd+g99l23k8Kv/+E0iQqf9udLn0R
         wa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559816; x=1707164616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+Y8mddvkdiZ6ddfM24jx/NNgzjj0UT3L8rY/aNqpTU=;
        b=s7+TUSD2Nt7GcRhEgYwEn7UwEzsi6R0+m81Dqcc+gRQTBkFuJu/Ur4VTmyCJ/Hlbe5
         F/+CUtZkPlDM1AT1HaqZIHTF74mhfXGRRDZzrCahN4ZMVHsEay6zZ/EWr+T4HTGtul0o
         z5/fZIjKqhUIquLozt5TvsRKkA3XCU9khdrU8lT0FXVB5iXVppB2/FrL78ndjQ3RY85e
         8vsolsUiXrgI1D6jF5tQ0SJ6/vrCQ7t0WcMa7wl/41bXn/l4RtoXnT6APMxzgLeId64J
         hkD15O8vofFPogubTmgQQGLvSZpWOzSercM6Ormgzm1mKGQt2nQ0HPEmy4zIah/4mxBG
         eWAQ==
X-Gm-Message-State: AOJu0YwAnBe2G09A1Kz0ZVkiQFkLvubXM8lQtVa7zj55AQv9nDsHgWyC
	qRK47kp1GGyYGDwy0/efb4J9ljMciwJVS3dy2wryYPU5SL7zSliNG2iJ/2UDMjE=
X-Google-Smtp-Source: AGHT+IGapPRO8e+yLEIHFwWVkv29hR7h5xLCR9o2yY2fGzh5Xqct7tJaJeRmPsM+e3utru9Zj6Z3OQ==
X-Received: by 2002:a17:906:4708:b0:a35:de06:23fa with SMTP id y8-20020a170906470800b00a35de0623famr1897440ejq.6.1706559815710;
        Mon, 29 Jan 2024 12:23:35 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:35 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/6] media: rcar-vin: Move media graph pointers to device info
Date: Mon, 29 Jan 2024 21:22:49 +0100
Message-ID: <20240129202254.1126012-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of selecting the media graph link setup and media operations
based on code paths store them in each SoC static information. This
reduces complexity and makes it clear what set is used for each SoC.

It also makes it easier to extend to new SoC with different link and
media graph setups.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 38 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  7 ++--
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..47aeeeb4354e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -64,9 +64,7 @@ static void rvin_group_cleanup(struct rvin_group *group)
 	mutex_destroy(&group->lock);
 }
 
-static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   int (*link_setup)(struct rvin_dev *),
-			   const struct media_device_ops *ops)
+static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 {
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
@@ -82,10 +80,8 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
 
 	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
 
-	group->link_setup = link_setup;
-
 	mdev->dev = vin->dev;
-	mdev->ops = ops;
+	mdev->ops = vin->info->media_ops;
 
 	match = of_match_node(vin->dev->driver->of_match_table,
 			      vin->dev->of_node);
@@ -114,9 +110,7 @@ static void rvin_group_release(struct kref *kref)
 	mutex_unlock(&rvin_group_lock);
 }
 
-static int rvin_group_get(struct rvin_dev *vin,
-			  int (*link_setup)(struct rvin_dev *),
-			  const struct media_device_ops *ops)
+static int rvin_group_get(struct rvin_dev *vin)
 {
 	struct rvin_group *group;
 	u32 id;
@@ -148,7 +142,7 @@ static int rvin_group_get(struct rvin_dev *vin,
 			goto err_group;
 		}
 
-		ret = rvin_group_init(group, vin, link_setup, ops);
+		ret = rvin_group_init(group, vin);
 		if (ret) {
 			kfree(group);
 			vin_err(vin, "Failed to initialize group\n");
@@ -246,7 +240,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->info->link_setup(vin);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -963,7 +957,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
+	ret = rvin_group_get(vin);
 	if (ret)
 		goto err_controls;
 
@@ -1055,7 +1049,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
+	ret = rvin_group_get(vin);
 	if (ret)
 		goto err_controls;
 
@@ -1161,6 +1155,8 @@ static const struct rvin_info rcar_info_r8a774e1 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a774e1_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 };
 
 static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
@@ -1178,6 +1174,8 @@ static const struct rvin_info rcar_info_r8a7795 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7795_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.scaler = rvin_scaler_gen3,
 };
 
@@ -1196,6 +1194,8 @@ static const struct rvin_info rcar_info_r8a7796 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7796_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.scaler = rvin_scaler_gen3,
 };
 
@@ -1214,6 +1214,8 @@ static const struct rvin_info rcar_info_r8a77965 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77965_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.scaler = rvin_scaler_gen3,
 };
 
@@ -1227,6 +1229,8 @@ static const struct rvin_info rcar_info_r8a77970 = {
 	.use_mc = true,
 	.max_width = 4096,
 	.max_height = 4096,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.routes = rcar_info_r8a77970_routes,
 };
 
@@ -1242,6 +1246,8 @@ static const struct rvin_info rcar_info_r8a77980 = {
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.routes = rcar_info_r8a77980_routes,
 };
 
@@ -1257,6 +1263,8 @@ static const struct rvin_info rcar_info_r8a77990 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77990_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.scaler = rvin_scaler_gen3,
 };
 
@@ -1271,6 +1279,8 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77995_routes,
+	.media_ops = &rvin_csi2_media_ops,
+	.link_setup = rvin_csi2_setup_links,
 	.scaler = rvin_scaler_gen3,
 };
 
@@ -1281,6 +1291,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
+	.link_setup = rvin_isp_setup_links,
 };
 
 static const struct rvin_info rcar_info_r8a779g0 = {
@@ -1290,6 +1301,7 @@ static const struct rvin_info rcar_info_r8a779g0 = {
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
+	.link_setup = rvin_isp_setup_links,
 };
 
 static const struct of_device_id rvin_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 792336dada44..ce5419818b36 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -156,6 +156,8 @@ struct rvin_group_route {
  * @max_height:		max input height the VIN supports
  * @routes:		list of possible routes from the CSI-2 recivers to
  *			all VINs. The list mush be NULL terminated.
+ * @media_ops:		Pointer to media device operation structure to use.
+ * @link_setup:		Callback to create all links for the media graph
  * @scaler:		Optional scaler
  */
 struct rvin_info {
@@ -167,6 +169,8 @@ struct rvin_info {
 	unsigned int max_width;
 	unsigned int max_height;
 	const struct rvin_group_route *routes;
+	const struct media_device_ops *media_ops;
+	int (*link_setup)(struct rvin_dev *vin);
 	void (*scaler)(struct rvin_dev *vin);
 };
 
@@ -274,7 +278,6 @@ struct rvin_dev {
  * @count:		number of enabled VIN instances found in DT
  * @notifier:		group notifier for CSI-2 async connections
  * @vin:		VIN instances which are part of the group
- * @link_setup:		Callback to create all links for the media graph
  * @remotes:		array of pairs of async connection and subdev pointers
  *			to all remote subdevices.
  */
@@ -288,8 +291,6 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
-
 	struct {
 		struct v4l2_async_connection *asc;
 		struct v4l2_subdev *subdev;
-- 
2.43.0



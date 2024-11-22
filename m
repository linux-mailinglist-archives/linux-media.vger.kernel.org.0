Return-Path: <linux-media+bounces-21841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8B9D6095
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 15:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94AE8B23E54
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1281F1DE89E;
	Fri, 22 Nov 2024 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX/f0VQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB45070823;
	Fri, 22 Nov 2024 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286244; cv=none; b=dtoIYNQ8YCzZCpvVUrz75vKsO2pd1e6I0DYBK20WOwxKj45wO1Xd9Wpw0uf/cckRE8StFsUqASJgM7ODAoFVImiUZr9E7468krTDym8D10JPzQ0/sZsqjGskTZKS2WDs+48c7PgzsLNSUOFVakCDcsrymKi1WRwKTMl5YT3C1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286244; c=relaxed/simple;
	bh=Keu5NQHlbLPzIDkrS/72fIWaWqtR0crDA6PH58JVMqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRhMikJj7THPwByeU0daO2rlQBpfclRDCqz2OyOGQhGPdEH0+ERC5S0y+ez3Nl+yS1BgbEuhJbyz8U756xY3fA0xzs4Ap4OAe2eiGb21uGeYVBwkTukWnpW0zt+kGGLI8OVGIDH14WqzXKoOXQw81ho6QB5D/guRJN1rRl1suZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX/f0VQ5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so19159655e9.1;
        Fri, 22 Nov 2024 06:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732286241; x=1732891041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BADAresG1EOtpwbTZcGXUhBjlqOEu21KZNXJtTjJmAw=;
        b=XX/f0VQ5IgTzpqgLxq8XAQrnlbjbTyXypXPIOu+sqTbzqMhNzEOaO6Wx+QpEEqnwta
         Rt53kKbB44KxyweerqdlfWG3zhU/0NwhOFLjS9jFu92g+fbrPPZpiqkgXRMLKwXGQgcN
         MuJA8Z1ILaKRAubqhuAcsUkq6602BexuMpovsPV0wrOQaxCs3DbTSEQDlTmg6vj6BBr3
         6TtA0n21Jj+OVFoYa8VuKhYZ+RAQRNbMq2wBn5bRr7p4rMin3E6eBXH8FSGqrqmYBCmj
         mlRZqrxyqqaMU1CtKJyOFXCi8EjKMxXXTCcL+2WNZyhQCPlbzOJ0v+H6FuhF9HKsqw7P
         9nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732286241; x=1732891041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BADAresG1EOtpwbTZcGXUhBjlqOEu21KZNXJtTjJmAw=;
        b=es7QLoVeohhqJXTWR1Kg/qcNWp2mIEh4iaI0c5uz4e70204psM+r8CTTXOUS1yaXi4
         +HhqGxWlX3MKYKtzjVk3OsOb3Hyv2E1spydRXH+uWS60xlh7VaSoifCChvU7UFS3ED9u
         chewjiOiHjgtWQLAjhEZtLNr3eRfNDqQVVTc2a82KYu0Ec1ZwUFz3buybwkqTS8f7yxw
         WU/hq2Qq5ELTLepDZEjb/dRTkcgBZdjwE2UNuA7wlwAFaajWGoYKzEmxu2Vc3I5LQDP9
         13WLTyJObYQJpN0Vrbh85uSpzydk75JUKuM7vySTdjtkykXEQpPAvOh/EkGX5S+aqDGo
         aM8g==
X-Forwarded-Encrypted: i=1; AJvYcCWEin0qQv9+U+u2IGrWl4+VqjKEoXJvnW3oBOaShYQjB+6CwyEwzrZgXMrIDdReAIFwoEvs7JebQcleHHI=@vger.kernel.org, AJvYcCWPHFlwRtNuseBhvRKVlYDxhBpTJVXWnZnQaRSey9hBUmcjbqtjGW943fpv2Vawv4VSCfDQuK13OBw9KEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYDdxXAy5MQfueqN1Hz55j0kUGrQrWwZcsyLYg01VVgoGUjiU
	fdy5M400Z8EqXXLhV+uvO7PcUvm0HVXYL/l5awR/HwiRAlVSa4NT
X-Gm-Gg: ASbGnctKt7Nz/TIF5yRy5HFtZrTOzkuIEpk3vACh2ZDyijUBYu8urefL06pKd0lqtSO
	/bLsDyWmmY5efpmJm+zuTkzKZTleSlxvs0xTv879QiZq9eFa1oqA4cgDSJfs0w0IfOr0xUbMRgj
	0ozEwquwujA9XpJpB+tCbpuH+YfbMhl5XBiL+jliIZD1RA0qxk/cWp6EJu60C7bZZYOCsRacAoT
	AzM9E1URp0A1zANinN0rkQkHlk4SMM0SfaXvJmdh4Kh/lzUEc6k7kSJoP2Y9C0g
X-Google-Smtp-Source: AGHT+IESxIXB3LIDME4haolgtpRkBfVpIxS+jDSOSOJs5KwmgJCEscuIBBgh7ZxSiBwgOvnmi6Kn7w==
X-Received: by 2002:a5d:59a3:0:b0:37d:354e:946a with SMTP id ffacd0b85a97d-38260bdfa76mr2661343f8f.50.1732286240836;
        Fri, 22 Nov 2024 06:37:20 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.131.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45bdafbsm92219825e9.17.2024.11.22.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 06:37:19 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: v4l: subdev: Prevent NULL routes access
Date: Fri, 22 Nov 2024 16:37:12 +0200
Message-ID: <20241122143717.173344-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using v4l2_subdev_set_routing to set a subdev's routing, and the
passed routing.num_routes is 0, kmemdup is not called to populate the
routes of the new routing (which is fine, since we wouldn't want to pass
a possible NULL value to kmemdup).

This results in subdev's routing.routes to be NULL.

routing.routes is further used in some places without being guarded by
the same num_routes non-zero condition.

Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cde1774c9098d..4f0eecd7fd66f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -605,6 +605,23 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
+static void subdev_copy_krouting(struct v4l2_subdev_routing *routing,
+				 struct v4l2_subdev_krouting *krouting)
+{
+	memset(routing->reserved, 0, sizeof(routing->reserved));
+
+	if (!krouting->routes) {
+		routing->num_routes = 0;
+		return;
+	}
+
+	memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+	       krouting->routes,
+	       min(krouting->num_routes, routing->len_routes) *
+	       sizeof(*krouting->routes));
+	routing->num_routes = krouting->num_routes;
+}
+
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			    struct v4l2_subdev_state *state)
 {
@@ -976,7 +993,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 	case VIDIOC_SUBDEV_G_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
-		struct v4l2_subdev_krouting *krouting;
 
 		if (!v4l2_subdev_enable_streams_api)
 			return -ENOIOCTLCMD;
@@ -984,15 +1000,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
-		memset(routing->reserved, 0, sizeof(routing->reserved));
-
-		krouting = &state->routing;
-
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       krouting->routes,
-		       min(krouting->num_routes, routing->len_routes) *
-		       sizeof(*krouting->routes));
-		routing->num_routes = krouting->num_routes;
+		subdev_copy_krouting(routing, &state->routing);
 
 		return 0;
 	}
@@ -1016,8 +1024,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (routing->num_routes > routing->len_routes)
 			return -EINVAL;
 
-		memset(routing->reserved, 0, sizeof(routing->reserved));
-
 		for (i = 0; i < routing->num_routes; ++i) {
 			const struct v4l2_subdev_route *route = &routes[i];
 			const struct media_pad *pads = sd->entity.pads;
@@ -1046,12 +1052,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		 * the routing table.
 		 */
 		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
-			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-			       state->routing.routes,
-			       min(state->routing.num_routes, routing->len_routes) *
-			       sizeof(*state->routing.routes));
-			routing->num_routes = state->routing.num_routes;
-
+			subdev_copy_krouting(routing, &state->routing);
 			return 0;
 		}
 
@@ -1064,11 +1065,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (rval < 0)
 			return rval;
 
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       state->routing.routes,
-		       min(state->routing.num_routes, routing->len_routes) *
-		       sizeof(*state->routing.routes));
-		routing->num_routes = state->routing.num_routes;
+		subdev_copy_krouting(routing, &state->routing);
 
 		return 0;
 	}
@@ -1956,6 +1953,9 @@ struct v4l2_subdev_route *
 __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
 				struct v4l2_subdev_route *route)
 {
+	if (!routing->routes)
+		return NULL;
+
 	if (route)
 		++route;
 	else
-- 
2.47.0



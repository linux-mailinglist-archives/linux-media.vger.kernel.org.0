Return-Path: <linux-media+bounces-26408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74DA3C84F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0936E7A4546
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1321B9ED;
	Wed, 19 Feb 2025 19:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOgNRZJq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F621B183;
	Wed, 19 Feb 2025 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992309; cv=none; b=fRBUX4fLDG/2LPXuaSbVYcy2OoDWBVGdGLVU8kcJrLzzD/GD5Jl/LEahJ8Eq//UfQn0/kkplkDBf0kXhlAbO9ZyGrruJFBa2lwdx2AF8q3o85jeKD42JgBt7UDn66y07Bj/W8vkwtEPp7DRGRk/JvywOh16YHb9lK0pvXq3ji9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992309; c=relaxed/simple;
	bh=CxD10gBKhnBlBboDKHEiIi7FSS2bsuepkGgdDzeKRqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9Ps7G0+z7TFKbDdoQkBILXdXxbFvjh31V4XkiaSXsNT58pLD86lM1Nn8bfuC0AFHP3C1FmRLH34HfDXLop9nBcX5AL8VeJwT3E3JT7ePOQRDx0ZM+vAqnWbTPLDx+tAh4M1kYngVm6DJA4h6dojRWVIrLU+gBtaZM5i6atdiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOgNRZJq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec61d0f65so38689966b.1;
        Wed, 19 Feb 2025 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992306; x=1740597106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=FOgNRZJq7H5wH922/7Ugvp5vTy0QhsOFZHScyskhjrGihipN7Tqd2lLzvJb+LCtuP7
         WwfOMZh+zO9Wsp+LIDqL3TA7JHK65eLpsV4WeCBM6nL2hWt0as1JbRv6XYwd5Iig0ztS
         CH6QyGfpacht8q2JUkh8GsdXztAoy8ag4C8pVsTmBGB5HEvKWfiwrEBsqnRadk5H79rG
         /obSXf5zNKJU09pwUpAcgnTfBKtWC1zND8HOzw8qvalb3JkLfRc3nOm3ApcG8PQ6YHv1
         qL9ERq4JO05GZU1Fx3MG+Z0Z0WO7nuyAt4ZYLQLxy5Gu8iv0/xxW4oWBlCGBqGuJLHE5
         Rs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992306; x=1740597106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=EP9U5A7bI0i0ug2duAoJigvvrODYYi6VTa0YaMVASbAIxYzSxMYd6OWUuGx9wMjiTp
         KPJT4dpvDOuiG/Z5zfS7LJ2q9n98yRic4XNTKFSpjlWQAAjphx9Wgs9/TKfUeIFo81/y
         bgkPZwpMhA8wfrk3CsnAhc3wJ5uHt0UVdGqGMVuJ/+34poXu0biUCprI81GxgdE89zkR
         aKTOcYaG8fxVfi8Q9SPm6CBz+pLGGa46PuEJGsujE7fNDWMRoDpMZrVjyBj6vFu6itYF
         s0teo5uwOvDqteiLenOeGaaneojI1so2E7dDHLDyH5kxhopNoDi4HNhUP0uBPbq1wpM7
         gM5w==
X-Forwarded-Encrypted: i=1; AJvYcCVbOWRtcmxPs2TRvgnoyGxT+ondce53KhJxI9/IbaMsmywL3FNO9IpETQvDOO8pJO3zH455bX2kYacnpp4=@vger.kernel.org, AJvYcCWfQ81qStxS4xvU2Qw4Gx4QvIFMlIPRprt/csO4wJk7A12BouL9GJz2k6LcSMsff61aTyKzJuBQytIUG4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqQpseozSJSrSSDx1k8TsVuOyKkg78yPENLY5bsqwOE32SAHw
	pNZRrm5K2MejDvlGyE0U48x+ZACStQi/GtBIAHp72YyumeQE+syK
X-Gm-Gg: ASbGncuNnFnOpthKCH3t4ij+tByRBBSm1KhwrpsDXMLbHykOiDMR6XH2a3LUhpkx85I
	cLswgh8IooeDv33J50rtyWoqcJ4kXc55plwO6mVyJHomXUujpy67lQQYKyUzttPd+JpQhKy8Awf
	kkuR8mZs2+qm6YpyIEaUiclLqBmWfVODzCcg5acEz1t5qAx8f/+5M4B8VIGmNGloFeRG0Nr3JkK
	dg42uijvcVbAT35eZ+G57Apm77s5J84OGHAVvKwFNQDDmgghZJEAs/2wBFEAnSHOKM2ObAkJ1TA
	v4vzZZuX0uWsEM8CfwF9lezTJF1N
X-Google-Smtp-Source: AGHT+IGt33FKjogW2MeCmEg4l06p7Iw7k+Kx5sL28n3odtsZTl47FrANkRpgYS+18doFVosGl8reHA==
X-Received: by 2002:a17:907:2da0:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-abb71159ef2mr2192693566b.37.1739992305822;
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:30 +0200
Message-ID: <20250219191136.215151-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++++---
 include/media/v4l2-subdev.h           | 18 ++++++++++++++++--
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cde1774c9098d..d1581f1036487 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2042,10 +2042,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams)
 {
-	const struct v4l2_subdev_krouting *routing = &state->routing;
 	struct v4l2_subdev_route *route;
 	u64 streams0 = 0;
 	u64 streams1 = 0;
@@ -2066,6 +2065,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 	*streams = streams0;
 	return streams1;
 }
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
+
+u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
+				    u32 pad0, u32 pad1, u64 *streams)
+{
+	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
+}
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
 
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b038..90d08e13e016b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1582,9 +1582,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @state: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1601,6 +1601,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  *
  * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
  */
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams);
+
+/**
+ * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ *
+ * @state: Subdevice state
+ * @pad0: The first pad
+ * @pad1: The second pad
+ * @streams: Streams bitmask on the first pad
+ *
+ * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
+ * state as parameter
+ */
 u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 				    u32 pad0, u32 pad1, u64 *streams);
 
-- 
2.48.1



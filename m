Return-Path: <linux-media+bounces-10962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1378BDB08
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B15A1C20BAC
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 06:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FB96EB5C;
	Tue,  7 May 2024 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UnNNn23e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F906BFD5;
	Tue,  7 May 2024 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061817; cv=none; b=jXuTkncYc3ysrZjtjNqcXo60AXwkJT/5GqJox+ZrN0zIwqIdnKt11wI9P9jt2n9nxnMQ4uCyQ1iXmNIjsoBnbstUM7cgRCDEjATCzFQJNpdaIACrUpoMW0w5T6xo0ovqjYLQnBP894Fr9lok1SWo5XDYYejPFRakURk6n9y4dvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061817; c=relaxed/simple;
	bh=CAfZBviyEOgNMqsGAM9sVQjH0LaJVid1J1G79UQlAb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNc7+e72xv1kfCHSfhsu7LVz/nOay7Gi2svRFQfZoC5QnPT8Ep5FTGm5gSFTtg9sbxDLlDR0jMnn8zq4VGGiNXHUCCVGWxxW2Je14+pyULLy5htwk1KG5R7QngYFSVSpk4B/mfoCDKKxbz2oszmvcRHx5fQaHQYli3+vKJNVQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UnNNn23e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 101ABA98;
	Tue,  7 May 2024 08:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715061811;
	bh=CAfZBviyEOgNMqsGAM9sVQjH0LaJVid1J1G79UQlAb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnNNn23ezDwfKmjV52iKAmgE72r7W2zhEZII5A/1ySGgNqm8MCuW9aXm+vypdzqcO
	 3Nvw2nKQYkQ82bPlvD7M2YxOjoG6cQmPnM2ClldQJNYZlfAZ0gZjxmMsJHfPKGBekz
	 d/vVpA2Mqbuo3b0uxVqGtLSAZD6CMQZe8h95esLQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/2] media: v4l2-subdev: Provide const-aware subdev state accessors
Date: Tue,  7 May 2024 09:03:22 +0300
Message-ID: <20240507060323.26950-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507060323.26950-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240507060323.26950-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It would be useful to mark instances of v4l2_subdev_state structures as
const when code needs to access them read-only. This isn't currently
possible, as the v4l2_subdev_state_get_*() accessor functions take a
non-const pointer to the state.

Use _Generic() to provide two different versions of the accessors, for
const and non-const states respectively. The former returns a const
pointer to the requested format, rectangle or interval, implementing
const-correctness. The latter returns a non-const pointer, preserving
the current behaviour for drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Wrap the accessors with _Generic() using a single macro instead of
  adding a _Generic() statement in each of them.
---
 include/media/v4l2-subdev.h | 40 +++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e30c463d90e5..c8cfa1eaa82f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
 #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
 	__v4l2_subdev_state_get_ ## NAME ## ARG
 
+/*
+ * A macro to constify the return value of the state accessors when the state
+ * parameter is const.
+ */
+#define __v4l2_subdev_state_constify_call(state, value)			\
+	_Generic(state,							\
+		const typeof(*(state)) *: (const typeof(value))value,	\
+		default: value						\
+	)
+
 /**
  * v4l2_subdev_state_get_format() - Get pointer to a stream format
  * @state: subdevice state
@@ -1340,16 +1350,17 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
  */
 /*
  * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
- * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
+ * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
  * macro below is to come up with the name of the function or macro to call,
  * using the last two arguments (_stream and _pad). The selected function or
  * macro is then called using the arguments specified by the caller. A similar
  * arrangement is used for v4l2_subdev_state_crop() and
  * v4l2_subdev_state_compose() below.
  */
-#define v4l2_subdev_state_get_format(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_format(state, pad, ...)				\
+	__v4l2_subdev_state_constify_call(state,				\
+		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_format_pad(state, pad)	\
 	__v4l2_subdev_state_get_format(state, pad, 0)
 struct v4l2_mbus_framefmt *
@@ -1368,9 +1379,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_crop(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_crop(state, pad, ...)				\
+	__v4l2_subdev_state_constify_call(state,				\
+		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
 	__v4l2_subdev_state_get_crop(state, pad, 0)
 struct v4l2_rect *
@@ -1389,9 +1401,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_compose(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_compose(state, pad, ...)				\
+	__v4l2_subdev_state_constify_call(state,				\
+		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
 	__v4l2_subdev_state_get_compose(state, pad, 0)
 struct v4l2_rect *
@@ -1410,9 +1423,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
  * For stream-unaware drivers the frame interval for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_interval(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_interval(state, pad, ...)				\
+	__v4l2_subdev_state_constify_call(state,				\
+		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
 	__v4l2_subdev_state_get_interval(state, pad, 0)
 struct v4l2_fract *
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-11177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED28C0671
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6328EB2119D
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCEE132C37;
	Wed,  8 May 2024 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YeZD99iA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452813248B;
	Wed,  8 May 2024 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715204462; cv=none; b=kVkcR5YvJ3UYo57OmiXgC7iRZ5AigHWhY5MhAGQ9L4E3Lef+bRsNwd3fcfFnmJoBAP0Y53Ro4JQW/iuJNmxyZ3XvSG9mu3Fnc6y7P5C9MLaCnGtC5PH6FuSnE0UWucm1aXXdDGGFBGMnXjJqO2AN2e3xv1TwSxGHpds+PxHdGDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715204462; c=relaxed/simple;
	bh=kRYOBfB3Skh5PpdSwvI6oBAoy/LqssM5t1B1xt8dPlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyOX5hudOtFAz8k+OO23qpGrPgbSe02h3eVkNcN1qnmtodr1L0e3U+D2HO+0XuzoK75v4kb629rqZGaLUs+oQydLCzM8cCkkquiuh+g2SCZmLnrlkc+yXlnUNgtgJ6UzJVXEUNSgQVir1M0d7M86mdynz1Rif4hPOFf1Ig5Yh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YeZD99iA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA2A2CC7;
	Wed,  8 May 2024 23:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715204454;
	bh=kRYOBfB3Skh5PpdSwvI6oBAoy/LqssM5t1B1xt8dPlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YeZD99iAM6EifyVruYgs8/eR+mXchCMIkmHhAe6cN7e7v1EJ7ruUxstqW7Cx2RMbN
	 aPJhidVPo1FiKkmmCk6nBiIHiV4pLHTyRnLSWarFJOLw6S2LL1ibcVCakEUNC+XCPY
	 o+906xzTgMjJKh0Fdb1hkSRXDFU+/otUh8eaHGKY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 2/3] media: v4l2-subdev: Provide const-aware subdev state accessors
Date: Thu,  9 May 2024 00:40:44 +0300
Message-ID: <20240508214045.24716-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since v3:

- Rename __v4l2_subdev_state_constify_call() to
  __v4l2_subdev_state_constify_ret()
- Update documentation

Changes since v2:

- Specify types explicitly in _Generic() expression
- Fix cast of value to const pointer

Changes since v1:

- Wrap the accessors with _Generic() using a single macro instead of
  adding a _Generic() statement in each of them.
---
 include/media/v4l2-subdev.h | 48 +++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b25b6e97ecbd..e1a6c49a966d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
 #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
 	__v4l2_subdev_state_get_ ## NAME ## ARG
 
+/*
+ * A macro to constify the return value of the state accessors when the state
+ * parameter is const.
+ */
+#define __v4l2_subdev_state_constify_ret(state, value)				\
+	_Generic(state,								\
+		const struct v4l2_subdev_state *: (const typeof(*(value)) *)(value), \
+		struct v4l2_subdev_state *: (value)				\
+	)
+
 /**
  * v4l2_subdev_state_get_format() - Get pointer to a stream format
  * @state: subdevice state
@@ -1343,13 +1353,18 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
  * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
  * macro below is to come up with the name of the function or macro to call,
  * using the last two arguments (_stream and _pad). The selected function or
- * macro is then called using the arguments specified by the caller. A similar
- * arrangement is used for v4l2_subdev_state_crop(), v4l2_subdev_state_compose()
- * and v4l2_subdev_state_get_interval() below.
+ * macro is then called using the arguments specified by the caller. The
+ * __v4l2_subdev_state_constify_ret() macro constifies the returned pointer
+ * when the state is const, allowing the state accessors to guarantee
+ * const-correctness in all cases.
+ *
+ * A similar arrangement is used for v4l2_subdev_state_crop(),
+ * v4l2_subdev_state_compose() and v4l2_subdev_state_get_interval() below.
  */
-#define v4l2_subdev_state_get_format(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_format(state, pad, ...)				\
+	__v4l2_subdev_state_constify_ret(state,					\
+		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_format_pad(state, pad)	\
 	__v4l2_subdev_state_get_format(state, pad, 0)
 struct v4l2_mbus_framefmt *
@@ -1368,9 +1383,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_crop(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_crop(state, pad, ...)				\
+	__v4l2_subdev_state_constify_ret(state,					\
+		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
 	__v4l2_subdev_state_get_crop(state, pad, 0)
 struct v4l2_rect *
@@ -1389,9 +1405,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_compose(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_compose(state, pad, ...)				\
+	__v4l2_subdev_state_constify_ret(state,					\
+		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
 	__v4l2_subdev_state_get_compose(state, pad, 0)
 struct v4l2_rect *
@@ -1410,9 +1427,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
  * For stream-unaware drivers the frame interval for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
-#define v4l2_subdev_state_get_interval(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
+#define v4l2_subdev_state_get_interval(state, pad, ...)				\
+	__v4l2_subdev_state_constify_ret(state,					\
+		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
+			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
 #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
 	__v4l2_subdev_state_get_interval(state, pad, 0)
 struct v4l2_fract *
-- 
Regards,

Laurent Pinchart



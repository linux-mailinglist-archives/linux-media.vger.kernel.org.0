Return-Path: <linux-media+bounces-26435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E765EA3D47C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC0B16563D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894E31EEA42;
	Thu, 20 Feb 2025 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYTWUCr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE01EE006;
	Thu, 20 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043248; cv=none; b=G3NIT8E+UlFpbd+cX7wO6putDtHChUqSTqs0Puk2CCbypoJm8T5R51qBIqURqzD1nQTbk3LwrFhfzPsAIvitR6My3Qe0mo7db4zZTDah+/XhB+n65NwVoJhh7xgcqznv5dNoQRWje4L4fanBunG63R8gCxdoh+PrTAMSXRC3mkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043248; c=relaxed/simple;
	bh=BshHmlA8ttxolsOurdqseo8CCumiC32LYbngrBvTgbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLnLsgDCG7ftPuW/zMtwlqbR+GLj71Oj8QbyqdOiAv9n/4syNkNrzaCY8BWO59gCfvxv49fw4ORagWi0Q0IN6Hh/sC1tUVR95zR2ZwxnvuvVvmNdcZOlFFDQJjcRl9BbLT98ZziNn6yItcOWGry+roe5OmFn4mp8lXweX6StqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYTWUCr0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so1035402a12.0;
        Thu, 20 Feb 2025 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043244; x=1740648044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=dYTWUCr0JLiy7uE8nssaGh0GTJ+AcBRErfzaSYFoybrUE/a+hmwWRPTuY999+SNzyA
         UV9t9FoUmhNHboWB1SHMuxZpvYIGgkWeaiO93OwipkREsXN4p71Hg+s0V91Q38Gd1yKB
         usnKyvif0NijLo1iCHZFdv/qzb0MqDkvqwq95Mvw6KrvYw8DCGFrhnzMTv3eegEBhdLs
         f9VtOm7P6r083GQeN8NKbCnKA6BDjhuLGdHsaYIsMLGjEDLYonVKZr3HrL7apwHkg2kv
         xkf+ZpLt8oOjOtIX0lwxWjTGrWHcnH8swjyEpzal0dIZSM4OKHfYvFmsHFjpnZcvnGKD
         Y/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043244; x=1740648044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=V6i2j5cV1iRxf0v6j4zicVPsqzC/x3iYyq/ZF+HYP//Z6rxcWNBk1qh0oFuMXYYJFj
         LX/fUhH+awCHSdQvb7+Eooq+uGtD0ADSfThA1HRAKAnY0Pv4lKbmvFwJcpuIRs+q12O6
         kOmQ2/e2jRWxhfYjc7aMgyuEV6xkcAGcF6aKPilopcNKWUDHVVTtTxTDCGFysXlzaNdl
         ClpBBaArtxY12K2d6KuomV6ya+w08pQPhHjM8jTrZ5iRFmWJ/2BjyZGNCzv60jS1/5ue
         fQuC4onkvh2h9Q17LjB/Y/rEehH/dBYsfD3JGhBfCgIvx2/ZAxlZyhYaEwX8uDfUVpex
         mueg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkQvp445XZtRZ1x/BTykEx3rm0Pvz/ntc2QlMTAvyR4VM+I7BCbOP5PrVe2APPtUcOzfIN+F5wqA1IPU=@vger.kernel.org, AJvYcCVVrbRH4RJd4IZhCMrqD5azux6npmYgkR1/RbkksmY/3Mf2dt/WxNPGqPhQRsZ4QJY8Wo9z9Muntd24Z4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4wZkyv+d8+wmlcK4Uhr4IdOflfFaUnnqeblit4XzJQv2yWxQ
	CAF65HyAYMNuSiMMnYoQNP2hMsIFLf/fYqPRLEZnKxMOS9QnSk66
X-Gm-Gg: ASbGncu/7fA/RsmfBQqvG+wekOMLK3FaH24sK2o/YjarzuT7L91U5v/GMkRVyyTbFAK
	UtgJhfuFEBea8O46ZW3OcZUuVX4wkFy3irgDoqAjrkrtA2Yd085QebCbQOiv2bYldg+Br/6AJPw
	bfav7wxJOYghCUg2bnRNzBZ8BpgDgFnMFRFQLuSIizH8iW0SyUIiSvyHUtb6fw4rXe39LVenehC
	cDyBJpVZhEIodDMViDbZWQW100rhhiD6hDCvb/ie/MrMuhU1lEDcToi6HYwGM/oS4ZduCcCR4lV
	jdckSnGQOoI3Zd8rsTLZ/bAXbij8
X-Google-Smtp-Source: AGHT+IGELBAVHlT1FsAwAPLAfs/8eHa7w1H1BXAuCz31GVyau0LU+/O4GL+wfZn7+PcEvnxYdppSug==
X-Received: by 2002:a05:6402:1ecd:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5e03602f764mr55679741a12.11.1740043243699;
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
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
Subject: [PATCH v2 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:33 +0200
Message-ID: <20250220092036.6757-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
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
 include/media/v4l2-subdev.h           | 20 +++++++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b150..91fa51259237e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2044,10 +2044,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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
@@ -2068,6 +2067,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
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
index 57f2bcb4eb16c..e49dba3c59bd6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1584,9 +1584,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @routing: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1595,7 +1595,7 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  * the subdev state routing table. Stream numbers don't necessarily match on
  * the sink and source side of a route. This function translates stream numbers
  * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
- * on @pad1 using the routing table from the @state. It returns the stream mask
+ * on @pad1 using the routing table from @routing. It returns the stream mask
  * on @pad1, and updates @streams with the streams that have been found in the
  * routing table.
  *
@@ -1603,6 +1603,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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



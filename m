Return-Path: <linux-media+bounces-10040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 910228B0E0E
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B781C21565
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A61F16130A;
	Wed, 24 Apr 2024 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PEJLZ8iJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C715F41B
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972167; cv=none; b=KwdSTZhZLLfKLuXWq9SQVLIGUj/tLrmj4BrfnCOCHI/1FkN77cHPHbE8ohdKSDDiLk/604BPrrlKeAz3r8rLUXg2NsCxa/ca7BmQc7E1pROIodw8i7+U21alb2HG2l15dPxFKI2oMub14Sfxuho+LOilOlh4sLPoEeaZNYzEIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972167; c=relaxed/simple;
	bh=hu0zJ/QFEMLEU6RuYsFNrt8WLJaHK6I/J8PfmvjXz4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtVsC85PLUhqNQgRtG2RO4wsFzbyLaf7q0mGrA2qz/WLV5JKbDe5XVi7AwwyxYIpnVBgqzbDq7Jis+aQrTXzz8eH3qrHjCxlGGaUlFd6J6keK0PAyYBJzCCTUQ2KZfBHuGYEDWwijBpe3gJAg3V/wAS23YAzVLtFk2OUs15ZLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PEJLZ8iJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBD0D674;
	Wed, 24 Apr 2024 17:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972109;
	bh=hu0zJ/QFEMLEU6RuYsFNrt8WLJaHK6I/J8PfmvjXz4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEJLZ8iJkMjcuyJzP6fceeImCm2qUdIDCZT+4iNYoH1l3GVC/dDuuMco9HGd2+kSW
	 f+4l87bbZxdMj3TN8WTGlPhVJSQfBxatP8Dt846TwrQ2EvtRtKWmUudh/d27guIf1W
	 9yiX0004C5TSO0rnLosqzTiGvcWrrEBFXOAflwQw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 5/7] v4l-utils: sync-with-kernel
Date: Wed, 24 Apr 2024 18:22:28 +0300
Message-ID: <20240424152230.31923-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update v4l-utils to the kernel headers from the internal pads series.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/linux/media.h                    | 1 +
 include/linux/v4l2-subdev.h              | 5 +++++
 utils/v4l2-tracer/v4l2-tracer-info-gen.h | 1 +
 3 files changed, 7 insertions(+)

diff --git a/include/linux/media.h b/include/linux/media.h
index b5a77bbf4062..4a733b9beb27 100644
--- a/include/linux/media.h
+++ b/include/linux/media.h
@@ -206,6 +206,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
index 6a39128d0606..c6f1228d43b1 100644
--- a/include/linux/v4l2-subdev.h
+++ b/include/linux/v4l2-subdev.h
@@ -204,6 +204,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable. The ACTIVE flag of an immutable route may not be
+ * changed.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
index 1ed43074407e..51eeb7b7ec60 100644
--- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
+++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
@@ -1852,6 +1852,7 @@ constexpr flag_def media_pad_flag_def[] = {
 	{ MEDIA_PAD_FL_SINK, "MEDIA_PAD_FL_SINK" },
 	{ MEDIA_PAD_FL_SOURCE, "MEDIA_PAD_FL_SOURCE" },
 	{ MEDIA_PAD_FL_MUST_CONNECT, "MEDIA_PAD_FL_MUST_CONNECT" },
+	{ MEDIA_PAD_FL_INTERNAL, "MEDIA_PAD_FL_INTERNAL" },
 	{ 0, "" }
 };
 
-- 
Regards,

Laurent Pinchart



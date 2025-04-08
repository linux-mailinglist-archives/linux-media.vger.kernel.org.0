Return-Path: <linux-media+bounces-29700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9BA81968
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 01:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D76619E4149
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F15256C91;
	Tue,  8 Apr 2025 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IKT39r8l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08269255E2A;
	Tue,  8 Apr 2025 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155235; cv=none; b=teiONa8bhDnBsfr3KqhoRZ6PvP6W/qZUaehubh+dqjI1rfehcFE7Hbz7O5N0sJdpM+cHT3nYafuO9dl0wY1k5DS92ANCzeSGQ6i7/dPJZ9fFmU4T6LYAWOqLlWAi8hkrP4gDqb8oHazzWzowowZgerXHD5tydCSK90tlfsNZRu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155235; c=relaxed/simple;
	bh=3L5YdB7siMfYHh4+o1FSVjyMr7VZp/zRYQuZaOhjLM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kngSug8ZEGw4j9KMGUbYJIxPeBcbPEzQfvu7URDl1/dBxVNAjSonpYDxUWYuKS3lUVHved/KS6FpgJ8uykCKYiY/oeTrvB+GtgmYdilYYyi5TeeTtDzPIfadzRA35H0y24vKHqfSVkudsMdX3Jhy0/ou811UUKCTx6yc23LIxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IKT39r8l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2042883D;
	Wed,  9 Apr 2025 01:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744155114;
	bh=3L5YdB7siMfYHh4+o1FSVjyMr7VZp/zRYQuZaOhjLM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IKT39r8l8RaWDiID2blRY+3gpUXEFCvhhrRre4pBMfwShbRR87mMDpC7JAtKzZgaq
	 IRotS78/xM68udIvHlQotHPecQh3oVniDRagQHevpEx1m8CRW75RWFcUqU5LubZjHr
	 PTNhEpEBdp8TPEGeUrSF1z2oVZkkXTIpSOirfbwE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [yavta] [PATCH 2/3] Constify various global variables
Date: Wed,  9 Apr 2025 02:33:22 +0300
Message-ID: <20250408233323.7650-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
References: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Multiple global variables are not meant to be modified. Make the const.
While at it, drop an incorrect description of a section header.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 yavta.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/yavta.c b/yavta.c
index 89b5c4a24cfc..4f7306daa0ce 100644
--- a/yavta.c
+++ b/yavta.c
@@ -185,7 +185,7 @@ static int pause_init(void)
 }
 
 /* -----------------------------------------------------------------------------
- * Pause Handling
+ * Format handling
  */
 
 static bool video_is_mplane(struct device *dev)
@@ -214,7 +214,7 @@ static bool video_is_output(struct device *dev)
 	       dev->type == V4L2_BUF_TYPE_META_OUTPUT;
 }
 
-static struct {
+static const struct {
 	enum v4l2_buf_type type;
 	bool supported;
 	const char *name;
@@ -261,7 +261,7 @@ static const char *v4l2_buf_type_name(enum v4l2_buf_type type)
 		return "Unknown";
 }
 
-static struct v4l2_format_info {
+static const struct v4l2_format_info {
 	const char *name;
 	unsigned int fourcc;
 	unsigned char n_planes;
@@ -449,6 +449,10 @@ static const char *v4l2_field_name(enum v4l2_field field)
 	return "unknown";
 }
 
+/* -----------------------------------------------------------------------------
+ *
+ */
+
 static void video_set_buf_type(struct device *dev, enum v4l2_buf_type type)
 {
 	dev->type = type;
@@ -2329,7 +2333,7 @@ static void usage(const char *argv0)
 #define OPT_DATA_PREFIX		271
 #define OPT_RESET_CONTROLS	272
 
-static struct option opts[] = {
+static const struct option opts[] = {
 	{"buffer-size", 1, 0, OPT_BUFFER_SIZE},
 	{"buffer-type", 1, 0, 'B'},
 	{"capture", 2, 0, 'c'},
-- 
Regards,

Laurent Pinchart



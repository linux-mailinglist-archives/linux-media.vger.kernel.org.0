Return-Path: <linux-media+bounces-8318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B41894812
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 350B2B212B5
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBE910F7;
	Tue,  2 Apr 2024 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MzTUYpf9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BB19F
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016049; cv=none; b=OxJLh0u/ZlwLlNY61HW4TL8oNrWPecNijVpzE/j9GTpu9UQn5g3qHlFPvJelLSjsAwreE03yUMuji4xEefcdmsb0hx6MTZ/IxUsGq2vdKLQ9FEKUpkRpOSyx19ybfZLUym1+aeyFjZd2NK2n9OZQuZrWd+jXI8RxGbJ/bi6PlMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016049; c=relaxed/simple;
	bh=ryiY/nc0AI8HR+CDFzHKJoR+7vPiehaIRViZpqDQFO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPUQymrZBOQZICe+Wd+8Xf+nSxP6LYBBwDVUtFldSNECFqZLKDa78Ui8OUp/zVQHtfb08FAj24rlt03j8YCvDU81Zk9dSDbn9NUO2vzMssWIEanxWws6xKwThS6mxG+xRbqnVQhXI0Kf8rW3prruj69b5BIGxigV2itD6XU1lIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MzTUYpf9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C78DC55;
	Tue,  2 Apr 2024 02:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016008;
	bh=ryiY/nc0AI8HR+CDFzHKJoR+7vPiehaIRViZpqDQFO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzTUYpf9IEjb0KkOlnT/HJMalku4Hal/3jiYXUFT4iVmpjVEUoZKQbXHlHQLfCkpo
	 NSoUpcyr+NBsm2CA3ouGQCbcOnh2u56ZnbNHLp76ehJTkDSR2btNcJK0B93latQSc6
	 +h5U08BnNmukhbgaRw/L8tdT3/IBgjFPktx3jnrc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad flags
Date: Tue,  2 Apr 2024 03:00:26 +0300
Message-ID: <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Print the MUST_CONNECT pad flag for each pad.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 2081f111f2db..1b40552253f1 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
 	}
 }
 
-static const char *media_pad_type_to_string(unsigned flag)
-{
-	static const struct {
-		__u32 flag;
-		const char *name;
-	} flags[] = {
-		{ MEDIA_PAD_FL_SINK, "Sink" },
-		{ MEDIA_PAD_FL_SOURCE, "Source" },
-	};
-
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(flags); i++) {
-		if (flags[i].flag & flag)
-			return flags[i].name;
-	}
-
-	return "Unknown";
-}
-
 static void media_print_topology_dot(struct media_device *media)
 {
 	unsigned int nents = media_get_entities_count(media);
@@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
 		v4l2_subdev_print_subdev_dv(entity);
 }
 
+static unsigned int weight(uint32_t word)
+{
+	unsigned int w = 0, i;
+
+	for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
+		w += word & 1U;
+
+	return w;
+}
+
+static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
+{
+	static const char *empty = "", *comma = ", ";
+	if (!(flag & flags))
+		return empty;
+
+	return weight(prev_flags & flags) ? comma : empty;
+}
+
 static void media_print_topology_text_entity(struct media_device *media,
 					     struct media_entity *entity)
 {
@@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
 	for (j = 0; j < info->pads; j++) {
 		const struct media_pad *pad = media_entity_get_pad(entity, j);
 
-		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
-
+		printf("\tpad%u: %s%s%s%s%s\n", j,
+		       pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
+		       comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
+			     pad->flags),
+		       pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
+		       comma(MEDIA_PAD_FL_MUST_CONNECT,
+			     MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
+			     pad->flags),
+		       pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
 		media_print_pad_text(entity, pad, routes, num_routes);
 
 		for (k = 0; k < num_links; k++) {
-- 
Regards,

Laurent Pinchart



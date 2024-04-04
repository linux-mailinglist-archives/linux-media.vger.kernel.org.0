Return-Path: <linux-media+bounces-8682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AB8990F6
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 00:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77C71F2241C
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 22:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF60013C3D8;
	Thu,  4 Apr 2024 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="unVIOfsT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CC1384AE
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268207; cv=none; b=jugAcX8fpJyDtTQNYim36pUZZL2P6rSwNI7bmID6NoD58VUHqiZGkxg2F/Aplp3hbw851ncnwiED9WGir2y5zxRJaJzOj5hmAsEZtthl1/5D2po5r90ZtD22g11Tl6SmT2wBebCOVOb+x+0a+18mVeZ/5sZp3GsAVqX6Ujhh74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268207; c=relaxed/simple;
	bh=QxFI2iW/TvHpNZmpXoIkP3S0c7HdaNAoV4aetL9zfy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VT+P5GjoIb6XajCZRZq87H2dx7UcWFq/0+34Nw855mKdkAx+TXPYZ7t0n/r1KUDyaKaGBL6ZggWQTWYHnn+6bdKfc1gW/8CKOJVWMT3i3TYraklE27jkHj8dJEqAAyHpq81LYVsmq3J7sQ9dGOAiXQvjsmKS/vUDBWO9n7f5KvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=unVIOfsT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D3F322A;
	Fri,  5 Apr 2024 00:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712268165;
	bh=QxFI2iW/TvHpNZmpXoIkP3S0c7HdaNAoV4aetL9zfy4=;
	h=From:To:Cc:Subject:Date:From;
	b=unVIOfsTnSRjale87brPlljjnpZQzgo65s2oV1SWTndOvtQGCR4F2rNeljm5tQ7uX
	 n3q9EkDspxGpDSPMMnQZTJZ3welCEEC2rPZIWgaFi6OSvqsfXCOO+/us25MxJqI5EQ
	 l8Myg/Ry0f+L+iuxqMFYEu3TVjlJItn2JkHqE82Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2] utils: media-ctl: Print the MUST_CONNECT pad flag
Date: Fri,  5 Apr 2024 01:03:11 +0300
Message-ID: <20240404220312.8019-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the introduction of the MUST_CONNECT pad flag, pads can have
multiple flags. Print them all using the print_flags() helper function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Use print_flags()
---
 utils/media-ctl/media-ctl.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 2081f111f2db..1a9e393ac1f3 100644
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
@@ -533,6 +513,11 @@ static void media_print_topology_text_entity(struct media_device *media,
 		{ MEDIA_LNK_FL_IMMUTABLE, "IMMUTABLE" },
 		{ MEDIA_LNK_FL_DYNAMIC, "DYNAMIC" },
 	};
+	static const struct flag_name pad_flags[] = {
+		{ MEDIA_PAD_FL_SINK, "SINK" },
+		{ MEDIA_PAD_FL_SOURCE, "SOURCE" },
+		{ MEDIA_PAD_FL_MUST_CONNECT, "MUST_CONNECT" },
+	};
 	const struct media_entity_desc *info = media_entity_get_info(entity);
 	const char *devname = media_entity_get_devname(entity);
 	unsigned int num_links = media_entity_get_links_count(entity);
@@ -567,8 +552,9 @@ static void media_print_topology_text_entity(struct media_device *media,
 	for (j = 0; j < info->pads; j++) {
 		const struct media_pad *pad = media_entity_get_pad(entity, j);
 
-		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
-
+		printf("\tpad%u: ", j);
+		print_flags(pad_flags, ARRAY_SIZE(pad_flags), pad->flags);
+		printf("\n");
 		media_print_pad_text(entity, pad, routes, num_routes);
 
 		for (k = 0; k < num_links; k++) {
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-8322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D5894816
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD011C21676
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC485D520;
	Tue,  2 Apr 2024 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F9WekO4F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F239B
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016056; cv=none; b=PbilWhMaziHbMWjHGZTv3P9i4fOv63oN1zcvm6HSkrdvgryDhFmocw8vQMHaLqR0XlPVOqY7c8E/RtlpDgZ3EzwlNInZJo+fLVcs5vwgWpkRnK1qDPLcABDyrRxZUxXBSz66ipCJ9/gvgryO4nIu3+yXLP8MU/7jEzY1qBAz+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016056; c=relaxed/simple;
	bh=XdPyj3qoHkwrKy8nzdvrrTxumEHCw9yICpR5oPebrqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YN6wzZf1+ZzcJg3YHmc69lUFQsZmpjf0Fd5PnF1csBiyX9WdPRfYzuVlbU1c4nGgMiyX4PipAfMLrERRWDAMlkFA2MKCqY+IboXLv2nhxUu9svVZvmS++oaZht7LuiP1aKLKSGYqlrXoEpXMT/QCKQnPkpoV0MC0HIZiaOArASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F9WekO4F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E258D49;
	Tue,  2 Apr 2024 02:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016014;
	bh=XdPyj3qoHkwrKy8nzdvrrTxumEHCw9yICpR5oPebrqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9WekO4FjmdYnH1VmRu1QKVDNWLEdJKyJ6Sjinqtwc6S/qHYPmt23eH62p6SCVHpz
	 KhW/tpsVYx4avLHt0QuFlxRHTkkDrQXFxjad70acu+VcshRNtusQaxdlqLTYEPHnQv
	 Z+kDWaQ7k+JT852GTm9CI2DJJq7QJEAMlG7Ap1nI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH 5/8] utils: media-ctl: Also print INTERNAL pad flag
Date: Tue,  2 Apr 2024 03:00:30 +0300
Message-ID: <20240402000033.4007-6-laurent.pinchart@ideasonboard.com>
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

Print INTERNAL pad flag for each pad.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 utils/media-ctl/media-ctl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 1b40552253f1..2a7d994a7b74 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -566,7 +566,7 @@ static void media_print_topology_text_entity(struct media_device *media,
 	for (j = 0; j < info->pads; j++) {
 		const struct media_pad *pad = media_entity_get_pad(entity, j);
 
-		printf("\tpad%u: %s%s%s%s%s\n", j,
+		printf("\tpad%u: %s%s%s%s%s%s%s\n", j,
 		       pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
 		       comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
 			     pad->flags),
@@ -574,7 +574,11 @@ static void media_print_topology_text_entity(struct media_device *media,
 		       comma(MEDIA_PAD_FL_MUST_CONNECT,
 			     MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
 			     pad->flags),
-		       pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
+		       pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "",
+		       comma(MEDIA_PAD_FL_INTERNAL,
+			     MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+			     MEDIA_PAD_FL_MUST_CONNECT, pad->flags),
+		       pad->flags & MEDIA_PAD_FL_INTERNAL ? "Internal" : "");
 		media_print_pad_text(entity, pad, routes, num_routes);
 
 		for (k = 0; k < num_links; k++) {
-- 
Regards,

Laurent Pinchart



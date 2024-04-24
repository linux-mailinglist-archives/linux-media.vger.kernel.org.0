Return-Path: <linux-media+bounces-10041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EC8B0E0F
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CBAEB26AF1
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46AF161310;
	Wed, 24 Apr 2024 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rtmgl9iu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FD715F41B
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972170; cv=none; b=CBT/LR2mJ6ZdyhYcCBTVxfdM41EnzQ0LBjdCZU3kYvJmOP5FqpRW1jIus42RLFC8riPUe994E5Tvz4foQq4hYgv99E0x84IfUZPSfSNXZz5Y89xrejvh+fH+gniRXC4P0bK7Qb7/IvemzSmSx2lq9UayD3jViQE0HOrcNtkvLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972170; c=relaxed/simple;
	bh=A+zb2D2LGp8GxzkvjLvhtvagR4efkimO58aCnLGHKFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sect3VTDpszoSBKtYIWu8itkX9KPBdCSvJjROWUCpEFeZWibY7DEZC5B1XFo987SmZPCvW6pn7M7RS56oLPOz1/VAiT9KUv/OoBec9lz1iU0wnqErM4qSLWQwXeSi1fJZrln+xCek5XCENC4KBSRsQWpqhRt6IrSiOELm2KLWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rtmgl9iu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B5261153;
	Wed, 24 Apr 2024 17:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972110;
	bh=A+zb2D2LGp8GxzkvjLvhtvagR4efkimO58aCnLGHKFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rtmgl9iuXEwaq1Po5N+rmp0v3p0+xO+aSVTM8zEJxssVp2/HrsJL/2dP8W9kfCSpF
	 ppRS+VLvufC/sQf7QM0k4eL96pkKPTWkLe3gG1JGMmJvg2wUw55wWO3AzvDt19Rw33
	 X1wJ3nze0Bjm2GFdKA/c0ZlHADZ4bxpmTr1rlZZ8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH v2 6/7] utils: media-ctl: Print the INTERNAL pad flag
Date: Wed, 24 Apr 2024 18:22:29 +0300
Message-ID: <20240424152230.31923-7-laurent.pinchart@ideasonboard.com>
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

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Add the INTERNAL pad flag to the list of known flags, to print it by
name instead of numerical value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/media-ctl/media-ctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 1a9e393ac1f3..510479d83de4 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -517,6 +517,7 @@ static void media_print_topology_text_entity(struct media_device *media,
 		{ MEDIA_PAD_FL_SINK, "SINK" },
 		{ MEDIA_PAD_FL_SOURCE, "SOURCE" },
 		{ MEDIA_PAD_FL_MUST_CONNECT, "MUST_CONNECT" },
+		{ MEDIA_PAD_FL_INTERNAL, "INTERNAL" },
 	};
 	const struct media_entity_desc *info = media_entity_get_info(entity);
 	const char *devname = media_entity_get_devname(entity);
-- 
Regards,

Laurent Pinchart



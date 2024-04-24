Return-Path: <linux-media+bounces-10037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4E8B0E0B
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E82E1C22E58
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D01C15EFAD;
	Wed, 24 Apr 2024 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wgdkYFnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDC15FD04
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972163; cv=none; b=hV9s5F3otZgNwraV45qGW89ngtWWlGaHu743nTGbnXqZFyJiTPzbQiXTC5oZAvUVVfnFnsc/CklIMwluJvCxtT6Ad1gbV7VD8HO7HtfkckuA/DOejnaUhgeBvBIPku8fSLDT6Wl0JE1TPUc2HHtMMVXlMZdHFa2HrradseE6nqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972163; c=relaxed/simple;
	bh=hupgmJIHD3vLdEzoo2acwODFOKaoBBeqMuY60keLcYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXoi2xjT80ekWdgTzqek/ejFL/7vaeWezB3sg8OQHfVF1Ctr6jEeus0KRRcBnBqbIqC0ubBaBdYaqteWoPRytjrSlYP7DnqhaEjTFnHXAC3obtmtZx+/dunD7L3Ch2ARK7/uVTg5uLgY+sBeQwbjbqqZf4PatfliOqukW0EEh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wgdkYFnZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5917DEA5;
	Wed, 24 Apr 2024 17:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972107;
	bh=hupgmJIHD3vLdEzoo2acwODFOKaoBBeqMuY60keLcYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wgdkYFnZRfP0B0jCQjqwEzwWS83d7V0z8we9tU4aP3exX50atMCHbmOtDpF1+mFiL
	 8oRibErplM4ecqi/llK6zLKkM1tC4hg4l4IUwfB7D0NjZFaN4hcuKpVP1uHQEYcWI/
	 SB3WMXCmRK6rR6TrrkD3jEO7gF710+NXS4drG88Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH v2 2/7] utils: media-ctl: Support changed routing API
Date: Wed, 24 Apr 2024 18:22:25 +0300
Message-ID: <20240424152230.31923-3-laurent.pinchart@ideasonboard.com>
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

Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
longer used, i.e. having room for fewer routes than exist in the
configuration is not considered an error anymore.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 utils/media-ctl/libv4l2subdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index c614f4a2e0fd..e0df686e01c7 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -258,7 +258,7 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	}
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
-	if (ret == -1 && errno != ENOSPC)
+	if (ret == -1)
 		return -errno;
 
 	if (!routing.num_routes) {
@@ -272,6 +272,7 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 		return -ENOMEM;
 
 	routing.routes = (uintptr_t)r;
+	routing.len_routes = routing.num_routes;
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
 	if (ret) {
 		free(r);
@@ -292,6 +293,7 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.routes = (uintptr_t)routes,
 		.num_routes = num_routes,
+		.len_routes = num_routes,
 	};
 	int ret;
 
-- 
Regards,

Laurent Pinchart



Return-Path: <linux-media+bounces-8321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C44894815
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C89DB21D4B
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805E2646;
	Tue,  2 Apr 2024 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CbWNDRj3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8938C13
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016055; cv=none; b=IStHS16l0Qb5Pz8dF88yoOqXYs5sJ0X9GLruIB6re0DQLma598aq/BWDvk3OZLhwoc7N+xhlMdoLcA0oa6jTYXOIUj0Q+c1E5A0e3ihwOYudW8GSAeTZ4qM/5G4EhkB/Uw3HH81LKlJB+U2lCB9KWPwMHWBRawm7haEQ0xlmwxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016055; c=relaxed/simple;
	bh=hupgmJIHD3vLdEzoo2acwODFOKaoBBeqMuY60keLcYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kU9OTPXgcokw/Z34oV9m9V22SC4f9B8Xj4eJYB/Y2057/wPOjFMehfv/ocQP3CK0JAHqZiJeaIZKnFMEm2ISOdmK0WjWKZdKZwjEWgISDE87Bo5+7VE58iw6JWT4/2tfvMglgGt5++8wO36OiKiaAQ/gy+pUlqfrm+g9eqQHk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CbWNDRj3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B4AD01;
	Tue,  2 Apr 2024 02:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016013;
	bh=hupgmJIHD3vLdEzoo2acwODFOKaoBBeqMuY60keLcYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbWNDRj3An49dDQFjEfDrrV9d1Of7Ko65ZrYWnomzbXpOJa2Qoj2EH7J8RsKjJUBM
	 raVeD/DbPt++wcpw9Wn3xaGuZJWrNvNkiKVbm9GMMSaZfRd2M8EzJjWeZ6cCA4lgV5
	 tLchgrpv1JJ2Nq+hAvO6FcuruZdpWhXr+ySzZ2lA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH 4/8] utils: media-ctl: Support changed routing API
Date: Tue,  2 Apr 2024 03:00:29 +0300
Message-ID: <20240402000033.4007-5-laurent.pinchart@ideasonboard.com>
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



Return-Path: <linux-media+bounces-16622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BB95C061
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8021F24B8F
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F2C1D1740;
	Thu, 22 Aug 2024 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oDpYDlEU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5FA933
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724362891; cv=none; b=WFzkOKssmkbOuvimJ46gPghIK31rx27k59hHDGN7hYa+SAzLuqa4xaLOIsUXCpPfTy9lbhJI4jJGYOFHf/x4j9evIccUC9zD/5JcO7qw6X29KY3j94DaeXUbMtUaE8ByLoKaJZYNALdnebRvAUc7SDgDzD/iB+oWolvyvCOUKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724362891; c=relaxed/simple;
	bh=ig2QeMoZ0rp2XcGL6QzySgQBNmnR/TqUo1JoULm0zAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KvtQkHq092Enws45AJRLTOEERsqGH6X75Bil4TsFTvTVStxr6HKOpifDHkK8G2JVKHJE/l0DRvY/UfnZI9rpW3OVtulTX2CI6GyBbYNn4tRtqvsDetQRh/GNf6nZrhvGkodM7Nj3o2+/z1EfmSGyvbTybcGfeOrVBAmKuOGJglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oDpYDlEU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A579F219;
	Thu, 22 Aug 2024 23:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724362824;
	bh=ig2QeMoZ0rp2XcGL6QzySgQBNmnR/TqUo1JoULm0zAU=;
	h=From:To:Cc:Subject:Date:From;
	b=oDpYDlEUeXa1rf6SKI3G57xIwmFRXX8PlTGPTdC92LQTycDwAm1jdRocV+JW2d4H5
	 FdodUFQMk95ivoVNOM64SlvasaL3plq+XGoRcLcofw0bI745m55Dzvxq3VAgd7NUww
	 AzkiUes6fu7d/mZj9ICR/W0lzcWkkheRcrGsftFI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as deprecated
Date: Fri, 23 Aug 2024 00:41:25 +0300
Message-ID: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
deprecated") marked the v4l2_pipeline_pm_get() and
v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
the related v4l2_pipeline_link_notify() function similarly. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/v4l2-mc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index ed0a44b6eada..1837c9fd78cf 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
  * @flags: New link flags that will be applied
  * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
  *
+ * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
+ * ON SUB-DEVICE DRIVERS INSTEAD.
+ *
  * React to link management on powered pipelines by updating the use count of
  * all entities in the source and sink sides of the link. Entities are powered
  * on or off accordingly. The use of this function should be paired

base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
-- 
Regards,

Laurent Pinchart



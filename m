Return-Path: <linux-media+bounces-39644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C4B23B02
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B389D585DF0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C5F2E0901;
	Tue, 12 Aug 2025 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g4L2GPly"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592842D0628
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035216; cv=none; b=JO6lDm0pGisNMxLmgdAypvHUmYbCqafqHWzj/R0qVZuIHgelLLoNOELWgyNCAqcidAa5+1058LlhHzQzklVRYzav5UtpWDykRdiOp9FZcAXrJDxtDCJGsuxlOKX9GuQX+srxn5rHTkEFjxusQ9YDVuPW4McaO3NzS6TArtyYCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035216; c=relaxed/simple;
	bh=1mWCpCcChIEq+ELmnVt9fiQcopEGJYjqYWI6wri//Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhc0V3jujEl20BeSzwhcL/tCpjXIUwIHYyRaoQm0hfp3vOr9BIJgYPMzd8P/+lm5QUEzHaFsrvkDeqo153ZAfjDtZYdQ5EHN0Q4Ptoi6YLXthcXGZ1m96ZgPKcfokrFHrReBhZzLAK2atUvhDD0qgIW4Kx2qW23mn0CM9Z/sjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g4L2GPly; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 178231123;
	Tue, 12 Aug 2025 23:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035159;
	bh=1mWCpCcChIEq+ELmnVt9fiQcopEGJYjqYWI6wri//Xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g4L2GPlywJ0WxULaGCLvr7eH+pomJ1UOE6AEAm52000DVeieNZNphIy+Lp8PM4wU/
	 gf9whaAldNtgcU267EEmX39j7gTwF2whMk9XuLi2xaH7lztNGDcPCT4J6vGcYiyMak
	 q/iIbqcosbXmy7SHDx5eYYbn4oVKpUiPKVRSUlME=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 08/72] media: i2c: mt9v111: Do not set clock rate manually
Date: Wed, 13 Aug 2025 00:45:16 +0300
Message-ID: <20250812214620.30425-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver retrieves the rate of the external at probe time, and then
reprograms that clock with the same rate when powering on the device.
Setting the clock rate is not needed, drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9v111.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 6aa80b504168..cdcdc9896e1e 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -365,8 +365,6 @@ static int __mt9v111_power_on(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	clk_set_rate(mt9v111->clk, mt9v111->sysclk);
-
 	gpiod_set_value(mt9v111->standby, 0);
 	usleep_range(500, 1000);
 
-- 
Regards,

Laurent Pinchart



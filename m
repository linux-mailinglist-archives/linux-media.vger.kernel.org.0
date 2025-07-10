Return-Path: <linux-media+bounces-37361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE29B00A84
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F520189A2EA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0622F2C4B;
	Thu, 10 Jul 2025 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D7z8aIDU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A97279DB6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169752; cv=none; b=Oz4L87R18mUwSzxi5MLik/TZrOQ2ZZSOzSkLitSzM3siMwC1f0ors9yIoV6yJ2DV1IYrSrWNI6Wvnyxo3TSsuNZ2x1sXM7RkaFKNSeQTn3OU0pKtyzmU9Dsupqr8jYK7D+d5fH625a1bNaNfYyJksOOsfTRP1uGXi/cduDl1m9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169752; c=relaxed/simple;
	bh=1mWCpCcChIEq+ELmnVt9fiQcopEGJYjqYWI6wri//Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJO7io37mIyqjG4esar7Dxx5kR68dUHR+U3n24ziDK1sncRrJnlRAMPZBceeHqPzIVUSVfkHNeIxzcM6UIDHqr049qJ+l/0P3uUojGA0Ce9RJOZyWF7E02WZxzFoL2xHr+Z/4ZA+JXZo/L4+GOUUP0OCBpCwO9l+DSO4hyG8RqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D7z8aIDU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 072771A9A;
	Thu, 10 Jul 2025 19:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169719;
	bh=1mWCpCcChIEq+ELmnVt9fiQcopEGJYjqYWI6wri//Xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7z8aIDU/CzrilfIs0d+Ve3ex7xXx6b+c5ak1Lk1tv4GKNevDXFHhRiDOZo0PGyys
	 lkuLwBAvCppQLwltzPAvS3QbTzgeE9frcXya7QmDRnIXXrmE0AHGEtxWIZxDv5ZXrM
	 0WmmUlwQMLofjYDcYMaA09hk+BmfHXjAYj7evSlM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 18/72] media: i2c: mt9v111: Do not set clock rate manually
Date: Thu, 10 Jul 2025 20:47:14 +0300
Message-ID: <20250710174808.5361-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
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



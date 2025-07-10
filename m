Return-Path: <linux-media+bounces-37358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48FB00A80
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE25189D07D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13422F0E5C;
	Thu, 10 Jul 2025 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ldmTmT8j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48D279DB6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169747; cv=none; b=B+zyxqAncdGgeJ3ygqT6eS2B9H659t2g3R62OuHGVehlNyD7bzPpnjzI04ZGkcVZRiGlS6lY0esQxdLWT0igpFZMHkXPQyENL/E4oKVTgCPC5TEZcLmzKpp0BxCZv2a9BMlwuslxNPIDYixN0nmX0CCoSFnyxRGItixFwrVjOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169747; c=relaxed/simple;
	bh=TqJRCv5nMVW0L+4EFqcsPeC7+L8BZK0bfXYu6r0SQfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyEHuoaNMmS04lj8CijpzsjdqflXHTYYiSMgdgW2dABdbJHs/0CgNChC5DxrQn284PPI0vIU+qcLDFDcgap7cupOAz+nXBk5mmHKOrhbWWCPCnRQ8mFoe4yZxcQ8avb3j261BTp9l6KKWMO6Yiy8nZB7rnF0yTLwDIkSvcR5buY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ldmTmT8j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49BDFB2B;
	Thu, 10 Jul 2025 19:48:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169714;
	bh=TqJRCv5nMVW0L+4EFqcsPeC7+L8BZK0bfXYu6r0SQfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldmTmT8j3nXmMUT/6d/ewumfGmh0gfiyV1JSH+Mk3I0elZgfxJYSALZpUg1KMw+kW
	 T9aM00rzuLUpLc5y314v8l7b1Vy3FTDfq2m34+LM3fVWk8hnlrg1tkcOdQEUOkSBiP
	 U2Xbo7Z2svdgk2wyjZYOiW2WeWUol59cbaNsH6eQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 15/72] media: i2c: mt9v022: Drop unused mt9v022.h header
Date: Thu, 10 Jul 2025 20:47:11 +0300
Message-ID: <20250710174808.5361-16-laurent.pinchart@ideasonboard.com>
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

The mt9v022 driver got removed in commit e7eab49132ba ("media:
staging/media/soc_camera: remove this driver"), but its platform header
file got left behind. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/i2c/mt9v022.h | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 include/media/i2c/mt9v022.h

diff --git a/include/media/i2c/mt9v022.h b/include/media/i2c/mt9v022.h
deleted file mode 100644
index 6966eb538165..000000000000
--- a/include/media/i2c/mt9v022.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * mt9v022 sensor
- */
-
-#ifndef __MT9V022_H__
-#define __MT9V022_H__
-
-struct mt9v022_platform_data {
-	unsigned short y_skip_top;	/* Lines to skip at the top */
-};
-
-#endif
-- 
Regards,

Laurent Pinchart



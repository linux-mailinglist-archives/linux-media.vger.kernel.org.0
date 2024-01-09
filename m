Return-Path: <linux-media+bounces-3404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5942828613
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F89B24192
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ED638DF7;
	Tue,  9 Jan 2024 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEAOM3WZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA4C38DD6
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704803520; x=1736339520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tq/3fF8IV/O60b8KwvuuOmqL8bbw+kLVtmOYtfocM0M=;
  b=ZEAOM3WZo13+n96D6QVB0J89Jt0+q6z8p0ZaNCmi26iBZOQgUaDBC+qw
   guQziUJcXNrvIjhUeV6N/BsWnxNgjgN200m0NO8uNtXvFagZKfVpz4BAj
   UfvgpAX8++8thPdYZYPn5XDWmx8PkyesvS/XurH3BOHSTzdPvd+b9MPwb
   BWYI0o/VZCEgeE9KtrborNIWL7jarsqKrG2ha/K5fa0gcOfMvun2UoJgR
   cZRfUmbyByBddRCeYMu+paJOIXm4Ct8OgP5Z6tzCegzaIEkBY7s7MaG7+
   5q9cN9glchzgPv5OVgjM5hC6QnPDxLuGvAHgnFq70SRQfxu7xmkt7bhqS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397884335"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="397884335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785227106"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="785227106"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:31:56 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A80311FBF0;
	Tue,  9 Jan 2024 14:31:54 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 3/3] media: mc: Drop useless debug print on file handle release
Date: Tue,  9 Jan 2024 14:31:51 +0200
Message-Id: <20240109123151.106054-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109123151.106054-1-sakari.ailus@linux.intel.com>
References: <20240109123151.106054-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a debug print in media_release(), which is a release callback for a
file handle. Printing a debug message here is simply not necessary.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-devnode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 680fbb3a9340..9c8fe9335dc1 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -190,7 +190,6 @@ static int media_release(struct inode *inode, struct file *filp)
 	   return value is ignored. */
 	put_device(&devnode->dev);
 
-	pr_debug("%s: Media Release\n", __func__);
 	return 0;
 }
 
-- 
2.39.2



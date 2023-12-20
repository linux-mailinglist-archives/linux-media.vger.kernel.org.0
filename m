Return-Path: <linux-media+bounces-2775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04560819CF6
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DC128859D
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A9621363;
	Wed, 20 Dec 2023 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW2QOBPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4580821116
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068648; x=1734604648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f4QZYuk5GOjZevZxAHm7nfSqVvf3WIo8y/0km/Uo4k4=;
  b=IW2QOBPHRqEHrMVCxHvxvj8SWiwG+GQekwKlwAeKSjOIl8IPPB3GyOfF
   VQH0MMU7SDurNOO3QJhoagcbjVCkKhGX/OSZ18qYMnbFpOX1QY/8OdI4+
   5kk9hKpJVyoPm+FdXO6QwLQgOohKkM1ddPQbKKBLrSNmVDpBv+Vuirysx
   AgFi/X/HWu6hsHVmwtfDlGzarek+qFtguhoMxGXAkECAspebIi//u4oAm
   GPvZL+N/Cq0W/bsDh1SXYVz804/DnsHiOm3n3LUdUwAE30vCjJRdL+NES
   47MFmHQTUj6dDyyvIY0rI3imId+54CcO3w/2ccV2AKj9jQ7D8MyaTPvwz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174351"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544257"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544257"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:25 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2E6AD11FB5E;
	Wed, 20 Dec 2023 12:37:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 14/29] media: mc: Refactor media devnode minor clearing
Date: Wed, 20 Dec 2023 12:36:58 +0200
Message-Id: <20231220103713.113386-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor clearing media devnode minor bit in media devnode bitmap. Note
that number is used instead of struct media_devnode as argument since the
minor number will also be stored in a different structure soon.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 7b17419050fb..717408791a7c 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -44,17 +44,22 @@ static dev_t media_dev_t;
 static DEFINE_MUTEX(media_devnode_lock);
 static DECLARE_BITMAP(media_devnode_nums, MEDIA_NUM_DEVICES);
 
-/* Called when the last user of the media device exits. */
-static void media_devnode_release(struct device *cd)
+static void media_devnode_free_minor(unsigned int minor)
 {
-	struct media_devnode *devnode = to_media_devnode(cd);
-
 	mutex_lock(&media_devnode_lock);
 
 	/* Mark device node number as free */
-	clear_bit(devnode->minor, media_devnode_nums);
+	clear_bit(minor, media_devnode_nums);
 
 	mutex_unlock(&media_devnode_lock);
+}
+
+/* Called when the last user of the media device exits. */
+static void media_devnode_release(struct device *cd)
+{
+	struct media_devnode *devnode = to_media_devnode(cd);
+
+	media_devnode_free_minor(devnode->minor);
 
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
@@ -254,9 +259,7 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	return 0;
 
 cdev_add_error:
-	mutex_lock(&media_devnode_lock);
-	clear_bit(devnode->minor, media_devnode_nums);
-	mutex_unlock(&media_devnode_lock);
+	media_devnode_free_minor(devnode->minor);
 
 	return ret;
 }
-- 
2.39.2



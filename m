Return-Path: <linux-media+bounces-47743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EADC88DA3
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5ACD13481CD
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C00F31B11E;
	Wed, 26 Nov 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CldMlNi9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6D30BF74
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147987; cv=none; b=Ne2QYHKIiylotL0gBCRmRTBctzKndvaZpz1AGgZvVraVXcP6EJnaMPaI+qtuxmT27cIthUfEZ88m//+r/ul7eahMd54fV8V86Om2oavy7Sj210c3KZvdmahw+k6oy2e0akwApm/amh11MHpV9Cm1SDq0+DjL9Q+jBX/+BCT3V/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147987; c=relaxed/simple;
	bh=5wxGmobjXbWZzG99g1BKBjEvaZBd9dafwgvAgdjAyh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCgzIVxQqfdFf4+/L8X8eNluYhFvVEHiZWPV4bCdxSytK2xAfwv6YJHkSg3fKoQKMZO1Ygpi6ptif0b56rwtUifDYiYQFLU1bTaw4RI0FLL3pq4DylGbyakHgiBItoszJ9TmF+G94jp6DoCZaYYGCPHPkp+V8NL3zXT17RBbDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CldMlNi9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764147986; x=1795683986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5wxGmobjXbWZzG99g1BKBjEvaZBd9dafwgvAgdjAyh8=;
  b=CldMlNi9m2NIlqqsx8RZ8hYxO2theemfgWdku8vIt3mviF+bxWTbJ8Y4
   fYwTc1ndNp8GibvpGt2LAjTyUkBCbd//p9J3FgnhKr7ojt15r4QBc5cg6
   YBI1oYmRi6Z+Et2B6E4slze8IyzBwaHRBaslOErhO7817X4wu0eiubev4
   ZN2SYl/40iaU494n0juGvGjW67fN5A781/Nnaw3Jl43mTLoxdqPmAIn9W
   MjTQFZPTKd9n9+JcrbkPUA5lofK4yg5L6l3V4VyEDh2Vh/cDNa27XPCek
   unnXi9FkZTA0Hezcs5svb/wRilU/M7wpCTu3Hp9f3paWS/UHFdOo3qx5M
   A==;
X-CSE-ConnectionGUID: URkZGGo0SBGoLn8YonjV7w==
X-CSE-MsgGUID: 8pqztH4CQ5WuEuNnpF9QYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65888358"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="65888358"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:06:26 -0800
X-CSE-ConnectionGUID: GEMPzd5bQjO26MQt1gslpg==
X-CSE-MsgGUID: 9Xn7nZH/S/yLyl0a8TQ+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192532194"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:06:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FA9711F869;
	Wed, 26 Nov 2025 11:06:25 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vOBTk-0000000GWCq-30jn;
	Wed, 26 Nov 2025 11:06:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yew, Chang Ching" <chang.ching.yew@intel.com>
Subject: [PATCH 1/1] media: v4l2-async: Fix error handling on steps after finding a match
Date: Wed, 26 Nov 2025 11:06:24 +0200
Message-ID: <20251126090624.3937040-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once an async connection is found to be matching with an fwnode, a
sub-device may be registered (in case it wasn't already), its bound
operation is called, ancillary links are created, the async connection
is added to the sub-device's list of connections and removed from the
global waiting connection list. Further on, the sub-device's possible own
notifier is searched for possible additional matches.

Fix these specific issues:

- If v4l2_async_match_notify() failed before the sub-notifier handling,
  the async connection was unbound and its entry removed from the
  sub-device's async connection list. The latter part was also done in
  v4l2_async_match_notify().

- The async connection's sd field was only set after creating ancillary
  links in v4l2_async_match_notify(). It was however dereferenced in
  v4l2_async_unbind_subdev_one(), which was called on error path of
  v4l2_async_match_notify() failure.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: "Yew, Chang Ching" <chang.ching.yew@intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 45 +++++++++++++++++++---------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fb..1c08bba9ecb9 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -343,7 +343,6 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *sd,
 				   struct v4l2_async_connection *asc)
 {
-	struct v4l2_async_notifier *subdev_notifier;
 	bool registered = false;
 	int ret;
 
@@ -389,6 +388,25 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
 		dev_name(sd->dev), ret);
 
+	return 0;
+
+err_call_unbind:
+	v4l2_async_nf_call_unbind(notifier, sd, asc);
+	list_del(&asc->asc_subdev_entry);
+
+err_unregister_subdev:
+	if (registered)
+		v4l2_device_unregister_subdev(sd);
+
+	return ret;
+}
+
+static int
+v4l2_async_nf_try_subdev_notifier(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd)
+{
+	struct v4l2_async_notifier *subdev_notifier;
+
 	/*
 	 * See if the sub-device has a notifier. If not, return here.
 	 */
@@ -404,16 +422,6 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	subdev_notifier->parent = notifier;
 
 	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
-
-err_call_unbind:
-	v4l2_async_nf_call_unbind(notifier, sd, asc);
-	list_del(&asc->asc_subdev_entry);
-
-err_unregister_subdev:
-	if (registered)
-		v4l2_device_unregister_subdev(sd);
-
-	return ret;
 }
 
 /* Test all async sub-devices in a notifier for a match. */
@@ -445,6 +453,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 		if (ret < 0)
 			return ret;
 
+		ret = v4l2_async_nf_try_subdev_notifier(notifier, sd);
+		if (ret < 0)
+			return ret;
+
 		/*
 		 * v4l2_async_match_notify() may lead to registering a
 		 * new notifier and thus changing the async subdevs
@@ -829,7 +841,11 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 			ret = v4l2_async_match_notify(notifier, v4l2_dev, sd,
 						      asc);
 			if (ret)
-				goto err_unbind;
+				goto err_unlock;
+
+			ret = v4l2_async_nf_try_subdev_notifier(notifier, sd);
+			if (ret)
+				goto err_unbind_one;
 
 			ret = v4l2_async_nf_try_complete(notifier);
 			if (ret)
@@ -853,9 +869,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 	if (subdev_notifier)
 		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
 
-	if (asc)
-		v4l2_async_unbind_subdev_one(notifier, asc);
+err_unbind_one:
+	v4l2_async_unbind_subdev_one(notifier, asc);
 
+err_unlock:
 	mutex_unlock(&list_lock);
 
 	sd->owner = NULL;
-- 
2.47.3



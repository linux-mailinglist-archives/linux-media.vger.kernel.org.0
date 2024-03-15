Return-Path: <linux-media+bounces-7104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8587C937
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F76281E99
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15C01429A;
	Fri, 15 Mar 2024 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeGXrgFO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9566E134CC
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710487893; cv=none; b=caAgIr3Z7093eWNoIU6Am02+CTMXdV6DFZcLqwCsMiXRjnF5CsSWUZlPmMLJbZoG1dJI3iCnBZXWOlgsyGHYpmpiS2NsF1+QwbwWTQzGAMTgXDbqjxW0pW8mfwH/sPlN/F6FHd4gTzLu2BkgkukxmyWXXk5yN0pLwFtuPW39AZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710487893; c=relaxed/simple;
	bh=jvVrhVVJfTj/x2F/RYBvgsHMEnH+1t6zbZiSEi0tj8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gpIXeHH986nM0bo78ilTy8kjw8jZu8QX4rjBCq2VDYaDL35sjpPrbCRyxGHfug5uhlctJ0R2rtY0y1+/1+V906j2zaqz6kP5ZK95jJFN3r/v/Hl+ap+6KCSJUiWFjCHFxj/IErdEi6ZCONugwGIq5LJ5onBJvJzQp4M+8+TJsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeGXrgFO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710487891; x=1742023891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvVrhVVJfTj/x2F/RYBvgsHMEnH+1t6zbZiSEi0tj8A=;
  b=WeGXrgFOrShIZRT44mtXtv3DJuPfVmqg+C8w52EZvRYQGDWcshbpY8Iw
   egRZ4eYMF1SdjDsfFIQ3q9Ica9R2svRsITs1xzJVAU+DhUqLSgyoyJDDf
   I9PbtrUNsK5iND1mC4YXekqPUQfGb0CkHci2DqY7Xa8EqRj1FMxZqD7D4
   esacN38gLK1Fc6IOLNy+HJHswLG/rycwbPQcBbjvdtV1U33eVCABkrHOO
   00muBBP2d1F4j56fO6MHzuD9zncP8RdgMt5WExOpiWBxqTA85UJHsIz4P
   PmamrfzwyflI6Ibh2tycHHs9SIrtrgeua/blpz/jGaOht4BQw5UjIoRX4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5945692"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5945692"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12499682"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:31:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F264811FB5E;
	Fri, 15 Mar 2024 09:31:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [PATCH 2/2] media: v4l: async: Set owner for async sub-devices
Date: Fri, 15 Mar 2024 09:31:25 +0200
Message-Id: <20240315073125.275501-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315073125.275501-1-sakari.ailus@linux.intel.com>
References: <20240315072935.275458-1-sakari.ailus@linux.intel.com>
 <20240315073125.275501-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the owner field of the async sub-devices by making
v4l2_async_register_subdev() a macro and obtaining THIS_MODULE that way.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 8 ++++++--
 include/media/v4l2-async.h           | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 372a22d8b4d5..9dbe29999dba 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -785,7 +785,7 @@ v4l2_async_connection_unique(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_connection_unique);
 
-int v4l2_async_register_subdev(struct v4l2_subdev *sd)
+int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 {
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_async_notifier *notifier;
@@ -809,6 +809,8 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		return -EINVAL;
 	}
 
+	sd->owner = module;
+
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
@@ -851,9 +853,11 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 
 	mutex_unlock(&list_lock);
 
+	sd->owner = NULL;
+
 	return ret;
 }
-EXPORT_SYMBOL(v4l2_async_register_subdev);
+EXPORT_SYMBOL(__v4l2_async_register_subdev);
 
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 9bd326d31181..f26c323e9c96 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -310,7 +310,9 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier);
  *
  * @sd: pointer to &struct v4l2_subdev
  */
-int v4l2_async_register_subdev(struct v4l2_subdev *sd);
+#define v4l2_async_register_subdev(sd) \
+	__v4l2_async_register_subdev(sd, THIS_MODULE)
+int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
 
 /**
  * v4l2_async_register_subdev_sensor - registers a sensor sub-device to the
-- 
2.39.2



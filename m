Return-Path: <linux-media+bounces-6875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9D87921E
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2CF1F21FA6
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E651678B7B;
	Tue, 12 Mar 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWvLPy8v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC75915C
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239674; cv=none; b=FGhbi7l6ygWvM5D8kamFOQpDzzwS1Mi/rPXc7ZAoSxZcCQmziQfn7MO0ttu4Py5sPcZsAI/BNjZhFJjZsWmc17+evLx3Vkwi+ibJjfqpZHHRI9YeK6+1SHPMCvYqS4V331AZu3dm/Hn8bhz2lXGpM0QebJhEpLvzwQyCQbXAbgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239674; c=relaxed/simple;
	bh=BCV4Q0jxmi4NLkGyKEPc+e1Rh62tXpkYRWDOjDRVNUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ww96nNZfgkwoDzyp4uMVbDzNmuTJ0/DHx2d9zpFdVW3ezK/lhs0RlMQB9Iwy1KeHTFhP2l23/xaVdRdYB9woU/50UhhUruox/IOGQwE3uk7CUL+Avd1lGl4fWvumiAywfIoIR0ufXJH8JbWz1LV0hkoZ+uQGNafMrFsggmAg308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWvLPy8v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239673; x=1741775673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCV4Q0jxmi4NLkGyKEPc+e1Rh62tXpkYRWDOjDRVNUE=;
  b=aWvLPy8vqB+HLnoEeJ/kiE1qULmGm7dVRkeU3AiytlL92n+ZWUlFUvyJ
   fQkzdN4CSjJg3lHgHIl6zzmfFXi4POMRkMjLPPsi4v2AQo2FCroetDJsL
   JDeOerLJAMrPBi6vrVg8fVXyRMqHbbjFS5Wozi+BSKoifqGdv/y+f13oA
   UbEotyIpSNnRjm+axwREb/qny7gWavDu5NB/ctyonvBD4o5yriSoX6M7z
   YbDKOXhrz94QlKOMC1CaZ4/xDIf8Ok9UXnob/sip8uRLOtIpZ28SiUCM5
   uIwKIX9bjtVXak3hPUmhhkj/YRp3dP+rO+q9Rj1PkXVI2SWn631/sB4zz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794277"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194066"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B77F711F819;
	Tue, 12 Mar 2024 12:34:27 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 06/26] media: mc: Drop nop release callback
Date: Tue, 12 Mar 2024 12:34:02 +0200
Message-Id: <20240312103422.216484-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The release callback is only used to print a debug message. Drop it. (It
will be re-introduced later in a different form.)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index d4553a3705f5..c0ea08a8fc31 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -566,11 +566,6 @@ static DEVICE_ATTR_RO(model);
  * Registration/unregistration
  */
 
-static void media_device_release(struct media_devnode *devnode)
-{
-	dev_dbg(devnode->parent, "Media device released\n");
-}
-
 static void __media_device_unregister_entity(struct media_entity *entity)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
@@ -718,7 +713,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Register the device node. */
 	mdev->devnode.fops = &media_device_fops;
 	mdev->devnode.parent = mdev->dev;
-	mdev->devnode.release = media_device_release;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
-- 
2.39.2



Return-Path: <linux-media+bounces-6878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4A879222
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006F51C212DD
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9C553E3C;
	Tue, 12 Mar 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRF3D4DN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1078695
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239676; cv=none; b=pCH1R+/II/PRSPvDhMDxPZEwEBjkH9CJ4amnrHFhCN/bB+Y/48eJoOw45SO62ZZ6wba+t0/SPhudTafhOtUOjYeiyo0Ms4SxoXBiutruO2dpZomJahgPYkPp5RveEqz/so2wUqKJW6y7oHA/Ho+TdtezZ8ib6t3eubftyho2S5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239676; c=relaxed/simple;
	bh=pumpeucLrbSPE9Y0gR7PCLnIjblk0+6TPE2td5baNZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MHAiNZ3yuUoFFwpQJdI0/LCX3q2lgD4eegLK4WXfJexN3ALRl68QlnpdE0Y0FsEN2UKyuE2ORxbVVgRHMnKK8khRhiKr6CxiuubbiDmAxoUG5zoxyFSBW6fpO8vu4DiwTKGuNXLc73IycTCmu6kBMVPmuFinQuEsXqQcpeGuD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRF3D4DN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239675; x=1741775675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pumpeucLrbSPE9Y0gR7PCLnIjblk0+6TPE2td5baNZk=;
  b=BRF3D4DNRcEkTq6BJsyRrzQGXCwPIuB6cUW4xuPh6xUPqGWM+3/8qtaM
   wjSUPxz41YWKwzXTn92so7R+uv7kAxXkv7WOTRLgLpjMCecP4vCY/tZYJ
   vkKU1cZpWIMbvxhUjIFYvBdQA5GLfwOe9j0/7uySzI0yL8gpseMyozaUG
   7nGlapdNFGRpvAy+gHPSajPdsZFS7GVKZp1sH/AHcJDoy94BRCH47Hvxj
   reAQ8QTiuRCZzqueGiyqQf1SxuIy5Pea+FSHMPcOJ4yYGeXHN+9mZario
   xTD0Evk0SfTpXRCfKteNNEK0nRIRuvWaTBymO680p99f0S8aIxvGeEonF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794291"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194079"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6AEE91206F9;
	Tue, 12 Mar 2024 12:34:29 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 09/26] media: mc: Delete character device early
Date: Tue, 12 Mar 2024 12:34:05 +0200
Message-Id: <20240312103422.216484-10-sakari.ailus@linux.intel.com>
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

The parent of the character device related to the media devnode is the
media devnode. Thus the character device needs to be released before the
media devnode's release function. Move it to unregistering of the media
devnode, which mirrors adding the character device in conjunction with
registering the media devnode.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-devnode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 5696ccf01d81..dbf546853ca9 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -51,9 +51,6 @@ static void media_devnode_release(struct device *cd)
 
 	mutex_lock(&media_devnode_lock);
 
-	/* Delete the cdev on this minor as well */
-	cdev_del(&devnode->cdev);
-
 	/* Mark device node number as free */
 	clear_bit(devnode->minor, media_devnode_nums);
 
@@ -271,6 +268,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
+	cdev_del(&devnode->cdev);
 	device_unregister(&devnode->dev);
 }
 
-- 
2.39.2



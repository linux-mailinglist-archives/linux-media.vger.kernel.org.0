Return-Path: <linux-media+bounces-2770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1C819CF1
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F7D3B25DC3
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3AD20B01;
	Wed, 20 Dec 2023 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4D4tGsK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83C20DEF
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068646; x=1734604646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cnQVp1AUtNnhG5EZc1r0XssIluaqMK1nwvl07Q2tM9Q=;
  b=B4D4tGsKQABBfbTWpAE+y7bGHRmbuONEpt0VNmwg38o5iWbML0+gEw8A
   3On6BzMaYkv+gTbCXHtFm89teI1ygtJ7D79nMO4iOKNFCfqRRaT0niBLH
   jjG9RrmjGSyfBkKHiESxExi5rgM4dxyb6xnDC+KA84x5FI3O6TuDscnGO
   tc9+RepE6rUainIkoFdLTuRHquASNtUzZlKKpgHPk36/oXtC0SNqWSHZ6
   lAyvJ3nthj8QCvaxnryWPErVf755dMXhp4bt+mjYGidj+8x0Nn5JXLr1L
   a3rlCsUKQ+k3NSS44eIINglNe7dClwl8NkaKBVw2AO2uDzfoAqtj2A2xb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174333"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544247"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544247"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:22 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EACA311FC49;
	Wed, 20 Dec 2023 12:37:19 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 09/29] media: mc: Do not call cdev_device_del() if cdev_device_add() fails
Date: Wed, 20 Dec 2023 12:36:53 +0200
Message-Id: <20231220103713.113386-10-sakari.ailus@linux.intel.com>
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

cdev_device_del() is the right function to remove a device when
cdev_device_add() succeeds. If it does not, however, put_device() needs to
be used instead. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-devnode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index ce93ab9be676..7e22938dfd81 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -254,7 +254,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
-- 
2.39.2



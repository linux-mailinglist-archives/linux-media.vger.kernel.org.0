Return-Path: <linux-media+bounces-12830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEC901ED4
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99BB8280E7A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0680A78C7D;
	Mon, 10 Jun 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmXgvlKN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F978286
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013953; cv=none; b=AO/nJ44f1ofNG8Uiyanc8g2FDY90uTq6wdJ7qGwpV1msQH5jtKA09TcCgMyNx/tBKMuOOAHiLJZ8OmiQaIiXkwVTG+6fN0IiFw55BkJeP5uzygPTSN8mpECvoo4xZOGJFduSMohv6pdu7agZ+g7JdNWToLxZeUfXflpjr2S46CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013953; c=relaxed/simple;
	bh=lDXunC2yWcL87NyRoIaSqunhZ+s8aMeLsm6O8XfiE/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iK5Tq3KCg1tNqI8yGBOZSy54JZoRV4p8+g8rERXl9KCEt3aX3cCYRxGTan+eG9UfOQk+ZbBCvcd6p7TcvsvfvcxB0SIw5OQXIPiRliEhhVA5Ge4dwsApzQ2K9JOCMgZBT0MJR9cS1vR289oRW0KRTXw48dazDDFVrJcfZ5fOc48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmXgvlKN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013952; x=1749549952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lDXunC2yWcL87NyRoIaSqunhZ+s8aMeLsm6O8XfiE/A=;
  b=dmXgvlKNfRTYgpnhj1eC7ZR3zc4gbfvN0iOwFZcT77MvYZKOAep5lnQK
   UOMGSzQrH3OA6Zl5/xh2WCRziqGquCebb3CgO1v2wu4N8PS0bNe28dD4j
   Ge/SaoBUbsXRom25nlgJ++nUm1x9pUtFcA1YxzF9GlTEmKAQpauu3jnEO
   GyuYuwAZC/zpdVT+BYNNLvKuvLtH51Q979Gz95Fm3hmRYDCk1CJ5swkib
   jctoRV6OPXRWta8a58n9/mll0rfuqDg7JGTjFnzCYJgIe30+OJzgdgccq
   Qwa+oMbDD2KVYY5MvO6+GQKJkvELNMGwCufxLQZiGCByFW1A8wVWdvkqg
   w==;
X-CSE-ConnectionGUID: Co49fLiwT/C7csfOS/kEpg==
X-CSE-MsgGUID: MDbIeCsHQCaqTpGnDfiYlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819902"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819902"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:49 -0700
X-CSE-ConnectionGUID: mR9P+g1ET+GC+ru4nUu9sg==
X-CSE-MsgGUID: vLgLwzG2SYmOYATZmE/biQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137342"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06446120A93;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eD2-3D;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 09/26] media: mc: Delete character device early
Date: Mon, 10 Jun 2024 13:05:13 +0300
Message-Id: <20240610100530.1107771-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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
index 707593d127a7..38c472498f9e 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -51,9 +51,6 @@ static void media_devnode_release(struct device *cd)
 
 	mutex_lock(&media_devnode_lock);
 
-	/* Delete the cdev on this minor as well */
-	cdev_del(&devnode->cdev);
-
 	/* Mark device node number as free */
 	clear_bit(devnode->minor, media_devnode_nums);
 
@@ -269,6 +266,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	mutex_unlock(&media_devnode_lock);
 
+	cdev_del(&devnode->cdev);
 	device_unregister(&devnode->dev);
 }
 
-- 
2.39.2



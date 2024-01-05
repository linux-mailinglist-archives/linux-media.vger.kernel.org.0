Return-Path: <linux-media+bounces-3224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BE825018
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F2D1C22C28
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 08:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A72224FC;
	Fri,  5 Jan 2024 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnMG4BGx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0891921A1C
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443895; x=1735979895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tq/3fF8IV/O60b8KwvuuOmqL8bbw+kLVtmOYtfocM0M=;
  b=LnMG4BGx3KKKax4DCNkQgivDmDzqfYyrhx1L+pEKhE2u3RTFtMwu/CQQ
   akuBmT66GD/aQOADoNRlSLVRUwcUcj5svPBRPI2FqnIkf+Nnno3mqu3zu
   OcO5kUX/vnv3Oxn7/dxawY+FhEG58x18NwKFCcR7RdjH6pWnT103nmweg
   fKXtfuPndnvvzWZkNYDrFGW0IhDw1kCIkySGXD7ry1LJugwskvOMtfhHl
   ljN3o5Mg1OhPbs+R0YSMQk5iMUTiFk/LZvtaC5NVcnMFP4PEXNaoEfaYm
   Z7wGJwB2ZYvNfpRVil72HAZCfmgBfCke/a0k4Hy6tQCkgIUGtC3pGHKoW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4834113"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4834113"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953888660"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="953888660"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 09E331203E8;
	Fri,  5 Jan 2024 10:38:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v2 3/3] media: mc: Drop useless debug print on file handle release
Date: Fri,  5 Jan 2024 10:37:57 +0200
Message-Id: <20240105083757.197846-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
References: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
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



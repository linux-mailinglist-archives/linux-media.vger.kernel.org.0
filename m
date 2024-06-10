Return-Path: <linux-media+bounces-12829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FE901ED3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDDE91F268B7
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74E78C71;
	Mon, 10 Jun 2024 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKK9IR8m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B775817
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013952; cv=none; b=HZg+XflUZOZx/uoZ/Yl4L/S/Z3qWSJ7y9+hp1WujdQhGRGrKzChYz8H+ra9rPsuTPOCJ1T8ZmdlnN8SZ3/LHxq0Zfcy+H3iSKy3ykXd/0XRNgwB//6OFBxvdypaGQzt5rknezkOziFa5a39IIxrbtxsU3DehhXKEhe7nCK8d88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013952; c=relaxed/simple;
	bh=HyOG+obzA3lxQt6iGtMe16dffGHTQG1lkMpum4Twabs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iuzJercx49DNwNab7NM+YGw+E6c7vqmInL62GayizGt9NGY2Iiitgw5EuQPNPoLbdSiB4rhsXXcAKDAhshwAt34CXYQZAjzR7yO2z3PR/MXDs4CK74gi6uw5f+/Tut1r4+LA5sYd8FYfcYGmcTczPvZLI1daFZSy2AQfSpzUj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKK9IR8m; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013952; x=1749549952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HyOG+obzA3lxQt6iGtMe16dffGHTQG1lkMpum4Twabs=;
  b=YKK9IR8mh/l0ci87v/jhZwkP9usitGYQu/B6VEnNjVxhOnEMMVhXubvt
   OV0WJ/Vaz3EuSyhLrVIgnDbQDIJpxEsit/+7NN8pdVWHV70DpGfBxlTGP
   7r8q/EGUml9IVLtbvbep6VK89KyWSAIWPBkYiC37L23O65V8SdD0QbzNY
   MMyMbb/1Y7gDethizNFQ0mJaDVtT4nRcDz53Bhrhp2TL2NvK+kU+SXEm8
   fLk3HeU6nCBBYkQHXQR9dx0gpCAfes22BzSHitX+6tutR8G28wV64nZob
   Zq++d/xTWJFqoYorUOIePY7xRoHBnf66zdLCt+lGDJLAPADTjfzVqnaaZ
   A==;
X-CSE-ConnectionGUID: +nreRy9CRMenWCdlJyc/Jg==
X-CSE-MsgGUID: B2bu/vDsSt+DPkNgRW6LJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819908"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
X-CSE-ConnectionGUID: 3pSihWtIT6igVFjbmvLGqw==
X-CSE-MsgGUID: 8LKtv7RnQTaAculyrVk5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137340"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EC35212074D;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCs-33;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 07/26] media: mc: Drop media_dev description from struct media_devnode
Date: Mon, 10 Jun 2024 13:05:11 +0300
Message-Id: <20240610100530.1107771-8-sakari.ailus@linux.intel.com>
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

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/media-devnode.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 1117d1dfd6bf..024dfb98a6fd 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -55,7 +55,6 @@ struct media_file_operations {
 
 /**
  * struct media_devnode - Media device node
- * @media_dev:	pointer to struct &media_device
  * @fops:	pointer to struct &media_file_operations with media device ops
  * @dev:	pointer to struct &device containing the media controller device
  * @cdev:	struct cdev pointer character device
-- 
2.39.2



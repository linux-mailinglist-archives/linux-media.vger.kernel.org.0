Return-Path: <linux-media+bounces-6876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5187921F
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB2D282255
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119A779945;
	Tue, 12 Mar 2024 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXHUK4HS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29D69D0B
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239674; cv=none; b=nNQtTWKNdElmuaVZ2gSyDGev1IJiWyk+PHbUuUB4FlZu9Zzkei6qm6CUuWszgYLd7GU66t3MkuxmK/8EhnR9LS8WObJyL53zMwYS08InX1edqDw3zCqJvAIP6pb+6PakOjCu4HBA2IR0y7bOK7gvt1JZ1CIxWuIZmPVnx5YGVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239674; c=relaxed/simple;
	bh=HyOG+obzA3lxQt6iGtMe16dffGHTQG1lkMpum4Twabs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hpjHT5OJTB/gPjbGAVTClNEYBPMerOgx7gG0VFeQKrUPBp1mVZY6xmbtNoXecZLBqel9YsX8SYIfvUgfSZON3RkWZWaSfxKYvW+rYPOW7IVIk6h9kMAD8MN/008L9UUb2mGuDpw1BQ/NnLpacsmjR5PyN7oVXf0cTnprzpaRK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXHUK4HS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239673; x=1741775673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HyOG+obzA3lxQt6iGtMe16dffGHTQG1lkMpum4Twabs=;
  b=kXHUK4HSWZedief6YzXcnFavQ5324//oYGID61tzGx3SiUiDE5XqJckR
   Cska+c4n0Ae8BlhhDVJ7ibxH2pSfOFCAPFwH2JVCsMqgGz0zbW//t/KQN
   kzPMIMhRfUmdv3NAh2J+7Nw8NEprO8P0aXfmNyXl+XMnsRmgi+egxMYRz
   Ww8wKnWGcnUIgchVwnsemKyqccVqjkEABnXE/zLy91bxj5EScBJ8w/Khc
   88TQSBTF+gWMkZ6pcc3VJHGanD81EbLZghNtebfmk96MyKsf7cCvoykIg
   qS59ynCmGMyvnZiAtid/Lw9wP6uuMCHnlb71ZZehnw2wVwFpQ2X3c7TwH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794281"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194067"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D52011F81D;
	Tue, 12 Mar 2024 12:34:28 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 07/26] media: mc: Drop media_dev description from struct media_devnode
Date: Tue, 12 Mar 2024 12:34:03 +0200
Message-Id: <20240312103422.216484-8-sakari.ailus@linux.intel.com>
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



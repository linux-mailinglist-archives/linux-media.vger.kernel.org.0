Return-Path: <linux-media+bounces-5497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CA85BCCD
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31EFE281F07
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0306A01A;
	Tue, 20 Feb 2024 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne25k6+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB269E01
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434227; cv=none; b=FCSJNLuJaegg0yYpmo1npxKx3G8RvgcMVYXzyBbCb1gzeq0/JsqR/4JgXFxducStwXkcK/mCkPnvfIGhEq+4wa1oY3uN2WuPW8ifHYwcHiSkI5rD1jOyYNIyYnpCXmM9MIw2gxmBLjpxbzr5Qz3PQE9W+R/cSCsAYpmvgS8NDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434227; c=relaxed/simple;
	bh=7wL7nFvP5WPKCe9xQFQVBjuPbHelc+qiAbdzX/d5Lm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NtSfuaTppTaqaHCh2WMxe4EOl3D++TbbMSEEXhHoAaSXbdbZcz8DCHbiWWufSzwiIhKh8TW15Hzv4lw8wjO34hw3AMMjGgJfR3n3W2rvXym6yVi5ELH0isNm/RVvwegCTuKwctojHMXnRUu557s6cl357Y4SGZFTIkvI6kLQCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne25k6+3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434226; x=1739970226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7wL7nFvP5WPKCe9xQFQVBjuPbHelc+qiAbdzX/d5Lm4=;
  b=Ne25k6+3QVAjWoL1MM8cQT3IYt/n1CaY8Sh2//OmcndauDwxGgXIWocq
   c5l+UTfTRTL+MxsNMVR9b4toPS1ZMM6ipxPEhIOydN168MOXTyvldaPZU
   7KeW2slMs3zDjdoh2J6IqYNTzZ01hfFYymbheQoiZbHg8uE2ZGOXv5F58
   Og+oPM4HWVbhxMMuslTbU1/5AgzaYHwk93FMzRTkRMYQ0WsIdhY0zAC7n
   8bn7xQbWzUxkksQplkiicILeuOiJuJCPuiQdXfv3CUTPENF73mzcDsFDh
   zYVkh+CEiRWfwYyifsp2SZy+GHE/OM+DJGlfsfidJVsOfhdxthEdKF5Np
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13158161"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13158161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827157824"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="827157824"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:43 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 540EE11F915;
	Tue, 20 Feb 2024 15:03:40 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 1/3] media: v4l: Support obtaining link frequency from INTEGER64 controls
Date: Tue, 20 Feb 2024 15:03:37 +0200
Message-Id: <20240220130339.543749-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support INTEGER64 controls in v4l2_get_link_freq().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 273d83de2a87..8e2fd81b7edf 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -473,6 +473,9 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 		struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
 		int ret;
 
+		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
+			return v4l2_ctrl_g_ctrl_int64(ctrl);
+
 		qm.index = v4l2_ctrl_g_ctrl(ctrl);
 
 		ret = v4l2_querymenu(handler, &qm);
-- 
2.39.2



Return-Path: <linux-media+bounces-11505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F88C71D2
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D764B21C23
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02702D051;
	Thu, 16 May 2024 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjBShEQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B5929D08
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843117; cv=none; b=TyAQpitnL6q4o/qv/EKDetikJ1AoiiLfbJymL86z27QNlIBAKuaWgW1RR2fR779oVXrlvTmCW4zhamMIRWtCgwLN/dkNdHvHGb985X8XLd6/1K9uwrV+95DDncYMvGOOCnKkquW2gBKwPA/RtmLzD4w/1O/WSTtW+USQmzC871o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843117; c=relaxed/simple;
	bh=Ju6xGaKV78HqFmzw9VxE/wG8MX2cO5OMSEQGa+MWeh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3Fi/Gu9GsCqBVzzIIM9vU0rAMOvLcGMVb1N9Pr3UWPNjWCVAsAeowh8JUX0FB4hqOHl46J1FumHGToJD1ymYTOoTWYIZmVgRu3bVCp+x8SOfIkBl59MTV8WZQ35k+mbwQtB+yWbXqt++kK4wKdmTftGjhkWsUJKdaddpg/05v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjBShEQd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715843116; x=1747379116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ju6xGaKV78HqFmzw9VxE/wG8MX2cO5OMSEQGa+MWeh8=;
  b=UjBShEQd4Q4MiC1IbrYDJbMXcOVEgkKbg1L0ii7odtPHp+Ve/OGIoQ+7
   Z77/DXmwp7B84pD2bGX8vnVODi3wlWLv1r8oC0TZOLQEd9e50NPmvVsmZ
   8ZgN8E3xCOrnZOu7spYp9xxtblClaccERLPWFxyocc6SO+bLSaEkSec/W
   NXGwdFbgn5WAqsCFF7TOR1reapVHPlnX1q12GdvEcbVCiEk6aZKLggNnx
   cP0uIQnH+eCX0lvClVP0A7dmW1x1LUq2DXlh6gfmRmfMDJvbEnnU0sGfY
   Za8uKaTpki/bi+UsQdvwSBeKqkL0SYoJYEtjGhzc4rURCrVMuwkCEW9fU
   g==;
X-CSE-ConnectionGUID: ltgpC/0nS/uEnxtIZ/5hig==
X-CSE-MsgGUID: ZgCecwoFQUGK5xMDJB7KTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12113635"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="12113635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:14 -0700
X-CSE-ConnectionGUID: Gq5J/oWeRdSNaJVr57opCw==
X-CSE-MsgGUID: y9eXvTMlQLatTGyuqohZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31894938"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 46BD5120455;
	Thu, 16 May 2024 10:05:10 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 3/4] media: Documentation: Update link frequency driver documentation
Date: Thu, 16 May 2024 10:05:06 +0300
Message-Id: <20240516070507.21735-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
References: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 29d66a47b56e..eaf3d597fa1d 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+On devices where the link frequency isn't configurable, the link_freq field of
+struct v4l2_mbus_config is recommended over controls for conveying the link
+frequency to the downstream driver in the pipeline.
+
 ``.s_stream()`` callback
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2



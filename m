Return-Path: <linux-media+bounces-10015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6F8B0943
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A369E1F23AA1
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C57115B575;
	Wed, 24 Apr 2024 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbbAZT4/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3315B108
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961386; cv=none; b=Hi6PV0vqZf+wgt/WDVIhV8A/WX8oqwE948xCSUZ8RwKsbKEQmRx/LpZxEkMaNdWXIAYMJfUXvpdThiGaQTl8JngOSC6HKLjxEqVWSRStbVB/qcoExw21oYmxX3qv0zYleDRMVKPS/usb6g3oL5nXOeZe7u3OHa490mX6ge+cCvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961386; c=relaxed/simple;
	bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nODuzmCc4+gDt51xKRr0R68vqHgNU6I7Ab1ZbftiMJ/Xar4OWWTF63dpRyDnmVphvDvhvpF0UF/WvB0TKwRHMha1Gl83Wmd0EK4Pfyxzf7iYMGOuoeRfLCGqjxqzkmEb1XVmR+q1uEeRg5dC947ZquWphXx7KOnfLN0EGkZjtxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbbAZT4/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961385; x=1745497385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
  b=hbbAZT4/D4/90+l03BMREXMv5Krh6wdCJYYf0VtxIvtJZ2g8DD2985XA
   JE8DHcg7ddAi1TsGcLOKeg71YH3Qodg+3BpJZJcB+KjdAlOaEvkzA+OeW
   DFJbEE/gHnZD02YeC75f4EqntWh3Z8p+uvSNtc+4cJYhB21xAYbO09CLH
   h04eNGIgg/QI4BDVHQOfJ1+JxPrG8CU55Y48AXI+FPo9FyR6z2EoIAir/
   P39ikQFLhmham0V8EaxQxES471zM4jXSLy1/9PTCDPAu4vfv5AAc5GfWI
   F34Ueee89+kKu4UzX6hi3Q18u0p47H1yZRTGODRePrlplNgNJL/DVVnJX
   Q==;
X-CSE-ConnectionGUID: VFiMt0mPQ2WP8lFSZZevLQ==
X-CSE-MsgGUID: FtOr6ldbTRi7NVia9Wfpqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809646"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:58 -0700
X-CSE-ConnectionGUID: 6gw2szAGQQyGRn4XxVxIaA==
X-CSE-MsgGUID: 86ks7FXASN2tWATqPpbZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512830"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:56 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 403EA11F855;
	Wed, 24 Apr 2024 15:22:52 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 08/14] media: Documentation: Additional streams generally don't harm capture
Date: Wed, 24 Apr 2024 15:22:31 +0300
Message-Id: <20240424122237.875000-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having extra streams on the source end of the link that cannot be captured
by the sink sub-device generally are not an issue, at least not on CSI-2
bus. Still document that there may be hardware-specific limitations. For
example on parallel bus this might not work on all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f375b820ab68..b76e02e54512 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
 pads.
 
 Subdevice drivers that support multiplexed streams are compatible with
-non-multiplexed subdev drivers, but, of course, require a routing configuration
-where the link between those two types of drivers contains only a single
-stream.
+non-multiplexed subdev drivers. However, if the driver at the sink end of a link
+does not support streams, then only stream 0 of source end may be captured.
+There may be additional limitations specific to the sink device.
 
 Understanding streams
 ^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2



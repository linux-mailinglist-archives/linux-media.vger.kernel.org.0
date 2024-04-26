Return-Path: <linux-media+bounces-10183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D78B334C
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2B01F2295B
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F42D13D602;
	Fri, 26 Apr 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDcB7yyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DC613CAB7
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121457; cv=none; b=N7I02dQHwSRgBvSAxhxro51Y5oVkdde/kM58e948UYAdjRSy/Q5WXMNdotkazEWnrXa2An7BYOcIjembJY73STz/3lWd6ZO5yf1mrlpArvCDRbw+c+5F6vRKHwVK8fNLLxubymX0wsATcxiBWv6EG5FTZ/fSTlqSV8P7wTcrJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121457; c=relaxed/simple;
	bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/wygHDQRe56Z4OiiMIiajmMjcoI4rZHMYlW9wLczFrt2RZZq36rhpOvMVkgpH0KxTsAQepXUuJ7wG6YHmfY8h2KsHGgmZ9PiOHJ3nK/M9IZSy8nOfYkzCQDFCOdoNJWt2HNzBZCw+i01PfgB7KjB6OCZmqZH18qu4rKPwxpOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDcB7yyp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121456; x=1745657456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
  b=aDcB7yypcIYgNWI7GMfXt+u5zIeEKByIm00+1KDXCcnTKGO3kE0w2eMR
   Y9vQBPDc3TIalr9iqbBkL0InV98zjgzLfAtT4zFg2LghNKyywqAuWXT2d
   oDO7yNftD/En5L5CvpdsiV6n/1v9uZDMZj/D3BCJySqdUnWDUzvCWtxpA
   At8rqk6haTReTjtu3wxGNAmTh/kqiYy2CkHg5Y8nlXoLAlnztmNzgL0ca
   uRVsUeaHuByqvfV+YDVPWdqgTwa7Ro/RD8XQFk6kir1uV5gHm/n/II0TM
   9oFdVUgmusI1Y3FZbrKj7RNsJ/QBcsKxgwl7nX9eC1SRnY+0/BnTtJ6eO
   Q==;
X-CSE-ConnectionGUID: v345xABRSn+93Yxt8pBX/A==
X-CSE-MsgGUID: VIFxQWCxQGeMblTYR0f6/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683820"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683820"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:55 -0700
X-CSE-ConnectionGUID: RpPzXcHzS02F4xl6OH2X/Q==
X-CSE-MsgGUID: /gJYeoZCQ8eg7NhbOgMK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598522"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:52 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 926191203ED;
	Fri, 26 Apr 2024 11:50:49 +0300 (EEST)
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
Subject: [PATCH v3 08/14] media: Documentation: Additional streams generally don't harm capture
Date: Fri, 26 Apr 2024 11:50:32 +0300
Message-Id: <20240426085038.943733-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
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



Return-Path: <linux-media+bounces-9570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0ED8A74E7
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27700B21D4C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B29313A896;
	Tue, 16 Apr 2024 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkMiBmen"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F113A265
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296033; cv=none; b=bv9uZsgVTYajPkJ3oCLM8kHgEPBOvGoNcjuKkPPr4lPI9tcZvF4RWHXtO6FWmDpnsTXo2QaE2dmNgk7fAyHSh13UmftI19of1C51qqy4WsNI32MrJo7wWaKM2hwLXz7pYlXAtEoY5xrczZ+zFVNY8IjdHpSMNwveB4BxejGtqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296033; c=relaxed/simple;
	bh=VbxA/CXN58rfKsEMDmPzTB3GKljE4dP/mAd+U7dAm+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=avj9VlbSFxrwThQvLOs3X3xo6Wz7qnbNb4hNW4xRazMWhpOuuqU57upooScGZTsIrM3EfQQSxWtp9m2KbOlj7w+nv+AAB4hRfE+ZlQtLQrLTJv+5mNOfzOHJQxuQoeKHQ8nSvf4ba9fBVMk7VdGM0NbOMimiwqkFHcUfzNCd8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkMiBmen; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296033; x=1744832033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VbxA/CXN58rfKsEMDmPzTB3GKljE4dP/mAd+U7dAm+M=;
  b=JkMiBmenZCSHJ6nkX2msX+dxCFFURBd+QExwIlZKui94dEGjvQuqI53/
   0hRu2ch3dYuuLOYmHi+nTqjR1e86SfSZnHtSrPxEdk0bCvxJWZVcGi5vA
   9EaprGjEupATuV4xIyKr1Py1+nLvb7W10K/FwyudVIrqlJuYSbmtUxq9v
   ek7Xi5yS9W5AfiuYHBcI8mzzF1b3KLDJVB0WQP5uWtEc0ATkPETvZvpL0
   0flddtmBun9EEfO7zKFm7iaUulSSxrFKAV1WSE53OfvvbzTo4rE7j/cQq
   /3Lc4fSItX+Nzkx5d2ZxCA7h3W76wcjLI7wVxOojRcVzCiOpUfz1pc5Hw
   A==;
X-CSE-ConnectionGUID: lVPPT8IySICLeZ4bhB9juw==
X-CSE-MsgGUID: AahfL9yIQnKUremd/YXhug==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906117"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:53 -0700
X-CSE-ConnectionGUID: mmX8Cp+dSQOIJMyXI4XoOQ==
X-CSE-MsgGUID: ZLojFL42ScmYoyQ1gl95ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155380"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CA1D31204F9;
	Tue, 16 Apr 2024 22:33:45 +0300 (EEST)
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
Subject: [PATCH v9 18/46] media: ccs: No need to set streaming to false in power off
Date: Tue, 16 Apr 2024 22:32:51 +0300
Message-Id: <20240416193319.778192-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streaming will have been stopped before the sensor is powered off, and so
sensor->streaming is also false already. Do not set it as part of the
runtime suspend callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e1ae0f9fad43..7e5474e38732 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1710,7 +1710,6 @@ static int ccs_power_off(struct device *dev)
 	usleep_range(5000, 5000);
 	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
 			       sensor->regulators);
-	sensor->streaming = false;
 
 	return 0;
 }
-- 
2.39.2



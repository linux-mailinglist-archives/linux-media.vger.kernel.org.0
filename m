Return-Path: <linux-media+bounces-6954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A066887A37D
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404CC1F2242B
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35093171A6;
	Wed, 13 Mar 2024 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv1axl7P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFB1BC47
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314760; cv=none; b=eyOjjgaiDIXzrUo8/q8CLu82RTUYxtRm25LIOQGGDmyyj6/EeYphkMW9+VwmxjoywKNGFzHeQtuqRobTKP5g62kvvAUyPQKCIqgoFe73RspP/IbJpe+ERY5RZ/JMKdsF4RhDNzPxGKZ1KKkXnZSVlmJ8YGfMjnpxOzWp6aQT6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314760; c=relaxed/simple;
	bh=mRGTBp/Efh3RIrAjT9y+yY83yw7/WGlU18VRj20tPpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PM3ClDkgsWs8uEYS9SCNny0MCm9ndlOcjqMIEH+w+OF8Xlp/jXYF/w9sCSNiXfa/FISi8mp2qu+OGAO8foFgDT+vrxCWCabGEmyIBbYSugJQn3PZoNorxpCZxT41J+Sz1cbOShQUdXJ5Qcvjr5i5pFbXJIwBV9KG0AV3ueO+D/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv1axl7P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314759; x=1741850759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mRGTBp/Efh3RIrAjT9y+yY83yw7/WGlU18VRj20tPpw=;
  b=Hv1axl7PTNj4vq0x+6NG51riISaTuqimH2uGA8mxIxw9P/ItD1PF+lou
   aMO+PZdnVG8Y+5WMhGu0pFzBjgczQ9jOh+J4DnrRBg1fRHKO5UoHkVFub
   9QSsSEsgJMwtHAkkAb3A6CqWg2xVl9iHBwPO6wqqhajwb76HoFUXz4KpY
   fKN4/HLVyAGx7GPZqps4vzYn62TqS/cQkn2Ndxe64cTHJfW0AzRYV9tPq
   VZUpWD0wPxJz9uGzKsYKkybnf0RKBcF+oHUAalar2frJ/39YOZLxn36s8
   bXLhIaNLfaqElpFSqFjedLdXRE68S1xIDtFWf6eWHX2xDNxb8ZBGeX9nT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575615"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816452"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:47 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A37511FB94;
	Wed, 13 Mar 2024 09:25:44 +0200 (EET)
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
Subject: [PATCH v8 18/38] media: ccs: No need to set streaming to false in power off
Date: Wed, 13 Mar 2024 09:24:56 +0200
Message-Id: <20240313072516.241106-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streaming will have been stopped by the sensor is powered off, and so
sensor->streaming is also false already. Do not set it as part of the
runtime suspend callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e21287d50c15..671540a8ab6a 100644
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



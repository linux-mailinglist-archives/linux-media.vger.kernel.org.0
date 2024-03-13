Return-Path: <linux-media+bounces-6956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B445587A37F
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CEF1C2137C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E878208DD;
	Wed, 13 Mar 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnmXFd+F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DCD1CA94
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314761; cv=none; b=tIZa/LM4yhYNewP3v7OFfEDO0OG3zWUFYvvrX/8p4QxJLX94uMML8anvD/YtW8iEoTQqYooFeh/3tCcSn2G31b+7kcBH63ZokXYpZTVBFJUlNpyYIpwgwNkW6/Bx5wAABYtRhT8JK+PheYhySo1RbxlIZYii55nhtO1AnEbG8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314761; c=relaxed/simple;
	bh=iF3ArMf0udxVzJVh1K6f+MrahEydjZHmnaSM3IkW0Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=obfqcSbcbfez7W8dT/olqCnh7OtFUI/D3JwrpMVTDP/Efzcum+uiwb1kBBQWZLGXfmS5fzTzumuYFOOlJyUjl+lDkdgCtg6wce/ErpLTrHgpwuTChZfLLqs6Z+L3ETOLWf6RBJS+AK8FcECROAKoaZj/pPJChC4qOWXxhx8Ry18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnmXFd+F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314760; x=1741850760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iF3ArMf0udxVzJVh1K6f+MrahEydjZHmnaSM3IkW0Ro=;
  b=BnmXFd+FSU0twgQdHo+QLDgW95IEDqNTd1TeNk0r8HSCl59JfYdhodXM
   9uW4cuH9iL5R6tbXXpg/wmdoKIPztqhyoIBQsSUEnLgjtoqVYbH7NA9YE
   wOFfU9cBANpM8UZ+7ryirQM9C1WHDLIRIWPub5f81QmCEJtDSsw7Y5Eu3
   r0wIrM3x6RWs57pPft4ptykWC7t2MFAZ4XzrryMDEnidyORDoBcKBgksm
   EPfk/Xbnbny+cUKQTjF+X6D3RBKXdZUWR2wJs9JKtJI6Zk1IC5czzLnYc
   93rJZceWUeRf/yLRAOt2k7VyQXtlXoA7uPK6gAalP7cwnRmOwnHmKtWYM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575625"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816461"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 34AD91203B3;
	Wed, 13 Mar 2024 09:25:47 +0200 (EET)
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
Subject: [PATCH v8 20/38] media: ccs: Track streaming state
Date: Wed, 13 Mar 2024 09:24:58 +0200
Message-Id: <20240313072516.241106-21-sakari.ailus@linux.intel.com>
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

With enable_streams and disable_streams, the driver for a device where
streams are not independently started and stopped needs to maintain state
information on streams that have been requested to be started. Do that
now.

In the future, a helper function in the framework is a desirable way to do
this instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 drivers/media/i2c/ccs/ccs.h      |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9e70946653e9..0cd8ee957655 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1766,6 +1766,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	if (sensor->streaming) {
+		sensor->streaming |= streams_mask;
+		return 0;
+	}
+
 	rval = ccs_pm_get_init(sensor);
 	if (rval)
 		return rval;
@@ -1887,7 +1892,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-	sensor->streaming = true;
+	sensor->streaming |= streams_mask;
 
 	return 0;
 
@@ -1909,6 +1914,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
@@ -1917,7 +1926,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	sensor->streaming = false;
 	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
@@ -3525,7 +3533,6 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	sensor->streaming = false;
 	sensor->dev_init_done = true;
 	sensor->handler_setup_needed = true;
 
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 096573845a10..4725e6eca8d0 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -236,7 +236,7 @@ struct ccs_sensor {
 	u16 image_start; /* image data start line */
 	u16 visible_pixel_start; /* start pixel of the visible image */
 
-	bool streaming;
+	u8 streaming;
 	bool dev_init_done;
 	bool handler_setup_needed;
 	u8 compressed_min_bpp;
-- 
2.39.2



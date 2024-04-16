Return-Path: <linux-media+bounces-9573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BF8A74EA
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682801F224F6
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C570E13AA39;
	Tue, 16 Apr 2024 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbAYiYjV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BB13A25C
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296040; cv=none; b=iMmjfsLGmtAfUlD47n0LzdB/TmQOBfFhqpiAZB3vzeUjfIjKl0KpEMuH3cCUs04s9U9yImgiaan52mypckFOrUgS+Yq8zXWGVLexy0SMiEWmxOkwVZOLBwtntmyQncv6MAk3qbERsMeZWVMX44h0wiIVWrEX/fWK1k8eMBIuZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296040; c=relaxed/simple;
	bh=J8UIuwPnagPMn4IZ6pyWD4Gw4spVb2F0ywkEPMX5D48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mPxBlOsaeTf3R3wGOiGi3R7GtbWfM8DEVr5aB+7arqTiyNEdpfjlu7ksla5bQMgiuP+X4Rji3uEDisGsTgKXlo5NS2YyHGJJtWHWSwlvhDyLg6kPKjcAtRw0lIcYHtBPL89cpEMU4yCnQUoSV6i9aLuQ7UWDsGYjDdfqBqkzjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbAYiYjV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296039; x=1744832039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8UIuwPnagPMn4IZ6pyWD4Gw4spVb2F0ywkEPMX5D48=;
  b=GbAYiYjVwFqA6/C8qdgaLt8aRLX+w3tfJO3NhR7WVRyYZUQkK9MoX8TY
   6M96wRoexu0IeX22hvGOvky0jq7PGQTXapWTbfHw/qpFpSQMN+6G89K+f
   WNS707YLVbJi+RB4bh7Jx2jyMJvviIDHV2RDmw30C/c+/ibziOSqQ9zyC
   /ZCoB8T45WhMF4HEVucfxttr28NSH9fXBFiHTaebS8BnT30vP4OpVlAeb
   ujxQVjeT/g2+gS5cPZkMdbbhfIeRGN2GjbGKeYav0eVJb8hvpiurAcUCX
   o4vx1Fhoo3zYiyI7JqvnmXOSiHDaEwvFS7pH/+UkMAkd4cWLgjdYqcumr
   A==;
X-CSE-ConnectionGUID: +xIU9+WHS/eywz0DcZTsPA==
X-CSE-MsgGUID: yN1JTWoWQICnQX/6nTyNqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929803"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:58 -0700
X-CSE-ConnectionGUID: XsYGkEyEQxC4GNH2j14K9Q==
X-CSE-MsgGUID: OTIZGQdSSEi4VDGld4n3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380182"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1824D12056F;
	Tue, 16 Apr 2024 22:33:52 +0300 (EEST)
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
Subject: [PATCH v9 22/46] media: ccs: Track streaming state
Date: Tue, 16 Apr 2024 22:32:55 +0300
Message-Id: <20240416193319.778192-23-sakari.ailus@linux.intel.com>
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

With enable_streams and disable_streams, the driver for a device where
streams are not independently started and stopped needs to maintain state
information on streams that have been requested to be started. Do that
now.

In the future, a helper function in the framework is a desirable way to do
this instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 drivers/media/i2c/ccs/ccs.h      |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index aaa6bf8495e1..c39ee4394534 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1767,6 +1767,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
@@ -1888,7 +1893,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-	sensor->streaming = true;
+	sensor->streaming |= streams_mask;
 
 	return 0;
 
@@ -1910,6 +1915,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
@@ -1918,7 +1927,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	sensor->streaming = false;
 	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
@@ -3526,7 +3534,6 @@ static int ccs_probe(struct i2c_client *client)
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



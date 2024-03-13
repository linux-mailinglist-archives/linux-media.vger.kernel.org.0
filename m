Return-Path: <linux-media+bounces-6970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355787A38D
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF141F221CE
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA1D22625;
	Wed, 13 Mar 2024 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS0ll0Ff"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006417585
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314774; cv=none; b=ZlhjFIk4iStkQEmFAjv+Rn9WLZROVKNSU+FSLCg4nSbEUFLbojXV1w+ps6axjG+EhvGPpoINyNLmIqZMRxPb4BebcLlbRFxNXsGSQnwmGkZHB/OWt2dS1ezrWs7tFQT/KvJp1EcIS+eqG+sjd/XoxNkGoCTB9FqipLDaq9XF4HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314774; c=relaxed/simple;
	bh=7cjbMhgXEB8lKaeeUtDg7OcHQmRGlA2HraWtZiAB/gU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xfm/M4iUGyn0jQCdRfli1e8475TbEllwcprn7vzTDpLYiJOuhvAlSFSzLfHL6to73UsAdMEV3UMDTMgMzAuToflsv3msfeWRzwJgNVw+BJpFU55ErR1Xbt0wXQEHuwp0oRWKB5Qrxky8E/OBeuSxC1Q1gaGRzf+QD97urKFEsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS0ll0Ff; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314773; x=1741850773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7cjbMhgXEB8lKaeeUtDg7OcHQmRGlA2HraWtZiAB/gU=;
  b=YS0ll0FfiomedhMtLLgErcB4jNHb6zktpGPVIOV+F5iNqYDQTyc+MD9J
   ptgv3Oy+8lUr5IErf7VEwttDjY3gk15zC0nVerUcGOSI758wON0GxAJlq
   QXJT4y4KSPpxpnOZg3x3qS7c9SO4jN2XuAq93Q3kVZas7xsRgCzAQYxxj
   Cs/heEs0CSDE5omyRK01Q3QMsDgvXQyDS0tf3EZC9ZUSSE0uNc/Y5EFIx
   o/lxHTRI7ePdkT7ye1kTd6Zwg66RPdi4UEg4en7orI0n/STmm+jeY3TiG
   UZa88/Ut7heCfxJGzdA7W3vBrVxC0nRPfpsZSLxjKhBDYvPFgR31NAN0U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909331"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542378"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD0DC11F853;
	Wed, 13 Mar 2024 09:26:06 +0200 (EET)
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
Subject: [PATCH v8 34/38] media: ov2740: Track streaming state
Date: Wed, 13 Mar 2024 09:25:12 +0200
Message-Id: <20240313072516.241106-35-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ov2740.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 44c6724a102c..df57f0096e98 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -539,6 +539,9 @@ struct ov2740 {
 
 	/* True if the device has been identified */
 	bool identified;
+
+	/* Track streaming state */
+	u8 streaming;
 };
 
 static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
@@ -929,6 +932,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
 	int link_freq_index;
 	int ret;
 
+	if (ov2740->streaming) {
+		ov2740->streaming |= streams_mask;
+		return 0;
+	}
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -975,6 +983,8 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
 		goto out_pm_put;
 	}
 
+	ov2740->streaming |= streams_mask;
+
 	return 0;
 
 out_pm_put:
@@ -991,6 +1001,10 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
+	ov2740->streaming &= ~streams_mask;
+	if (ov2740->streaming)
+		return 0;
+
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STANDBY);
 
-- 
2.39.2



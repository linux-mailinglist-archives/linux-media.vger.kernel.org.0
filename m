Return-Path: <linux-media+bounces-9592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BCF8A74FD
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DA9A1F227BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C2113BC1C;
	Tue, 16 Apr 2024 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haLG6l5y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5DC13BC14
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296066; cv=none; b=rjtg4AgUomdNkqUKHDMhCHKTrat8QXj8LdNKBXGIf6epzk783a6cFco1d8i4NTh6BU8TXyXbpjgiTSQFGbpIQL9L/cr7mSwJbEVsVUCudPpBLjX5VOL0i9PK8olZbpusG5IBQULQZiSw8wnbjp8kRf92BOvdXq70eozj6WRYREI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296066; c=relaxed/simple;
	bh=ktgBcAIWo1oDPDZ/a47CL3Fb7E4foBgOI2jxkm5ndDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kdKE0zlAL8Bvh80PsqR0YPutwLjldWWtjWAJs44f8LRfBl5x8em9FIW3wUK/wGC9e/QYSQCCz0llY05c5f1oomUZ60IeavtgCPbySZzCQB6Q8cZ05d9NhaMQsuDGWDO8GiUWoXB2PSQxYiIndLCqfIDRO5zBkINk6GVhMQrfjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haLG6l5y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296065; x=1744832065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktgBcAIWo1oDPDZ/a47CL3Fb7E4foBgOI2jxkm5ndDg=;
  b=haLG6l5y7RFNsrPuXDKABBP/U4C4T2/Q6NRFDsnkxej4iA1Ed1cxsCny
   yKHMNVL+UlzfQlgswjDQSYlujtxuXoDATdxpRkUdo/8LkdN792SpdHaFS
   YKZjagpeyYQWvDX2ZdLLQ67uUxmvN9fSJGqZUr3mRoiqBOrftZvFh6a88
   cQR5qTFyXE5MUIuvM+RY2rbhhNHhu7qUwnK1Bl73BY4vpgvOhwZ3VKlre
   6GS1IPq/f/X4zVS1CHfGlzKQUl4FxmDlD997XTokY1HoICQLAzi2EhnIT
   Gk21uxOz4h6apPRgCBUDzzbHxdnWp+cc4chU2UULnFNQ9sxLqu1U2AiyL
   g==;
X-CSE-ConnectionGUID: 72UauVXGQyePVA01NLlYxQ==
X-CSE-MsgGUID: 53A/ISaFQYqQfSbmS1lu+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929904"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:24 -0700
X-CSE-ConnectionGUID: 4HOwB6SvRsOQbkt+ezEHeA==
X-CSE-MsgGUID: fcb65gt+Ro23FqDmodE/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380289"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C8A4B1204F6;
	Tue, 16 Apr 2024 22:34:17 +0300 (EEST)
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
Subject: [PATCH v9 40/46] media: ov2740: Track streaming state
Date: Tue, 16 Apr 2024 22:33:13 +0300
Message-Id: <20240416193319.778192-41-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ov2740.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index a12dc58fa0c0..c29e9b8cde15 100644
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
@@ -926,6 +929,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
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
@@ -972,6 +980,8 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
 		goto out_pm_put;
 	}
 
+	ov2740->streaming |= streams_mask;
+
 	return 0;
 
 out_pm_put:
@@ -988,6 +998,10 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
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



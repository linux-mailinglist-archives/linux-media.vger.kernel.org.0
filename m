Return-Path: <linux-media+bounces-37256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589EAFFAE8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1803C3B9178
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2750289371;
	Thu, 10 Jul 2025 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9XhtiON"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31861203710
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132729; cv=none; b=fl78OwjF76tPMd2a34OLh6q+6FV/OkTTQEpGBdoNzME5nQ8I3fMG4NwgqAiO4iHK8RHO2vSnvSqYyc339hhHggjRsjOQfXTsZLDCpPxJMUc3Aql+kGr/rb7IJ1ZF1MUXW7UWMUIGO0gfeiASg9w0pNWPtv+l7p9ZGqOVjYgjVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132729; c=relaxed/simple;
	bh=CqCWsjoR+3QFL1zj9gnUPF7TjRLGpJwc96S3l85SP9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ErWc2+a46nBRq8Wf3WfxljmPo2k8tgKS8oQRQ55LmvwUjVxKrPl+Jv9cRRq5mTllXR6iE4q02WVq8eiTImu4pGNPYhOtgP8hFJgv4XYM7F5M3yyb6dhzC7MCxrpWiypKxFL+T/OzwJ6p2Zik6Al9jetAxR18yYDHD27DRmxI4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9XhtiON; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752132727; x=1783668727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CqCWsjoR+3QFL1zj9gnUPF7TjRLGpJwc96S3l85SP9U=;
  b=M9XhtiONYN2/enD/uKsAzUOO9ogIvJt7g4K8/9VgJfKWtiVABPypKgUy
   m4suCPISmBysdAHsd3wxLsNweQna268wioXqWGphfPAqD0KDVmvDvn1J1
   JtH9vGK154YACPWUGan6wg8L7uIvCCve1uMnJy+LlVB3NaOyQ5VGKEKPe
   gOaiVtRP3zr5sbRB0jH+Y6mycIGqEoq13ckWh9aydyaCKbbA6hkTynRa1
   CnrLY18OGilkFITCCypWwcRyAwU6uWmmH63X45omE/Yh5tOLf6L1ZwbqJ
   V+iCh9K4m1zHfkA4k1zbsE+9CuH9eZzeVB6KKaGu6ymnxaAexDLsm3KFM
   g==;
X-CSE-ConnectionGUID: v7l/f7deTAu8a4e+5wAbhg==
X-CSE-MsgGUID: Ar2zrTVjRKOK6OtImbtW7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54258394"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54258394"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:06 -0700
X-CSE-ConnectionGUID: sOK2Aj8BTZmkeermJ8f34g==
X-CSE-MsgGUID: W5AB3fMnS6qmTL8u4CdaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="186998387"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.54])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A37F120B20;
	Thu, 10 Jul 2025 10:32:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZllB-0045vD-2c;
	Thu, 10 Jul 2025 10:32:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 2/2] media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()
Date: Thu, 10 Jul 2025 10:32:01 +0300
Message-Id: <20250710073201.976056-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250710073201.976056-1-sakari.ailus@linux.intel.com>
References: <20250710073201.976056-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print streams found by v4l2_subdev_collect_streams() at debug level. This
could be useful in debugging drivers, userspace programs or the framework
itself.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7b1a67a52efa..4fd25fea3b58 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2233,6 +2233,9 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
 		*found_streams = BIT_ULL(0);
 		*enabled_streams =
 			(sd->enabled_pads & BIT_ULL(pad)) ? BIT_ULL(0) : 0;
+		dev_dbg(sd->dev,
+			"collect_streams: sub-device \"%s\" does not support streams\n",
+			sd->entity.name);
 		return;
 	}
 
@@ -2250,6 +2253,10 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
 		if (cfg->enabled)
 			*enabled_streams |= BIT_ULL(cfg->stream);
 	}
+
+	dev_dbg(sd->dev,
+		"collect_streams: \"%s\":%u: found %#llx enabled %#llx\n",
+		sd->entity.name, pad, *found_streams, *enabled_streams);
 }
 
 static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
-- 
2.39.5



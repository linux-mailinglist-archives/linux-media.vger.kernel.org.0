Return-Path: <linux-media+bounces-9553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA488A74D6
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A22751F2217E
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B913957C;
	Tue, 16 Apr 2024 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLW5kvr7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA711384BE
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296012; cv=none; b=mNx+Y1pCXzSJi/VCJNyNG6iczpgzegQ6SlDvlXtADUE8VTT5onUWddPVb+fKl+xbfZjwgkMQ1aNjCzS+/05mbkMb6nYrXRujZx8SE0tJzcozc66XDB5QPYmRTscRhjcMs1l1lHz9bGnQkUf11po2EuS5t+kU4omdcCDrVE1/y2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296012; c=relaxed/simple;
	bh=ml6AHSQcfO2i7Fq1tJfOzpM8XxrgjT1U/EOPVPzD8qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KlKDqSMhbb8R3aac2AxZK8mjywk1RnQS1NLoMu9rsfeNQZ0vVawh5y/6XDbm3e6EtiFDqRtkSLrY2WvDx/mYRID/U9YIj3UyIVneG1ESceodmSQOC45WOe86WMhNFYTbGUQmhCFq9s7RG1JY3N8SfmCExXvE90FfXpMNYGX1kSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLW5kvr7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296010; x=1744832010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ml6AHSQcfO2i7Fq1tJfOzpM8XxrgjT1U/EOPVPzD8qw=;
  b=kLW5kvr7t7i1VYMZdamWuptZtx7h7pTExu9MfP9kWZtiTVEfo+k5AHBm
   r+tuViPiP00H3kd8MYuAX0plVz9DTjrAZMPmPpjVETOaKzqev0hKjc+wL
   bXnCn8G9JeatCajAns1lI27o8Zxvh57ftq1ST976BsIohymQ33BsMZzCz
   4SphFdpgUzB7UZxXxi6TR/SDxdwCUSZpVgSersjQw+JMwhNUWbkHJ+H/A
   jcDm1aomORodYCFn2mQUt+w8VL+UVSENRCNhQi24PlaZ45pcO9B4hps0f
   XwGhaiVWYg7TrcKin8Zz12XcJbquvnKVs+5+GZuc1VxCZtYUWwCq7k0cl
   Q==;
X-CSE-ConnectionGUID: /SS8qMJ9Rb2C18aAD1xINw==
X-CSE-MsgGUID: B0xxpeYcTDy3Zl7CZlhJPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8621174"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8621174"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:28 -0700
X-CSE-ConnectionGUID: bFiGveuWTbuBT6nPjzhOnw==
X-CSE-MsgGUID: c7artb0bRUGYSDAD5S93Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22430671"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:25 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 969EE1204F6;
	Tue, 16 Apr 2024 22:33:22 +0300 (EEST)
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
Subject: [PATCH v9 01/46] media: v4l2-subdev: Fix stream handling for crop API
Date: Tue, 16 Apr 2024 22:32:34 +0300
Message-Id: <20240416193319.778192-2-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

When support for streams was added to the V4L2 subdev API, the
v4l2_subdev_crop structure was extended with a stream field, but the
field was not handled in the core code that translates the
VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.

Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4c6198c48dd6..45836f0a2b0a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
+		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
@@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
+		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 
-- 
2.39.2



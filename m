Return-Path: <linux-media+bounces-10231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD268B3A70
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 16:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559FB28C43E
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 14:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B6148FE8;
	Fri, 26 Apr 2024 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQXbFf7o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F976148836
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143358; cv=none; b=MNb+TfswlWt7qRKdxe5kjIo2Ra5FvoRoENmoo8uq5pJSA93oVHVEAX0dOkIRCaqszrImCzu3JArbdE/FB8qivycuf4Ua/PDV0j+mGyP/nwWmz9KAALygJj/c9qXihdTyLuHrrxq1yyrf3katv/J1/Sefc7KybWuxkVk5q6nw9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143358; c=relaxed/simple;
	bh=nIgOxxJ7GEApbaALBIkmKlN+UJUxUMGnaqgFIo1Am/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/USdSv4qQQBKYk7bMig0jeXk+07sOfKSMm3sAmQZqSh8khLCFnFgvBZv1o0sYz+AiCxTWmHU3NDymrYb4SvYvV3y8syQuvVQoP82+eYABqY9n3VI7hTpDrGP2oA7Xd4mBFWRNFTxbu+rTvmDapF6XlMcJ71IhS27tKMnj+Vy8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQXbFf7o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714143356; x=1745679356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIgOxxJ7GEApbaALBIkmKlN+UJUxUMGnaqgFIo1Am/c=;
  b=YQXbFf7oRCTHAN8VEGeGkXJrV3iwXfg205xDIG2pvCjm0Nfd+FbUjQXV
   aNxZSCAOiMiknmTwRKBnOzYbJA3U1F2NSB2hdA2xTan0YtxJzhcAy78pe
   cThPieV2ZlY7Wu7uS8KN0J9Nz7RzR6k5GHzeDfHsUSZsiZJTJ2Um36aUe
   +PUJrnvhITbvDlG+yorfargN2d81aHrupGrqhKF4TFcbRmV0U4w0BBexD
   IAgB9ZMBJeSYY/ZxfSTjh0tO6/l8CYpdpxt2xnvvZ+PlBVShNYHlCCPd+
   B5589EHqTrPIsGF+KharJnpMWpdzyYTJQpKCdEnXv/rP/XKBnj/CgC8Uo
   g==;
X-CSE-ConnectionGUID: K/fPZXh4SZ6041UnH6WNzQ==
X-CSE-MsgGUID: VUN8Ao20Tu2MMMHR3fm0CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10095285"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10095285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:52 -0700
X-CSE-ConnectionGUID: GjY+2fjaSYuDBTSmwunvLw==
X-CSE-MsgGUID: OoG1Pa4AQIOWa0qdTAYUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25514722"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B3106120358;
	Fri, 26 Apr 2024 17:55:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s0MzM-002kCD-2G;
	Fri, 26 Apr 2024 17:55:48 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 2/3] media: v4l: Support obtaining link frequency from CUR_LINK_FREQ control
Date: Fri, 26 Apr 2024 17:55:37 +0300
Message-Id: <20240426145538.654212-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support V4L2_CID_CUR_LINK_FREQ INTEGER64 control in v4l2_get_link_freq().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 4165c815faef..bf1923314d15 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -483,6 +483,10 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 		freq = qm.value;
 	} else {
+		ctrl = v4l2_ctrl_find(handler, V4L2_CID_CUR_LINK_FREQ);
+		if (ctrl)
+			return v4l2_ctrl_g_ctrl_int64(ctrl);
+
 		if (!mul || !div)
 			return -ENOENT;
 
@@ -494,7 +498,7 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 		pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
 			__func__);
-		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
+		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ or V4L2_CID_CUR_LINK_FREQ in the transmitter driver\n",
 			__func__);
 	}
 
-- 
2.39.2



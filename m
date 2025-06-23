Return-Path: <linux-media+bounces-35648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6297EAE458B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 064551737C9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04D0253925;
	Mon, 23 Jun 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYilbP7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB72517AF;
	Mon, 23 Jun 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686690; cv=none; b=Iq8giOfaERyVyRmt4onR5kyS7MrgIqNG2AF16N91/usOzqiAsNcm8SBuq77IhASygeT5Tlad2WlY8sqXyl1AWFkoYkjVOnAE/PJbqfOlybH8GORgxpGJ1sbg9OT5WHaFkSQO14anROSlo77OroIjYC1GgoGFIu2tqGy4oL9+jn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686690; c=relaxed/simple;
	bh=bHjuyxyVFG9+AyPuWhaES1ZkDT6p8+wUC4f3Czki77Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUEXUE31b6pujoq160x1KMgwL3Zb8OEVc32tqrN8L8em68cx5IqlaB4ZCgv3z/zqy7qp05clbvZpX5HS6+TV2GeXW+1GjZbgXNnmbUisrI/rTkqeXGaMnYw9gFu5bjuJ8OrHJyYiwjFbq9Bf+xPR4OFV5Ggdvpz17EgLGDHjj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYilbP7G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750686689; x=1782222689;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bHjuyxyVFG9+AyPuWhaES1ZkDT6p8+wUC4f3Czki77Q=;
  b=lYilbP7GOxn7gTE1jms0Y3FlFFjwxZOSzELl+fJUdr6KwlQiwqv6zY+c
   hDTlZQSiU9PfT5ArUYiBAoCEoyoZWelAmMaPNAKtvrxS7/Wv+RfeE9gd1
   f0V8SA4MTF/FnkQdgY95UqvTloK0A1HYM2aac2eVDFbTJvBRkcd2kEY4L
   IxBuZ3GyQr6enWX7n7/wPRa0jp7FHs2WlPNF80l15gS/yZp+CPpvI1h9r
   81HgI8E1d2Y2UvQ+O7IZ0Ro5FLu7VTmQqyogXhG3p56z1/tHUnYkhsmRs
   Cg9AZT2e73bCl0FCM7fgx0607CzALH8V+mxdKNmjy1Kot0TK4FNU4RHja
   w==;
X-CSE-ConnectionGUID: cUSjIrQyR7+1NW++HXxszQ==
X-CSE-MsgGUID: KTOF+NEtQYC+AE8F6bG7wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53026070"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53026070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:51:28 -0700
X-CSE-ConnectionGUID: XtPNOqXPT5iWcczWtHU+sQ==
X-CSE-MsgGUID: wDB0R4TWRWqjzgSR8T5uxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151755623"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:51:25 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	michael.riesch@collabora.com,
	nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v1 1/2] media: uapi: videodev2: Fix comment for 12-bit packed Bayer formats
Date: Mon, 23 Jun 2025 15:51:15 +0200
Message-ID: <20250623135116.93787-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For 12-bit packed Bayer formats: every two consecutive samples are
packed into three bytes. Fix the corresponding comment.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 include/uapi/linux/videodev2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc7..421cc0d22ed7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -726,7 +726,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
-	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
+	/* 12bit raw bayer packed, 3 bytes for every 2 pixels */
 #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
 #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
 #define V4L2_PIX_FMT_SGRBG12P v4l2_fourcc('p', 'g', 'C', 'C')
-- 
2.49.0



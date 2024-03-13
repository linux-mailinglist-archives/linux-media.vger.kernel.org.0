Return-Path: <linux-media+bounces-6949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28887A378
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A9A283523
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61141B95F;
	Wed, 13 Mar 2024 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+mpljp7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49819BA6
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314758; cv=none; b=lxf1EqaoPv6FoJV8j835DOmCIA2s8MPX+VvdqPFZpDHJ8WlbNk5A5zwWDHGVzLSDSouqG3M5qCofz2KN+DPKVUaPHczuP6wsZvo3HF78K9b9eAxLNW14tugf3iGnsyNZAW849pBwycXSg4AxWpeX0nLXlDVqgWB90ZW8avD4Dvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314758; c=relaxed/simple;
	bh=w190f1QqqLl54h+qpZaAFDiJqtJqcvNQNkbwtNvnMVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tYNnCaEAWMZrkDBNxfv9aBmSxBTeujvFYd+aowPBL6p3TtEJ+n3ytEIWjU5FydNNkzRyXJz/j63KMBos/S6RdKalUpnyWihgayyN8LRVhlPfLKaRYEOHwtrJVruV1gS7peIYynME6vHP0fqdYxAwUe8KivvfQnH70oE0EJpNlUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+mpljp7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314756; x=1741850756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w190f1QqqLl54h+qpZaAFDiJqtJqcvNQNkbwtNvnMVs=;
  b=U+mpljp7j8Y+LaLHk1XvhEOsrfx01Y6EGMdikpWZJiqbeKOT7tgs6bW8
   SeFYwsHRkeun5bIoSPn7m9kRjvytAuwBISZzReXiTry7x4pMwv7iNQ11d
   brJzvyE8aJpoJH2t9W5XsYbpN3rF4xa8zvLKBTw8QP2ODs8JaTBPrMVuQ
   MC7bPZtz/zrMK4Z/3BAxs34DQ7JoY6bbfbhh3ad4j6rJwS6ApKJt8rAOm
   woVsDgUfiLTg7Otach1I8IuwACr4HILhIkOJgnbH/yHmsVzjsLlAXSWk1
   IRq5v5MA6bKnhVInD5XiR3zSa2wTo0NK+/ykjyiMrSpddPCl/ogfFAKBm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575588"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816421"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6BB811FB94;
	Wed, 13 Mar 2024 09:25:37 +0200 (EET)
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
Subject: [PATCH v8 13/38] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date: Wed, 13 Mar 2024 09:24:51 +0200
Message-Id: <20240313072516.241106-14-sakari.ailus@linux.intel.com>
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

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index d125d23e4e61..95bd56145d38 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3415,11 +3415,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * FIXME: subdev IOCTLS are partially handled here and partially in
 	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
 	 * defined here as part of the 'v4l2_ioctls' array. As
-	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
-	 * in case of failure, but it is not defined here as part of the
+	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
+	 * even in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
+		always_copy = true;
+
+	if (err < 0 && !always_copy)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2



Return-Path: <linux-media+bounces-35304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B6AE04DD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6369C4A3254
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4212459FE;
	Thu, 19 Jun 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNjnl8zF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBD257AF2
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334357; cv=none; b=owd9ANA5j68SGZzUPVuf10akQpVmUeiH+l+1NIY4ereafQSJSxkWJr2gSVG7MhsKvgaR8XoK9YVAUkQV5ihN/UBo4BsALv6M+/NagMwgpyZuPxGFEYz1aR3/UI+EzS4yZ1Vu1yXYiQ1OwOMbtxsqPk7byOq8XWV2blFqjmnc0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334357; c=relaxed/simple;
	bh=DIkwtM1jSrBk7+GS1OA9vrTX9hrUk27Jvnny8G9g4zc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uuJxijqFHmKtR575yBRj1S+S8Yn30m42S48KKEEj4SxL3nwWnHuDfP02Dmd6FcIgZBUAe9oc6ee8GuDJbN2hNOMjd/wonZIFbMsh84aZi5YhwvkhClM6YpHQKUNSm35X56CjZkBLHFqPnRgpv64vEw6Bbage/hwSr+283jZ/r1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNjnl8zF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334357; x=1781870357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DIkwtM1jSrBk7+GS1OA9vrTX9hrUk27Jvnny8G9g4zc=;
  b=NNjnl8zF5RzGXDAxLJVuEPrPmx6VKZyAJs93uLcKAx4RTiS+5fF2JRON
   1m2xcVT4SdIu2YuwXviNJbX/k4jir85FDsjrmKYcHfFb4ot2cl4wnKrXe
   TXmLh8Z/MtwFghtwxgQP70Urr2g+7iNHycUknvkQ37Vz+Zqni8zVyNXBw
   kl1wJFMFNc1cuUCnSfNr5IeDYXoXzn6SNe+1TYeNvL+WPgGU+LgKz8QUn
   /16XEJCyC97cC3LaQC06KaizZH6lV/5EqyMPHJVBvSzGe9i3yfP6jd3fx
   j9jj80sjTJLefH8hQF2dH3faRWP9GWX56USeTyhFK0cLrMXZ4N5IRvOLH
   w==;
X-CSE-ConnectionGUID: u4bsv746TkWp2gTjNK0A8w==
X-CSE-MsgGUID: /fXd0Tx1RAGKkPMh+ymLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386612"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386612"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:11 -0700
X-CSE-ConnectionGUID: r5PMNq2tRH2FIwsFp9XI0w==
X-CSE-MsgGUID: wxmpHSzIQzycESs1K0LhjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908425"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 30A4F1231D0;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKi-0Y;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 39/64] Revert "media: uapi: v4l: Don't expose generic metadata formats to userspace"
Date: Thu, 19 Jun 2025 14:58:11 +0300
Message-Id: <20250619115836.1946016-40-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d69c8429ea80af02e89e5b3eecb78e417ad049c8.

Make the generic metadata formats visible for the userspace again.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/videodev2.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 6f0dacd69ab3..85b588efc23e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -887,7 +887,6 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
-#ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
  * adding new ones!
@@ -899,7 +898,6 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
-#endif
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
-- 
2.39.5



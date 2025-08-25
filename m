Return-Path: <linux-media+bounces-40985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 280EFB33BFD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273AA18850EB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D14E2D837C;
	Mon, 25 Aug 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mi1DPHAC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9642E03F8
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115520; cv=none; b=h8b+a4FWXzS94If9recRiQpVxsG0Fy1UC6I4QBK4lRaA5LKsqGGxydtai4bL880z6n+52uQuD4lrY5hxT1b7hMUGa7cMJ3YTJBVKIjrUAAsGqc8IG4CSZJXNgysly5IsaYHo1TAQKxj3FciYJ2I1yeMgMFYMXvRKh16psEbMgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115520; c=relaxed/simple;
	bh=AtT1Lyyh8mRQLdBcLWUeA3Yf7QuPUQD7Bnr6VAPu4c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IATlPtEwLoXYLRIUr9+8xjY8Q7zkmJGLc09hlnNDZUIfO1BKO5AEDv7kFLWAIPgG3yXC0uQoN2xzsaE5zWqBRxqvM3iSn6UPJR3bh/u4vO7wdMnoxPTLR3HNnPCdaBRRH2uY1SXT8SdrV8WJsjV2uDesUxjV6jimxuoMeiXL6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mi1DPHAC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115520; x=1787651520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AtT1Lyyh8mRQLdBcLWUeA3Yf7QuPUQD7Bnr6VAPu4c0=;
  b=Mi1DPHACVuEF0eOQ2PYDxDJTfjeyPoR2cxmL8YR/3Pd8YIhf1EvkI5z1
   Sxadbi1TSh8fNQFP2bAL1qyS8xX2N5jbqrzgeHZgx16qRylUy6884x2zZ
   nY6PHmit9bYcFRMZ5IJG6BxvnyzwcUXFbmViHHTjwyw7GbRlouJ9mqgp+
   Oiwn6l1Vi9WDGjR7qgZFT58/sGcb+SYzsZE4c0dRa/b1BbIAzrusvG5cC
   1TTrOHmK+mMmPigwnCo0l0sEdtGjfZMAp+zv4yJ1i4bxfxaHpEbRhR1so
   oGYXokpIEYLwFxdJPmd6WHRy4GqkditQxi5QBAVcxRZcszyFQKZjXab8L
   A==;
X-CSE-ConnectionGUID: rfm7+Pb7RLmYcbyBMLnRuQ==
X-CSE-MsgGUID: uAf2A6HAQNmBRCsX9h/HPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032426"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:53 -0700
X-CSE-ConnectionGUID: ql2waNXnTa21KWemxToxiQ==
X-CSE-MsgGUID: /Kf8wUpoQBuPFTlTPSWRow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431142"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E4FA9122009;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahi-3n1B;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 56/66] media: ov2740: Add IMMUTABLE and STATIC route flags
Date: Mon, 25 Aug 2025 12:50:57 +0300
Message-ID: <20250825095107.1332313-57-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add immutable and static route flags to the routing table. The driver does
not support disabling the embedded data whereas the sensor itself does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 2480813113cb..8a2f22a7cf1e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1235,12 +1235,16 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 			.sink_pad = OV2740_PAD_PIXEL,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		}, {
 			.sink_pad = OV2740_PAD_META,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.47.2



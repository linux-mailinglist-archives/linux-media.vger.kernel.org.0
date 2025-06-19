Return-Path: <linux-media+bounces-35319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B00AE04F4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57F6A1658FF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15C325B2E2;
	Thu, 19 Jun 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR7VerV2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA20D25B1FD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334368; cv=none; b=Re332jrlxST7eNTIlE/tNDuC7N0QWsfimCkDUosMiU9P4DmuG+wz0knxobTtsywiaW5KUUU2Dop28EGgnpMKlF5si5IRV9tZ5luvcdH3AsgTkMcQvITomz/PNIpKhG0KfTj5BYEQHJi6yoJXmTMSX6XIWh32jydJVuwZKpaA4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334368; c=relaxed/simple;
	bh=HwA1MiWL/X+yuiy5VxzaOSh1F4NS0g/b7WT5u5Ajccs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XYIoC08QFD307Mi+7cqh/On+1Cty2ej7XVpdNc/bzBQu0cvZnsxd+l10rb7vt+GvyIWIEBBj70AwKO5QML0zgAzkRNKRsY1+yNUK6BFAM9SRYxyxXlimFYf6UA8UNnyg3C7gC3jAQjxwOmEnYKhwOo47wJgZe6AkxT0WCWZ3ybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR7VerV2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334367; x=1781870367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HwA1MiWL/X+yuiy5VxzaOSh1F4NS0g/b7WT5u5Ajccs=;
  b=nR7VerV2gZb4p/l2zgHw/usi2TcBUr1boy4KScVH283ILJxxd94l47f5
   n2hdKTZ1pwZmeL0SjCh2kDveSXYrjmj2L6vm949JvjOK4IACXrLThCWlR
   //U+mxf0FhNEf07dRkGKWtSLQRvVjbt7hHoEA8aEPoOebl2MefvtamsSP
   FsQCzP+jzZL0sWsN75JxebnN17b8BEemfPhZTR9JR8KTrqrssDiphW84G
   vmq1cP2JljOHtay2N7W5dvpIvA/Fn5cZwCwI2NavS122yOWecD/TDwBRf
   /pY5P2H/dhga7koCkqvxdHXWEVNzUkL//BPYV/TQgfz2OYGKlViszRo4N
   g==;
X-CSE-ConnectionGUID: j4vh3PVPSPqsprfyEm1btw==
X-CSE-MsgGUID: 6+M3dulmTial7bF4r640YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386788"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386788"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
X-CSE-ConnectionGUID: tQf23ZVlTDq+enagMttUrQ==
X-CSE-MsgGUID: +pV/HduwSU+lhiZRIryTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908473"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5E51E123280;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALq-1A;
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
Subject: [PATCH v10 53/64] media: ov2740: Add IMMUTABLE route flag
Date: Thu, 19 Jun 2025 14:58:25 +0300
Message-Id: <20250619115836.1946016-54-sakari.ailus@linux.intel.com>
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

Add immutable route flag to the routing table. The driver does not support
disabling the embedded data whereas the sensor itself does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 2480813113cb..55b0e1d2228f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1235,12 +1235,14 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 			.sink_pad = OV2740_PAD_PIXEL,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}, {
 			.sink_pad = OV2740_PAD_META,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.39.5



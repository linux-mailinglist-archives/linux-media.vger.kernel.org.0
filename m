Return-Path: <linux-media+bounces-35317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E1AE04FE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FCD05A3811
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAEA25B309;
	Thu, 19 Jun 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDaMDmmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755425A655
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334366; cv=none; b=ekAZJq8pVRi2xjntW6hvIk3zqtA40J8XwEPPXufzkFf2DcGTxLzpYFyGFui2EEfPOc0aZFWSXJqT2kfmiY7lhD4MPMKxcz/+32ALri6AhwpyDXSgRgnJWO+mq3i49AXwf91bSqU4DUYopfiqVDUf1LBU9lK+glBNhS5wgptZYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334366; c=relaxed/simple;
	bh=aBCht+4r8ybctkxt2QuvUf5P5EOXCr3nr0IneH0L3FY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apjgic8EvhBHYelJYGaQ1XNAlsoaXy0f0Xx7Pt8F2IhtpONN8lWWHX8TqKCJ9NKuTPENzAVY1bgjZ4U/LW0IaCvNQGBNGRiIxiQc5Rxf+RukGiFSQeppTvlU5PzvszegxhELQnOmq7Qjl2qIwfRiaMIUaoDJa4Lr9wZGLTQ8/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDaMDmmS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334365; x=1781870365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aBCht+4r8ybctkxt2QuvUf5P5EOXCr3nr0IneH0L3FY=;
  b=DDaMDmmSZWYqj4rvkNDeSjaxUJeRRYY67zqp4/dJ0ewVARHj7ONhHJUA
   Z0DPcwu0QWhKAGbODheY3BBnnwt/ury9WWSaR07evbQgPsomQQ+7hwsre
   i9y3fkkfn5xdS6BBMe4NgKj0MN+phgsBa/Vl5Ht0yXwxE7n2fYEeNhiJc
   EWN5AxLdtMhgXzrY+yJvwRYW99dK7e2aQn+coCR1kCheXvjDQNxGFjl2F
   tKBV5Wfys5hIdtU5+xnswUMn9eTDZgAsQRvy/2/gzITfaeY5AfPdRkcZS
   QalvKXISZ3PIM6sAfMAVeTdtceDao5uQeVvJ5V3YR1hQ8MvMwXYhYLh4Q
   A==;
X-CSE-ConnectionGUID: kiugzrfoRVaMfp/LqDUk/Q==
X-CSE-MsgGUID: w2SI9K1CRzeAUOMQWAJ6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386753"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: +l+MzlF9QqCF594Fsu5fpQ==
X-CSE-MsgGUID: XeMeJZeuRp6q56v87Pb4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908458"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5BE85123276;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALl-17;
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
Subject: [PATCH v10 52/64] media: ccs: Add IMMUTABLE route flag
Date: Thu, 19 Jun 2025 14:58:24 +0300
Message-Id: <20250619115836.1946016-53-sakari.ailus@linux.intel.com>
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

Add immutable route flag to the routing table. The embedded data stream is
always there.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 87a1614a020b..1bb390c9ac54 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3370,12 +3370,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
 			.sink_pad = CCS_PAD_SINK,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}, {
 			.sink_pad = CCS_PAD_META,
 			.source_pad = CCS_PAD_SRC,
 			.source_stream = CCS_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.39.5



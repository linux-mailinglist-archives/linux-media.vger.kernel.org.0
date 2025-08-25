Return-Path: <linux-media+bounces-40977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62238B33BE2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4257016AEFD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D472DFF3F;
	Mon, 25 Aug 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzonbpGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237302DF715
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115515; cv=none; b=kAKUYm3Hp/AQ2BA1BARfx7fN8ZD6dokRWu7XJcQfFVnj8m3v7ZFSihT6xyrgQmM5kkqqZXl9h/qG6pBB1+SzSlT5GOY53Tp35EeuBLoGYvEwZZ9cIH1wrurHTDJKgco/bJy9dyzKIMEEGcb39m9aK0YZWDqAej8odLHiXNiCzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115515; c=relaxed/simple;
	bh=CK1ee4c6rb6Z7QwMyXH4vSmAdJ1Bxax89mgVnL1Q4sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjtMgk95Cx3XuVlgSR4SYEdTzt1KNoZuICWpAdxR+fUR2/XgJshFGIjrmzhuyi/3T1I0rRhQ+HwgXAF2FQMxD1YQU1B1t3+KMqWTxT8J4hYjWRfD2vdtr6f1tg5x/AOuy/b89BobJpH26oC882KUZB2LWLTfXVY4tL7oA5uVp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzonbpGT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115515; x=1787651515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CK1ee4c6rb6Z7QwMyXH4vSmAdJ1Bxax89mgVnL1Q4sE=;
  b=FzonbpGT20v4GDjkF28tP3CIgl53WZuH6Eb6Z5itV7FTEbmNvKNiWtXK
   /mgTzqbVW3ev0Ry2bE0ksUAgOcfDMuF8CFc6p6aONj3F9ZqZtOKvSWzt+
   k6lvkz20b/ot4mKl5HZLSL59svx7NPjtEJDpPpDBDTrUAJf8THvjQIwya
   h/HxQR+NXO31FMFi5KouNA25okLkdkg6wq4tINGQICj5PNhCxxjyEZ2Bv
   OnUi3fI4R1+HuMQ6kBjAx08ngKkn3PzV+dhucsW/oeNLICBlfw9CAiU+E
   bCZ4AaGuHySUr6+GLz1Kq3lxwt5s2BKN7wv+1CalV7FzCPTBMfh4YACtY
   Q==;
X-CSE-ConnectionGUID: HFo0ugIIRCaMLipCY4kSnQ==
X-CSE-MsgGUID: IMJfdJQuR+qRjX4XR79fTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032310"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: gJM/4YMrSret94++qpt2ug==
X-CSE-MsgGUID: io9+kE6sSEaUG596entjqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431097"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DAD37122005;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahU-3bkk;
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
Subject: [PATCH v11 53/66] media: Documentation: Document IMMUTABLE and STATIC route flags
Date: Mon, 25 Aug 2025 12:50:54 +0300
Message-ID: <20250825095107.1332313-54-sakari.ailus@linux.intel.com>
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

Include the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_STATIC
flags in V4L2 sub-device documentation that discusses routing.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 684ef0844517..2e94e00978c0 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -603,11 +603,14 @@ depending on the hardware. In all cases, however, only routes that have the
 ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
 
 Devices generating the streams may allow enabling and disabling some of the
-routes or have a fixed routing configuration. If the routes can be disabled, not
+routes or have a fixed routing configuration. Such routes that are directly tied
+to hardware resources are marked with ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route
+flag. Routes that are always present but can be disabled are marked with
+``V4L2_SUBDEV_ROUTE_FL_STATIC`` flag. Static routes can be disabled by not
 declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
-flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
-``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
-the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
+flag set) in ``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still
+return such routes back to the user in the routes array, with the
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
 
 Devices transporting the streams almost always have more configurability with
 respect to routing. Typically any route between the sub-device's sink and source
-- 
2.47.2



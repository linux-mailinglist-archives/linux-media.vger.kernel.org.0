Return-Path: <linux-media+bounces-40970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA43B33BEC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7D1C7A1511
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087682DECDF;
	Mon, 25 Aug 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nkmnm/rW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7712DCF71
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115511; cv=none; b=SyiWa0yLZZxpoIf+5cgilxe6fwmeNUg4ySpqhierw2K4aZlGP04pEb4Ttw5DLLE2U5VrBCxI1RLevnJdAYlggKyDMPA7M6BND0c4/8KVg+nnxF1b/38m8kp4gpVYDSkNb4qZRsgFydVwve7CBPIYXK4UocKmbTSe2gjlcBlZ4l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115511; c=relaxed/simple;
	bh=LSIjfHfqlUiZa2Hig9SCzH08HSgnkvlbUDElXWvj6Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzUeRJ/NEOLfjAzSxhkM1Q5eZwsGzbxwWMXpy71Wk+znUl4WFoiXE7oXmucVdAOSWTeI6QL/BwO6K3he7RT+5Ys3622tVypE10jW6RUN2dfAWkoyWf/GHlUhWQ3wA/M3M3Czmo5xAH4Zo7P8NSxfZitwBBgr7Jbcq+Cvv0WISGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nkmnm/rW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115510; x=1787651510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LSIjfHfqlUiZa2Hig9SCzH08HSgnkvlbUDElXWvj6Jg=;
  b=Nkmnm/rWGiVoWqpsHPlJyOh9QBVjxw9J2CTNNNLW3Lv+ZVkMFmcMNPFV
   qruc43AKiTWjnFRbZGke5ZB6A8KaEIW7dfX6ibpzaKiUXWE5sNkT9F8xp
   7J2dE4+Aqd7fh5pynyPijHXGuZ2o0C0l7bxtG8f49j1BNXEGuiMeT0eW2
   vVMAOvMaEzOblfVdkkDIX4rRo1tGQFCDIv+g75AKFjA+PdvubPvUmZTvB
   P/DTfcflAqHa47aZdXkjqB07MzlaT3yLmUPpKQpswPWN4M8yJ+c4/Yryu
   K+spWDweouHtkdFzCVatMY+wVn6JLB5c+46iciscKfMjh/8bCs7I6vqyr
   g==;
X-CSE-ConnectionGUID: VNUNlrRmThinvJXWTAveUA==
X-CSE-MsgGUID: l1pz4uO8SRiIVlX2j5PjvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032230"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: 6Xq5DmwhTES/dLTHC6ur6A==
X-CSE-MsgGUID: fjed4ut7QpKyY2lmyt4Cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431080"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6D58122004;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ahP-3XHs;
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
Subject: [PATCH v11 52/66] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC sub-device routing flag
Date: Mon, 25 Aug 2025 12:50:53 +0300
Message-ID: <20250825095107.1332313-53-sakari.ailus@linux.intel.com>
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

Add a flag to denote static routes, V4L2_SUBDEV_ROUTE_FL_STATIC. Such
routes cannot be removed as they are related to hardware features.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 0b90be43af57..3c7fde673b34 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -151,6 +151,11 @@ wants to retrieve the missing routes, it can issue a new
       - The route is immutable. Set by the driver. Indicates that the
 	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
 	unset.
+    * - ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+      - 0x0004
+      - The route is static. Set by the driver. Indicates that the route is
+        always present and cannot be removed. Implies
+        ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 839b1329afb2..cb353fa4a4a6 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -209,6 +209,11 @@ struct v4l2_subdev_capability {
  * unset.
  */
 #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
+/*
+ * Is the route static? The STATIC flag of an immutable route may not be
+ * unset.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_STATIC		(1U << 2)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.47.2



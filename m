Return-Path: <linux-media+bounces-35301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53513AE04BF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3C7E1885D77
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BB823C4FC;
	Thu, 19 Jun 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2+4qHRT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F1257426
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334356; cv=none; b=gv8H+XnbT9kdI5j+rO3dGfN10zHTFQcJWjvdVSPjGOQnkTV7x0cjjY2aFNYlOXEP8dp2HFFpUTG/Hx+prg/Fc1NgGOBGOIVKVa9+fFg7799na6PCuaKdPyz9fSEdLqpWmj00oJNh2zuprvTGsNr1OrSq67Wpgvn8rFVrLebTxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334356; c=relaxed/simple;
	bh=Z6fQ93vQqWmVN2lvR+FF0AB3K4ZcqcfysD6OAQ/yFaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aWKA1jHBA1qNAgoZaBl5t8osCHARt5n0kn6J5GvDaxuiCDo45bQDYR7rXUlswd5DfYz9lNDM133qshCdF2X5da8mJvh5dib5IlN0BJGt0k2BJwtJckDODHUQWvfSoE/dJNTUWaYtuf/mQOaFg7hB0I4vvrdjYCODpPjeKCggonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2+4qHRT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334355; x=1781870355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6fQ93vQqWmVN2lvR+FF0AB3K4ZcqcfysD6OAQ/yFaM=;
  b=j2+4qHRTOD+psLYkpboAYRd2/sKaGjHAb5z00pQpRvcSbtWoqeSk5yXp
   NJHZeSEIGchwlrQGY8uWY0P8WV5mbw/5xOD+G6e0HX8QavVzop0E3F6JW
   d9WCZagMGciETQoQQdDGdBC1+UwwS7+hX4tP/5ionNb9WgGGuvAKzw/RE
   IwgPe/uqoq81PNMR4z06OwIdiqhKNz1A8ur/dSbitHqnzN8lbh+vb57+q
   hP9VSJlbXP2JGXNNeS1IxzUAx1ofyvfbrH8CiAH1cUlcRvPyp+FiZsm1c
   c7zNBgYtaNdqjFBvh9KADjFWUqsAhzPZGSpcN/dlKhP5zm1qxRZKikaAf
   A==;
X-CSE-ConnectionGUID: bwEP7CU2RaaWieh/5yWPrQ==
X-CSE-MsgGUID: fC8UmrviTmGhad0GOb/tpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386580"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386580"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:11 -0700
X-CSE-ConnectionGUID: OpNhsLXrQEWj6MIxvhi6Zw==
X-CSE-MsgGUID: 9Ew37n+6QKOazp98qtDSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908419"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 23CD512276E;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKO-0N;
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
Subject: [PATCH v10 35/64] media: Documentation: Add a hyphen to list-based
Date: Thu, 19 Jun 2025 14:58:07 +0300
Message-Id: <20250619115836.1946016-36-sakari.ailus@linux.intel.com>
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

Add a hyphen to list-based for uniform spelling in camera-sensor.rst.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/userspace-api/media/drivers/camera-sensor.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 16dfa6d841c1..074b8ca11785 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -26,10 +26,10 @@ of cropping and scaling operations from the device's pixel array's size.
 
 An example of such a driver is the CCS driver.
 
-Register list based drivers
+Register list-based drivers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Register list based drivers generally, instead of able to configure the device
+Register list-based drivers generally, instead of able to configure the device
 they control based on user requests, are limited to a number of preset
 configurations that combine a number of different parameters that on hardware
 level are independent. How a driver picks such configuration is based on the
@@ -80,7 +80,7 @@ is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
 the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
 sub-device. The unit of that control is pixels per second.
 
-Register list based drivers need to implement read-only sub-device nodes for the
+Register list-based drivers need to implement read-only sub-device nodes for the
 purpose. Devices that are not register list based need these to configure the
 device's internal processing pipeline.
 
-- 
2.39.5



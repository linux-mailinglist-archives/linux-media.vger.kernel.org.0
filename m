Return-Path: <linux-media+bounces-35298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE45AE04E5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2EF3AEBA9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443A4257430;
	Thu, 19 Jun 2025 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfas3f+D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBCC2561DD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334354; cv=none; b=uWZgJr4X/SIfrZSHveLaivdEDXSE6BbFSrSKdN/6LcLWOmbfZkWOHtDr6hTFOUy/sOgnVy0Y/gXn9iz/u54D1/Vja/VAbnwvw//WCUvl0l8cqFJpmLIQAwS95IAcuMkuH01P/NMYMO4mSNSZYbZQ9LzxHqVQkwR+2+UOz7ZQsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334354; c=relaxed/simple;
	bh=t9z5XUBV9d/Mnl0I+EAgmtXn34wQG1D/vXxQXvRG87Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZFCePCt/4FVweIjJgAIGISl4TaHGWxBuBiymVrODs/8GF96L8eXnb7hJfckDy3rZaTalDQ6I/M/mDOUiTqmSYCA3389M0uICOdKdoPIW42kJO4jOLWYB/vXb7O0wkWKDmbHOk6u5SuIi/IP50ulaJrC/853d+0GgW5/UcPmXPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfas3f+D; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334353; x=1781870353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t9z5XUBV9d/Mnl0I+EAgmtXn34wQG1D/vXxQXvRG87Q=;
  b=Sfas3f+D1NminnSlF2DZTKZrRGrcppKSK6HOsDRuLJAim7A8YgX9NANK
   WDgz6oZNBqBH2g8O4o3KldPOGvgmgpCCVwC66ooWUi1CqGGdc9fnoGCbj
   qFp20MnauohtAd53dw+229yreQQ02AsJiyb+DBHGa5AhnPqSB2HZJ4rog
   G8wpwni7gNN99HDVZx31A9vzGL/fnZ/Zvn+7/FPCoaQRHcxvpnUDBF1HP
   AfX3+80T+j/Mm+XXeRGdxSh7qFUZzaf9BuUK4EE+ta/QOZk6kZ3NCSB7v
   dk3blu012CWqSLD/uqRxO6TdysYM1bNGCrcYqsEzyukcckUfXGy3NSIhI
   Q==;
X-CSE-ConnectionGUID: YFqiipMCTUe3z5bRn3QpIg==
X-CSE-MsgGUID: TRNa41EzQ+iG/ByJHd7RBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386495"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386495"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
X-CSE-ConnectionGUID: w3wGM+vfRM2OZPyr7SmBBg==
X-CSE-MsgGUID: 2XrhXz7ZSrygeCn2DbNMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908325"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1F4D8122443;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKJ-0K;
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
Subject: [PATCH v10 34/64] media: Documentation: Rework embedded data documentation
Date: Thu, 19 Jun 2025 14:58:06 +0300
Message-Id: <20250619115836.1946016-35-sakari.ailus@linux.intel.com>
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

Rework embedded data documentation by removing the reference to the pixel
data stream. The specific documentation of the embedded data interface
will be elsewhere, in the near future either CCS or common raw camera
sensor model documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index d9589ad80204..16dfa6d841c1 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -124,13 +124,12 @@ the sensor configuration for the captured frame back to the host. While CSI-2 is
 the most common data interface used by such sensors, embedded data can be
 available on other interfaces as well.
 
-Such sensors expose two internal sink pads (pads that have both the
-``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
-<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
-embedded data streams. Both of these pads produces a single stream, and the
-sub-device routes those streams to the external (source) pad. If the sub-device
-driver supports disabling embedded data, this can be done by disabling the
-embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+Embedded data support is indicated by the presence of an internal sink pad (pad
+that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
+``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
+format to model the embedded data stream. If the sub-device driver supports
+disabling embedded data, this can be done by disabling the embedded data route
+via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
 
 In general, changing the embedded data layout from the driver-configured values
 is not supported. The height of the metadata is device-specific and the width
-- 
2.39.5



Return-Path: <linux-media+bounces-35293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FBAE04BB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AEFE18833DE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3432459D1;
	Thu, 19 Jun 2025 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaomGDiC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403662566D7
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334351; cv=none; b=ZSe2b+r9BP+d/8BzCYXYT8cepsGKQkVYThRKMaIk0gx6+BwU8pPwen5oOp53xHwY7eCUihwvjsw88+eEELEVPotbsviAzqInGGGqnPlqnxW8Kj9bsj8Ee9/APnvCb/xqMdkx66rYcgpT47z1tYyVk3MUzoD8til1x8IfMOE19uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334351; c=relaxed/simple;
	bh=+Wrq7GkW+pir+NhS/kihFZy7ORgWRj76BLs4E33adcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QPuzj6n9m9cXT299m6ZgKVVEpx4d62+kmpbdnobrvZNsikjOPS27kNaz+rje0CFHy9iQK4egdoA/DyAAoTAlTVxccldFcw1NqZ2oqxk6kSGeRRFTssWj37JXH9lLXH5UeUH39/nLtQOB83TYJO05Uwb9fusYtAfvIPu8aHMdEu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaomGDiC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334350; x=1781870350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Wrq7GkW+pir+NhS/kihFZy7ORgWRj76BLs4E33adcs=;
  b=AaomGDiCu7R5U5PHB4wcioBILXb0XOn9TsJps6ETPp6SJmXltlf+jsu1
   R9C68+v1VP1m9M2QaKVV3wAgrz5JGflAYejV7JyHk+ADW6Wzt9URYxtC2
   clZy5Q/283sqPcneUy9LZ9UIebhQxbEUaULvvBdmCJufqYHWl35/TcwUR
   9i508B+JbkdH9g/5DQ4PbJOzBR/hhl9jPAUiIrV2a/+0nkokTnspc/SnE
   oA6aTJb/+ZlGODlEcD8bT3AfaH3wjjPXiFbTjNHXrNguUnmCWFSZYVu+4
   aJJDDTDDk/tcaKimX+tsqq8iL7sXlOMPkAt52xD0R2yEyykZWHYnJhlHt
   Q==;
X-CSE-ConnectionGUID: zj1P1oMSQyqVvNTTLbvMCQ==
X-CSE-MsgGUID: jrCCqft+S3eNp2ISQTb1ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386449"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:04 -0700
X-CSE-ConnectionGUID: 08K2uJ03SwqSFHgMqDV58g==
X-CSE-MsgGUID: klu+pADKTRu1UZgFrRVqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908306"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0814D1218AF;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AJk-01;
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
Subject: [PATCH v10 27/64] media: Documentation: ccs: Document routing
Date: Thu, 19 Jun 2025 14:57:59 +0300
Message-Id: <20250619115836.1946016-28-sakari.ailus@linux.intel.com>
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

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 43 ++++++++++++++++++-
 .../media/v4l/metadata-layouts.rst            |  2 +
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..67c7d2b62ed5 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,45 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if it exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (sink pad
+0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
+(internal sink pad 2/stream 0 -> source pad 1/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The metadata layout
+used for this format on the internal sink pad is :ref:`V4L2_METADATA_LAYOUT_CCS
+<media-metadata-layout-ccs>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :term:`Data Unit` for that
+particular bit depth. This is indicated by the generic metadata format on the
+source pad of the sensor's source sub-device.
+
+Devices supporting embedded data for bit depths greater than or equal to 16 may
+support more dense packing or legacy single metadata byte per data unit, or both
+of these. The supported embedded data formats can be enumerated and configured
+on stream 1 of the source pad (1) of the CCS source sub-device.
+
+The use of the denser packing results in embedded data lines being longer than
+the pixel data in data units since the data units are smaller. In bytes the
+embedded data lines are still not longer than the image data lines.
+
+The embedded data format is determined by the sub-device image data format
+configured on the source sub-device. The embedded data mbus code is only changed
+when the bit depth of the image data changes in the source pad of the source
+sub-device.
+
+**Copyright** |copy| 2020, 2024--2025 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index 5f717d54d1ca..a4f7e93e6a29 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -37,3 +37,5 @@ devices that fulfill all three levels above.
 This metadata layout code is only used for "2-byte simplified tagged data
 format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.39.5



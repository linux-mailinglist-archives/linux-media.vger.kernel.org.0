Return-Path: <linux-media+bounces-35271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FBAE04AF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771671897C04
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE684253B68;
	Thu, 19 Jun 2025 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU8wXs0j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75B253954
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334336; cv=none; b=W9GhQplxmOgifIHghmrAjjnjwgk8mzW4AOT7i6VAWJiNSkSErzGBITikER+wsWThb/AoTOiDCgOd5y/b+ci7w0psYsz3CzRYPtaSiGzCnJ4dru1albStS8LsgNFk+zopmHnS5IslGvYlm6+oFHBdbZGaqOtX7bFsoZ8lVMcpMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334336; c=relaxed/simple;
	bh=QCAYOh8WejGGbjffcyXfJJ7X625BFp/qYjJ6R/zkhvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TBhu3okNiJ5bo2G7pnR7OGnXXnyqSQ4DlqMRgW6LhBhdaXf3b0Lfmyf/qthj6/FsmxxGwHqalrDb/R/TH6eUV3uOfaFLpRu3gvq4u5BxWKDNZZu6ofJ4hWT542H92vAct9iApFD8DbhAUknvYUtPOlD3Fvs+roMBWttJqzzyw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU8wXs0j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334335; x=1781870335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QCAYOh8WejGGbjffcyXfJJ7X625BFp/qYjJ6R/zkhvg=;
  b=EU8wXs0jCWIozclF4VxFCflZODwz1WSOVqHVEvEl9TDC2qKMcG6WGpb4
   27Xy9DccfijJKKg+sGGabYZmf/3ny8+r7k9d31JymF6uzclc+snbOTg4j
   E605Nalvv4zCQWrSldtIDchl11GRAgpX37qYvV2kQwLlrUgDFGq3OdA0Z
   +Y2EgK0Ztiq6fmDNruefEHMqGXte5FpFaO+E8NwqQfaWVY2Kj62Wy1u7T
   kfvuoDftxOXPTxihf/3QFojFlbcvSLPr7R0Hvim+7hgZ+rTHRhJMlbJO5
   RKc8yAKH7PdF4YiixbQQVjYA2L9OaHmspG6wShEFMuqbPIzLDsdVonhWf
   w==;
X-CSE-ConnectionGUID: bHmWaWkMT06/g+gnNktrkA==
X-CSE-MsgGUID: jfbtnB5pRFWKIzY51XMh/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014842"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:55 -0700
X-CSE-ConnectionGUID: /7PQnIeLTvS8imzB9QKPMw==
X-CSE-MsgGUID: /3jcepZGSjWUKy4yD0M5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192202"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BAD7012072A;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AID-2N;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 08/64] media: Documentation: Refer to internal pads in metadata documentation
Date: Thu, 19 Jun 2025 14:57:40 +0300
Message-Id: <20250619115836.1946016-9-sakari.ailus@linux.intel.com>
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

Metadata is intended to be used with internal pads when it comes to the
source of the data. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/metafmt-generic.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 78ab56b21682..90a1bc2ea15e 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -7,12 +7,17 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_M
 
 Generic line-based metadata formats
 
+.. _v4l2-format-generic-meta:
 
 Description
 ===========
 
 These generic line-based metadata formats define the memory layout of the data
-without defining the format or meaning of the metadata itself.
+without defining the format or meaning of the metadata itself. These formats may
+only be used with a Media Controller pipeline where the more specific metadata
+layout is reported by an :ref:`V4L2_CID_METADATA_LAYOUT control
+<image_source_control_metadata_layout>` of the source sub-device. See also
+:ref:`source routes <subdev-routing>`.
 
 .. _v4l2-meta-fmt-generic-8:
 
-- 
2.39.5



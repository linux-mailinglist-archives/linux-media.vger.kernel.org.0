Return-Path: <linux-media+bounces-40938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2494B33BDA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067E71B60369
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD162D6635;
	Mon, 25 Aug 2025 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSgtObte"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF312D5C6E
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115490; cv=none; b=Q1GYIZgpWKc8HyeLa9IoLEH3HjVxYAVxTlH4BESgToM4z8B4wHEBSQieFOtDd4rlpNRS4N4C5hdt8s7vE2NoP8ENrPGAHcWmoJwEuq5Y4DTdSpxswHSpPPibd4ZKwNvl7RH3UpzznLTIlNw3yvh1TCXxwthl8yCAOVqImtc9X9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115490; c=relaxed/simple;
	bh=z3OT9BwgLZsjMCY3Dn5di2E7N0fRMlZdcarxvhWYZYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBsOTVvtgOEl7UnSxCGxzF6ACOs9vZOPJH0owJYbNYYCefOPU6RA8PI8kvUavPkDC5BA59sDahNe0/DcF88EJW1y1DdN1ngnv5uGDBBvC9gFv+LQsVCuiMbCX58p/d8a26K0obtmXHPNh+q6gtRJJxDh4Fs6sGYPgSNG4ekox7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSgtObte; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115489; x=1787651489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z3OT9BwgLZsjMCY3Dn5di2E7N0fRMlZdcarxvhWYZYk=;
  b=mSgtObtemSdAmGlo+sJxhegskiCkbyVHSEhdlIQ4W03A3AEucH4glr0S
   0KtL/M5ehqlzppK+ARhz6ffcZ5R8V374H/2b7XaLUHaS+sQJpy/MYLjxY
   +Fg9LPt6cEnUflrFAWQwIjjuH0Af/6SMrkgqnzujX3ESRJUE4w+9QWSkY
   nedCOXLoNO33T3vm57ZKJQjlabF+zEqLqOJk/eAgV4lY1/0pfZ8Fq6uPv
   UT/F1nvor1T4eztCQ4hsmdcw1g4uaJ6r33CP5mdYUDb0+gxMQKBMuwRrS
   GdbiEu1oZL2Rr/ggLPzVWJOLeAbXKmwcHbG50sBIkMO92eHc5Fur8PPj6
   A==;
X-CSE-ConnectionGUID: SSt/8KXTTlazkYqchLfQnQ==
X-CSE-MsgGUID: abaGqZ7zRTqmm0jO69gxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695845"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:27 -0700
X-CSE-ConnectionGUID: I9DVnCAITbiU7IiV8JxDWA==
X-CSE-MsgGUID: Qhp4mYtGSm21gjI4o0ai6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195423"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4059F121FA8;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aeK-0wKL;
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
Subject: [PATCH v11 14/66] media: Documentation: Refer to internal pads in metadata documentation
Date: Mon, 25 Aug 2025 12:50:15 +0300
Message-ID: <20250825095107.1332313-15-sakari.ailus@linux.intel.com>
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

Metadata is intended to be used with internal pads when it comes to the
source of the data. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/metafmt-generic.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 39d529c910a8..e8824b5a65d6 100644
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
2.47.2



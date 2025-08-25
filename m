Return-Path: <linux-media+bounces-40964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77559B33BD5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501C41641AF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF242DCBF2;
	Mon, 25 Aug 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d07bO/It"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EA2DBF5C
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115509; cv=none; b=H7Vn1MDwnJpj69skN6uzQDjmaGWPa/lJANnqDddhGTz11SM2Gh5kVD4gAp/FozijNjHpSsE4I6MvekWkK4uUTeQCQwVpT6hbHb54W95ucUaq8/+EuL8D9E56+Bqk3PJX91X9WdVtoMMqOGWmv3XQ++DTsN0GQws2ASk4rTC02Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115509; c=relaxed/simple;
	bh=ll1ntIYYQb8o0yIdfVhCSNLzjzY/CAqIfG+Y6a6ikU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqb9sU4vMHc/sP1XiN+2jX9RYC2fmsba2yGKyTrYp27sDMHJ5rAN3B1SlS1IZODHxlolYRxypWTtxkA1HR18jOCiWD7NFpx7j2mHStKVoYLBIF1dlBxXUsaDTYUY/tC2GRWmdQoJr1mM+Py22rdDzHIvEMGZU6QFFq5jHx6q9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d07bO/It; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115508; x=1787651508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ll1ntIYYQb8o0yIdfVhCSNLzjzY/CAqIfG+Y6a6ikU0=;
  b=d07bO/ItC52XVT/1Y+8WyP7DxKE9HPmEGUSHl2gMVPlXcuB1AfKnkb9v
   DA74DPeVrql5cJnvajDEDkGYMJeht/UD9tXhnIYvamEAGRMwh0Dhja9VV
   6B5UtZEf4RCgydV+2odhqxl22kfC8SKQie/9V2AC8ATx5KCmWl1TDLxys
   gHWjAyz61q4PN1LvFq7ZFHntMkuLKjbjc/LWJNSoM8DwIO7Qnb7oOwuYa
   OB/EmKIuYF3+lKYkywVq9kyqd90/EIxr2b6vlfZGqTO1xOzP0sfW4S8te
   5U7iNgy5Snq1UiR0UwA/dt+oBcXuivyIFI8kJykJejYmKr8jKvXsU6/Ro
   A==;
X-CSE-ConnectionGUID: jIoNjP7yRDytgjbhlbsI2w==
X-CSE-MsgGUID: ts13x6q+TDSUXXh1kvQNnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032187"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: 0A4vhtRySMe9fEuiIcTNXA==
X-CSE-MsgGUID: ZppFCuxKSJK0ttATcXt99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431067"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A7EB7121FF1;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agQ-2jBf;
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
Subject: [PATCH v11 40/66] media: Document enable_streams and disable_streams behaviour
Date: Mon, 25 Aug 2025 12:50:41 +0300
Message-ID: <20250825095107.1332313-41-sakari.ailus@linux.intel.com>
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

Document that enable_streams may start additional streams and
disable_streams may not disable requested streams if other related streams
are still enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 4b28086808c9..96a9c869ffb1 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -814,6 +814,10 @@ struct v4l2_subdev_state {
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
  *
+ *	Starting the requested streams may require starting additional
+ *	streams. Streams that are started together due to hardware are called a
+ *	stream group.
+ *
  * @disable_streams: Disable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
  *	state management provided by the subdev core (enabled through a call to
@@ -823,6 +827,9 @@ struct v4l2_subdev_state {
  *	Drivers that support only a single stream without setting the
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
+ *
+ *	A stream is only disabled once all streams in the stream group are
+ *	disabled.
  */
 struct v4l2_subdev_pad_ops {
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-- 
2.47.2



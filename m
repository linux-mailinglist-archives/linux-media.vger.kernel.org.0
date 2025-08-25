Return-Path: <linux-media+bounces-40944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437BB33BC5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19490164D46
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269E62D7395;
	Mon, 25 Aug 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQwFDAkX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEA92D7386
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115497; cv=none; b=AuZxJsLvpt96m0XgLCK/8zUn+pBU+8pVUMvcb2cf0dJ6yHGAh1LX4GA4UGC9AzESnYVTetnBU8AXtbfOa89qufd+7HIclGVkLbaROskqd29m6vzfBclmOQLcFE3DfxxuOdZOBMN/rusa9p/ky5d30sZ5j6HdTdJ/eq0b9nsAtIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115497; c=relaxed/simple;
	bh=tppQ0Yx+OwS2mHHjiqf1escBxU4AeRSmYrEO4ZGBt5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSTlGFUDP2Uigkznj0GjmMPNa9CcjjOxPzjPxJps96mcZaChLg8HWBC0cYECW3SdSKA3eiTPSQUiU/GK5qdlVg/IyZLEL5aGMCIusW6uM8U6urxe73z6vH14+i6DJ23HiUI+zO7j/uwkimJYtoOYxX7dvjrYiWR/q1uezr3EE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQwFDAkX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115496; x=1787651496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tppQ0Yx+OwS2mHHjiqf1escBxU4AeRSmYrEO4ZGBt5s=;
  b=UQwFDAkX02VtPIDp/I/Yg4IwNZ4Y5niMO3vsVvCdpoRMiwgLmcZwIk56
   /7FK2OOwCy2HmmfgyfCGoJwByem5O1Xul/LDQZ0PvU4TzhBrKnwLZHhHZ
   K7fCVzo8Sad9lMasvmxyiz5edfteIqzedvRgpfv0VP7esqSxzgRuDGN/0
   si18qIEC/IL1aXTLreufDpI9etu61J2Ex+3DYECCl4Uo7gdl52vaOGBjK
   mDm8B0Ckhhcstrpcq9EdQM6ai4mhtShUGK8DX7wNMj9pDB8xVUkoghTYh
   zUgtCyeTaNjb+H5YLvT9Rxm8atktcXnyfGDREIRcKaR1sRfisK95A2lqq
   w==;
X-CSE-ConnectionGUID: DlVY2XdJRpWkBJJZn0L7tg==
X-CSE-MsgGUID: fDV8LS/6RsyHVcdFO9qSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695925"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:35 -0700
X-CSE-ConnectionGUID: /ZJ+kiXcSouP4MWXIJtRhw==
X-CSE-MsgGUID: gDqRHmPiQVSgp6N2PsLL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195484"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64125121FCD;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005af3-1Vso;
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
Subject: [PATCH v11 23/66] media: Documentation: Document raw mbus codes and CFA for cameras
Date: Mon, 25 Aug 2025 12:50:24 +0300
Message-ID: <20250825095107.1332313-24-sakari.ailus@linux.intel.com>
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

Document the use of raw mbus codes for camera sensors and how the
V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
to convey the color filter array pattern on UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383f..a8e0e4accbc9 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way.
 
+V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For raw image data originating from camera sensors, specific :ref:`raw mbus
+codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
+<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
+raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
+control in the same sub-device defines the native color pattern of the
+device. Flipping may further affect the readout pattern as indicated by the
+``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``
+control. Further on, cropping also has an effect on the pattern if cropped
+amount is not divisible by the size of the pattern, horizontally and vertically.
+
 Frame interval configuration
 ----------------------------
 
-- 
2.47.2



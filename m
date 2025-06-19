Return-Path: <linux-media+bounces-35278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2726AE04D0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D01D3B1ED6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2D6254B17;
	Thu, 19 Jun 2025 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpV1/cIr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09DD25392C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334341; cv=none; b=s5mapZ547+HyqnXAFXvT0Z1PiM0GkMgvK7XdZmp/if4BO0DTbVT94D6gkqvCWXvTuWlWNFtrF2X10ruDZ1AZfwPzYw6GG5jAdjJShyK0dFHc8UyktaeRDEP3GlIs1B/74Ejh5oJkMJoF87EVr2l2EewvYyxysK7R7Y6u1MMWM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334341; c=relaxed/simple;
	bh=demch2edbDZ5Lwjmue2frzPfboz/6Ui0QD+sCbt5aB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=epLwUk0ublgXxohj3kZX1DSWkPpp9VPXmd9RTbQhG9d/f37wHtsEXf/dZ01w637SUia5JLWYZHlZdaWICrrpoDRmxxCS3IsTwiG+a/yOjGwvRm/wfplG+KPbosR5t4jpvkK4ur2EJm8dZaNpS3cjm5LSCBhYWr7Hx5o3mTflVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpV1/cIr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334340; x=1781870340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=demch2edbDZ5Lwjmue2frzPfboz/6Ui0QD+sCbt5aB4=;
  b=lpV1/cIr86dX++WpU6YFCRAZn3Rb7GS/dnoM2NM3hjUUiB4gpqJdNC0R
   6/1rbWvi8AiuCg7cDyr6H7dzzT5zhb1GYyrJSfmnBpDK4Nv1oLqIgi8Z1
   pWDAfuRLIdt/HjmdLLx460IGAQRvsr77Mt/0tqRI+JQ+OrE1j1H0DXizk
   HBh6j6j/CIvbsWZme4cjuXlHHDbDGOtX65WmWdS7QifaiwdY7Hv8VraE/
   ChGetHB9adoD2ZBa03/MkdE9+jWQ6zAGYAEIq7wUX5x4YBM9Kg+l8iMxF
   eqpNX/UelE6KQ1vXjP17k4/6t8Iwwaal6hX3a1DAN6vAezfnFz0xs4ZSV
   A==;
X-CSE-ConnectionGUID: YSYv+GUlQLOF2SD2SDrS8g==
X-CSE-MsgGUID: cShYVrNoQqG2yDu41G6cvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014937"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:56 -0700
X-CSE-ConnectionGUID: huh1oiGHS5e90o6QXwN9BA==
X-CSE-MsgGUID: ncXiWx9tRJ6feleATJJ7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192220"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D001A120AFD;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AIh-2e;
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
Subject: [PATCH v10 14/64] media: v4l2-mc: Ignore internal pads in finding source sub-devices
Date: Thu, 19 Jun 2025 14:57:46 +0300
Message-Id: <20250619115836.1946016-15-sakari.ailus@linux.intel.com>
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

Routes to internal sink pads do not indicate a sub-device would have
further links to upstream sub-devices. Ignore them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index e593d00f7d70..7247f9f30917 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -636,6 +636,10 @@ __v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
 		if (!(BIT_ULL(route->source_stream) & __src_streams))
 			continue;
 
+		if (state->sd->entity.pads[route->sink_pad].flags &
+		    MEDIA_PAD_FL_INTERNAL)
+			continue;
+
 		if (!has_sink_pad) {
 			has_sink_pad = true;
 			sink_pad = route->sink_pad;
-- 
2.39.5



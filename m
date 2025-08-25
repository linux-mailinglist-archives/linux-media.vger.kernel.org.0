Return-Path: <linux-media+bounces-40972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD901B33BDF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06AA168340
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FAC2DF3F9;
	Mon, 25 Aug 2025 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJBigK2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42342D7DE2
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115512; cv=none; b=CXzD0pZF40TpC8imwHyRxvmkX8KUgocxZlRwa5KXeIDpt7WVK+h1P8/YUV1rHaSK5bKhT0Id7ZN0GWLOugk9L3CuLfZeIhOj+Dj22vvRB8/aSohdUufnS2GY4uxRw0Dcy7HRaekB8sK7+46AJoXma1kOaJGmPEYJDAixo5Dj8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115512; c=relaxed/simple;
	bh=jl7m0NN7IM9nfApZSwENhmrvtAmxA09eHvuzMyoE1x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMjnVZtazChOQs4aMvbxspFypM+Xozykh8VDzZzlLSKN2cPlBuCuwBXbiRTZsJ0YxBZ/2VFXB2l9ec1qWsbjIuIhJO0SWU7KQJ2ieq74NULsjHKNKMCftPgeItA9cwgBo/VoknOcTTL41lOZYFpbM+FCy3F4bWWiCgEQNmy71js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJBigK2F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115511; x=1787651511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jl7m0NN7IM9nfApZSwENhmrvtAmxA09eHvuzMyoE1x8=;
  b=HJBigK2FlU8r8DDxt6xEKLMTASM3VIXCtdI2xio5oRmH3pL2qJL5Vqde
   Z6xRCiB7SkV29gIp8oOM1couM32AVgr+kkCzC0Vke/RY9KxJsMz0vN/AN
   FbEcbAzQZm1xvZDyM+VQ6+pZU8d8nMhYBUZgnxbDoXK9IfalDZdxk9u68
   Rkmc3b5/Fb9btz4/mkvM3n1ta1mv5RWNrNvvy2CismIUGRdTxmH6TT6pi
   tYvTXK8QbazMZovJ6pHTSMOd9EjvT8P7RJTr/pHj71/HtIDGnFPTrdZR9
   BdBzSnm8L8LMNLkQNIPAqrAcH8btR7Y/hXfwRR9Eb7MWhg6n2bBMTWmfv
   A==;
X-CSE-ConnectionGUID: JKwoqp5+Su6ecaWF+T63Bg==
X-CSE-MsgGUID: CHsukMe0RSemfd+G6EQJ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032260"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: 6jrufBTLQjunFl8QLsBwqw==
X-CSE-MsgGUID: /4XJOGK2ReGuGqmtLDKbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431084"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CA432122000;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ah9-3Jwn;
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
Subject: [PATCH v11 49/66] media: ov2740: Add metadata layout control
Date: Mon, 25 Aug 2025 12:50:50 +0300
Message-ID: <20250825095107.1332313-50-sakari.ailus@linux.intel.com>
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

Add the V4L2_CID_METADATA_LAYOUT control to the sub-device's control
handler, to convey the metadata layout for the sensor-generated embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0b9309fd0461..00319eacf89e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -863,6 +863,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 			  V4L2_CID_COLOR_PATTERN_FLIP,
 			  0, V4L2_COLOR_PATTERN_FLIP_BOTH,
 			  0, V4L2_COLOR_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_OV2740,
+			  1, V4L2_METADATA_LAYOUT_OV2740);
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
-- 
2.47.2



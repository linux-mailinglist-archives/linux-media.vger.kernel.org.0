Return-Path: <linux-media+bounces-40943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59539B33BD1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4037A5D13
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE282D7393;
	Mon, 25 Aug 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU9uPzOf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD92D6E75
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115496; cv=none; b=o3yx+zYpatBcVcWTmuBPfwMDZBts+ydux5MZzlgnYinTSoBlhD+kTnrbndYzr0pjcUyqY5LvtEqxJtECwbS+/5d1L7dqFOLeI4t6CYJ++h8v2MzW1I40hYstCvK1QDwAIAdwyJBZ9yUxkTE+IK+jX5YPpV5g6ROXmL5bgMv4+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115496; c=relaxed/simple;
	bh=fnIvM30knaf5nTEWJ8isfJN0f9IAy9fhfpe04Py1iSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3o2BHDXnAEXWV2mSKrPoLytOghWUuyhKSeYx4G3WOdmbtjK68Au9by2AA35w4AI6Weh1XbrYqpwJvcnyC1BFz5BENoXraZaDt0iJ/ZuMqDEzOCAMbPTn2ZYW9LDqtHHpdNyuyoAW+2mE+i57dRUl53HZc3TV/Jv7RnOx7JnrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU9uPzOf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115495; x=1787651495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnIvM30knaf5nTEWJ8isfJN0f9IAy9fhfpe04Py1iSY=;
  b=hU9uPzOfVCzFUEomZ8nFulDZNx5rvSNCX81Ip/J6sFRyDNd2m5pZmQ2l
   sqSaYlVw0vCLSGu8Nl34tPTVivpVjF+nG0QK3A3ryP0gCksgeMUq+28/x
   OkRAuynaiE7rkX8KLC9p2tbV2fCeoNgm/Ezk1Puz8TNY6wfLwWzEF0e4J
   VP5vLDfKQz6y9wtYZvLGot8w+e0mdT78dkq2bl/1BkaqAYDc29jtdJ664
   Y56mv6g1Zt4EaIoyL2SVRpSMsIIU9DuUlRaqhhNC1tRjvJHFe4yjOn9tY
   loml32eZMGv/GuZMyX2aRLvo+anIGRrqKuyvLz9yz4b5XOM46k8PN6LiB
   w==;
X-CSE-ConnectionGUID: HMuWONG6SrOrMZSuyFw9Gw==
X-CSE-MsgGUID: UH9semCpTvOE0UsXcqslFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695913"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:35 -0700
X-CSE-ConnectionGUID: hq1ThGajSxGBbxmSyOgg2w==
X-CSE-MsgGUID: bg3cAkyiRNySL5/lEZ86Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195481"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47289121FB2;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aeU-14as;
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
Subject: [PATCH v11 16/66] media: Documentation: Reference color pattern control in format docs
Date: Mon, 25 Aug 2025 12:50:17 +0300
Message-ID: <20250825095107.1332313-17-sakari.ailus@linux.intel.com>
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

Refer to the color pattern control in the generic raw pixelformat
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 9fda7a36cd3a..034d4f3e0499 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -13,7 +13,10 @@ Description
 
 These generic raw image data formats define the memory layout of the data
 without defining the order of the pixels in the format or even the CFA (Colour
-Filter Array) itself. See also :ref:`source routes <subdev-routing>`.
+Filter Array) itself. These formats may only be used with a Media Controller
+pipeline where the more specific format is reported by the
+:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control on
+the source sub-device. See also :ref:`source routes <subdev-routing>`.
 
 .. _v4l2-pix-fmt-raw-8:
 
-- 
2.47.2



Return-Path: <linux-media+bounces-40969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA407B33BDD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE79B1647FB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B762D9ECF;
	Mon, 25 Aug 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7oVwrI2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B12DCF62
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115510; cv=none; b=QQEPDosRD265gwykHyd9J++MEeDPcrW6sk1hAzYPIAJCaKVX8orneBiiSPVk6sc6aGaL2GqPfQWdQzQ0XelQvxOt1Lw7drxXQYzJu23zSBFF2KK7ZHSplWINa0iue3mqFQN6DVUqaE7ABygvJU6ORH7RVNWZCqlEi+DBKtgNTAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115510; c=relaxed/simple;
	bh=MgunifFaxdQvKuV0YUgj8REkcFEQgHgap7uDA1xO7pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQPctfdoKlybcSgh+h7Pqk3Fk+IwMNLfPEs3v2I9s8QrGLFOY74YqwyjOHwTBpIhBZRQoSxuThdpy3BC9y4kCM7Lx+OMwxxeu6EwylGHk8NvkdaHL5Zy9gacHMTT61SYwlPbtDbw02LMrQjukFvsHU7zxd8Oiz9EfdZnEK9aLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7oVwrI2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115510; x=1787651510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MgunifFaxdQvKuV0YUgj8REkcFEQgHgap7uDA1xO7pA=;
  b=U7oVwrI2AYEBx8ubQE9XO2JqV2R2q1L5ZQz+EgxMWDWZCS75YWB4O/zg
   18vRTV6Q4En0SQNzoDpGC0r6F3e74JEsSkhgaPsLOn05fnypQXnVfBKoG
   sxObmETDhEoQmp6TIHoK8fzQTqybD5hVTn4VU641T6KseJB4G0VR6/YLm
   p00RNTcY4lO0rzYB2i5qjSrDPMtVmiKT8IW23jH9tH0HpLAyuTBADxsw0
   a4Ig81PAjso8Y/s3XLMWoxt4vDQaRSSSljZXi9NUBOBRxVibIQw/juzc1
   lEx0tT8DkykVvtLZknZoYU259ZtxZ1zWoPAmGMmeKL2Ic92LsnPUyqw56
   w==;
X-CSE-ConnectionGUID: 8GCJEYSnTTic1ShfnTnVpA==
X-CSE-MsgGUID: YzaStdpWRQef2a9M02SZjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032223"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: yi6GTzqFTq+Pc9/4TkhQ6w==
X-CSE-MsgGUID: SKo50L5LS4aNI5QfqCnbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431077"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BC796121FF6;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agp-33Gh;
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
Subject: [PATCH v11 45/66] media: Documentation: Add binning and sub-sampling controls
Date: Mon, 25 Aug 2025 12:50:46 +0300
Message-ID: <20250825095107.1332313-46-sakari.ailus@linux.intel.com>
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

Document the binning and scaling controls (V4L2_CID_BINNING and
V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index ee59bf3c5761..c1c9c9b8bc14 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -134,8 +134,12 @@ separately horizontally and vertically.
 
 Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
 rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
-1/0. The driver implementation determines how to configure binning and
-sub-sampling to achieve the desired size.
+1/0. It depends on the driver which of these operations are being used to
+achieve the resulting size. Binning and sub-sampling are also directly
+configured using :ref:`V4L2_CID_BINNING_FACTORS
+<v4l2-cid-camera-sensor-binning>` and :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>` controls on
+drivers that support them.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
@@ -194,9 +198,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - X
       - Binning and sub-sampling. This rectangle is relative to the
-        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
-        combination of binning and sub-sampling is configured using this
-        selection target.
+        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING_FACTORS
+        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
+        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
+        controls on drivers that support these controls. To configure binning
+        and sub-sampling on drivers that do not support these controls, the
+        selection rectangle may be changed directly to configure the combined
+        effect on the image size.
     * - 2/0
       - Format
       - X
-- 
2.47.2



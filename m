Return-Path: <linux-media+bounces-40968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F62B33BDB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24843B4BFD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F8D2DE6E9;
	Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoY+6nwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674D2D9EE1
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115510; cv=none; b=d/5NT59F12ajiFkn9YfgOAJtpsS1k/Woo/483kUTIUsUh1LtXYydp18Le2JabRAAkGTv5RpF42eXZtOuPI64rymjAOPVEuFxpnXuuJYbcG0kp854uG6ppGjwD000FMsgde3IJCGKThK1eoGDFcpN9cOvvmSWStRsftEQlRua9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115510; c=relaxed/simple;
	bh=MKHR1r9Fd5tdFBju0F19LHlEXLpf/q9gZ0IcGaJ9y98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npe/7Z1fI/sbqD3q9z4IlaHUckIM0G/fO+4olSzzwqn3bKgV/N+U4k0VYZb78NwZD/bR0UGMKupQxAy8Gm0ySsTI+7k+JHyb/5SAJIbMorELE4ozzjWosHXlL4pylix68+YljyxoQGoSe7JwFmRaDaxB7T4b7Pl8pFpqzYC5y0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoY+6nwp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115509; x=1787651509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MKHR1r9Fd5tdFBju0F19LHlEXLpf/q9gZ0IcGaJ9y98=;
  b=AoY+6nwpaA4+CFDQJP9+UHtk1Ntd+FG2c75O1E0YMpJ/4BwaGoACIh+t
   WYEGOxNHRODIeTNTuRm/GxDjXV+FfpuyR5olozgKYmtndYxKqN3/NpDJ9
   uQq8OJbW8HJm75O2alh/gKdIwcJuE1humO9tpZIcIps/rnI0n7is08sLi
   NgOFNhHzd7zgq0IU5UCNqljzN0/mVvTlUd4UKtVaEonhADdiE4jCNIuZR
   /vmIW8+gQn8huML/ZrCf6jBgLeEQzB9/K3zUgjzcM60RaXGLG8zl3K+N0
   g5dAMi9GJ4RgvFYlehCkeg3cHDikCYHS4SBTI8/NBSQ2Mz6NJX/2RL+rt
   Q==;
X-CSE-ConnectionGUID: BMp3NX2NR7qulgkXXaeCUg==
X-CSE-MsgGUID: PlINdl5NQxamyXODFMsjLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032208"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032208"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: 2GC1nSR8TxqlOC8lMm8YZw==
X-CSE-MsgGUID: mXEjUUkKR86hfmWkzIp2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431075"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AEA28121FF3;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aga-2r6W;
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
Subject: [PATCH v11 42/66] media: uapi: Add MIPI CCS configuration model
Date: Mon, 25 Aug 2025 12:50:43 +0300
Message-ID: <20250825095107.1332313-43-sakari.ailus@linux.intel.com>
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

Add a configuration model for MIPI CCS sensors and refer to the CCS driver
documentation from it. If more drivers start implementing the CCS model
the documentation should be split into two but that appears to be unlikely
at the moment.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst         | 6 ++++++
 include/uapi/linux/v4l2-controls.h                          | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index c1b9b74cbcef..ee59bf3c5761 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -242,3 +242,9 @@ space may obtain the size of the embedded data once the image data size on the
 source pad has been configured.
 
 Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
+
+MIPI Camera Command Set (CCS) model
+-----------------------------------
+
+The MIPI Camera Command Set configuration model is implemented by the :ref:`CCS
+driver <media-ccs-uapi>`.
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d31cd22d1fa9..e25c9d669687 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1256,6 +1256,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
 
 #define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
+#define V4L2_CONFIG_MODEL_MIPI_CCS		(1U << 1)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.47.2



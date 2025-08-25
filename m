Return-Path: <linux-media+bounces-40953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF09B33BCD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A2D3A3236
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559982D12EB;
	Mon, 25 Aug 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD9JKY8S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD32D9ECD
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115503; cv=none; b=sCJlGQY0PjJ1w4rxwPafU1lGAsC50TZxNSgNhNjnmcVGEnXvhW6RQlMbZ4VcBol14Mp4uXFvQ2Mz3LV1QtawANxpN2GgMAFJcyjNsN9ZMVcEamb0ucXBi4v5/f+wqG//xABehHA9s/C8WQ7h0/BEuxVXxm/EkSYaJjA/uajRwaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115503; c=relaxed/simple;
	bh=nl6jwZE5mymyMVLvGYQ/FCkaE2VVp+wKFBHJ2tAeaZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nzn+T3u/boBSZvzek/FjnoRsEPWYDQhU5ZCHIX7oltxfIzaNr5+Zthf01TbuVpdG37tkKS4urvpfqtUS+zS/vdpJxGLrAzx9IgdyA8rtUgdSWy+bkr3vWR73Vv1KFrV/yNajIeclbN9Jy+OtiAxoeQpwi8IFMzbn0BRiGFwN3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD9JKY8S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115502; x=1787651502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nl6jwZE5mymyMVLvGYQ/FCkaE2VVp+wKFBHJ2tAeaZM=;
  b=PD9JKY8S27+SLiUzNOR1L4BY9Y21clcdc/6ANkztpFIctGhvf0WKgP9F
   lqwjIyQlwEiP1nUGIf9M4r1Cz8Ihtdq2OxiExc9Ar7cyIB7MjToSrq7AJ
   R0ZP9T+1OlpBvcVuaCwNqfcVMWyR1YtUw+iyhPwOAPHlUetbTyI6+Yhwy
   kOab3U9JwJ0iMj9rXYd8BcqftttXNZbAhdG4LSSk+FAvXIFsZ7JP5zMdw
   Fp48BTMBM+lo0HNS/aFcojzdMGhVOeXnvq82P0WniupJBgvjti2UltDJi
   fGc+NTfrOVxaadTADtPCYo7zKSEEE0vVkWVTGMUCg2eyQXWDN+/vMBfyO
   Q==;
X-CSE-ConnectionGUID: t1DI7GW3R0Kfo0HrCCrSLQ==
X-CSE-MsgGUID: HJ5w3cK8T2iYquUn2TU64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696044"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: rQ/n8oC3Qs2IAaagmx3cHw==
X-CSE-MsgGUID: njmbFphpTnqy8kWvt1nzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195510"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CC47121FD3;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afH-1iRm;
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
Subject: [PATCH v11 26/66] media: Documentation: Document embedded data guidelines for camera sensors
Date: Mon, 25 Aug 2025 12:50:27 +0300
Message-ID: <20250825095107.1332313-27-sakari.ailus@linux.intel.com>
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

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data layout should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/drivers/camera-sensor.rst           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index a8e0e4accbc9..a719c6f88f11 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -117,3 +117,23 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common data interface used by such sensors, embedded data can be
+available on other interfaces as well.
+
+Embedded data support is indicated by the presence of an internal sink pad (pad
+that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
+``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
+format to model the embedded data stream. If the sub-device driver supports
+disabling embedded data, this can be done by disabling the embedded data route
+via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
+
+In general, changing the embedded data layout from the driver-configured values
+is not supported. The height of the metadata is device-specific and the width
+is that (or less of that) of the image width, as configured on the pixel data
+stream.
-- 
2.47.2



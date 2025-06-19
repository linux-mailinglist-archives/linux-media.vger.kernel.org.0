Return-Path: <linux-media+bounces-35325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B5AE0501
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8F95A4187
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEEB25C6FE;
	Thu, 19 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5KOaE0g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90625BEFF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334371; cv=none; b=mbcGxNi5DE8HDkKONNDV5yYiNLvPut4bP75lx0Ac1dRaVeA5+vwG+lpP+4nRoq4pRUv/76Dgf3kAkOCwa+25xCPjs6tIg0Z6Pi2LM+vv2rrFa/Xzy2dvQxVSwkKP82F5Ifvi15J2ejTyCcI62OKqJWFTqVPIn1cETChiHjYsADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334371; c=relaxed/simple;
	bh=c2ChigYtZdLH059d2hGbz1kxRcKtU92tnArxDZzqvnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qul82aoRuBSrfKkAkg1eCD/oBbnUnLjumtOUGk6VZwzLIexV+k8iPcMFQhrSoMR5BrmJA3vD0j1Aegk7aWb2WHmh1Lc8gHwIP6NQhLCE+hFFgf6jVSb0rq5fM3m4v7XFVMRzS9p9OuJzUDguRV8K8k8KLOSAv7vRkBbEvKTt3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5KOaE0g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334370; x=1781870370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c2ChigYtZdLH059d2hGbz1kxRcKtU92tnArxDZzqvnM=;
  b=S5KOaE0gQ5MV6QK8HBUmQNdLH7z0PThQOMu1C7e3YV4BdankI5lry7UK
   7yaSxeJd1vwqBErEpEhOSD5utfNupbOj6WF5VZ1FiCYf8nvDXM5bLEl+1
   2+vs5bsOO2eB8486AuBnndRhRo3RbCh2Z02Ce2cNvJjsOSQFL8z2easO/
   ye5utTdE61p/NWVFd5Q6eUFOqyc73vMah2SyOZ/210RbkTvzb7u6rcQZC
   ewRHkPPkZ4ZnyWVLAQ3MMfvX/miewbdGv120nw1TNVaUjf3KK1jLs59gb
   ITnx8/81RhFGMbqhbuPqJsvw+l6p4WzG2AYXTrwM9opMqMikwxFNXuKAE
   A==;
X-CSE-ConnectionGUID: JAGXX3cjSt2iAmcy7HvaxA==
X-CSE-MsgGUID: 68/2DFUPT/uXEXu2rOLB5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386931"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: WK4coLrGRmCZqltIGuv0kg==
X-CSE-MsgGUID: Le88G+wISaybOkbl6FF9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908533"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7ABA7123296;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMZ-1X;
	Thu, 19 Jun 2025 14:58:37 +0300
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
Subject: [PATCH v10 62/64] media: ipu6: isys: Set embedded data type correctly for metadata formats
Date: Thu, 19 Jun 2025 14:58:34 +0300
Message-Id: <20250619115836.1946016-63-sakari.ailus@linux.intel.com>
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

The IPU6 ISYS driver supported metadata formats but was missing correct
embedded data type in the receiver configuration. Add it now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 0a06de5c739c..463a0adf9e13 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -81,6 +81,12 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		return MIPI_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_META_8:
+	case MEDIA_BUS_FMT_META_10:
+	case MEDIA_BUS_FMT_META_12:
+	case MEDIA_BUS_FMT_META_16:
+	case MEDIA_BUS_FMT_META_24:
+		return MIPI_CSI2_DT_EMBEDDED_8B;
 	default:
 		/* return unavailable MIPI data type - 0x3f */
 		WARN_ON(1);
-- 
2.39.5



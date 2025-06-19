Return-Path: <linux-media+bounces-35286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBDAE04B7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85DA8189663C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79352255F2C;
	Thu, 19 Jun 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc76TrMM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3AD255227
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334347; cv=none; b=RzkHJly6jrR7Y1GWnQIhTW+bi7+fNBVO1nB3OTQIIcj7Ee7QjsX4dz5RhMRXe/XgG0eDlMwbkVXEbNRo2jIHhOKv8x6e2i0xF7UZNTP+GrkiXnlpiKymUgckKYCFV42XiEx0QfPzesrZK9N39stAjB+ikUVpJ6iJzpTl+ZUNehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334347; c=relaxed/simple;
	bh=2+mprGsAMw65HRjF87EpzkyLTP6VNAEEx1mKiGshaVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iCjgm3jiOavYVmQGPOAdsIHnU6GeIC77EJlpc8NB2OCCqiWvcyM1ebf0AZkkxcSjpzqmA1sGZceqaYQxdOgkGnuBPUI5CDAkwLSCxKS7+qeqnBmAkGujfCzxf5n3pM0MvR9WQr6YN1m8OAD/pIl8zzA5M6i3YP/0J4X6r3LYRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc76TrMM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334346; x=1781870346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2+mprGsAMw65HRjF87EpzkyLTP6VNAEEx1mKiGshaVA=;
  b=Dc76TrMMX0VXCZHm7sQnHaFeG334jy9vJL3NFapSh+NfQaM3wNekPUDh
   PDeyj6kgYkjoX9mMALD+yqoCVd/v79RrVI5xTKq4Kgj1vbxTMz5i78BRq
   ba7Wvml3qVV7mt/E79ZkQFcFb+5dk+kf1FZBdRdFX4Lok2Dr/7klBvWLQ
   cKHCrvaGw7pTG7MOsLcut5jaFj95PBX0oGrv6E0T0SYqlw92dro0LHhjq
   tZi429iHN1oJSENfwIMDyZ8B7s8CKwWtOFpsgcBhJzEIytC7ZOKlAmfYZ
   pPDqU2+F+brw/ttew5kqk8rxkgKBScc60x34T6UA3Q+0us+BMBNKhf0dr
   w==;
X-CSE-ConnectionGUID: a3YCzMcIQT6Lrym6M10CxA==
X-CSE-MsgGUID: igYNFTU+QFWSLDGGhuZcJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386376"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:03 -0700
X-CSE-ConnectionGUID: ddljn+x1TxWFvzADqgTAvA==
X-CSE-MsgGUID: aZynokQ+TEO3oWF6TWTJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908277"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 012D8121607;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJa-39;
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
Subject: [PATCH v10 25/64] media: Documentation: Document non-CCS use of CCS embedded data layout
Date: Thu, 19 Jun 2025 14:57:57 +0300
Message-Id: <20250619115836.1946016-26-sakari.ailus@linux.intel.com>
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

The CCS embedded data layout has multiple aspects (packing, encoding and
the rest, including register addresses and semantics). Explicitly allow
non-compliant embedded data to use the two former to reduce redundant
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 450e5940c6e7..d9589ad80204 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -136,3 +136,15 @@ In general, changing the embedded data layout from the driver-configured values
 is not supported. The height of the metadata is device-specific and the width
 is that (or less of that) of the image width, as configured on the pixel data
 stream.
+
+CCS and non-CCS embedded data layout
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
+data layout <media-metadata-layout-ccs>`` (level 3) for :ref:`the metadata
+layout control <image_source_control_metadata_layout>`. Device-specific embedded
+data compliant with either MIPI CCS embedded data levels 1 or 2 only shall not
+use CCS embedded data mbus code, but may refer to CCS embedded data
+documentation with the level of conformance specified and omit documenting these
+aspects of the layout. The rest of the device-specific embedded data layout is
+documented in the context of the data layout itself.
-- 
2.39.5



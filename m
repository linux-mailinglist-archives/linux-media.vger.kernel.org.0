Return-Path: <linux-media+bounces-40957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CDB33BEA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337A418848E5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA712DAFBA;
	Mon, 25 Aug 2025 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDFWkP6q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627A2DA749
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115506; cv=none; b=BzknXf5kVQZPIZwsd4QqzbRgX3vXLFCZP77hdVY3/qjVvj0EouHrJZtSpmad/CSawZs4J/kt1C/IH5LllNPFgi9KhD+uJIJySJD5paDSrS8ZR1pK5wAYFFmig9IpSRcdwSUeHNRtXoj5wFh5SlbLUR8Vj5ES5bnRn5XWFBVgGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115506; c=relaxed/simple;
	bh=LrSFvggoAa0mIlFPEe+q2VPlT24lxQ1ExnGHOHIimjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwA4AA5NLJFFJfEl6N+TYMpBbvviwS3X0BDeWE2q6Yb4fEwwRV9wZxvb00tArjxgSFp4rkDunEe2ux0bcxEdZwLTei6jzmyWMv0CEo6vT35L0JYaTyF9GU1H2n4GmdHIf4sh28KqQrAbhkycjCD7wtQeLRtNyPXtm+luQZa2eS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDFWkP6q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115504; x=1787651504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrSFvggoAa0mIlFPEe+q2VPlT24lxQ1ExnGHOHIimjY=;
  b=TDFWkP6qeVH5m2siJMt+8ceCzJ49IAsIhLrld3dY7bHQ9PKmKnF52cLu
   /+C3UVGBp4VkQHQU7RhEv73QNpHOI8AvMrYwNwOuH81FSn8o1FJAsuWWO
   MztrwMhXOenJJ3jwHw/Dd+1UReB7GwmuFIshGIFqeuevhgLIFcPvmL451
   nhhPtR6leTrT+UzkorweMZ6I1A42XjgtnM00ohzGln50rUR9jwsrRWXxS
   TbMqWAatlUn+nJpyV+bcjbtU/8KzusQPVEpSFv/5Qz7ut1jDaFfKMmP/L
   KYmcbBOjh2pnjLyNLuNQEME689TSbGONo8yd7fSdnsTbfgxukLhBwnf3j
   w==;
X-CSE-ConnectionGUID: AKU/58lvR22ol/icodvkSg==
X-CSE-MsgGUID: a349yf28TkmX1tjPyg6O3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696073"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:37 -0700
X-CSE-ConnectionGUID: ommfbK0HQUK7Jxbcxsmr/g==
X-CSE-MsgGUID: a0v/n4O1SVaSuUZS3ZSEAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195516"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 74448121FDD;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005afS-1qjX;
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
Subject: [PATCH v11 28/66] media: Documentation: Document non-CCS use of CCS embedded data layout
Date: Mon, 25 Aug 2025 12:50:29 +0300
Message-ID: <20250825095107.1332313-29-sakari.ailus@linux.intel.com>
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
index a719c6f88f11..cbbfbb0d8273 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -137,3 +137,15 @@ In general, changing the embedded data layout from the driver-configured values
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
2.47.2



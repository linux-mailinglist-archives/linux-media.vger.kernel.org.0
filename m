Return-Path: <linux-media+bounces-40948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7423B33BD6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE82C7B28C2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E0F2D7386;
	Mon, 25 Aug 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e35dAJh4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A3F2D73A3
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115500; cv=none; b=sOcymPf7lDMZjXY0Jfgkjf1PSaPYsCIoKkOiCtQ0s9wbPr1GRV94BkHYItseWtSaGSgpeEkh5qVBfW9Bi1xFwE0ew62KJHNsH+m3FLk6ub2stDvD3XFCKDt//K0lpx9mgvGPBwFAY6QIFFSZpP0j9UUfOujxAifCewjwANDgaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115500; c=relaxed/simple;
	bh=UyQOmGWv/WMj8yDcZ42gz0cOeghhl1kxMaZ4zGdisX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb4XwdWIDs1F3M5PeEv2ZxtjHmgdWeM/eD7vC+spbok/HvcAxp3LtrQUVcebjiu3ah0ydarxcJPQW+hiTfre2haz9tBdMnAY5hIfijIc90ATxjMFgD6Tl7naXkNFkSIrxVdSEsRYnimest3ihAujK7yOUEwNh2zcK7UgGa+mtPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e35dAJh4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115499; x=1787651499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UyQOmGWv/WMj8yDcZ42gz0cOeghhl1kxMaZ4zGdisX0=;
  b=e35dAJh4CaNSoJ7Pijh/hDkJOvUn4R7JrjcCAUtwauS+r/pifKZxscT7
   OJlOvtpzlUXFV/xUqiVthujXPG0aR5BdhXMdk5Hq7nWBJ/33GTpxqZhZn
   xvhAeayz8j0P+6Ae1byN4SnKL2xNEM+/zUUIPt62p094gKErwOW0qmfbY
   jozEbwbgI2ILH3wjIpWFA1BElgZkLCkDWcuuFSn0MitR4L8JN8z2dPQ+T
   OucJ7blw3HWCY9jqK+NHneXPOPklXWhSjV2zx2zVufdYm735QJc1oP+q+
   7J/puPSV0rdfJJX8o1xEaOZgx8brvPuouKGZnwA3ClrpyhkMU5iGrZjO6
   g==;
X-CSE-ConnectionGUID: klFm2MXCTZiEmh1RfqfhQA==
X-CSE-MsgGUID: 2EhqofjNS3CuB1kgIObOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695974"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: NCvojBepTrOWhNqwXE7HnQ==
X-CSE-MsgGUID: Wu/QmzH1TWKlD89ruOFV4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195490"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 56650121FC0;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aeo-1Jx3;
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
Subject: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN control in raw format docs
Date: Mon, 25 Aug 2025 12:50:21 +0300
Message-ID: <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
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

Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
pixelformat documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
 Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index b19aaaffbce0..0fcd60d8c621 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -93,6 +93,8 @@ Image Source Control IDs
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
 
+.. _image-source-control-color-pattern:
+
 ``V4L2_CID_COLOR_PATTERN (integer)``
     This control determines the color components and native pixel order in the
     sensor's CFA (Color Filter Array) when used in conjunction with
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index e77b4ad19737..77571adeb21e 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
 interfaces. The packing of the data on the bus is determined by the hardware,
 however the bit depth is still specific to the format.
 
+The colour components and the native pixel order are determined by the
+:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
+
 .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
 
 .. cssclass:: longtable
-- 
2.47.2



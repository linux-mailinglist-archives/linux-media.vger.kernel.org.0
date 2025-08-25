Return-Path: <linux-media+bounces-40945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EBB33BC7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679E116B517
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D142D6E48;
	Mon, 25 Aug 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X647ERLq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0902D738B
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115498; cv=none; b=sofyYEzUJknxNvHBNFaPnLDo75j2lzEiwfS7mcP2HivlClTHBiK3Bvh10DAv5ssosscMO2HCDgTyOYBfkvABPSkmHCrGRtUc6O1NbCSCTK16c/gDNrXQ3Id+xah6Mbfr7puvhCTpLmiJshm5EeTNFE/8FtyKHILB4ZPoRYoQslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115498; c=relaxed/simple;
	bh=TkVVi74o+2YqRd/2ZiM4VZf3DsnaVTsGPeGiS1ItGgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTMnoFoZpZdYXDyxPEy8O2KRX5RsLpIBHehEDxVqAes6d68GFE8T/c5p4CyKltfkmbcnycHIM7rvXwjgH7EE16LQEV77MdleNOz989VSOfKLmr1ZKk8Iurng06O9+yE19nz/ZwnvrWS39HrSU/5CyXhIBMXWY3KfIvhl9Qt4ASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X647ERLq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115497; x=1787651497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkVVi74o+2YqRd/2ZiM4VZf3DsnaVTsGPeGiS1ItGgU=;
  b=X647ERLqYF5hr7f2eeh/qcGGXU1srIVppHsc+i3hmeACJtKOPygQUb5i
   EMw4DTs3PhGYNsZGIudJGyoqJuzq/o8HCNAL73JBR1rivtjX6TG8NEGTl
   8MRrfA7RygfgmEKwD93lefCGFzhwoPkOaA8yIomfKXIPSF7nSNYMs73yD
   AZuS8dOxndbV2WrAnTtXnWCjTO17unB9Ge9aYzxh2UPwfYVrzLuwY3jyS
   CQDtiN/j2VjrwHVIs2faUSjLNwSxduyn5eess0P7IN30TGv6wN2QCrt7e
   xx5c3Yqs4WVCX1ZYyOEegQwUEKlJAHQ7JHu9iARXMbjr+s26XvBOtS3Bh
   g==;
X-CSE-ConnectionGUID: IGCimzoPQDKmipKHo4DDoQ==
X-CSE-MsgGUID: 0fyUVm/YR1e0gJVLwzEQqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695935"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:35 -0700
X-CSE-ConnectionGUID: I5U3qRSET0ShoDJM91239g==
X-CSE-MsgGUID: PLNQ9JOVRFm8Ji3MKpfwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195489"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5DA3E121FCC;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aey-1Rdz;
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
Subject: [PATCH v11 22/66] media: Documentation: Reference flipping controls in raw format docs
Date: Mon, 25 Aug 2025 12:50:23 +0300
Message-ID: <20250825095107.1332313-23-sakari.ailus@linux.intel.com>
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

Add a reference to the flipping related controls (V4L2_CID_HFLIP,
V4L2_CID_VFLIP and V4L2_CID_COLOR_PATTERN_FLIP) to the generic raw format
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
 Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index ef3784d1119a..3cb7ee1b0aed 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -134,6 +134,8 @@ Image Source Control IDs
         red, green pixels.
       - 3
 
+.. _image-source-control-color-pattern-flip:
+
 ``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
     Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
     V4L2_CID_VFLIP) have an effect on the pixel order of the output color
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 77571adeb21e..c36cd42b09c6 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3446,6 +3446,9 @@ however the bit depth is still specific to the format.
 
 The colour components and the native pixel order are determined by the
 :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
+Whether or not flipping controls (``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``)
+affect the pattern is conveyed via the :ref:`V4L2_CID_COLOR_PATTERN_FLIP
+<image-source-control-color-pattern-flip>` control.
 
 .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
 
-- 
2.47.2



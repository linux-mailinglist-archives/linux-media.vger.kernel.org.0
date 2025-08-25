Return-Path: <linux-media+bounces-40949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B879BB33BE3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 376FE7A1C35
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77D02D97A3;
	Mon, 25 Aug 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSCJEHjK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635902D738B
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115501; cv=none; b=nIDzgGh8Z93z5BvfoLZ2Z5/riEhMNjhKmeRC11e2OIqJu/MwtU68rboO2oepldUc0U6LZgAKZUzmLIyADg+Fq07G4FMz4X7iTvSU66LeODkU2OtRAw2zaKJDiPb6UhtdpL02U+yZq4bY/ffRwFqmnlGtmbEvi1Mi6NU41ZiEgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115501; c=relaxed/simple;
	bh=Eg2AZKzmivhrdIUbilyj4JZWbsDEFY8mm8S0VjY2ZZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EX0Y2nea38zs8L8PjLG9grxIS4PjnPCLKumI+li58x2ts4i0n9WJselOn29gCNRotfZO7osrr3B4Hxwl+VHrclJcHYpod66AMx9spD56uzf8h61ZJWDhluAQmhgbG/NsCLIgIi5TRg6p/kZp3flguXr0ZADx2243ACeR/YHRGyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSCJEHjK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115500; x=1787651500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eg2AZKzmivhrdIUbilyj4JZWbsDEFY8mm8S0VjY2ZZ4=;
  b=nSCJEHjKBhuUJ5Zj2ukaTAEN2k5JIEk0d30UbZyVQ/ncr+P6gmNMNoHB
   eRR6yg4r6xn6AQo4TR7+ymVwLJl01D6pn2J7UYS9dZZkboLCug3ZqBF+N
   oojLsoEGUf4mIPaQZzz7T3DyJ/hYQlfIPSzdi8ntNtznrO8iWkpmjfNjb
   +7hHUr02/yGJ1ygTc4VOO8Bfi2RRxNnGJOH9GbLPuaoVE3dM6hH6DkR8H
   tRIAL4Cm9YTW6UiT0+JO/uW77WgKDwAWG19H2G0lZ7eqcxzQSXz/Q5fV4
   /hGnDW1+1DpB7Ge3T0h3uNR3MVsQM3iabicR59etolznhRzGu7huVqRIZ
   w==;
X-CSE-ConnectionGUID: th4KzwNfQduCww5VYbLEfA==
X-CSE-MsgGUID: X23XiRMYRVGnSdkzVaB57A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695985"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695985"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: WCKkGj/5Q8uKohQRvSf4SQ==
X-CSE-MsgGUID: iwP7hb4nRhael0MVhzQ9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195494"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4B580121FB5;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aeZ-18b9;
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
Subject: [PATCH v11 17/66] media: uapi: Add new media bus codes for generic raw formats
Date: Mon, 25 Aug 2025 12:50:18 +0300
Message-ID: <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
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

Add new media bus codes for generic raw formats that are not specific to
the colour filter array but that simply specify the bit depth. The layout
(packing) of the data is interface specific.

The rest of the properties of the format are specified with controls in
the image source.

The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  6 +++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 9ef1bc22ad9c..1a51b5c817f1 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3434,6 +3434,33 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+Generic raw formats on serial interfaces
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Those formats transfer (largely) unprocessed raw pixel data typically from raw
+camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
+interfaces. The packing of the data on the bus is determined by the hardware,
+however the bit depth is still specific to the format.
+
+.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Generic raw formats on serial buses
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 1
+
+    * - Format name
+      - Bit depth
+    * - MEDIA_BUS_FMT_RAW_8
+      - 8
+    * - MEDIA_BUS_FMT_RAW_10
+      - 10
+    * - MEDIA_BUS_FMT_RAW_12
+      - 12
+    * - MEDIA_BUS_FMT_RAW_14
+      - 14
 
 Packed YUV Formats
 ^^^^^^^^^^^^^^^^^^
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ff62056feed5..b71120bc1788 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -185,4 +185,10 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Generic (CFA independent) pixel data formats. Next is 0xa009. */
+#define MEDIA_BUS_FMT_RAW_8			0xa001
+#define MEDIA_BUS_FMT_RAW_10			0xa002
+#define MEDIA_BUS_FMT_RAW_12			0xa003
+#define MEDIA_BUS_FMT_RAW_14			0xa004
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.47.2



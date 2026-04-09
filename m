Return-Path: <linux-media+bounces-58403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIpiIcYJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B13CF5FE
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCDB300F5C0
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDC433B955;
	Thu,  9 Apr 2026 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dx3Wa5s4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BABD33B6C8
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765722; cv=none; b=tXpaxCYuKKeg2DYcg9jPbIxEzjAwTNd0xGqch53GM/XSOhptj9VvRsBvnGQUpcgfVHSF6EKSqZlbfsA1N7oBX3JXUAhp9g9x6Qe22OEc+fIMPbpksx/mldBSHpJHxm11/6kJBomGXCcajOHrdARHM5jaWbZmRZhspFbHTtzLnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765722; c=relaxed/simple;
	bh=FamP04/RqVdu56kY9frHn7pKQWFGaHMB/rh3QVLs3w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAQiQHrF810rMrM0EaTKV3fncW0Shepjy/JYpMmCiVHjNvZc3r/cUFc+uc1HU8mAKmrYc7QtgvzD48VBSdCYRDKJ43axW5LWdgv3x3K0JlpiiFt5Em2v8aoir/JeRmjtynxBNROgc7YNHfyTFDlDOCPbXB60mW+GXIzQNGNpol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dx3Wa5s4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765721; x=1807301721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FamP04/RqVdu56kY9frHn7pKQWFGaHMB/rh3QVLs3w8=;
  b=Dx3Wa5s4VzPdFgb4OUCzZeT9Zjxu0VvT3K3pBWcY0SlXZHmBo2gvSxQK
   tu4PDOHDyfk7kths76vw640adIDITqNUDDF/bAcanw9jeHrlXX1uB+wj2
   zrcH4IAjjIxm2Wufs6+76PAyL8FhMW8xHDXDG2cS3DXrQ4SFLMvgb86Iu
   1QUwFETaSX+/mf3hUmygFMqeiYenVB1IY4/Ie2ctSo4ABf0EvqpJTfwEZ
   1EQ7IX6+rXOFcIvskdaAuXCXgMgraBmfWTk7ny+vJS0s4EilRodPDCRpT
   Mr0PYm+um5pNq8jhVmbUPK6nGNRSHZf+BuD7EuYYKtS+KUHz4c43CTFsT
   Q==;
X-CSE-ConnectionGUID: swbHgt3dQS66G21ohhKK5w==
X-CSE-MsgGUID: JXJWWm2BTXeTqrC+ASVHGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408907"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:16 -0700
X-CSE-ConnectionGUID: 4vlxwTzaTiGSzTW86MP+0Q==
X-CSE-MsgGUID: ONvAyaAfSIWE5E54OeGWfw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 35FA3121CE5;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045kr-2fu2;
	Thu, 09 Apr 2026 23:15:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 03/86] media: uapi: Add new media bus codes for generic raw formats
Date: Thu,  9 Apr 2026 23:13:38 +0300
Message-ID: <20260409201501.975242-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58403-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 184B13CF5FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new media bus codes for generic raw formats that are not specific to
the colour filter array but that simply specify the bit depth. The layout
(packing) of the data is interface specific.

The rest of the properties of the format are specified with controls in
the image source.

The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  6 +++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9999b929773..fecb786cb8af 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3855,6 +3855,33 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+Generic raw formats on serial interfaces
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Those formats transfer raw pixel data typically from raw camera sensors using
+Bayer and other Colour Filter Arrays (CFAs) on serial interfaces. The packing of
+the data on the bus is determined by the hardware, however the bit depth is
+still specific to the format.
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
index 6005f033e62c..83feeae6a31e 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -190,4 +190,10 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Generic (CFA independent) pixel data formats. Next is 0x9005. */
+#define MEDIA_BUS_FMT_RAW_8			0x9001
+#define MEDIA_BUS_FMT_RAW_10			0x9002
+#define MEDIA_BUS_FMT_RAW_12			0x9003
+#define MEDIA_BUS_FMT_RAW_14			0x9004
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.47.3



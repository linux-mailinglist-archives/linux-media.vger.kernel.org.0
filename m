Return-Path: <linux-media+bounces-40951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684FBB33BCB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF643A30C2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4332D9787;
	Mon, 25 Aug 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3yhL46U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E42D94A7
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115502; cv=none; b=W4RFzUdk0fm1C6oP0B/SLdQ1ZUSahCcSxqWOLOszb6Pu2QFYGba+FKT9sZ9KmpPGwvue9uak6EezakozozzqExjNYWlCBYUXlF+CfC7xreGFwm4zKB1kVzdrTVQxcFlY5/WcVlA0Z44xhSEALmTjzDC96Rr5wWNQrdHfrJl2J/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115502; c=relaxed/simple;
	bh=ZyzD6tg864laJigu37/JTEkuqeJcflzQRFK1u9JsAXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxISKSjEp745tJ0D8EASBc6vSiAmPXRPxxiG4pfaDfWJDLdHJOdvYJgXKEufP8NPvTL5OL5enuhs4fg2OqjS3SUL8W1svA+vDzAeBLmEiaxmSA8a7FtEPZchTxMiAhl/QFn/3zYCn2kYp/10a7ob/S+WuAbmz7o9zsggkC0XnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3yhL46U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115500; x=1787651500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZyzD6tg864laJigu37/JTEkuqeJcflzQRFK1u9JsAXs=;
  b=G3yhL46UaxFrzmrTeLMa80zxyGY8KBu09q+RN/LgfKpifltMUKg7pXCx
   231qomewwgF17X+JQmJBXU+kHWwtf/IM/DbuFRbBW2cfoUjTOWy05Eq9f
   6ueJAtF4unA1Vj4Qjf5lvSrb6vUDV4SAWHCjtxor77Xb3mU0L7vWSvLcA
   bcWWP9Nxn7dy9lTH1lMN3mTQupO4Dr0HiPr95Brnj7aomH2LeKSjR1JWD
   9nr+3KE1IVC/hZrawughFFoaXGOiMxf8wzJsKZC9RLkNb9Cp9sAwFXluS
   5d11eDtNMSX/npHASktCWh86uuNGZGFhLvcT5oy4PMIcnCwE5J7Px37a3
   w==;
X-CSE-ConnectionGUID: /dHfR+krSyuTcOqf+h8mCA==
X-CSE-MsgGUID: k4hbzT9PQoKq9cyTbdy3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696005"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: j0v7slipSA6QanHHDl3uCg==
X-CSE-MsgGUID: V5RnkH4SSBmiDEjJRKXmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195501"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 651CD121FCE;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005af8-1Zcq;
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
Subject: [PATCH v11 24/66] media: uapi: Add V4L2_CID_METADATA_LAYOUT control
Date: Mon, 25 Aug 2025 12:50:25 +0300
Message-ID: <20250825095107.1332313-25-sakari.ailus@linux.intel.com>
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

The metadata layout control defines the layout of the metadata on the bus.
It is used on sub-devices that use generic metadata mbus codes on at least
on one of the pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
 include/uapi/linux/v4l2-controls.h                          | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 3cb7ee1b0aed..64c0f9ff5b1b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -145,3 +145,9 @@ Image Source Control IDs
     of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
     ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
     ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
+
+``V4L2_CID_METADATA_LAYOUT (integer)``
+    The metadata layout control defines the on-bus metadata layout for metadata
+    streams. The control is used in conjunction with :ref:`generic metadata
+    formats <media-bus-format-generic-meta>` formats to specify the layout of the
+    data.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 9ec65998a8f7..a7ea380de5ee 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
 	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
+	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index eb9ffdd74d32..74e22a930be4 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1239,6 +1239,8 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_COLOR_PATTERN_FLIP_BOTH \
 	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
 
+#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
+
 
 /* Image processing controls */
 
-- 
2.47.2



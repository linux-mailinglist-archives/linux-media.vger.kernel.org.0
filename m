Return-Path: <linux-media+bounces-58448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGplGo8K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F0A3CF727
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C893033D16
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBC0366049;
	Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWv5nMmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015434DB74
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765741; cv=none; b=tigBWmOFurUbBgWzgjeogx3kXkrWIR7CssI6W3uqvsxnlAAAXShCcWrMDIk7bsK7nZYp4sTM+WsX7zIuZDMZ2r0duXW+Oyn41hVkH+B143ehSee7tY9s5uXoF5ZFlBpoSCSlt4edKOvaU95ruXzDejR+PQxn0gypEZYFPbiH13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765741; c=relaxed/simple;
	bh=Qk7CVBVb3LS0lU4NZN8YuHaMlfgyPB1H27eQWu3N+/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hihgYVb/J2kT8VPtUkU1HD821ajPLmex0NxjFQZTJWjEc5b8brZTbxX+TSSDgeg/ACOZD8p+H1aFPQ5rB7zpoCxAqGaCkq0kVFrJ+UVKFp9Im/hs+X1Xib+jUXoeP8wD6atZNWjhxnVLtJ8tOP3FG4IU7MOwz0gx+H+f8Xzv1tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWv5nMmo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765740; x=1807301740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qk7CVBVb3LS0lU4NZN8YuHaMlfgyPB1H27eQWu3N+/Q=;
  b=FWv5nMmocAcJJBhrZjvpO9cHmIqrz8mhinUsGIg6hrKyU6a+U5/b4OCZ
   94gvf2yx0nY6gsVpHasD0Ng/xvKQJ2IrzwRBe2epXeTVEIDllE157Bas4
   yvXhqFjKusa8J+OAwy3IqgTVsuV0n/KiXLhKunCt2VBR/uoVOxJi8tm+h
   6E9hnlDgJwPPoTzY5NqZZnLLLnFALqZ0Y1R0TMdfFQzFAwbp+vlx/wrpz
   OnJJdZMM3X+sQJx3CrJSP8+f4WjLyKmK8t6WO2wG8EtZTiyTNiIZ3bctj
   ytF4fft5+SulutDZUJkUJBNdYIP/JGFgmnZhL3EiHbHMhZnHhbZi5sRBj
   w==;
X-CSE-ConnectionGUID: 17NEayRYTmCamEcLhCLmZA==
X-CSE-MsgGUID: 86mHfpl9Sx+mGRdxjKybog==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176677"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: TylCNlVVRsScgdCMGI5jOg==
X-CSE-MsgGUID: fqMtgQrPSh2Yf/PmfKaQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047625"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CC0C412292F;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nN-16un;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 42/86] media: uapi: Add more media bus codes for generic raw formats
Date: Thu,  9 Apr 2026 23:14:17 +0300
Message-ID: <20260409201501.975242-43-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58448-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2F0A3CF727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new generic raw media bus codes for serial buses at bit depths or 16,
20, 24 and 28.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 8 ++++++++
 include/uapi/linux/media-bus-format.h                    | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index b207119415f1..4b832118060a 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3890,6 +3890,14 @@ affect the pattern is conveyed via the :ref:`V4L2_CID_CFA_PATTERN_FLIP
       - 12
     * - MEDIA_BUS_FMT_RAW_14
       - 14
+    * - MEDIA_BUS_FMT_RAW_16
+      - 16
+    * - MEDIA_BUS_FMT_RAW_20
+      - 20
+    * - MEDIA_BUS_FMT_RAW_24
+      - 24
+    * - MEDIA_BUS_FMT_RAW_28
+      - 28
 
 Packed YUV Formats
 ^^^^^^^^^^^^^^^^^^
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 83feeae6a31e..40912155c741 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -190,10 +190,14 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
-/* Generic (CFA independent) pixel data formats. Next is 0x9005. */
+/* Generic (CFA independent) pixel data formats. Next is 0x9009. */
 #define MEDIA_BUS_FMT_RAW_8			0x9001
 #define MEDIA_BUS_FMT_RAW_10			0x9002
 #define MEDIA_BUS_FMT_RAW_12			0x9003
 #define MEDIA_BUS_FMT_RAW_14			0x9004
+#define MEDIA_BUS_FMT_RAW_16			0x9005
+#define MEDIA_BUS_FMT_RAW_20			0x9006
+#define MEDIA_BUS_FMT_RAW_24			0x9007
+#define MEDIA_BUS_FMT_RAW_28			0x9008
 
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.47.3



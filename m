Return-Path: <linux-media+bounces-58454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI1yCJ0K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41D3CF735
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D29C3038F4B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCC9370D41;
	Thu,  9 Apr 2026 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czmdMT63"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0A36AB7B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765744; cv=none; b=aKlfVgdfzUt9FETFNTaEmLiAGRL04nUMJLSfkGYRLVC/YD4MEcZeBUnWLOszzu9HxOz7vIxYldilfW4I3Z10gphHvySAaGbbpxllhGN+ztvtFZFBp/IblzauoPiK9Bdl5lOzMSbC6anY/C5ATtZfXwhsuy+wmyQysgJ8ki87coE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765744; c=relaxed/simple;
	bh=aroFNLyj/NCxmKY0aT68UR/WbF4GmtnMRzDL0VlQqWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXuovi8uALt9AQYCFIxsQEm6zU8BuOAFzwzSTpmLwu3ECJmIKhuCLy+Naeu+IrT916cukwf/4The7JhVWLbDNaFiIgJ2b6x6KdJ+KAxTO/cdTr6xFPLzRpg1DrrDpo26N0nPNC83S0ERPtaKYipb7N41dOM6xeetFdnpKpLzMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czmdMT63; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765743; x=1807301743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aroFNLyj/NCxmKY0aT68UR/WbF4GmtnMRzDL0VlQqWk=;
  b=czmdMT63aRjLbp9cPaLnYN0oDPAAVi6OjzqRBJw/l/x84Zlsq+9FaO4E
   1gAos0hn3Ww5ZL/72Y1+vmf1DZw1MKOaY6TRq6j2Cczd9skIcSLQcNi4S
   oFKF6BzLl3GgBe0hGvSmrowec0D2HHDGHe6iFDN+rylGBCMfn5noKKcZj
   IDPfTXOYEYxNSb1+EbWQfgPQffVWbQPt3apCGhE14YT1Jkx9UZjktUxnh
   uOjxoL+osbdjD9RXVV7+T4NOwWj7AHG0Czhn/pJvdRuESJwQAeE6nx5Qm
   bi2ITBHJRzXRa56jtQezKnJF2eUy5a/A/RUelz2AMSw8+8LhFX26Zm3xG
   Q==;
X-CSE-ConnectionGUID: oiRWFiQeQjipwFZfzIXiPg==
X-CSE-MsgGUID: SqA2me6JTiiKEKzPNFgVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176774"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:34 -0700
X-CSE-ConnectionGUID: lJ/f6lKpQhuW5R+0GBQDxg==
X-CSE-MsgGUID: RS9w9uqkSwq7FXXGuXVQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047639"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB93C122944;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nd-1NgQ;
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
Subject: [PATCH v12 46/86] media: Documentation: ccs: Document routing
Date: Thu,  9 Apr 2026 23:14:21 +0300
Message-ID: <20260409201501.975242-47-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58454-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,ideasonboard.com:email,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D41D3CF735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 43 ++++++++++++++++++-
 .../media/v4l/metadata-layouts.rst            |  2 +
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..67c7d2b62ed5 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,45 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if it exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (sink pad
+0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
+(internal sink pad 2/stream 0 -> source pad 1/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The metadata layout
+used for this format on the internal sink pad is :ref:`V4L2_METADATA_LAYOUT_CCS
+<media-metadata-layout-ccs>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :term:`Data Unit` for that
+particular bit depth. This is indicated by the generic metadata format on the
+source pad of the sensor's source sub-device.
+
+Devices supporting embedded data for bit depths greater than or equal to 16 may
+support more dense packing or legacy single metadata byte per data unit, or both
+of these. The supported embedded data formats can be enumerated and configured
+on stream 1 of the source pad (1) of the CCS source sub-device.
+
+The use of the denser packing results in embedded data lines being longer than
+the pixel data in data units since the data units are smaller. In bytes the
+embedded data lines are still not longer than the image data lines.
+
+The embedded data format is determined by the sub-device image data format
+configured on the source sub-device. The embedded data mbus code is only changed
+when the bit depth of the image data changes in the source pad of the source
+sub-device.
+
+**Copyright** |copy| 2020, 2024--2025 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index cd190f453994..0f8709f2e9af 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -37,3 +37,5 @@ devices that fulfill all three levels above.
 This metadata layout code is only used for "2-byte simplified tagged data
 format" (code ``0xa``) but their use may be extended further in the future, to
 cover other CCS embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.47.3



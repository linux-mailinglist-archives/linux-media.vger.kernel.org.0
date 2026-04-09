Return-Path: <linux-media+bounces-58440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPBLAT0K2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 780CE3CF6EB
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33DE9302F0C3
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A2834CFC2;
	Thu,  9 Apr 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ny1c6+rg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AEC3446C3
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765737; cv=none; b=Laq+AcEWOsY/DBZLS8dlxaARA0ig22BMtt/zc2Pg3yj/NLSlC6/RiLlPaOhiRUkeNlYNLkR4nN2PTmvzSWASvpn5NugBuiHwbH2o1wa7g0F7DWxVl+wXcYF2mzRFQ+wXzx1x3csbDbUIMbzlgle+yhRnbqaZnUC8B36FdDINYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765737; c=relaxed/simple;
	bh=RXY7mLJa/mcFbtgWufbuVq4q7gFlSMHXrAHW1R0Brdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psFLHZao99YHxkFlIeujGD7Ttb0010CZpXIujyqkESEE3FN16gxRaIhxjzys9SkFks5qzLfX+c+NBbrD/bOCZkyo3tSGd9sWmJZIADqX905VVt0c5f4/IvXLFQNIC1+oerresKaKEQOU05s39cRqHbYbfG83ANArHNYVCKCwJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ny1c6+rg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765736; x=1807301736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RXY7mLJa/mcFbtgWufbuVq4q7gFlSMHXrAHW1R0Brdg=;
  b=ny1c6+rge4Xbk4zY+R2U77h5lGgu+08+6T2/OcH618E+w5GDDgvXWhE6
   +D4HcJpvWa27gXP3qrzZU4d+Kf0DWj5JORJVYlNceUVjrFVUe3hYVanmV
   4fIPxy/EJ0wPZDSiMDzQi9lDuiCM1lObGMHxC2Pc8FX/pljL5CxlvxDDD
   OaT8qpFbRlaBbPmwr3hsyL81WIOwcN09MSjqF9cSPOzHPqmoiTz+w8CZ3
   j0pXjr7S2A6yZQqwCukLlR0OI50TE/l2eZjzdWg+Dw7iefYrPcOOaaV0/
   VcyA9wbuM/nwyFxlRkbWf1e16Pf+8W/gQ46RgTY/8qokpcO5KAY50K3CW
   A==;
X-CSE-ConnectionGUID: FJAj+Q+mRS+w2JExW1Hs9A==
X-CSE-MsgGUID: jHcSPi4RSj+H5k4EXjWVSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176557"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: mmo7YcmjRA2L82LzUqFfeg==
X-CSE-MsgGUID: rfnIhVeeRoK+ccKKPXMIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047544"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 880CA1227D2;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045mD-46SR;
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
Subject: [PATCH v12 24/86] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Thu,  9 Apr 2026 23:13:59 +0300
Message-ID: <20260409201501.975242-25-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58440-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux.intel.com:mid,ideasonboard.com:email,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 780CE3CF6EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document scaling and post-scaler digital crop operations for the common
raw sensor model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index b450f698a608..1525119cbeb9 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -146,12 +146,19 @@ binning and sub-sampling to achieve the desired size.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
-0/0. The resulting image size is further output by the sensor on the sensor's
-data interface.
+0/0.
+
+The scaling operation is performed after the digital crop. It is configured by
+setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
+relative to the digital crop. The resulting image size is further output by the
+sensor on the sensor's data interface.
 
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop if supported by the driver, affecting the right and bottom edges of
+the frame. If post-scaler digital crop is not supported, the width and height
+fields of the format will match the compose rectangle sizes applied on the same
+0/0 (pad, stream) pair.
 
 Drivers may only support some or even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -220,12 +227,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - X
       - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 1/0.
+    * - 0/0
+      - ``V4L2_SEL_TGT_COMPOSE``
+      - \-
+      - X
+      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
+        rectangle on (pad, stream) pair 0/0.
     * - 0/0
       - Format
       - X
       - X
-      - Image data source format. Always assign the width and height fields of
-        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
+      - Image data source format and post-scaler crop. The width and height
+        fields of the format, used to configure post-scaler crop on the right
+        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 0/0. The media bus code reflects the
         pixel data output of the sensor. Setting the media bus code on this pad
         configures the output format.
-- 
2.47.3



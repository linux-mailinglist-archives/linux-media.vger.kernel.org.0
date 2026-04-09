Return-Path: <linux-media+bounces-58377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHAKgoJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED33CF44E
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1243D302A2C3
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB9333689F;
	Thu,  9 Apr 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHoznO7c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF83358B9
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765704; cv=none; b=jQ4tyxE+hYjGSF+NL9H+2ZzxAKo+mWhNU6vRH5+RCAK8GJJ8MPU6r66/p86fdRWFKl5cIAbdqM4TXsHr3Tl0E70Rtai8f3GPSEGfnyS7ADAQQokciqht5Yk/HCuuocfUkbq0VpAIGDNFCBmEIepGbHODptFV9ZY1Ve+ILoIEYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765704; c=relaxed/simple;
	bh=ddClvMGa/BxgNQH7DbR6UVG2cXsKelF9gcPFAKQ4YJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF0fvgXmemm61KcLkasvdj7jj7i1GhoAw2h0Dl/0IxytZBUGUeTxXFbVqL+efj0kTgsJEWnX4nq4rTSDUAfDk6VAuD9M9jetvv4ixHuThwAicfvTm+FRWJC852jcCRXunij2CwK9LDST7yqgu/N2xPL2ZOiOLN4GUQphHlQcurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHoznO7c; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765703; x=1807301703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ddClvMGa/BxgNQH7DbR6UVG2cXsKelF9gcPFAKQ4YJs=;
  b=dHoznO7cp3hFuTei/LjeE4YnrUCfV42Ms46Ty71QU9sPZyVQ+/u5yEQi
   wEAk+Iagnbm7jBQfiQlPfG6U6XwGz3+AmMnCWhzCJW1BmCYmebt5Od466
   x77yYMJBiTSnOvzT6MJ2XhrUbxJD2iMHmuDquUP+kP+d+JYNu3cGXMT3e
   Yx33vld+ZwiqtOZTaQnyNqIw6p8ceW9xNH6gWkVrR4nOjm7XFR53ScmHG
   8/K/EkhGJGOBb99H2xqqARAGSJm/BaLQpjAi94j4kH57rxV7H25SSMBD9
   A9d40VYBEt5j0KMTNTCv+4gOXHwq8vybCu0vZKINgH6duF8r7BK2licqn
   Q==;
X-CSE-ConnectionGUID: PfUobnUaR16IBS6YetvqDQ==
X-CSE-MsgGUID: Y7pmriTRStWoLXkk5bZC4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408517"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:02 -0700
X-CSE-ConnectionGUID: mjNh33RuR8yNBCcEb+5QsA==
X-CSE-MsgGUID: CUcVix5WS2Khn/d3puC9rg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:14:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 15365121CFD;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045oa-2IEF;
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
Subject: [PATCH v12 59/86] media: imx219: Report streams using frame descriptors
Date: Thu,  9 Apr 2026 23:14:34 +0300
Message-ID: <20260409201501.975242-60-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58377-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14ED33CF44E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e79b26268415..d695987839e4 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -669,6 +670,24 @@ static void imx219_free_controls(struct imx219 *imx219)
  * Subdev operations
  */
 
+static unsigned int imx219_format_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return 10;
+	}
+}
+
 static int imx219_set_framefmt(struct imx219 *imx219,
 			       struct v4l2_subdev_state *state)
 {
@@ -1046,6 +1065,34 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	if (pad != IMX219_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					   IMX219_STREAM_IMAGE);
+	code = fmt->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = IMX219_STREAM_IMAGE;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -1117,6 +1164,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 	.enable_streams = imx219_enable_streams,
 	.disable_streams = imx219_disable_streams,
 };
-- 
2.47.3



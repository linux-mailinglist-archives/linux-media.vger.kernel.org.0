Return-Path: <linux-media+bounces-58268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLrNEMZ31mm9FggAu9opvQ
	(envelope-from <linux-media+bounces-58268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:44:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D890E3BE681
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E06443098E16
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4DD3D75DA;
	Wed,  8 Apr 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVhtxhmA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAC3D75A5
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662832; cv=none; b=t72z8z3a0IGZH08aPGzDruXPYVoutUA8RjfYOzlxlDP8M0YnheVX3KnnflKqj4n0ZDZ6arIgvYcQEOdXYLwcfK8MXX0/sYyEdcLWiP4PP4DGbrVkvuKlimmpHoE6bvmWzfeDI/OqPrg2jzQXfiZzvs9AnmpHitqdSkO1dR41b+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662832; c=relaxed/simple;
	bh=CFpCbThpSIVIrtX2sttGBGjl4mtGqj1OcSCXNrLh7+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryJ6pZngPcMFaj8qwpaEBHEsQONIDybOTP7M6g274Nr95mF5h3Vd7mvCscAqI0sIkpSGufy8Dr46crkB8pc8jJ80B/w0NA3/So6Q2Jzp8kzTmHvuZVAHLYJLpPkakbvvCzoTznk8UFOihL08bztM+LEk9PIMVlX/2OsXMB+RIvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVhtxhmA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662830; x=1807198830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CFpCbThpSIVIrtX2sttGBGjl4mtGqj1OcSCXNrLh7+0=;
  b=nVhtxhmATauMpJBkUFf3Z+m7NwCAjeLKt4fKZYCBm4/T6BefLXlAEO1N
   YxQRI7+fHQXUPUBWBLdVYpI9nieT2thjyPv4nWYO5v7ftcNe1FhFis1Gl
   8uZkA9a0p7huAe79g1ACKWOMFNW/qu340Nb5UEzPiYAKppGPFNAy46CiO
   Gy62ajavZbYpU1u0K6zlNzSbX30VZ83iW8AGS9bCLyigBO16l4jM9D2Z2
   gACF0IGa+9yUxCgjdYEi34S3R82bvb9g1MX2vyDdFJvh2k2Kpt1pXVNSF
   TkQ0DYkp3wnFVpnz3r77T5W/oe1CR5TLUx5Spl5jdnRSxgtcqxx3UpG4k
   w==;
X-CSE-ConnectionGUID: 4lVeNkc2Rgur3I5K4+JfDQ==
X-CSE-MsgGUID: +f2lJZrUTW+XtQgEZLbB2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038578"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: XDzE8hfrQg6hmcvhRSuTlQ==
X-CSE-MsgGUID: qVN3vZj3TpKMcincMMQ4+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740407"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 453AD122109;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Dr-2tJf;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: [PATCH v4 24/29] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
Date: Wed,  8 Apr 2026 18:39:33 +0300
Message-ID: <20260408153939.969381-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
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
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58268-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.955];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D890E3BE681
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce v4l2_subdev_get_frame_desc() in order to facilitate implementing
drivers that need frame descriptors. If the remote sub-device does not
support frame descriptors, v4l2_subdev_get_frame_desc() creates one (with
a single entry) opportunistically, thus avoiding the need to add frame
descriptor support to sensor drivers the device for which only generates a
single stream, or managing the situation on the caller side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 20 ++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 647587c0499a..40b28e070726 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2758,3 +2759,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
 #endif
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
+
+static int get_mipi_dt_for_mbus(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MIPI_CSI2_DT_RAW12;
+	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return MIPI_CSI2_DT_RAW14;
+	case MEDIA_BUS_FMT_Y16_1X16:
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+		return MIPI_CSI2_DT_RAW16;
+	case MEDIA_BUS_FMT_SBGGR20_1X20:
+	case MEDIA_BUS_FMT_SGBRG20_1X20:
+	case MEDIA_BUS_FMT_SGRBG20_1X20:
+	case MEDIA_BUS_FMT_SRGGB20_1X20:
+		return MIPI_CSI2_DT_RAW20;
+	default:
+		return -EINVAL;
+	}
+}
+
+int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_subdev_format subdev_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad,
+	};
+	int ret;
+
+	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
+		unsigned int type = desc->type;
+
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
+
+		if (desc->type != type)
+			return -EINVAL;
+
+		return ret;
+	}
+
+	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
+	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
+			       &subdev_fmt);
+	if (ret)
+		return ret;
+
+	struct v4l2_mbus_frame_desc_entry entry = {
+		.pixelcode = subdev_fmt.format.code,
+	};
+
+	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		int dt;
+
+		dt = get_mipi_dt_for_mbus(subdev_fmt.format.code);
+		if (dt < 0)
+			return dt;
+
+		entry.bus.csi2.dt = dt;
+	}
+
+	desc->entry[0] = entry;
+	desc->num_entries = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 4588992b4417..93b672edd08e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -2058,4 +2058,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
  */
 bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
 
+/**
+ * v4l2_subdev_get_frame_desc() - Get a pad's frame descriptor
+ * @sd: The sub-device
+ * @pad: The number of the pad in @sd from which to obtain the frame descriptor
+ * @desc: A pointer to a frame descriptor, with its type field set
+ *
+ * Obtain a frame descriptor from a sub-device. If the sub-device supports the
+ * get_frame_desc pad operation, its result is returned, just like calling it
+ * directly using v4l2_subdev_call(). If the sub-device driver does not support
+ * it, then one containing a single entry is created using the information from
+ * the sub-device active state, which this function locks for the duration of
+ * the call to obtain it.
+ *
+ * The caller is required to set @desc->type to the expected bus type.
+ *
+ * Return: %0 on success or negative error code on failure.
+ */
+int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_frame_desc *desc);
+
 #endif /* _V4L2_SUBDEV_H */
-- 
2.47.3



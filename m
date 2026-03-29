Return-Path: <linux-media+bounces-57527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAxbHF6EyWndygUAu9opvQ
	(envelope-from <linux-media+bounces-57527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 21:58:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8943353DF6
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 21:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EE9D3025A6E
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 19:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26055386C23;
	Sun, 29 Mar 2026 19:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsRjKNc7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8338551B;
	Sun, 29 Mar 2026 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774814215; cv=none; b=XV6oPOx/Tt05ME6lVVE6RxtB5i4TO2tUXN4kKBGXgVws3xOs9V2btNCo/k+LplzSkTPLl3WIRwoKIAo1NyVRGHBsSjg+2ar9ljSKhJYBBYg0usx5YIlrcntTk/C7G8s8Sn0yDokXsJZjm1I0xH/YpLPVA1Tq+U72JJaJMZqlSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774814215; c=relaxed/simple;
	bh=BXU0dwUqoGwqO1T4lj4Y6GvSHUa/4teMQLayUlAtrM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JN9IjRC0SKJpbYj23i61gXSHXlfBbEJs4qoAmySifNAC5ntPS9y7flmNP9Pz0VVZTFaiyXZxLmZPzebD4I/Ww5srQ5tFaZ2h8Gce8HYrkzBSrsv0+xHobLi7xZCZAN2CPogQHe5CHxj2G6LXsZEqwvXtSral4Um2oS4vYyOZn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsRjKNc7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774814213; x=1806350213;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BXU0dwUqoGwqO1T4lj4Y6GvSHUa/4teMQLayUlAtrM8=;
  b=nsRjKNc7EzL2ggNz/PQ0q3TjMM+dW/J3dkTV0Oohpsl4ZOhYXhbEBBpo
   oAjVQRTvBAdUir/q5co1eguxsjUDAYZk4gpIWL7NBVGUIKQ05I9cCrOYr
   KBWj8rWjKvBe5V8pl28kZzur5aXPCVFTAquu2Tm9Ys0H088E0Qx+dN5Bf
   4VLWwnirMudRdpRGr7QtCDKqM0TLJNNLsFC+zvJchTfnOqZN4Tzai0DO+
   r4z+OxOEr8HFrwbq9ARM+XlCmAV2DUQKc2iMvCuCJxgiGCYje1nJPcBMN
   pNx10vFr41vHsLAerjHYptRMWDd8IiZ8sx644M2SMiyRzhcHjb7PkIPi+
   w==;
X-CSE-ConnectionGUID: KQwztKzwR5OT2ULS4Ec8TA==
X-CSE-MsgGUID: lT1KcciARGi3ylZ6UElEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74992374"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="74992374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 12:56:50 -0700
X-CSE-ConnectionGUID: elmd9yG0QaWNRK0peEYozw==
X-CSE-MsgGUID: JUpnfqHzTYCfAEUTYcBXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="220993250"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.47])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 12:56:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57EDB11FBE3;
	Sun, 29 Mar 2026 22:56:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w6wFF-0000000Bv0O-2uDF;
	Sun, 29 Mar 2026 22:56:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/1] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
Date: Sun, 29 Mar 2026 22:56:25 +0300
Message-ID: <20260329195625.2840728-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,ideasonboard.com,linaro.org,linux.intel.com,windriver.com,foss.st.com,siliconsignals.io,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-57527-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8943353DF6
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
index 04a5cb2ad3e3..6032b7c4b949 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2790,3 +2791,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
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
+	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
+		unsigned int type = desc->type;
+		int ret;
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
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return -EINVAL;
+
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_state_get_format(state, pad, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	struct v4l2_mbus_frame_desc_entry entry = {
+		.pixelcode = fmt->code,
+	};
+
+	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		int dt;
+
+		dt = get_mipi_dt_for_mbus(fmt->code);
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
index 97b487b1507a..9b0e091c30c1 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -2100,4 +2100,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
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



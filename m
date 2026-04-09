Return-Path: <linux-media+bounces-58441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MJKNV4J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B80693CF503
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20096303BE0C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1E434CFC4;
	Thu,  9 Apr 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYujrpG1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6E345724
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765737; cv=none; b=Ml7xlcCyawCSxoDTnZZ1C0P0Ivq2yzW6+NfFnKGvEiVtw3gIDhm/E7HNL/1fzvM5J+G1EFD9ONmPtFnIASgZdBtxa+QHu8bl4RMGFJad85Nte+TQa/1Lpti9iWObJ2gKGeUO1FA7gMlyuMULKqLHpN9njKiZM02CVEzvICxyDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765737; c=relaxed/simple;
	bh=GdjAOPtDm7eAbzHJ63A0E8IBJdJemQeoRyp1Z2w16CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4gYqFgFV5l4S4x5AFDnCuF2I+DmDk8nB+6fTatPAQgbFQ5PWSrtsMQ+dmaPNqTQY30TQd3fjNlgywHDxHn/FMKVStXQZBIQJGtHS9qgQ535KuWXJupIgvc6B3QsBOz82Wa3mVIpej7PD/6M/S+//mzj5BUAd3f4fc/eqTR/K5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYujrpG1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765736; x=1807301736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GdjAOPtDm7eAbzHJ63A0E8IBJdJemQeoRyp1Z2w16CA=;
  b=cYujrpG1TjQ8l+PGMXDYh8b5fivWagXPCMQjL+WDupjzJI2D5GEl2JKK
   IMZDkXsZ7LnrkNY4AErDbLrGy0X9xpq8j+UZ2NLowBg9Kqqe+Hyh0dAq7
   xoY6s0Iut3X/p66r1dPCf1uyu7vdSRn2S6sOk8yelKgwP+DfZZq+s0UwJ
   BOqlA2zSptx2/gRZk0Ygb5hl3hJ8FVXE31bA9GO+3dFAyfTAziP6PQHqm
   6e7iNhnDu+Kz3dBLJAwRydib5nd+cWIrkfEMQv+HKlLDRDodiAOHy+MXC
   7qH+yRvs5uIu6mmRqbW71jhuFPJtd5I1aBZojZVIRTv7BXy/vAF2R3qEy
   g==;
X-CSE-ConnectionGUID: vEQKJPZhS3G9OJuOutU4jA==
X-CSE-MsgGUID: w87zL/GBSgy9FjDWUipMuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176532"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: DPGS/vLkQPG1lRQs8p5UOw==
X-CSE-MsgGUID: YFspiuc2R4S5JnbAYdynYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047543"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E60B122836;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mL-02Kv;
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
Subject: [PATCH v12 26/86] media: uapi: Add V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR
Date: Thu,  9 Apr 2026 23:14:01 +0300
Message-ID: <20260409201501.975242-27-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58441-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B80693CF503
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR client capability bit to
signal the userspace's support for the common raw sensor model and
document it. A specific capability bit is required for the purpose of
adding support for the common raw sensor model to existing drivers that
already have a well-established UAPI that cannot be modified without
breaking the userspace.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst     | 2 ++
 .../userspace-api/media/v4l/subdev-config-model.rst         | 5 ++++-
 .../userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst  | 6 ++++++
 drivers/media/v4l2-core/v4l2-subdev.c                       | 3 ++-
 include/uapi/linux/v4l2-subdev.h                            | 6 ++++++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 51188e7febae..983c7412c9f4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -59,6 +59,8 @@ Image Process Control IDs
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
 
+.. _v4l2-cid-config-model:
+
 ``V4L2_CID_CONFIG_MODEL (bitmask)``
     Which configuration models the sub-device supports. Please see
     :ref:`media_subdev_config_model`. This is a read-only control.
diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 3011643d58cf..0fb01bf6c825 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -41,7 +41,10 @@ necessarily offered by all drivers.
 
 A sub-device complies with the common raw sensor model if the
 ``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
-``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
+``V4L2_CID_CONFIG_MODEL`` control of the sub-device. A client supporting the
+common raw sensor model shall set the
+``V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR`` :ref:`sub-device client capability
+<VIDIOC_SUBDEV_G_CLIENT_CAP>` bit.
 
 The common raw camera sensor model is aligned with
 :ref:`media_using_camera_sensor_drivers`. Please refer to that regarding aspects
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
index da4a358ce762..50ac223e10db 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
@@ -91,6 +91,12 @@ is unknown to the kernel.
         ``which`` field. If this is not set (which is the default), the
         ``which`` field is forced to ``V4L2_SUBDEV_FORMAT_ACTIVE`` by the
         kernel.
+    * - ``V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR``
+      - The client is aware of the :ref:`common raw sensor model
+        <media_subdev_config_model_common_raw_sensor>` and expects it where it
+        is supported, as indicated by the :ref:`V4L2_CID_CONFIG_MODEL
+        <v4l2-cid-config-model>` control bit
+        ``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR``.
 
 Return Value
 ============
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c6d8399c2252..4b7830f705a2 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1200,7 +1200,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
-					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
+					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH |
+					     V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR);
 
 		subdev_fh->ci.client_caps = client_cap->capabilities;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 477d3ce3ddb4..9d5ba062be19 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -270,6 +270,12 @@ struct v4l2_subdev_routing {
  */
 #define V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH	(1ULL << 1)
 
+/*
+ * The client is aware of the common raw sensor model and expects that on camera
+ * sensor UAPI where supported.
+ */
+#define V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR	(1ULL << 2)
+
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
  *					  the subdev
-- 
2.47.3



Return-Path: <linux-media+bounces-58443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM9vAmYJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A97E63CF518
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 575FB303C6B5
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183E634D911;
	Thu,  9 Apr 2026 20:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSS91cEh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8634751E
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765738; cv=none; b=A1gvyqCu03uqUvon+syHK2XUHd880gCSxewOg+qcfRexe6kprN6QeBHpPARsZsBb7/OJH8CUBEM4vp7rGXOf3k25yu047tz7G8PW7MBUn1yvj/3h2cb3rsIhKbT19rcGndKE14lZPcaTa8VN9v69/eTksmmIrMjQ5Rj9IrPZiaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765738; c=relaxed/simple;
	bh=DPTidinhnCY5NNjcHuKs0zz/BoUnnRFtfQ1k29vJZbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJEalbMrfGXKx1oXJemBf2fPvgt+aAYAXBgewgBQn3cCHUXBxyzCRUYPojWj9N5P7EI4/bEKk4WiWgKhvrKEmrz6/+DYRzVYQvpM0UE6uyHvR4P8w2gNW5rrc3SreqlZ3qWpfWtZAWdiDckDfgJMvS5bDHTR7YI2N3+hJk3KAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSS91cEh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765738; x=1807301738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DPTidinhnCY5NNjcHuKs0zz/BoUnnRFtfQ1k29vJZbE=;
  b=YSS91cEhb12IdCLfq41UFHwYFO+Bw2HkI2oVEIQabEylT3CiazY8NAVv
   Du5jwY0PQv72GbaPsIIhBNml6AGcjI6fH+03zLNcPPry/KH1TrSLuiuX0
   1Zu88p21+1Y8bRN+TG43IjV7WcxlMwziA8QLzEgB+4EAIxqFVuHmtewLM
   C3Zpmh/N8dq+NL0XT5BZZZp2iGEGNJtnbvH3Jb8U5ii1x/rFeSwWS1DJ8
   WbTVDFZs5VnFqUereknRiKoYkUMca6be9JJMqI4YlLWp3ieY+Mnv388Ej
   1ZAOJsFSOddp4nZa08U3Ym0vQHWLn04xLiKPg1rWxi4MiQ6h7varws8Yw
   Q==;
X-CSE-ConnectionGUID: xm/bwVxUQQyDcEEY1pnAWg==
X-CSE-MsgGUID: 0S9wWg6MRuSy4blpInvKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176578"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: YOHlZaYzQAC715Uykga6xw==
X-CSE-MsgGUID: 7Un/qYPyQtOxXi2mJi1wow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047548"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B12A01228F5;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mv-0dEj;
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
Subject: [PATCH v12 35/86] media: Documentation: Document frame controls for common raw sensor model
Date: Thu,  9 Apr 2026 23:14:10 +0300
Message-ID: <20260409201501.975242-36-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58443-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: A97E63CF518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document that V4L2_CID_LINE_LENGTH_PIXELS V4L2_CID_FRAME_LENGTH_LINES are
used to configure frame rate in common raw camera sensor model. Also
mention the controls in camera sensor documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst         | 8 ++++++++
 .../userspace-api/media/v4l/subdev-config-model.rst       | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index aa05681c7090..6d9dadab3277 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -61,6 +61,8 @@ There are two different methods for obtaining possibilities for different frame
 intervals as well as configuring the frame interval. Which one to implement
 depends on the type of the device.
 
+.. _media_camera_sensor_frame_rate_raw:
+
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
@@ -78,6 +80,12 @@ The formula is bus independent and is applicable for raw timing parameters on
 large variety of devices beyond camera sensors. Devices that have no analogue
 crop, use the full source image size, i.e. pixel array size.
 
+The combined *analogue crop width + horizontal blanking* and *analogue crop
+height + vertical blanking* can be controlled directly using the
+:ref:`V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
+<image_source_control_frame_length>` controls, respectively, should the driver
+support them.
+
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
 ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
 is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index fb6d8a1bcac7..1923ccbafdd0 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -262,6 +262,14 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - Embedded data source format.
 
+Frame rate
+^^^^^^^^^^
+
+Drivers supporting the Common raw camera sensor model support
+:ref:`V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
+<image_source_control_frame_length>` controls for :ref:`frame rate configuration
+<media_camera_sensor_frame_rate_raw>`.
+
 Embedded data
 ^^^^^^^^^^^^^
 
-- 
2.47.3



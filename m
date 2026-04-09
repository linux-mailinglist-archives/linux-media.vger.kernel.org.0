Return-Path: <linux-media+bounces-58426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAfAEywJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915393CF49B
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC110301151D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2024B344D8C;
	Thu,  9 Apr 2026 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFUUNM+K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7E233FE26
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765732; cv=none; b=ZHQgZgjdKPs0ef5Z6Zmdiuu4Nmw3529TVHKechqzTNBOENJJ/CrUoP60BXaytjn1FVmAY3et8LjxZor87QfdPD/wp4rmMqPR5dlFLXtaWEOfgqSXTTSe3LndjG6uCs61aIXFcufCIw5m2GMC9NRjBAvBFB+LhZpG6fzsaAVoIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765732; c=relaxed/simple;
	bh=swYpDtr9A5O9KJZdJVVvgMR0YgjRGyv7HzwA9+dUsiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw7QKBOIwQ/zZAwYTFYrrzLdEXet8p/FSwtKu44mtGjG2ByGTHZYUpbd74F5ImIvrG+VH/TCxsIiQofxGygCAzqhdKBmYHB/HB/7WwCrUAmGapy1/Qz09An/OMPo1hzzPNQjGdRxYswLuQZqC68IGbyby1FlTnRf7KqymcotYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFUUNM+K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765731; x=1807301731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=swYpDtr9A5O9KJZdJVVvgMR0YgjRGyv7HzwA9+dUsiM=;
  b=YFUUNM+K2XKugA0rlRDGAQWVitde81w5khPF5RGL6HJ5OluGHiu3aTNz
   yISPs0Qk9Bnfr6s38znyWEbo6Wb6HkItuGwfo7u/f2ysCsMw2bJ0t039F
   eHG6t+Po4KWg6/jYbe1aqhi/CETiqhOH/3yTChdiGyGMlHBM/x0GCGHyo
   THgcwYY5RQhusATQCWBay0uNAhp08535SqR0dYo+s+TFC+qKp10qqYL0Y
   glR4HyPbov8xr+RHC8vJokHY1SAEa8/Hat1fMKMuLhukHjUSchPUOm+EW
   j1VGiWRNUe2Hvp9DFW3hWY77W6oTHHk3+2Ck6YgW8zOS8GPh12Kx0scwx
   A==;
X-CSE-ConnectionGUID: +n8a5qMYQfSmD/YO4mDRcQ==
X-CSE-MsgGUID: 0MjCEqb+QiCFVxxo6fwMWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176454"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: abYpBkOFRsuhkaq11Cv87g==
X-CSE-MsgGUID: BpcWZgNeR9GNv+h3HBdFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047526"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B7A9122884;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mX-0DWU;
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
Subject: [PATCH v12 29/86] media: v4l2-mc: Add v4l2_subdev_sensor_fll_llp_set()
Date: Thu,  9 Apr 2026 23:14:04 +0300
Message-ID: <20260409201501.975242-30-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58426-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 915393CF49B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add v4l2_subdev_sensor_fll_llp_set() to facilitate driver implementation
of both blanking and line and frame lenght controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 67 +++++++++++++++++++++++++++++++
 include/media/v4l2-mc.h           |  8 ++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e1..2e0be23d7511 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -14,6 +14,7 @@
 #include <linux/usb.h>
 #include <media/media-device.h>
 #include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
@@ -427,6 +428,72 @@ int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links);
 
+int v4l2_subdev_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
+				   struct v4l2_ctrl *llp, struct v4l2_ctrl *hblank,
+				   struct v4l2_ctrl *exposure,
+				   const struct v4l2_mbus_framefmt *format,
+				   struct v4l2_ctrl *src, bool *setting_ctrl,
+				   int exposure_margin)
+{
+	struct v4l2_ctrl *dest;
+	s32 val;
+	int ret;
+
+	/* Was setting the control user-initiated or were we called again? */
+	if (*setting_ctrl) {
+		*setting_ctrl = false;
+		return 0;
+	}
+
+	/* Are we being called for writing a value to a register? */
+	if (src->val == src->cur.val)
+		return 0;
+
+	switch (src->id) {
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		dest = vblank;
+		val = src->val - format->height;
+		break;
+	case V4L2_CID_VBLANK:
+		dest = fll;
+		val = src->val + format->height;
+		break;
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+		dest = hblank;
+		val = src->val - format->width;
+		break;
+	case V4L2_CID_HBLANK:
+		dest = llp;
+		val = src->val + format->width;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val == dest->val)
+		return 0;
+
+	*setting_ctrl = true;
+
+	ret = __v4l2_ctrl_s_ctrl(dest, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Only modify exposure range when setting fll, directly or via vblank.
+	 */
+	if (src->id != V4L2_CID_FRAME_LENGTH_LINES &&
+	    dest->id != V4L2_CID_FRAME_LENGTH_LINES)
+		return 0;
+
+	int exposure_max = fll->val - exposure_margin;
+
+	return __v4l2_ctrl_modify_range(exposure, exposure->minimum,
+					exposure_max, exposure->step,
+					exposure_max);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_sensor_fll_llp_set);
+
 /* -----------------------------------------------------------------------------
  * Pipeline power management
  *
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index 1837c9fd78cf..8618a74e4e0c 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -18,6 +18,7 @@
 /* We don't need to include pci.h or usb.h here */
 struct pci_dev;
 struct usb_device;
+struct v4l2_ctrl;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 /**
@@ -139,6 +140,13 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
 			     struct v4l2_subdev *sink_sd);
 
+int v4l2_subdev_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
+				   struct v4l2_ctrl *llp, struct v4l2_ctrl *hblank,
+				   struct v4l2_ctrl *exposure,
+				   const struct v4l2_mbus_framefmt *format,
+				   struct v4l2_ctrl *src, bool *setting_ctrl,
+				   int exposure_margin);
+
 /**
  * v4l2_pipeline_pm_get - Increase the use count of a pipeline
  * @entity: The root entity of a pipeline
-- 
2.47.3



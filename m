Return-Path: <linux-media+bounces-62034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIPqDrpBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB757117D
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6B523006134
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9B848C401;
	Mon, 18 May 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apwN0kaR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DBB48BD36
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122611; cv=none; b=p33c3alPMgH47IjAJhEdKb/OMapp27tZqgR2Gpy6z/nIn5TYgTTz8wJvD/XeoEv2mwwGAT+pQgL0lyyX9oJX/nFgUlaxKNrAYU+XA3qXrF4lsmCJnIxvPP4YUL1qDdAq1p1ma3WpFrzc4LfqnH94Ubo17WLauCwg1LNAnWnR51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122611; c=relaxed/simple;
	bh=lxWoqTZH6NjiJ66utzCH7LsQy1tGxj3yvDxTOeVcTro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0WYmK1vxSvw2uC6i0DQx41DHvBvhPH4mfHonX6+HwEBwAOh+019+4tbPDoxi1/jAWlSUY4zg9kgG0qJv0fCwnvnzVC2kDNG/4GxUKmp1YEnUgOEpcS99YrItdjDg1wcVUp17wixeW3O3Vr9vXHftmKCjaJ0L9Q+p+rER+mNug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apwN0kaR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122610; x=1810658610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lxWoqTZH6NjiJ66utzCH7LsQy1tGxj3yvDxTOeVcTro=;
  b=apwN0kaRM2esYeN4Sw48vdSxrb4x7CrnTlE0Ilbq9NP2UtfBXen3p46n
   yr2X5KbhPaB4idoGMQV0YJUGzOCzUXjv+1cbT+pDFxnxS3aqe9orZx2vi
   HSbNpJKgKpmGb7BQQIZ7wIU/x4E62qgItASs0+f4y8EunXQPej59TFAHl
   92LPKbjOwEb/Cce9PXwnb8MwbUf7rhUbo0jpL92HL8VqZY6OCNpM2nInv
   ywdXoIdp6caYKiycyPu+iz9ODhxOhek0H2/9mZZ4Rf3jXYwYF6dJIWHbQ
   gXgLrfmFiV0nfGh9PIU64O9fLSx9ajkHl8lqHhHKb7w2UuzHncpz1l9Mw
   Q==;
X-CSE-ConnectionGUID: EVJo6f+eQNeqzKSxcoRJag==
X-CSE-MsgGUID: tJ9QB6FXRQWBdU0QEFkxig==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413845"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: MQ5ihmgzSGiURT9S/tHv1A==
X-CSE-MsgGUID: wktXVdt0R7+vtMjwi31ajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019220"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B0C6121CEF;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8A5-0kD0;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 08/17] media: v4l2-subdev: Always return at least one frame descriptor
Date: Mon, 18 May 2026 19:43:08 +0300
Message-ID: <20260518164318.3367888-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62034-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBDB757117D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make v4l2_subdev_get_frame_desc() return at least one frame descriptor
entry or an error. Empty frame descriptors aren't useful for callers so
callers can now omit this check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b5eef0baa237..dc4ac08c210f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2732,6 +2732,12 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto err_free;
 		}
 
+		if (!desc->num_entries) {
+			dev_dbg(sd->dev, "no frame descriptor entries\n");
+			ret = -EINVAL;
+			goto err_free;
+		}
+
 		return desc;
 	}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f9b121eefa92..0361c8bbee38 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1817,6 +1817,8 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
  *            v4l2_subdev_get_frame_desc(sd, pad, desc);
  *
+ * The returned frame descriptor will contain at least one entry.
+ *
  * Return: The frame descriptor on success or a negative error code on failure.
  */
 struct v4l2_mbus_frame_desc *
-- 
2.47.3



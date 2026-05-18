Return-Path: <linux-media+bounces-62033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF2AHrZBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA857116F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34B21300145D
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFCC48C3F4;
	Mon, 18 May 2026 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNzICS0C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDE3FDBE7
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122610; cv=none; b=rx6aBXsnHt2hMM8FtYVKeZk/yv/HmzfGUEbl7WEgGn3MPTCqoLaImyAhxAlEL2Iym6K8U1YfFBvaPX2cWvO1U3Ea1HcRHZi5xR2nQxaTw81ZaNaaxStBMIahev0yoCsLeeP0Fp13ytEC/GuoaF2qfPMHSfMHrvEY3rQZhvbuHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122610; c=relaxed/simple;
	bh=lltK9Z4ge1iOuwvSdNs5Jjwzf8lLEfZvr8Po3kFnwOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrYpDEggKCGZ/c7FDJIuF473P5O9EjJYNN5YDEKCUE1KaarfG6vy3lC1C+HQyfwyMrzeL+yVn8xTzybLiZ3PZ7c/UT0zeJ55QQcOHrYTWVPPxSq5FWna1nC0B6QtIQ+s9ssRC6n+K2/IqTIPbEwE476S+Rvln44Q8+26X/YFFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNzICS0C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122609; x=1810658609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lltK9Z4ge1iOuwvSdNs5Jjwzf8lLEfZvr8Po3kFnwOU=;
  b=nNzICS0CodDUodYLJQ3WmRdQYs13k407UP3aw1d7zwYzLfQJveX7qbst
   odm1gAMyhB0Kf8EpACJ2hQ+K+XHKyqX6lCrs4Y4w8y5LVVMP8BkumQnrQ
   +B72U7tyt5PIrctBKcVBBn2qPhBBQcWLG+bRTRbIUmBmGLbaVEIc5jX86
   IpdrrwlsH3ix5oA75RkNrtK2y48qcPBhikA75h222T6WqecydB/ij8MMt
   UNOWJcbWV83ZWfVRS/gOrzxTQYLyIAB7jmcydcUYAZTME6flDNv6fbP50
   qJ49VGREUaCjxEfNISi4weAcb1JNsdB9j+Fp0bExzBsGhXg6Da1VPqRxH
   w==;
X-CSE-ConnectionGUID: Q3VzQ28xSG+MhsVzBTNdvA==
X-CSE-MsgGUID: QiWvce19RBKfiy8mtfM0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413840"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: 2d2ddJl8Rf+A3UMpn4ZewA==
X-CSE-MsgGUID: SMQOtm2rQiOCwrWc/0WCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019222"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 40136121D04;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8AG-0rYh;
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
Subject: [PATCH v2 10/17] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:10 +0300
Message-ID: <20260518164318.3367888-11-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62033-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AFA857116F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..545b2addc9ea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -32,8 +33,6 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	struct mxc_isi_dev *isi = xbar->isi;
 	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 	const struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_mbus_frame_desc fd;
-	int ret;
 
 	if (!gasket_ops)
 		return 0;
@@ -44,15 +43,17 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	 * to match the configuration of the CSIS.
 	 */
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
-	if (ret) {
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(remote_sd, remote_pad,
+					   V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
+	if (IS_ERR(fd)) {
 		dev_err(isi->dev,
-			"failed to get frame descriptor from '%s':%u: %d\n",
-			remote_sd->name, remote_pad, ret);
-		return ret;
+			"failed to get frame descriptor from '%s':%u: %ld\n",
+			remote_sd->name, remote_pad, PTR_ERR(fd));
+		return PTR_ERR(fd);
 	}
 
-	if (fd.num_entries != 1) {
+	if (fd->num_entries != 1) {
 		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
 			remote_sd->name, remote_pad);
 		return -EINVAL;
@@ -62,7 +63,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	if (!fmt)
 		return -EINVAL;
 
-	gasket_ops->enable(isi, &fd, fmt, port);
+	gasket_ops->enable(isi, fd, fmt, port);
 	return 0;
 }
 
-- 
2.47.3



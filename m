Return-Path: <linux-media+bounces-61381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOyRHxdWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2653185B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02FF23045173
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51403FA5F9;
	Wed, 13 May 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OE8xYfZU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389D3EDAC1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669049; cv=none; b=JkNZN1uDylf2DSgv81h+sSLLe8cNNxVoENioUDlndmCOik26WXGoi6Xq1JGGyvy5FtkRViM1fExneD6FWjLxg4HSLsouOlxDOhxpMjet+lepCpecLWTsSgxcNfcNDqg4UWXwlx5C2Bb3W8NlWXRtrVmpHHbaqy+Nn4rSuw8ZMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669049; c=relaxed/simple;
	bh=xfExdIu9Sk825teAnrjYhS1h2uEKkJqL8uSKnHWPeZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM4KWil9uzF57RecVZdShRboy21u0+wBzkDI+oqhgHQ1Jc4H1jfb41NLZzj6FL0Oy8RwSt4MZLU5LrtkAAyDih7ctbF39/J86gvNDzoW3yfsnBQGu2p16nHfC37ecV1iT/DQLuPIiIQIyQunYYbbZmslAVeGb/LjKk8O+d9TO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OE8xYfZU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669048; x=1810205048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xfExdIu9Sk825teAnrjYhS1h2uEKkJqL8uSKnHWPeZU=;
  b=OE8xYfZU19p3b28423rxz7swCh78F6uAtgGbHtiakPqoQ014E/njeAQJ
   E3vNbbZSsapG9AiqbWM14QGGbNtYnatySX/1Prjh9w00LcAPEQ6o6pc+D
   C3VQ+dq8D+ifvwQoEleWVoWyLkS4CaZVWx813ZKxYVWk3HjDTQPa8uy88
   +pU2q6ZJgYHye5glnKCCRAx98Pi55HL6+S56E4fRgm9s+HXbJDkvlh/uH
   Guxqepv+Pu5ihwPDIeRiJIBFMQd84dujOHQ9fYwQ7MWig1T4d1FxRg734
   OHfQc+xu8pbHkS79Ud1X488xnxAKT03CV8ND6uPbGQsBLD6iBZQAXG4O4
   g==;
X-CSE-ConnectionGUID: 2+ZA+zz/QzSFr7n4XmV9rA==
X-CSE-MsgGUID: MqTJxSVnSTiEnkZAHR5VFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464459"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: NztTpWJqSPyqQDaPoQ9ChQ==
X-CSE-MsgGUID: x63yGDhfQD+LG7gVqvaVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599259"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6145121DA5;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1o-3RHq;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 10/17] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:51 +0300
Message-ID: <20260513104358.2252605-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26A2653185B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61381-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c     | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..5bb536465c57 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -32,7 +33,8 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	struct mxc_isi_dev *isi = xbar->isi;
 	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
 	const struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_mbus_frame_desc fd;
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	int ret;
 
 	if (!gasket_ops)
@@ -44,15 +46,16 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	 * to match the configuration of the CSIS.
 	 */
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
+	fd = v4l2_subdev_get_fmame_desc(remote_sd, remote_pad,
+					V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
 	if (ret) {
 		dev_err(isi->dev,
 			"failed to get frame descriptor from '%s':%u: %d\n",
-			remote_sd->name, remote_pad, ret);
-		return ret;
+			remote_sd->name, remote_pad, PTR_ERR(ret));
+		return PTR_ERR(ret);
 	}
 
-	if (fd.num_entries != 1) {
+	if (fd->num_entries != 1) {
 		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
 			remote_sd->name, remote_pad);
 		return -EINVAL;
@@ -62,7 +65,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
 	if (!fmt)
 		return -EINVAL;
 
-	gasket_ops->enable(isi, &fd, fmt, port);
+	gasket_ops->enable(isi, fd, fmt, port);
 	return 0;
 }
 
-- 
2.47.3



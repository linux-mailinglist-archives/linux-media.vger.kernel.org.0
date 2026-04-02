Return-Path: <linux-media+bounces-57991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF1fE4Xkzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB838E711
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF78B302A845
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84044378D8D;
	Thu,  2 Apr 2026 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJopjjx+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C23033FB
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166594; cv=none; b=gi3cJbWKYgYf7WhrQvFSm2/URikDwXxn5/Wdt0lDuVy1/pfkbGsC8Fw5XCY35ssbNcoGz2PYIZFJNkYdYcR1nSBxg7Y1FQrONwdO1pJ0LiDNxG2PVYAKytqTVcnyJzAQ1tOiqyw3Iskgi42SSyn57Dqm7UJOZZdv+ZseqL1hKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166594; c=relaxed/simple;
	bh=Cn1i+KMApijiqUxwksNRqaQbO6weNLSPZXS/G0BeH5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHawfOq1j/3++g79Mj4M/0TjaE5Rq3+qoU6GFMFX+nPBT9Sxg+JI+wLrFj9bfc1nK2Y26kdw244q6kC7rhBo/uxndv12JLbZGQFy1dlur3gR5+CY7EyhyNOECviBh7sh1DkOrzMqzgxxwnCw7zVKqFcS9JHS7EEP+Xig2RzKSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJopjjx+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166592; x=1806702592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cn1i+KMApijiqUxwksNRqaQbO6weNLSPZXS/G0BeH5I=;
  b=XJopjjx+O/KitYW0lpD8/wtmnDELRXL/CJtqaMbKFoUeMnUXb/DtwXWM
   4CEr0HVFBumbLnRCV+ekV7v825rxMH9ZUZPK1lCOO/9LEG2U4ndVMfzjT
   mA7iKW7gItZmQFrzAKIz9N96OFS2VEiDBh+FnRtvWdghEgwiwtcww/4pO
   WuFm3U2pVEyyJG+X1TtAFyRU38IWfpozf7mvENgTZTtNTkgoEuGH3FSN7
   P6IP6PIzhCXsaPx0idghBTpBXXHMcG0R/i3+tj6arT0VWovXQg2qWPa8I
   7Va+TgNJ4QNcLvZGPZZww+XvPgEcYWAVPTsT3pK9pCaZumobkrKk9RmDb
   A==;
X-CSE-ConnectionGUID: POudhEZNQDuhwwRNZ7xZRw==
X-CSE-MsgGUID: hrx0cTcjTtqPPjCMzEW5Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405628"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:48 -0700
X-CSE-ConnectionGUID: 1V0+Go5qRi6IVrcqxbf2vg==
X-CSE-MsgGUID: N/t+krUiR3CZCDutug/E1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154324"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:46 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C2C60121FCE;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3gp-0kWv;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/6] media: imx274: Remove redundant kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:49 +0300
Message-ID: <20260402214954.3827408-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-57991-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2CB838E711
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kernel-doc comments from  regular callback functions. These
comments have no information value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx274.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 8ec78b60bea6..241821572e03 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -897,14 +897,6 @@ static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
 					imx274->supplies);
 }
 
-/**
- * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
- * @ctrl: V4L2 control to be set
- *
- * This function is used to set the V4L2 controls for the imx274 sensor.
- *
- * Return: 0 on success, errors otherwise
- */
 static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -1059,16 +1051,6 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 	return 0;
 }
 
-/**
- * imx274_get_fmt - Get the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state structure
- * @fmt: Pointer to pad level media bus format
- *
- * This function is used to get the pad format information.
- *
- * Return: 0 on success
- */
 static int imx274_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
@@ -1081,16 +1063,6 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx274_set_fmt - This is used to set the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state information structure
- * @format: Pointer to pad level media bus format
- *
- * This function is used to set the pad format.
- *
- * Return: 0 on success
- */
 static int imx274_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -1423,16 +1395,6 @@ static void imx274_load_default(struct stimx274 *priv)
 	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
 }
 
-/**
- * imx274_s_stream - It is used to start/stop the streaming.
- * @sd: V4L2 Sub device
- * @on: Flag (True / False)
- *
- * This function controls the start or stop of streaming for the
- * imx274 sensor.
- *
- * Return: 0 on success, errors otherwise
- */
 static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
-- 
2.47.3



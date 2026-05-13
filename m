Return-Path: <linux-media+bounces-61382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBZ4DnVWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE053192D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8589730E12E0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84393FB079;
	Wed, 13 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgZAErdY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E823F7AA5
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669049; cv=none; b=kPj6xCkbpqr8vDoYEdDcOaE6Xf6TyYWlKoH/Na4Lp68AHxwLObp5zVGam17f+Sbi7ziCkg1n7VwPsL8+s2HO2rU4TsBSXsgOQx1f3W4eYiwIplJYQ8z11m0rgM7iElfCDzPSUROuxSTLpD0jycQq9oAII/6qRoLvrV4CNQPao/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669049; c=relaxed/simple;
	bh=wRXz/v/zrSy050U9DfK+VWqzYxpL91u3b6LGz+8h9tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pd9ulRRc0mud1RVCyIct3RnjFQr8RT15stPMcOJuDFwmNAKrxvae1s/+OZJCwj3w4EqgnDi9A8jhp8VQGRVc49Rxc4qczldkoDBYo1SB1dbAN09cTxCF153V625tiH3MpxL9cPcDroCil8ei3jaZqb7z6QyxxgeiH977+QZJX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgZAErdY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669049; x=1810205049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRXz/v/zrSy050U9DfK+VWqzYxpL91u3b6LGz+8h9tQ=;
  b=dgZAErdYWHEl4TPTc+z7TT7ETILgJ2rk7pNkbZsRIYXG1xij2oNGjR4l
   +Z0aUWTGPZvGFK+XNYoiSiud1VaG+okZ144UlZqKdqYyfrQqAH7NUsSFu
   NxtHHSPR6tanYERoPudO103maKeQtevzh/lPJViEGsXt2F+KvVV83QXFu
   xhUdTDXNIOMfFPfeS7I+coj9iBZM1uCW7+HgMDOL0SJIefAbTyZ47iBJg
   0JbWfjI7/yYJczrrtLnNItS7tKAa2o81u2bW6lLH+KoVK3DEajFwJEKCn
   k0AwDiTOBOM3mbmPY9GNQv08VGA+0HMx99NCxMlN0fIWTBOvWjTiXwIvX
   Q==;
X-CSE-ConnectionGUID: KJQKx/SbQCOYVKcxnUn8Eg==
X-CSE-MsgGUID: CmIYxcKORdSou87Uj49X+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464458"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: Hon/w4qVTUai7Rau3ZzOJw==
X-CSE-MsgGUID: 6O9AjYVKQUaKDXnzYUXUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599258"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D0228121CFE;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1e-3K9P;
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
Subject: [PATCH 08/17] media: v4l2-subdev: Always return at least one frame descriptor
Date: Wed, 13 May 2026 13:43:49 +0300
Message-ID: <20260513104358.2252605-9-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: A3AE053192D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61382-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Make v4l2_subdev_get_frame_desc() return at least one frame descriptor
entry or an error. Empty frame descriptors aren't useful for callers so
callers can now omit this check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9d7f616ab7ea..b92ae87fa5d0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2709,6 +2709,11 @@ static int __v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad
 			return -EINVAL;
 		}
 
+		if (!desc->num_entries) {
+			dev_dbg(sd->dev, "no frame descriptor entries\n");
+			return -EINVAL;
+		}
+
 		return ret;
 	}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6e40420c2fcc..8b10dcab5590 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1816,6 +1816,8 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  * struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
  *	v4l2_subdev_get_frame_desc(sd, pad, desc);
  *
+ * The returned frame descriptor will contain at least one entry.
+ *
  * Return: The frame descriptor on success or a negative error code on failure.
  */
 struct v4l2_mbus_frame_desc *
-- 
2.47.3



Return-Path: <linux-media+bounces-54669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKoMN5W/qWnNDQEAu9opvQ
	(envelope-from <linux-media+bounces-54669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:38:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 557C52165C9
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 491E230233FA
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37723E3DB7;
	Thu,  5 Mar 2026 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHyQYKyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208E3E3D81
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732131; cv=none; b=WF2awEcU6x4VkLpzLHTZqC1+BXXuuYDduWi1nIYPVtG+NJyVBuWHw1edrdPDIJRh+qPDLG29YM9aDeeUj5sFHLqRM8q2rt61+5/fqvOPIxUGU3gSfcNKFb0PUisSB81X5DqKRwmVPYKC6xZHHkYhf2cvqIzkotSC6THdzMQ6D/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732131; c=relaxed/simple;
	bh=GbzhZdVeSM/cLXcPkz3f4u/9Ezf6MjuKHEvBq3UAOOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=up4ypzh4Z50j2lT1x5a6oURLaPG2TYJjf4gTBcsFxOfbRhhPFQcjywRG68ksdxmaVtF+iAp/g7bRoyrQO7WTvb/VugWm86T95mhH6jo3oL3pS4zGgG/6UjjX4vHAmZK4JFI/MloudCm3bBUB4mrpAsotdtUeWZXMaz+W4YlDvuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHyQYKyw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772732131; x=1804268131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GbzhZdVeSM/cLXcPkz3f4u/9Ezf6MjuKHEvBq3UAOOU=;
  b=eHyQYKyw9pSo61sz+ooe0BRLxJ7Lb59Gdu7ONNiXl3Jw1HGWpqMmfjAy
   +dTACCytkLKD6wqzK/8qvdr8uV/9e2hvive0c0JasSacLPvRASA1tymhm
   yPSYhfr9vUpmSsZTrSuP72rGEZlyigopxveP76rKqAAjeV+f05IW85U4l
   4Mk5sgZooWaReeasinQwZpGFVDOrDnGb7SR+R10VYHKvSSGks361wAkLu
   aZkLvg9FdGz116l3tN/VT8WWPP0fBAPC5nKVjHqofz4u7om/u4rS8DoZL
   wnE15VqNXKQPEt4JkfEY8w8+AViXKrQ8ctPYU4bA9wbz1H26De7NF52IS
   g==;
X-CSE-ConnectionGUID: Nw/jnKtKSRmbuYgo+ZBVjw==
X-CSE-MsgGUID: 9OXcWn6ZQa+jOEacXVAsqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99297630"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="99297630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:35:30 -0800
X-CSE-ConnectionGUID: G5w25WpGTz+Tr0r8qjEIOg==
X-CSE-MsgGUID: GKkPbaicSOmkeQOJ4365yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="217988740"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.148])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:35:29 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8422112033A;
	Thu, 05 Mar 2026 19:35:58 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vyCcA-0000000GOa7-16K0;
	Thu, 05 Mar 2026 19:35:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
Date: Thu,  5 Mar 2026 19:35:58 +0200
Message-ID: <20260305173558.3907731-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 557C52165C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54669-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In general drivers get their firmware graph endpoints from system
firmware, but on some systems this information is conveyed to drivers via
software nodes. The software nodes may be instantiated only after the
drivers are first probed, requiring drivers to explicitly issue
-EPROBE_DEFER when endpoints aren't found.

Instead of doing this in all (or at least most) drivers, make v4l2-fwnode
endpoint parsing functions v4l2_fwnode_endpoint_parse() and
v4l2_fwnode_endpoint_alloc_parse() return -EPROBE_DEFER when an endpoint
is NULL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Only check for NULL.

- Fix the condition.

 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 include/media/v4l2-fwnode.h           | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 03daa8c4ff7a..36b0495351cb 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -466,7 +466,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 	int rval;
 
 	if (!fwnode)
-		return -EINVAL;
+		return -EPROBE_DEFER;
 
 	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
 
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index cd82e70ccbaa..44c985a12286 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
- *	   %-EINVAL on parsing failure, including @fwnode == NULL
+ *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
+ *	   %-EPROBE_DEFER on NULL or error @fwnode
  */
 int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 			       struct v4l2_fwnode_endpoint *vep);
@@ -276,8 +277,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
- *	   %-EINVAL on parsing failure, including @fwnode == NULL
+ *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
+ *	   %-EPROBE_DEFER on NULL or error @fwnode
  */
 int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 				     struct v4l2_fwnode_endpoint *vep);
-- 
2.47.3



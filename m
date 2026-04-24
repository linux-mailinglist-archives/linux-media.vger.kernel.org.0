Return-Path: <linux-media+bounces-59455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBAmAo3R6ml6EQAAu9opvQ
	(envelope-from <linux-media+bounces-59455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:12:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477C458F68
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 967A33015E06
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 02:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5512561A2;
	Fri, 24 Apr 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifWUd1vI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A013AF2
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776996742; cv=none; b=jCKVXnNFHh7VW8nLhqhGy+Shz0mu3LzXlO0UBVBebeFgJoyS5aZ8fvFIwKeh/P50q+1UqoK597L2V9KJD7fUXb9V+Zp9VzAY2QrFQf1FZ6f+14RdZctHejGZ1wS4WAIU7Gux81cn/9IgWCkxO6uOu1QpsEzWDqm6Smmoai/5gxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776996742; c=relaxed/simple;
	bh=QGzr5ziqWYmB4x6QJmZA9Zoz4dXH6QiJPPgRQHrrbLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Acs6LUfeaYl4rWwvfPzDZs8oRAiRmmwaRGdeGp3/5FR/JCR26B5Sjz3G7Xe1iNHf5wV9WPVev+Zw9HLqMXFAggAnjF9Il2/iZMBM6BZKZuCkxopVT5V/CVK0+VT+ZnFfXpfmIU2wwWfsmSecGHBbqAi7pZUoVQ9iBhVDEqicMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifWUd1vI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776996740; x=1808532740;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QGzr5ziqWYmB4x6QJmZA9Zoz4dXH6QiJPPgRQHrrbLA=;
  b=ifWUd1vILndc0zhCNlxfSC4ioJtoZY+HnO0dsij4hELn5ZN3iHNsv1m2
   ObSQEqslH0IiLM6k27iHfGwwmpjaN7B12d/+H2HkIkvHy/YWTIgGHCwms
   zkNIlvzeYFrGSfS89P6nUkpWfqybOjoG311vEnW1zW3iywJVvdvh5cViY
   6mNb3MOMDJ/1si2fzzzvQ+SnnUzuibLnnNgxkEENHv9Mwe2IncwHX4Kc/
   FD231nfCok0vYHzPIJ+86+gAlKpR+s7jn0TuJZFdoC4T16cAu/2pUfh0b
   EM1AkyOQoxQaucO3RoS3JiNF2AJRas1VwhDaVOSmGSjaxRrOYAY7EtBG3
   w==;
X-CSE-ConnectionGUID: 5M6U60Y5S0eSqGUKHiXnsQ==
X-CSE-MsgGUID: Zmbh0r5RRRSozJ7O8j83rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77677984"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77677984"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:12:20 -0700
X-CSE-ConnectionGUID: 56egG/gXQ+KtpGticJtgxg==
X-CSE-MsgGUID: gdp7GnZHREGxAGhZIhvvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="237817095"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2026 19:12:18 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1] media: ipu-bridge: Add support additional link frequency
Date: Fri, 24 Apr 2026 10:19:13 +0800
Message-Id: <20260424021913.48020-1-serin.yeh@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0477C458F68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59455-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

Support additional frequency 900 MHz for the OV05C10 sensor

Signed-off-by: Serin Yeh <serin.yeh@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a766b7..f4828a691737 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -81,7 +81,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
 	/* Omnivision ov05c10 */
-	IPU_SENSOR_CONFIG("OVTI05C1", 1, 480000000),
+	IPU_SENSOR_CONFIG("OVTI05C1", 2, 480000000, 900000000),
 	/* Omnivision OV08A10 */
 	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
 	/* Omnivision OV08x40 */
-- 
2.25.1



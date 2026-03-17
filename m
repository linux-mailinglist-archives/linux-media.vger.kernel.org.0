Return-Path: <linux-media+bounces-56028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH3LHKkmuWm1sQEAu9opvQ
	(envelope-from <linux-media+bounces-56028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:02:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A10002A76F2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A8A330825D5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBDD3A4515;
	Tue, 17 Mar 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuIroQTs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384F3A382E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741368; cv=none; b=Dv+SiQ7lK7F3oAsyl5uDPAWdsrwfkvOTla1AuOOChgbmgUUMvp/cx7whdIvxkP8uerVWzGaCUYO5fHMR9QU5juOj2wBvxjv24R+qXOowa3+8/19U94UO7HfHBAw9cYEWKX2qjMVNdELKHk+RQvp06m7jjDVKV09K3mciy6Jny6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741368; c=relaxed/simple;
	bh=MNGsJl/bwCBynALrLTkgyOTKOp3dj68oftKnBadzqsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzOb+HKGGfw0ADIp7TlMa0xyO/mqAmjXmoQeGjwnjqIULMOlyZqvV8jIydyXuRf+HnO8cx/dq118AyOKZSQ6t6P4Sr2ZxnSuIMKsXfr2eVm6rKeC8q2MMhD+89cJ7LBaAI/RwKuE5LyzHibiTScGvy1YMg/6vS/Fod4tyAiUEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuIroQTs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741368; x=1805277368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MNGsJl/bwCBynALrLTkgyOTKOp3dj68oftKnBadzqsk=;
  b=VuIroQTsYe7wNGbMnDszcs8YMk3yPNSIU+613qNOZsUv3fifoRzg1vvd
   usuakqp9c4BNxCPGSfrZwZ5X5Gnf3fQyAW8wVSP0XnZIwTF+JppcdmYBb
   hF3Kd9aqnnS+bKUkrGONVm+WP0FA6FGJQ8pOkZH/pSU1DTtIT/KVXpxbF
   g4iMpRM6fE2ZjCd4IQxxQXYBDqKeKZyIFCSmGrXB0c/xgOXYhI8fCTHdE
   tVxF2ts1Pyqhv5m7Sj9gMqq+lK93sj1BEoV+z9dddppXs2coIY9BJ+5/D
   58ihqrC2ZqkIr+FGbntrWwrKGk98n2eRDLXM+WUenieA2Cn7GBlihEw2E
   Q==;
X-CSE-ConnectionGUID: bFW/4S4jTWm6kdW+cvR9/w==
X-CSE-MsgGUID: ETlyfY0gRXe7bJfhATsVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335682"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:06 -0700
X-CSE-ConnectionGUID: zowyIKN4S7+VmK4nKeXtkA==
X-CSE-MsgGUID: b2UqnhLiRbOVWEkb/WC3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344888"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 70C25121D99;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000tp3-1ZcQ;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 7/7] Fix file size check
Date: Tue, 17 Mar 2026 11:58:02 +0200
Message-ID: <20260317095802.214532-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56028-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A10002A76F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The file size was unintentionally multiplied by 8 and that's not right
anymore due to changes elsewhere.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: 578f7012a851 ("Improve input validation")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 3b92c6ba519b..49b8071b299e 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -187,7 +187,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	if (file_size % *height == 0) {
 		padding = file_size / *height - line_length;
 		printf("%u padding bytes detected at end of line\n", padding);
-	} else if ((file_size * 8) % (line_length * *height) != 0) {
+	} else if (file_size % (line_length * *height) != 0) {
 		printf("warning: input size not multiple of frame size\n");
 	}
 
-- 
2.47.3



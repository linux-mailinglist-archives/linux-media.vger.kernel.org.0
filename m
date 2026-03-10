Return-Path: <linux-media+bounces-55062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIwiKZnar2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C3247919
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90AE23027C80
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03786438FE1;
	Tue, 10 Mar 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbCWSk59"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA743637E
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132358; cv=none; b=DKJzIW/wI9rhb7mj9QZ+exC++k3Lkz5CIVC/ernLYAfmuBbw8JxXcJSsHi4Aft/xw80EG5WbyEzhYb4gLl3bjL1fZzxkJP5Nr/M3/xEmvDsHTj3b4gdRUkqJ6eMpjqOujjUD/HnrsEd7wqj7C0vOS4J0kushFfKlDraCn5oJ5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132358; c=relaxed/simple;
	bh=Ym9KpJv3qDMo8WxGEPccy6zPDf+sEl3XcDjECccjIq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1iHtKLjKYtphQxKa7DnT26CNR5GN659faEJ3JE8siPQcPZAxg3RJiCwxgdKcvXXYZste4LFKewwrInX+aAVctpRtCjUlRF6w/w5MHaFQCDQsVM8oFBLWCoVIad3uZrb6PjHARtd9EL5SUWbKAkM8Thbdwacdfixa9qL1iplQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbCWSk59; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132357; x=1804668357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ym9KpJv3qDMo8WxGEPccy6zPDf+sEl3XcDjECccjIq0=;
  b=lbCWSk59lHOqAErURS0nMiDMVLHNj4JLVjzg/ltDh+n7A2/g9ygMlcS4
   FrejuglmEYeaBp+tAVIRkMC6AZOVOrbMt6W9998yTSuVa/BhzLGgiUoGD
   JHXb7GwcnDRqG87zgzkAzXqqvYZhkqcnbrwCBs9W7ISTe3XG6w6FwdbEV
   kaoW+2iAiBB2j+wx4nKEGecRwOUau6YikIcd2xJuedzXQaOce+RB44KZY
   jAL4ltbB3jJJDYhKajruq7N1ZzLbiR6baaKZVSmSAE3Q5Nvm3xEfWOu7G
   O3iQVkRz/j39ANwJ6A3l8FwQhSNK+UVx1dDZwN0ojs2mPg8bwHHpmb0rL
   A==;
X-CSE-ConnectionGUID: L4YiebGjQ5G6u9Ln3KC6QQ==
X-CSE-MsgGUID: q693Pl0QSKKIoVFu2YjxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501769"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501769"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:54 -0700
X-CSE-ConnectionGUID: NGj9QlotSU6VB4TGK5Ryuw==
X-CSE-MsgGUID: 6FH1SMFPSOSab5QJ+Dt5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727702"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76395121EA2;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnm-1QIB;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 06/11] The program has been called raw2rgbpnm, not yuv_to_rgbpnm awhile now
Date: Tue, 10 Mar 2026 10:46:12 +0200
Message-ID: <20260310084615.1183141-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C39C3247919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55062-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index b0151789b0c1..bb9a2d576969 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -43,7 +43,7 @@
 #define MAX(a,b)	((a)>(b)?(a):(b))
 #define MIN(a,b)	((a)<(b)?(a):(b))
 
-char *progname = "yuv_to_rgbpnm";
+char *progname = "raw2rgbpnm";
 
 static int swaprb = 0;
 static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */
-- 
2.47.3



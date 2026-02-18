Return-Path: <linux-media+bounces-53034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM5RLYN5lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:34:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B8B1541B2
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56B663019F0F
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F79B318142;
	Wed, 18 Feb 2026 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIQCtke0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23671A9FA0
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403645; cv=none; b=TzqfqFS+uODCOVHHb/4oFxiuwSlX0kQIHPiv2cG6wxfFd8XVbaCfcHD7BmqPiX56jv2Gpggh8rLD5dHks+/9D8epxS1W+nWVXAB/PFv4jXAIZCSCUk7S8LCPvc+10tibCeW2APiz/cspt+NmfXZHdzj2sZ7B+MHilNufK7m0ZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403645; c=relaxed/simple;
	bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdYOGptx1g1iltqdSEsCya0aTrwwdZxNmfw4KU35A/HHCkj6rOv8ENZ+JG+LgsdKR+HISeSinjYM5ObKoTRx4mQP096hT4hxxiuI7un2gnZJV39ICQZp4qWInPbz0Rbj6r7jnZHAVRkCVcUc17IEQcbTyzvQwP9OMx+VCyKtxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIQCtke0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403643; x=1802939643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
  b=lIQCtke0eZA0LbFPwzTnjExUoPQPdjDPF+Ml0qcPyp/Ozm6cVIy8TWlh
   pN2OQfKrJLiLlf0zCv3FaZjyNEHJXbKw44WVeda/ITw6DnG2+lasmpfOX
   /l7S9G1/sCu1BiVS3LCFBVLFYxFk35mZ+z5q+81cpLggJ0Mn19CY2juKO
   BSTw8LayRRHVKcl0dmNonA/ZenAetBI6zLYdy/8MYmdegdgCz8eOCeMhH
   wI8ZQxAVxEzDuAlksKgRZbnGoUxUxrZ2E1ZG+mlDbDg2KiJL3q4R16POt
   z+0EInui4rilOkvsCHa/E3UsBJrpMDB4ngJ+oex2sADKdfQZEeTzDYo7i
   A==;
X-CSE-ConnectionGUID: El4Pnt4oS3iqIw11epzPlg==
X-CSE-MsgGUID: b/SiHYJlSbqssd96dLzbWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72391226"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72391226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:03 -0800
X-CSE-ConnectionGUID: DaM+1waFSgqdAazNs9qa2g==
X-CSE-MsgGUID: kOYXCcu8Sk+RS0nwpws8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="237133555"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:34:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3191121D38;
	Wed, 18 Feb 2026 10:34:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vsd0q-0000000ACow-2yuC;
	Wed, 18 Feb 2026 10:34:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v3 2/3] Add compiler options to avoid warnings
Date: Wed, 18 Feb 2026 10:34:23 +0200
Message-ID: <20260218083424.2432541-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53034-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17B8B1541B2
X-Rspamd-Action: no action

Add -Wno-missing-field-initializers option to avoid warnings on modern
GCC.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab363501a212..7545682dbcce 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 CROSS_COMPILE ?=
 
 CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O2 -W -Wall -Iinclude
+CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
 LDFLAGS	?=
 
 %.o : %.c
-- 
2.47.3



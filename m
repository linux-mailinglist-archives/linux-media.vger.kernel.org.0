Return-Path: <linux-media+bounces-54098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN+HMOuhpWmuCAAAu9opvQ
	(envelope-from <linux-media+bounces-54098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:42:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F61DB11E
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C42E30EE92F
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 14:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740A33FD15C;
	Mon,  2 Mar 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cocKceCA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0463FD155;
	Mon,  2 Mar 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461846; cv=none; b=TW9YHyo3wiT0sPgYtSAZoM72BEN76Z+NLs3focBFDJdCKzWqujn1HjYyw4clCc3b6DY3RIROOdmhl8OI34Sva9P1xOieFY6uA1lwsWW0rC1do80CMr2np/8OgRfE4Mvmw721DRF5QhquJ40u9NGrNkqZBXIbgXxtFK6f3E9jkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461846; c=relaxed/simple;
	bh=auTACkpIpLcDN3HAmldqUJ0WhsCrIOAZ1kJlL3SREjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQ5wUS2OlpQ9Mc9zliEgb2GnY6r8MLs9eW+MaT0+qdp5madV2bZ6gXdaGrQ+9uU0XhJ8mUTfHIpG6fr75gLJ9u2JfgtCncwXjpIYimQYY6TQEFp1sx0W+vJTLQHbQTl4vHYM/+FtoQ8GdJxtLKwfcBIOnbUVutQ3JHL6xwJhrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cocKceCA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772461845; x=1803997845;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=auTACkpIpLcDN3HAmldqUJ0WhsCrIOAZ1kJlL3SREjc=;
  b=cocKceCAfobsM8DV3gdLooQOghO3TyrJNx7JPPexnWRbJEH2D9lzfwc5
   7BCz+6ZaMpymonTQ39YyFGkFcfu96BIrO1IMyhkANqLzyQaTAwtoRZ9Qa
   oZYuEZLEL9DBK8fklUVXld2OE7UNAW4gYEN+JpwjNQ2PLR27jdKCzJNU+
   pzEmO1PiG+TWk7cb5pyonPlQBbc1tcBnrxDn2VimshnYs6Fqz/AGNzcqw
   g90rkme8EWepyC/PDXyJVFBLmbF5yFy5leSWf8QOVM+zXPJ4b++yJsULv
   neVOAuZflhxnZQ2MSTLceFSPeRp56QPOaZz1K0ib33CrWgzntn+CIzQBt
   g==;
X-CSE-ConnectionGUID: pgPkPQBCSqaE1+2AXjQWsA==
X-CSE-MsgGUID: TpyhFmx8Q5+zPENFaCEOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73433642"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73433642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 06:30:44 -0800
X-CSE-ConnectionGUID: zfgxM7CUQ9WR7C8KSOigbw==
X-CSE-MsgGUID: IUNhEnTESLyOjAEataNUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="221823055"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2026 06:30:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 362AA99; Mon, 02 Mar 2026 15:30:41 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] media: atomisp: Kill OP_std_modadd() macro
Date: Mon,  2 Mar 2026 15:30:40 +0100
Message-ID: <20260302143040.2495464-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 253F61DB11E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54098-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

The OP_std_modadd() adds no value, kill it and update the users to
perform the necessary operations themselves. No intended functional
changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../atomisp/pci/base/circbuf/interface/ia_css_circbuf.h   | 6 +-----
 .../pci/base/circbuf/interface/ia_css_circbuf_desc.h      | 8 ++------
 .../media/atomisp/pci/hive_isp_css_include/math_support.h | 6 ------
 .../staging/media/atomisp/pci/runtime/queue/src/queue.c   | 4 ++--
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 86300991d30e..b4d86d1e4a61 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -139,8 +139,6 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
     u32 base,
     int offset)
 {
-	u8 dest;
-
 	OP___assert(cb);
 	OP___assert(cb->desc);
 	OP___assert(cb->desc->size > 0);
@@ -151,9 +149,7 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
 	}
 
 	/* step 2: shift and round by the upper limit */
-	dest = OP_std_modadd(base, offset, cb->desc->size);
-
-	return dest;
+	return (base + offset) % cb->desc->size;
 }
 
 /**
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 5645a7bf493c..5c213fe427d3 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -47,7 +47,7 @@ static inline bool ia_css_circbuf_desc_is_full(
     ia_css_circbuf_desc_t *cb_desc)
 {
 	OP___assert(cb_desc);
-	return (OP_std_modadd(cb_desc->end, 1, cb_desc->size) == cb_desc->start);
+	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
 }
 
 /**
@@ -78,8 +78,6 @@ static inline uint8_t ia_css_circbuf_desc_get_pos_at_offset(
     u32 base,
     int offset)
 {
-	u8 dest;
-
 	OP___assert(cb_desc);
 	OP___assert(cb_desc->size > 0);
 
@@ -89,9 +87,7 @@ static inline uint8_t ia_css_circbuf_desc_get_pos_at_offset(
 	}
 
 	/* step 2: shift and round by the upper limit */
-	dest = OP_std_modadd(base, offset, cb_desc->size);
-
-	return dest;
+	return (base + offset) % cb_desc->size;
 }
 
 /**
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
index 2cb5c986790a..72a070d94736 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
@@ -14,10 +14,4 @@
 #define CEIL_MUL(a, b)       (CEIL_DIV(a, b) * (b))
 #define CEIL_SHIFT(a, b)     (((a) + (1 << (b)) - 1) >> (b))
 
-/*
- * For SP and ISP, SDK provides the definition of OP_std_modadd.
- * We need it only for host
- */
-#define OP_std_modadd(base, offset, size) ((base + offset) % (size))
-
 #endif /* __MATH_SUPPORT_H */
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index afe77d4373f8..d27c6567daeb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -167,7 +167,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 
 		*item = cb_elem.val;
 
-		cb_desc.start = OP_std_modadd(cb_desc.start, 1, cb_desc.size);
+		cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
 
 		/* c. Store the queue object */
 		/* Set only fields requiring update with
@@ -315,7 +315,7 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 		if (offset > num_elems)
 			return -EINVAL;
 
-		offset = OP_std_modadd(cb_desc.start, offset, cb_desc.size);
+		offset = (cb_desc.start + offset) % cb_desc.size;
 		error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
 		if (error != 0)
 			return error;
-- 
2.50.1



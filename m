Return-Path: <linux-media+bounces-57891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENTZGVBOzWkWbwYAu9opvQ
	(envelope-from <linux-media+bounces-57891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:56:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 744CF37E42B
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8E483031513
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 16:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86C247D943;
	Wed,  1 Apr 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="KGfM9Sjh"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D53C942D;
	Wed,  1 Apr 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060758; cv=none; b=J0Q89E6QaGZ1CySjSyjyBAREdMiKXFLxSBWwIDwelliMoVA7FBMZ5ydKOraxt8Xn8NXO1OU6BY5QyY/ncs1GfOEtqpGiOG7kbeb3scQU0BpT7Vnj97/tR4tAo6ymBaLDm4SiqbL6wJtiAD3qX5Qm9D9zC7KZMXl/21h4hJYowlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060758; c=relaxed/simple;
	bh=65k/OPgoCxkpL0B2UvUpOxb8aihUudDsObyqeHk30n0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bm5sIBgRWyiynOtBYoPOOwwfsYy2RHBom5qyOfRy7N6OHU6AOu8qVcTWUfRSyY6BzLqIAXARCZDPhvcZv3/t8ZZ6D9OhAJUbM+Z5uyva7goGjHvAoyz9yGKkXNfNM6Y12Y6e4jzhk2y1K8NOo5k30YKtB0fhVvyh6aL8A8NJM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=KGfM9Sjh; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cnsGCJerqZeic+bB0DW198cYcKvnJe3T1BtOwC5JpOc=; b=KGfM9Sjh4A7iVDRHTMfSw4RPYc
	81bB+J9zsHFyQRv5omL5slOTiJFr1ZVQu+UlAcjvULhqviQ+sZipT2+xmh4Bbw03UffryGqrcgx79
	qLW5bfATQCHVJVqvpgGf44JIRhhaNM9429j4QXwyjMdSVI9q8kKAcL22WDEDpwq8jTh8=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7yO3-006hht-2t;
	Wed, 01 Apr 2026 18:25:47 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v3] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band selection for overlapping ranges
Date: Wed,  1 Apr 2026 18:25:47 +0200
Message-Id: <20260401162547.1597975-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57891-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kcore.it:-];
	NEURAL_HAM(-0.00)[-0.916];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 744CF37E42B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_hsfreq_by_mbps() function searches the freqranges[] table
backward (from highest to lowest index). Because adjacent frequency
bands overlap, a data rate that falls in the overlap region always
lands on the higher-indexed band.

For data rates up to 1500 Mbps (index 42) every band uses
osc_freq_target 335. Starting at index 43 (1461-1640 Mbps) the
osc_freq_target drops to 208. A sensor running at 1498 Mbps sits in
the overlap between index 42 (1414-1588, osc 335) and index 43
(1461-1640, osc 208). The backward search picks index 43, programming
the lower osc_freq_target of 208 instead of the optimal 335.

This causes DDL lock instability and CSI-2 CRC errors on affected
configurations, such as the OmniVision OV08X40 sensor on Intel Arrow
Lake platforms (Dell Pro Max 16).

Rewrite get_hsfreq_by_mbps() to select the optimal band:

1. Among bands whose min/max range covers the data rate, prefer
   the one with the higher osc_freq_target.
2. If osc_freq_target is equal, prefer the band whose default_mbps
   is closest to the requested rate.

Since the frequency ranges are monotonically increasing, the loop
exits early once min exceeds the requested rate.

For 1498 Mbps this now correctly selects index 42 (osc_freq_target
335, range 1414-1588) instead of index 43 (osc_freq_target 208,
range 1461-1640).

Fixes: 1e7eeb301696 ("media: intel/ipu6: add the CSI2 DPHY implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Changes in v3:
- Changed best variable type from int to u16 to match the function
  return type (Sakari Ailus).
- Removed the exact default_mbps match early return since the range
  check already covers it (Sakari Ailus).
- Added early break when mbps < min, since frequencies are
  monotonically increasing (Sakari Ailus).

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index db2874843..237906cb1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -288,15 +288,27 @@ static const struct dwc_dphy_freq_range freqranges[DPHY_FREQ_RANGE_NUM] = {
 
 static u16 get_hsfreq_by_mbps(u32 mbps)
 {
-	unsigned int i = DPHY_FREQ_RANGE_NUM;
-
-	while (i--) {
-		if (freqranges[i].default_mbps == mbps ||
-		    (mbps >= freqranges[i].min && mbps <= freqranges[i].max))
-			return i;
+	u16 best = DPHY_FREQ_RANGE_INVALID_INDEX;
+	unsigned int i;
+
+	for (i = 0; i < DPHY_FREQ_RANGE_NUM; i++) {
+		if (mbps > freqranges[i].max)
+			continue;
+
+		if (mbps < freqranges[i].min)
+			break;
+
+		if (best == DPHY_FREQ_RANGE_INVALID_INDEX ||
+		    freqranges[i].osc_freq_target >
+		    freqranges[best].osc_freq_target ||
+		    (freqranges[i].osc_freq_target ==
+		     freqranges[best].osc_freq_target &&
+		     abs((int)mbps - (int)freqranges[i].default_mbps) <
+		     abs((int)mbps - (int)freqranges[best].default_mbps)))
+			best = i;
 	}
 
-	return DPHY_FREQ_RANGE_INVALID_INDEX;
+	return best;
 }
 
 static int ipu6_isys_dwc_phy_config(struct ipu6_isys *isys,
-- 
2.47.3



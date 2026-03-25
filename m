Return-Path: <linux-media+bounces-56965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCiCN5+tw2nAtAQAu9opvQ
	(envelope-from <linux-media+bounces-56965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:40:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 418873225CD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17D24308D3D6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4962235DA44;
	Wed, 25 Mar 2026 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="ckjKooaA"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF63590C3;
	Wed, 25 Mar 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431186; cv=none; b=Cj5k6h6AoqIuOuEK+4wduHNhe0uLRCO89NC94Y6xJfooZLMLdCvo/GCnOkhiJa3roqLbxKnfPHluILXSsr7huDrdy8LpL44cECkrIDhmoPOfbostdhAA4Se6JG6UfnSU6+M4QklHTv2ldy26mNmGgx/1m4SzL7qWDbpVpZzcgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431186; c=relaxed/simple;
	bh=kC1Ee/8VnN9S5oE/AH75RpPrsklx4gIqbp9SMxaG7kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGfwY4Dd/vtjoQINI/KUTrm4rtrBOGD5G3iUasiWh9eC556O2bUvHXrBnWa5FzMCsuGY4eqfGfyldmlSZcXbe6RW/FK61VxJWKC0kc7rVjAP+UXMSiRoJvdIAyDaaTbs1Wx9CWFL4RLhOKiWCCqJzHrXquwyo2dkidWP5BrglI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=ckjKooaA; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bpEYG4mAJXl0fC+dB++UtXI2QI9xoOV0w6t35e7WFRA=; b=ckjKooaA0De37EXrO3qsRoCSWa
	QqOixPFADng4wVytLhI5HJTTy7GPqOR3+Ue4neOmsO3S/f+qugq/zSRu95AZb6e8iGKAo/4ElQVXu
	aQk35hr/oKNehyBRrhOTJ3Z+kU06PihYaxeTCFGAKClEzHV5S4tD0YS84kFv3LRvou88=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w5KbR-00630I-0q;
	Wed, 25 Mar 2026 10:32:41 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable@vger.kernel.org,
	mnencia@kcore.it
Subject: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band selection for overlapping ranges
Date: Wed, 25 Mar 2026 10:32:41 +0100
Message-Id: <20260325093241.1441512-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260323154037.1404865-1-mnencia@kcore.it>
References: <20260323154037.1404865-1-mnencia@kcore.it>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56965-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[kcore.it];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,kcore.it:email,kcore.it:mid]
X-Rspamd-Queue-Id: 418873225CD
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

1. Prefer an exact default_mbps match (returned immediately).
2. Among bands whose min/max range covers the data rate, prefer
   the one with the higher osc_freq_target.
3. If osc_freq_target is equal, prefer the band whose default_mbps
   is closest to the requested rate.

For 1498 Mbps this now correctly selects index 42 (osc_freq_target
335, range 1414-1588) instead of index 43 (osc_freq_target 208,
range 1461-1640).

Fixes: 1e7eeb301696 ("media: intel/ipu6: add the CSI2 DPHY implementation")
Cc: stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Changes in v2:
- Rewrote get_hsfreq_by_mbps() with a proper selection algorithm instead
  of patching after the call, as suggested by Sakari Ailus.
- Added Fixes tag and Cc stable.

 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index db28748..4c9e50c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -288,15 +288,27 @@ static const struct dwc_dphy_freq_range freqranges[DPHY_FREQ_RANGE_NUM] = {
 
 static u16 get_hsfreq_by_mbps(u32 mbps)
 {
-	unsigned int i = DPHY_FREQ_RANGE_NUM;
+	int best = DPHY_FREQ_RANGE_INVALID_INDEX;
+	unsigned int i;
 
-	while (i--) {
-		if (freqranges[i].default_mbps == mbps ||
-		    (mbps >= freqranges[i].min && mbps <= freqranges[i].max))
+	for (i = 0; i < DPHY_FREQ_RANGE_NUM; i++) {
+		if (freqranges[i].default_mbps == mbps)
 			return i;
+
+		if (mbps < freqranges[i].min || mbps > freqranges[i].max)
+			continue;
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



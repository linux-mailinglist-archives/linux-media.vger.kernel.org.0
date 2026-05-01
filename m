Return-Path: <linux-media+bounces-60148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFoaEgzK9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:43:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A15934ADAFB
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF27305C61F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5B13D1CC3;
	Fri,  1 May 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L26sPWp9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091F3D1CD2;
	Fri,  1 May 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649979; cv=none; b=sOLwmyWsX+BDUEWtxK42LJWKjOBeuycR0/XvDAd9PsSf8Zqb3arOM5W9giuE1T7HNqPD2HR1FPBMV774hVMFyNgOe7rdXcfgteSTR/FeVoKzMjhYh0Q23VkiPjCpdIcm+SmRbHS52bpGlBoVp3xAFwNHqSumHvKQ23KHOTpLcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649979; c=relaxed/simple;
	bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc3HLhtsrRf0DXToXS+XD9pYUT6engU6bwb/y2jS0MYgpqgwQj/VRjU5pUvwWLFFlaQuCUc9oOERVHYrpslO8lqxkEmReszVCAMnF1OvDqUjTEEKl6gIVfbPifJB5JXVN/KRW/viKlzQkxPchzyOQP2HhFLr1xQn0yln+EVtNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L26sPWp9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AB0C99F;
	Fri,  1 May 2026 17:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649856;
	bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L26sPWp9OZVrf8JTp1WTpmRoPF92lpd0U31u42NfYKwNAusSyMAuhheFZRMbD6Cut
	 kXtiq5xKQOdmkQm4QL/aXLKkaksgBX4ysqPhAyS3w5gseiZmg/4CRPJdG7LLMMqyeS
	 an334Buzg6NYI8rh4uvrjp9v1uhQTZddRRrwC6wk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:06 +0100
Subject: [PATCH 04/11] media: i2c: ov5640: fix error path in
 ov5640_set_mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-4-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=849;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
 b=QFKFyghTzzm09YpgOWaebBMF/UbZGBzcN3mE1Fzn8q5LFn8rICrWOHBHqAHhfEtV4ZyCEvCyG
 oyvGUHG1jm2BNiQBH3VxGGSOhgpyUhvmNtGaefYagjhfr5f4+OudQz0
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: A15934ADAFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60148-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

During ov5640_set_mode if the call to set the pclk fails, we should
correctly restore the state of the auto exposure
and auto gain if they were modified on entry into the function.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 0dc4f4272d05..244c341d0e77 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2349,7 +2349,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	else
 		ret = ov5640_set_dvp_pclk(sensor);
 	if (ret < 0)
-		return 0;
+		goto restore_auto_exp_gain;
 
 	if ((dn_mode == SUBSAMPLING && orig_dn_mode == SCALING) ||
 	    (dn_mode == SCALING && orig_dn_mode == SUBSAMPLING)) {

-- 
2.52.0



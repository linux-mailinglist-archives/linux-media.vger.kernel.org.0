Return-Path: <linux-media+bounces-62905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FYAFtMCF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:42:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2C5E616E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 128BA3054054
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28FA401497;
	Wed, 27 May 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nbYKXuDa"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96104014B2;
	Wed, 27 May 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892888; cv=none; b=ensPPKTmae0CH7eSzy9Tpb2Sg1TTi/mXPmYWKWtizZl7wHs8WpQfsaSWiXraYTNMByduNMADrxfTBNdyJVOzp5ovg/Srt68G9sUPtVzmSvU/6ysvfQs5o5UGzYe/5m9kqo4RSZ2Joj4syVWP+BASw126KtBbIE03NhgRpFY/LIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892888; c=relaxed/simple;
	bh=O9dF5ZEfJNpQgmZIBOVHmn07Ohic32zxhXXlKJXsZmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JL/KLwD3kOUuSKU7RJkOwJLQOU2Mtye9Gi3rfb5NWqNqPoRbT+KUfAvuU4vdDLg+m/dF2R5ujkfoVPt+ejnTgrd1lXxKezuKWzIHoDJ1Z2uabEkZTTtiNv4xiHc1pHih8lAOpdBD73HB2QZkJUNj1W3ELArjcFaJqvSoh0sdO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nbYKXuDa; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892887; x=1811428887;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=O9dF5ZEfJNpQgmZIBOVHmn07Ohic32zxhXXlKJXsZmc=;
  b=nbYKXuDa9LJp1RhEafJ1G6vziQSiQADKvpJu6d+ler+5JSWfQEs43Ktk
   srW0Nbj6hH5YFVAR+Ea8bMIPPhFEQ0noDdhNBIfeFQz3D6jGPCF0/fNUp
   iKHzv3bw9XFwl3tMDPslRKCqlGuHdq8LG6THMykBWSzqGHBwRin7Zqkzx
   IhplcYsLp977kP+HZ4jN+21m77VRTd37sCHL9Uvw7BuyX5btaRS0U0TWY
   13Cnp4kw3xkEFMesZECVKg2IdYnPjOPaSWJsCjPYhR2/IwkhhxFexAd8S
   OblSoqwk5wDfcnBb3HmlJBdv9jjh5+fFfX8jsNF/3ufPgJDOMHAdO9v8d
   w==;
X-CSE-ConnectionGUID: G1pshg5NRriwkIlwEHTZbQ==
X-CSE-MsgGUID: rqgfLAxBSeyiVaOpOA/9Kw==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58541474"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 07:41:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 07:41:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:22 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:10:56 +0530
Subject: [PATCH 07/12] media: ths8200: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-7-e8f7d2284288@microchip.com>
References: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
In-Reply-To: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tim Harvey
	<tharvey@gateworks.com>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62905-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: F0D2C5E616E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/ths8200.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 808ef16ec..88d826a03 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-dv-timings.h>
 
 #include <media/v4l2-dv-timings.h>
@@ -127,10 +128,10 @@ static int ths8200_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "----- Chip status -----\n");
 	v4l2_info(sd, "version: %u\n", state->chip_version);
-	v4l2_info(sd, "power: %s\n", (reg_03 & 0x0c) ? "off" : "on");
-	v4l2_info(sd, "reset: %s\n", (reg_03 & 0x01) ? "off" : "on");
+	v4l2_info(sd, "power: %s\n", str_off_on(reg_03 & 0x0c));
+	v4l2_info(sd, "reset: %s\n", str_off_on(reg_03 & 0x01));
 	v4l2_info(sd, "test pattern: %s\n",
-		  (reg_03 & 0x20) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_03 & 0x20));
 	v4l2_info(sd, "format: %ux%u\n",
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_MSB) * 256 +
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_LSB),
@@ -146,7 +147,7 @@ static int ths8200_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ths8200_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 

-- 
2.34.1



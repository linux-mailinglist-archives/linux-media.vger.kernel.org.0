Return-Path: <linux-media+bounces-62906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JLHFgsEF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:47:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0465E6285
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4649D31B5963
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A5042668E;
	Wed, 27 May 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tw7piZUu"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D03426ED8;
	Wed, 27 May 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892892; cv=none; b=UDlXBFZPPhI9d+oaEJjF3Q82YwPqWn73JpoppHSx+r2GG77tVX5X18erw1Xm/9nMrQrwdv1rBxZAGL3bibYH/y00cQssl0jl3tqzKK0EjGe/iGfQ1nSaUrCfVZcGh/L6SXnXJOFgiGtZAcy0S9uRdMJMbnWksfQdGE8M4C3Sv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892892; c=relaxed/simple;
	bh=QgACeNWqZEfeqr8+YCjS0n7Pug4kQEtqpeNrOcFaEy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J5cgCQn5ZSxia3aXlltYJafj2WPXAGSolNjgz702p4HFAmMUX3m1acG+4UyMPBgrpCna58MB8fUAMmh78ixpVAclu0XQHWQHhc2+QeVVMnVJjGt8UxYt0PLApJhhITKuY1Jzfkis7fGjDgYH5wl9F55YAYwHG4eBv4kQKx8GUp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tw7piZUu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892890; x=1811428890;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QgACeNWqZEfeqr8+YCjS0n7Pug4kQEtqpeNrOcFaEy0=;
  b=tw7piZUuTO60pwSDtuwWgqb5a9ldfOWnpjGoNa2x5ByTUxdSInRIKLrL
   QXAviWxQ9XldQhA6M1eU169l3zkzeEt84vNOfQTMcdp34M3FpgfqVX/UI
   xacJy5ChnsfcUSQ0gDCDsYCtLtCrBl3kuZZgwHndb3aJnQ4FyVCgF94Ci
   wGCqUH6j0f3ufWr2/MSGkMuO+LJdiAp1mBCknrzygLzbXR6cxBViXGBMr
   TMKvcKjzG7QZyPiSXdubJKgbiPmV92sHbTgVaU0CPdsrl5Fg6QseMoO54
   Y93UrsDxooIBvkoS5+XR7TWOi/WVUFOIH6O0swYRDal0LalHbqHs/HVCe
   Q==;
X-CSE-ConnectionGUID: wgJtjh2CS+auOMm79b/qjg==
X-CSE-MsgGUID: DJm/sH9/TYi1gcwMf1QBXA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58541478"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:41:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 07:41:30 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:26 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:10:57 +0530
Subject: [PATCH 08/12] media: adv7511: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-8-e8f7d2284288@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62906-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EA0465E6285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/adv7511-v4l2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 860cff50c..062ef8844 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <linux/hdmi.h>
@@ -583,7 +584,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 		"9", "A", "B", "C", "D", "E", "F"
 	};
 
-	v4l2_info(sd, "power %s\n", state->power_on ? "on" : "off");
+	v4l2_info(sd, "power %s\n", str_on_off(state->power_on));
 	v4l2_info(sd, "%s hotplug, %s Rx Sense, %s EDID (%d block(s))\n",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT) ? "detected" : "no",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_MSEN_DETECT) ? "detected" : "no",
@@ -592,8 +593,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "%s output %s\n",
 		  (adv7511_rd(sd, 0xaf) & 0x02) ?
 		  "HDMI" : "DVI-D",
-		  (adv7511_rd(sd, 0xa1) & 0x3c) ?
-		  "disabled" : "enabled");
+		  str_disabled_enabled(adv7511_rd(sd, 0xa1) & 0x3c));
 	v4l2_info(sd, "state: %s, error: %s, detect count: %u, msk/irq: %02x/%02x\n",
 			  states[adv7511_rd(sd, 0xc8) & 0xf],
 			  errors[adv7511_rd(sd, 0xc8) >> 4], state->edid_detect_counter,
@@ -635,8 +635,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "i2c cec addr: 0x%x\n", state->i2c_cec_addr);
 
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		for (i = 0; i < ADV7511_MAX_ADDRS; i++) {
 			bool is_valid = state->cec_valid_addrs & (1 << i);
@@ -657,7 +656,7 @@ static int adv7511_s_power(struct v4l2_subdev *sd, int on)
 	const int retries = 20;
 	int i;
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 

-- 
2.34.1



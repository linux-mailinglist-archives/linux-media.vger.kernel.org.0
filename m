Return-Path: <linux-media+bounces-64780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HR+lCSfBLWomjgQAu9opvQ
	(envelope-from <linux-media+bounces-64780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 22:44:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672567FB6B
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 22:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MtFWT6qH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64780-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64780-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0177F3028B2C
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BB3369D53;
	Sat, 13 Jun 2026 20:44:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD70265CDD
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 20:44:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781383456; cv=none; b=ku9KgsDpmLpJfHodpfIOD8cvJPpbKWyb2NTXeYtj+sFcgma5Y40IcOtWiPjU3tK+4w6k6LKTyuo00rG2/R2i2JhiDucKJCjHDVx1nWMVQL6xQA3sXYssKcqiMOWDSY1QEcZyDWRAA+5X8if8JmeBj3KKFqaiLQUrGg8jl/0jEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781383456; c=relaxed/simple;
	bh=ZLyMrqHCDwBzRR733SM/Mxa6b27u5BV9Xye1seQFPDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvKF0sjIjHhF8AsILzZKGSxI7zzMrrPpAZHzAj/m/C6KXTn2lvnnn+FGg2OldPA0hM/V0b1TIB4o34915g2kmbO7c0FYeHS4VYfO203/n5/ePluseAby7wUJgwtBCADxlVTUkp5SDCPu7IqFfgML9OhV79xj9sM7M24ytLlenIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtFWT6qH; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-307631dbfedso4609080eec.0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781383454; x=1781988254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weJ71DEVLCOn/8EfckE0MVwN8+Zw9VbJDneioNLXMSM=;
        b=MtFWT6qHPSBBhIxuH95+4R5WJv8DbDcIVTYgXWet1L+RpSsBhPQz/6i91HqJ4mL2Xl
         slczMDrUoLWQwz++WMx6drHhZKz0hLQcopov5Mk0DLMEZpNrFX+K4QRy39+3A7nk1eg/
         PTAYpaRvcb/5bxVqDncK4PMGc6Nm86xRy9iCAXdJeaMycPdqtRH0tD3uZ/w9kS+U+ooa
         JaBD9h3475u3uo3SIbX7Vvz2J4QgO4eVlNYuRvMHMNQIMUcZatcjhTXFoYKywOGfG/0i
         qv/YJc7w1wrYI2Hr913E1cFSlnY4MsK+kd6gSAI9S9xa/9sRNUwQ+GE8CLcvrpRQEMQf
         DkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781383454; x=1781988254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weJ71DEVLCOn/8EfckE0MVwN8+Zw9VbJDneioNLXMSM=;
        b=Jew+Y740xWoO6SVsghy/P//RlQF94pKdH0Vgd4CJte7F8RLxlg89B8/619Kc4WwOiu
         8FBS1bFONSJ77uissVEVywDc5CqjGM+0Vtv9cWI2RvOAgSw6fEeiYhjmUjtfu+Lu/5OF
         ZADeNtgL+h4hEudJmacQSC8L19KoHOyvEbqlvwYS9cRoWsMBM0YIIIT8TY+st6ewRcOJ
         +LHJqPfEI2fzbYsfy7oHYm8hR9PguoBtcVXvwH20l+Ni2f2x/wQ4kaXb7kk1VpZGRq/M
         pZOTen6hnAQws5F+dMn+ybUwp7pFCMd6WbF3EOGxTTkJ5/RQk8exXAFh6qBhgevoAnIO
         yldA==
X-Forwarded-Encrypted: i=1; AFNElJ81uTP3q53o6ItfUv0UeVFle4+RnDxIpcoDRzCL8rb3FeJUcxhOOFiQfWvmNMi4BCO40xMuwPANP2yIRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwASEso8IO4imagXnXCZWF9Lkcgvf+n7kfIcQxy3XhKP/cLDU3q
	SM6O6vh/9QVPYjc20JwbbVxIAV31vP6Ce9nUp9F05l71AvBkfVli7EXP
X-Gm-Gg: Acq92OHZ3OiW/myMmki40cSKgrpGOtMP/+JUMVDCMfnibb012hDOMNRmL+BqizIOEaZ
	M1IEno7yXBOPFi/Te9YtqzT8nKFukoAn4+vZms9upr7WDvgh6tgvSv5jKWvqzzc5AZXkUem7NFu
	WcKnau3oTgnxHKaDRyyNZyInFIJhw12ENEq+jtBuE98+nSwDXzhw5TyZfC4MP3MD6+HMoI479Lh
	vcDZyG1KIkuKV+Hr/iX1A2RxhQpg4Nkxc44w6W7AGqJTHTfqahrvzsqcthwWzLroqsVG9fLDhj2
	hNoNhq6b1IL+5VTChHQtMW/dIEOU24IEBT37mA1/WB7MbIAnUp9/Fqy4Hr4Ef8fUVZBshuajNEZ
	uI1ZoZzmN6EMi1Ly3iC03ofKTdJZzGvwVw5jmvQO/Mx2i6D1q7OLIM/XkpEOqBTWjSsA9O42ecf
	WNib3TIaqj6oBN3O0XamaNSI4+XBhiXher8mtPpa52y1g4bsspd9E3GM7w3yo/9w3k2OCGc7uSU
	qk5fHTyobu2lKugVgv1nJ23SeIxj2eazF0aG7WRJGqCVs9GJ+wkv0BLOAybdsPi58oyoWvH985J
	2grIa9nxQJUo28uWhQ==
X-Received: by 2002:a05:693c:3942:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-3081ff418b1mr4585470eec.4.1781383454380;
        Sat, 13 Jun 2026 13:44:14 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm8389224eec.19.2026.06.13.13.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 13:44:13 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: dvb: dib0090: remove code guarded by nonexistent config options
Date: Sat, 13 Jun 2026 13:44:00 -0700
Message-ID: <20260613204403.62664-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64780-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:enelsonmoore@gmail.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7672567FB6B

Some code in the dib0090 driver depends on CONFIG_BAND_LBAND or
CONFIG_BAND_SBAND, which have never been defined in the kernel.
Remove this dead code.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/dvb-frontends/dib0090.c | 58 ---------------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index e2a48059e854..12d489cf2320 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -1161,12 +1161,6 @@ int dib0090_gain_control(struct dvb_frontend *fe)
 		state->agc_freeze = 0;
 		dib0090_write_reg(state, 0x04, 0x0);
 
-#ifdef CONFIG_BAND_SBAND
-		if (state->current_band == BAND_SBAND) {
-			dib0090_set_rframp(state, rf_ramp_sband);
-			dib0090_set_bbramp(state, bb_ramp_boost);
-		} else
-#endif
 #ifdef CONFIG_BAND_VHF
 		if (state->current_band == BAND_VHF && !state->identity.p1g) {
 			dib0090_set_rframp(state, rf_ramp_pwm_vhf);
@@ -1786,10 +1780,6 @@ static int dib0090_wbd_calibration(struct dib0090_state *state, enum frontend_tu
 			wbd_gain = wbd->wbd_gain;
 		else {
 			wbd_gain = 4;
-#if defined(CONFIG_BAND_LBAND) || defined(CONFIG_BAND_SBAND)
-			if ((state->current_band == BAND_LBAND) || (state->current_band == BAND_SBAND))
-				wbd_gain = 2;
-#endif
 		}
 
 		if (wbd_gain == state->wbd_calibration_gain) {	/* the WBD calibration has already been done */
@@ -1869,12 +1859,6 @@ static const struct dib0090_pll dib0090_pll_table[] = {
 	{700000, 0, 2, 4, 4},
 	{860000, 1, 2, 4, 4},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1800000, 1, 0, 2, 4},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2900000, 0, 14, 1, 4},
-#endif
 };
 
 static const struct dib0090_tuning dib0090_tuning_table_fm_vhf_on_cband[] = {
@@ -1892,15 +1876,6 @@ static const struct dib0090_tuning dib0090_tuning_table_fm_vhf_on_cband[] = {
 	{850000, 2, 6, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 	{900000, 2, 7, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1500000, 4, 0, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1600000, 4, 1, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1800000, 4, 3, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2300000, 1, 4, 20, 0x300, 0x2d2A, 0x82c7, EN_SBD},
-	{2900000, 1, 7, 20, 0x280, 0x2deb, 0x8347, EN_SBD},
-#endif
 };
 
 static const struct dib0090_tuning dib0090_tuning_table[] = {
@@ -1921,15 +1896,6 @@ static const struct dib0090_tuning dib0090_tuning_table[] = {
 	{850000, 2, 6, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 	{900000, 2, 7, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1500000, 4, 0, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1600000, 4, 1, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1800000, 4, 3, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2300000, 1, 4, 20, 0x300, 0x2d2A, 0x82c7, EN_SBD},
-	{2900000, 1, 7, 20, 0x280, 0x2deb, 0x8347, EN_SBD},
-#endif
 };
 
 static const struct dib0090_tuning dib0090_p1g_tuning_table[] = {
@@ -1950,15 +1916,6 @@ static const struct dib0090_tuning dib0090_p1g_tuning_table[] = {
 	{720000, 2, 6, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 	{900000, 2, 7, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1500000, 4, 0, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1600000, 4, 1, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1800000, 4, 3, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2300000, 1, 4, 20, 0x300, 0x2d2A, 0x82c7, EN_SBD},
-	{2900000, 1, 7, 20, 0x280, 0x2deb, 0x8347, EN_SBD},
-#endif
 };
 
 static const struct dib0090_pll dib0090_p1g_pll_table[] = {
@@ -1984,12 +1941,6 @@ static const struct dib0090_pll dib0090_p1g_pll_table[] = {
 	{680000, 0, 4, 4, 4},
 	{860000, 1, 4, 4, 4},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1800000, 1, 2, 2, 4},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2900000, 0, 1, 1, 6},
-#endif
 };
 
 static const struct dib0090_tuning dib0090_p1g_tuning_table_fm_vhf_on_cband[] = {
@@ -2006,15 +1957,6 @@ static const struct dib0090_tuning dib0090_p1g_tuning_table_fm_vhf_on_cband[] =
 	{850000, 2, 6, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 	{900000, 2, 7, 15, 0x300, 0x1d12, 0xb9ce, EN_UHF},
 #endif
-#ifdef CONFIG_BAND_LBAND
-	{1500000, 4, 0, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1600000, 4, 1, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-	{1800000, 4, 3, 20, 0x300, 0x1912, 0x82c9, EN_LBD},
-#endif
-#ifdef CONFIG_BAND_SBAND
-	{2300000, 1, 4, 20, 0x300, 0x2d2A, 0x82c7, EN_SBD},
-	{2900000, 1, 7, 20, 0x280, 0x2deb, 0x8347, EN_SBD},
-#endif
 };
 
 static const struct dib0090_tuning dib0090_tuning_table_cband_7090[] = {
-- 
2.43.0



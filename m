Return-Path: <linux-media+bounces-59255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEULK9EA6GlJEAIAu9opvQ
	(envelope-from <linux-media+bounces-59255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:57:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 301104405A2
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4E9330C30E2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1AE3AA51F;
	Tue, 21 Apr 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSiVD4rp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DE3A75B2
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811964; cv=none; b=Xfex0GsvxQpDiWleI0IInjOFvW9/czWqUs7jzyJpIAvqUX03kOyY0mx5N6I58Ks2To54T2d5nVYuZnpwoduOvR4ZNeobG6rk2sgyDXhwyA2eDUnrzL9oV7nTPn2htgJqb8kJz77frDJpbvlIlJgrqhJGMCAOkoQ0/eCNRmCRavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811964; c=relaxed/simple;
	bh=vN7/TMO7cbX7Kb346f90McAkvXOdYr4HMCpOfdsC120=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlnirXW5ytK6eCBtqOPql85K2vq8ffSRg9gn0YKtWhxzQ7l1ushY0/ruARQNrdSMIN7yBc+nPL2OuZAevk90vjC+C8aV1FVmainniMBthlX89F1rsA/wmUg6H3TH9v+PjarK2f4yEwRK2TAJ8wkF6p+4JSXHyi5ojBmtwOd1cEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSiVD4rp; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2de831d2b20so397603eec.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811962; x=1777416762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyaL0qjo0P+Rjj/R8G2l6sBVGr71qFrjDMNkthRUPUw=;
        b=pSiVD4rpB6WShfIaJdNEOCfJBr3WHlCTpKEOMGFdUHgJ2uLV0yg2b4ula38xPOeiiI
         dqsIKIkdMyVeWA6uzSAMnMk1G7wXsXPgLs1TFNq48Cu8PnibUk3lVwsnF1/DasZHi6kK
         Bm0PpGgxM4Eap7gp1kbkc6Xdo+nnUSn7TmJOyI1ZDTqqUPRBHNQICHSzCo1ntcr8oaAU
         8wlpoj/xGjyYC5Y7kpv7lbkurXjkTRS6Vjwi6UjF7Si4Pjq4TawCCtTm9fRu9j5XdPLj
         Ntl4P6eiK8qNXChL0BQyT9RFqEpzTTFaWYihvoPI9yJ7DK/6Wmq6aQ8kQ8Vk0nCEwyLp
         SO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811962; x=1777416762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oyaL0qjo0P+Rjj/R8G2l6sBVGr71qFrjDMNkthRUPUw=;
        b=UYX6P2BC+YGleW2lDfM2NBn4/YBSCcwZjg+nvt0oc+Wmr/36EfRSNRFpghYOLBFQUf
         OxODmDWXa2Vie80roWsMTrLhY4qZteJw5vPDsDO4x3hu6Fh1fqaudCIncvdXB0/r81kx
         +1Rk1L19cB5lWiPR91N1RiE3YNn2euOCFm8y0Vg6WG2vx/M282t6LbhTe3+U6AWf4nUB
         DzU5FyGkKALagZV19TWSB6ys4sjzqpdIyW6NtmpkKHSUHNpr5tBS7Mtfud1UWZtRPgk+
         Msc7Qb/aAx2Z/tXi1+rBXUiGwC1rv+QgVAq8CxAmcZWGvkvbdRChHc1TaCsSOowxy3gB
         /1GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hmHe5U8bSp5o9U9AHKznYssAB164Xr8scgQ4x6ZmKEUDhg+4l0bODQ5BnuVPNS6HXL7JpCfYC7if4TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAdoRdhmCB7EY/o1UsS/E3r9+rCEX38s+INqaEvR+BgKkoJsMG
	3VddYMk+S93JH7O22EYxAx4gUqxYFclEfPOTMKZqEzf/4HSp1JutnUdS
X-Gm-Gg: AeBDietLaQLP49V2ER/aaYK2nzFV3jLy/V58RjV/V8QBE46BPyQz9xGcwUHyCwYtI8T
	Kd0kxBH79SB2JA6vd/OHAPgYuasTPw0CcaNZ8296c8uuOSiQBG6ilka1zMwaYYYSkkXug/sw68l
	R4/Ch2FZlkSzsfA2Wy3IKXryQOHB+3NoZtyOYylvXmcKufv1b9BdKJiXoXCTWf3llRul3yQSiMo
	PwqqLprWYhbd6HN8z7YTD2elkkiXNUR5Bf6J38LgXyTyi7l841hb2X2U3MFdMvHuFRqKSI1Iss2
	dIMFMp6evlNpFiRSsT0OSV1ax7RnIBfiAT84pgEn0+NOtTYuSGqEFjIhlDn7TR9ExoAmsUfNcq8
	d/ub/eW2EGqkTzgAcC4wpbpbl+hPcQNveVlJrG39zInQiJtoWe1nXlT5+bTMHvO3whjVE2SU53k
	pz6rFUzCZEAk+C/6p30xa4COQtPIJyVyKERZj/dCq7mV0=
X-Received: by 2002:a05:7301:1295:b0:2d2:ff9e:c07d with SMTP id 5a478bee46e88-2e478e162dcmr11101548eec.24.1776811962042;
        Tue, 21 Apr 2026 15:52:42 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:41 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 5/5] media: ov8858: add ACPI device ID INT3477
Date: Tue, 21 Apr 2026 15:52:17 -0700
Message-ID: <20260421225217.12472-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59255-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 301104405A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

The supply names array already covers the regulators needed on this
platform: the TPS68470 board data maps VSIO to the "dovdd" supply of
INT3477, so enabling dovdd via regulator_bulk_enable() also activates the
S_I2C_CTL passthrough (reg 0x43) that gates I2C access to the sensor.
No additional supply name is required in the driver.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..a1fa0be52 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,8 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
 };
 
 struct regval {
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0



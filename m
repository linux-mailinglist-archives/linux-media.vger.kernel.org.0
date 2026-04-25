Return-Path: <linux-media+bounces-59599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABB+MKjs7GngdgAAu9opvQ
	(envelope-from <linux-media+bounces-59599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A8466E7A
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DC65300AB30
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 16:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AED369999;
	Sat, 25 Apr 2026 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlGCA5xV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F665358387
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134722; cv=none; b=fzoOWrEJJYYXuTT/576k3D/FCyC8LaXX4hyAPkbtNwK1XPET85L/r7N38rPTzq6eHQwERq0fa+tz0PdAujAxr/6KgazWnviaM2nXP5NAFC5o2XkwC3Lhm7E5gUlEugeeCBP8vWnBoosRtIIRenNKVduG6TaIXRDvuyIqNZwLEFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134722; c=relaxed/simple;
	bh=JeFAGlclU046JIgSg4OVyBoSGPhLkEXsWzJ0ES221g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOBJgCr6frYf3aOr1xccs01I8BwjYp3WvOyFXscfl0XQ4u9Cp7+kYyb0lbEoNAPrKQeIku6RVyJyagNkFGICyzkXBQQq/QEc56ijmfd26wIOIm6ITVjOzzqpI7dLpY1sRoKz+z8w8UTDqbXpcHtCYReR9N9H0QlA4ugSBGC1xIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlGCA5xV; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2de831d2b20so252823eec.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134720; x=1777739520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=HlGCA5xVch97pywvv4d7rQOR/7J261BZd9UbKLz18Y+I9fB64uG06scuzCdEHgPXlS
         D2sNts09R836qNfWLP/FefeZOHMhw6y1Ds2zfxw6CTJP3ZeomYmEr2+BEgCl5lDiCo0m
         +Ph7Su17ZEC7BtXGaOr0l8s2R6XNUBKOI9A/IogqJWP85PBHlyyd/KsvIx/C+BkaBHu5
         c5MC4sWuK6Sd5Xh9KZU3PlOLBw9v5OJUY2xvBLFxIMLphJcuOz4WSryQhb0f4JkGRpxT
         8vRTIC94qV8bMPWKlc9nXvVQttnL7T7imaz/P27P3t5a5baoQO77Ou5AaQQ9PB3DiCjL
         gUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134720; x=1777739520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=YLthbFvmXjv2rOHsyj9AT+IPseKnivc+ImamW4SejEphLaEf+W30ImOb0ghwoA8BqC
         alb5PU6eqEg/27CIOQiB8M0eyJdqtbc2Lf4zB4zsTfwBCA/Rcnu6/yCFcW7WxS9Aow5B
         8lhorZdyM67n7tM7MrRW7k3LoKHMV+jLbK1HR+IQKKpWD9AsRpENn5rg6IOXBjZa1dvG
         wwEBBUSpgevZ+EvfdTQlxShTUQGdNyN/CKTR6Twim62t1IbQ+CKvmLU888MHC2b2n8KW
         zVIvNUiPK4kODdPLI/UZ6v4z1NbdeaCkP4KqZ/yYnhKpTIGP6kboqeliQ/G/BzaDQM5g
         F9BQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cmQ6GRnJkXryQ+mfunSSa9Kx4IqGFIAagY8bmbspwaaJhrUCPRdsBEYjjOFaZq08Kw3XY7Op9WcjTjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2NoIO226NlilR2lzPvij2k00VJ88z2PvWmnPYsL0rmZerdvT
	QeVD9llRfX6aGy5J05XvR0gpPwScj67b26W/ruKbxOh8F/rrjU0Xct14
X-Gm-Gg: AeBDietRvvvrbRmFR3feEFh9mbJ6sFJ7usFlENobIFwtNkppRphTpPMlzQ3NbDZlQ8x
	gwBZpi/M9MocS9Yyh3h3ql/eJ4MIUgSJcTWj6qr75Ukuro0CBdmX3M2q4eQYfZfDwb9uuuV9HfW
	eGrDRWv2is0Co0/aSDBlEMldvbnP94VgGwlwM9Db0p8S+R7hEsss5NnbYRKhB/hgqI3XJnhAWZf
	DBzM8JTzPIUKJtyj1REA7f8nMW4XOpjLLCY7WK2zED0IOLec7atldcPDw4B6Dlj/bE0QzM7LWDY
	htaXyUWnvkLSgsvxLKNwqGQew1hsW1bOK2FXaBjG+jDnQ7nsuwUlTqdj02VfCVavbnnqPUAOxvR
	+b+Bv9KIE1TciIfb1ItPvgWivkoD+2nndT9r76I7V45ZKrPwCCivXy401S8pZpVsmL/q9Jzn5Gy
	cUtwEG9aF0qxpwvMu2V8/1NqRHNIvSA7Tqgw==
X-Received: by 2002:a05:7301:6096:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2e4648c5f75mr22676084eec.1.1777134720156;
        Sat, 25 Apr 2026 09:32:00 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:59 -0700 (PDT)
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
Subject: [PATCH v6 5/5] media: ov8858: add ACPI device ID INT3477
Date: Sat, 25 Apr 2026 09:31:45 -0700
Message-ID: <20260425163145.8474-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F7A8466E7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59599-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

The supply names are reordered to dvdd before dovdd so that core power is
stable before the I2C passthrough opens (on this platform dovdd maps to
the VSIO/S_I2C_CTL regulator, which gates I2C access to the sensor).

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



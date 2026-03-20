Return-Path: <linux-media+bounces-56430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGvpLTqRvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:13:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7752D46A1
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9DAF31EE94E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5270E2A1B2;
	Fri, 20 Mar 2026 00:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEfI2I6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872272A1BF
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965408; cv=none; b=UUnhsKF9qBQJ4UHyYhNQSVbI/W627+e4sxT0I2ZMc9iBbLLjBmUDs58tmft6WWz5ln+uD2Or8wvEKO2UB+Gc7Xv5pUQTed//uTq8zvn7fBpKovPXFS0VrAE8MfJE37M9VB7zZvH3oQR4/1l6IWDNEhEsvhr9r2jsy412S37QiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965408; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKk7k4Rh1W6TlcNV4/RNyxjBmXCtWbHjheLkKPDKMVN93DI5HkOsrodIOEsuk3R2hrTRgRCILA9OhWa/B7kKIAGdS/p2IwdazW920bGzvbXAkuPB6W0NBSxOerohx9Z3kPy0HS90ZP5fdkrnVmL6I/kDZbBIz+kqofPmPjtDrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEfI2I6i; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0c482e069so124127eec.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965407; x=1774570207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=TEfI2I6ilO80tW9Xbiu8tMde//mXla2kVH+ZKdr79mCUU/wmicYqYFKohM2U3/7uMD
         Ef8vrHnlF1ny4vehNWkgSe31jWxUkHdPzL9v/H0VjSypv3yR2UPGCWaEHo7mDZvZ/ZKn
         h29Az11Kp1mWgzwnSQQoDTRrJkyvBH1btq1+h7AREOOFC7mnNfmyjUc/uputGb7PSvus
         0bKBvR2SmTRMvI4EZW2tQ+BxPcTVuetudjqNUZ8jPk4+ipSlf2zjpOZs9I1Bz2yWqrfq
         vPOQ20rFG4T5j2C9AkK85oDiL4xeOhkHnRRgX0NRD0UuKYgfEKZNCHu/vmc19nb26YYj
         h1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965407; x=1774570207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=N3gr6Q5JdfRKOF2Lq4GAX5h9IiEwgHN/23Awl6PIDWKXHcLrvlyVrxVTkTSR9FgNpQ
         WrMo7vFMsd0uzUS0xm9wPqDUlyl5EHZOslSRIoUdCtjskgXPpjYJ1kMh+VK00WWaOie0
         dZmov4c9CXWih1uvPqFYhZl7YCohE0xIPVrmhdxGXvezw/akrAcJ3lWMSo56iwxQlNFw
         BGSjk2D+RC5qWiOTyWzvPj5EfG34FiX+gUUcdbj4/+HSnZ4ppRCr8BUywbPIHRTxAe7J
         UxUoj5JFF5SKv/aMCSUqp+cBKmcjSznR/icE3QZDD6pOT5Kd0muuUSgPMy8EIGRr0YH+
         Qgbw==
X-Gm-Message-State: AOJu0YyEEotLkWDjJcGZFklPDIun4xQZlC0wJYGLlz5L2X7gH5M8+uh3
	/wN6XAzOWSXjgf2dKTXE4xlCeXJxZoomv0DYbEpfHUrk0sZv0Hz71SwOQJ1HDMw0A1A=
X-Gm-Gg: ATEYQzyYJsND4uX1uSXa8ICYSeuOobxjab2+trUML3d3Ka6i1h37JhJvKeGMACfOmnl
	N3/+9nYJexPGit4R+gwY5gZvhfIc/2lVY+3leOYUncQIWO8TKiXW4DdC2STuLObZAwIqKw3ObzV
	Md6vLv12ZLcMOMEdaFNJH96voIeAw5ecki2ajTWgxLEDmwvVBC9W2DByku88jyAfvJzG1L0hIul
	ZE47cadJT5aJLCNHg44GIyfwjEbth4EImbdc/WMl3jhqbKEuH6WEyV3VGezeXRNNQAtUIy5WWlm
	ZZxJMjxKbAtnBaFLOPc5lhk/RSmduW9O3x+bLu5no+em5PJilLIJWiRSOZZ+answ480YmRHiJaq
	RX0f9qF3wCJ7r5GCZRQnZ140SkbViaGWILtySBwPQ0w2sKlQ0kljiRcT8Js6iX0T0CUTeaQ0Etj
	CA0hdljIJzb6p2Fc0lf/82ag==
X-Received: by 2002:a05:7300:3252:b0:2c0:c482:805 with SMTP id 5a478bee46e88-2c1095fa724mr723316eec.15.1773965406563;
        Thu, 19 Mar 2026 17:10:06 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:10:06 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Thu, 19 Mar 2026 17:09:33 -0700
Message-ID: <20260320000937.9177-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56430-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.929];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C7752D46A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

On the Dell Latitude 5285 the OV8858 is powered through a TPS68470 PMIC.
The TPS68470 VSIO regulator controls the S_I2C_CTL register (0x43) which
enables I2C passthrough to the sensor. The board data for this machine
maps VSIO to the supply name "vsio" for INT3477. Add "vsio" to
ov8858_supply_names[] so the driver requests this regulator at probe time.

The existing supply array had a duplicate "dvdd" entry; replace it with
the new "vsio" entry and reorder to: avdd, dvdd, dovdd, vsio.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..5bfea237b 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,9 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
+	"vsio",		/* Secondary I2C / S_I2C_CTL enable */
 };
 
 struct regval {
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
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
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0



Return-Path: <linux-media+bounces-56923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AZpCXcFw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:43:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805C31CF57
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 375173040074
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6624363091;
	Tue, 24 Mar 2026 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkdD2LIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EB364E80
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388540; cv=none; b=STVjsE5b6PoNm4uBrWuSPC5zAB+bRIJh+Y7pj+VXTpg7pbQaSUgrQgExlejHWNoeGamqKD87AcgR+CNf/5Otw1VxQMvDw/PsTQMPzkYWECytcGkY7sK46nvjTr/Sr6e2V/AN7zmCuogcAeb/XIRruKtZDNHtQ1OU5mE1OdQRExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388540; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OixFFna2G+YRS/5nbjdDsLMiP7bnC81KuydyI4sK5BeeyNfSrEHeglROgigP14iCukNJKJT4q2BFkzcjukvdjl+YFUn/OIdRcyQckTFFxWdzdATUebS03zhwyoKmn2/Ra4KJa4k3S2HF+coCzlZ+GXfR3tWaWX/L8ljY4TQuLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkdD2LIZ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c15849aa2cso921821eec.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388538; x=1774993338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=kkdD2LIZ4aEz0CpE5rvhgIx0dSaoQyHak0gSs8XerBvnsASADHDWM9CUoaogcpEi6I
         HqEAVbSmVhItqvo3HhYggrztrOuslhW5p9nIe1fO3QKrwJPVoLbRmp9AFO3KIzTYsSy9
         ExvGzIJpTjAXYUiuCiZiN0nw2mL1+Yaus3LQzaWUwQuPa38NLCVTD7DUWp4CkOGoHOMW
         v25z4je4lJuybWXpJZ6Wrk7R13FUcwj9WLNjIRNMZZzTE6Co7W43yHjq4VzpAVm3hqZn
         rNzZUbF5PO4Sul1BD8+QdVddGqCdi74omxPZe8+ItkFnB174oaYsaUKwAvVd3iOlES6z
         SyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388538; x=1774993338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=An/lINb2sbrjiYG9rpSiM+OLi8eCXkUw7LAmIjxSbp4bdQugm7LzLX2zbi7HAukN8t
         SXs2mx3WrxqFppQnHoQi0KhU05LvN7NLcvyP9YfTV/QrWDI9TgtFQKSE/XfiJqA+WhVH
         hac9CPXq80DnikEaipPqgraasgQrVslwukUW29ai0U26Gfsb2/FesMFpeFxXr5jT180Z
         sU+9ASpySQIpG0ayREmNBnGtFVgGpnXeuFjoE5/1yH+fJAq9mXBdvOSwota0WDoobxu4
         rKn1lHHAfQStym+iJxyTmsSHr/cli0u+MERsU35T11eXNNqWS0AE9gt2MMoLrhyLsbAC
         Lq6g==
X-Gm-Message-State: AOJu0YwBuMko5mdSHfAN8qctysjl4+7B4gcHOvfb7vzOQj0QKuItqk57
	p/K82To6cSf6oHzCCcMnYe9OKRpFRVh7kArvknUefmemk4+zqJMeZMus
X-Gm-Gg: ATEYQzyKcjNtSkZ29llVhEUmGYJupgWOSJS2cnQ4tMq4P1Yxlh1jDVX9ue2br/VRhFR
	Cvn4sDUiQJQkhR6p48wNuP25rp/AIH3esd1bq8HmtY1mQuJBThUZz2o6Yrg7e2e8vdzaFRMIVK4
	yziPYoTNWG9wVwbN0S5j6mPT2JFz5ByEWr6cJRLuVqMKuSSGHwBXw/TT1bzCoBWm/YtOJsQ/xPB
	Sqv9H1CvD/zmVHwte0eujdEx1/RyEyamd/BvuUB5/eXC5c8fAqqpeazj4a+7UB/RddfK3zZXyw2
	hecny75yb3gJjFOjFQgZGdlA5e3CoKNZRAgnhQvCA4EHtfMFRoPGZy8/aMienZnhWRa4HgBJtff
	kdVMmYGr7e/hXh28gtcB/qNLwUmyMpUFz/gW7JCVsZn+4Hr6WZ8Fu1j8suqPPC8KoaB/7o+5HxT
	Q+sTDomqrR5CLwCkfC/wJoBQ==
X-Received: by 2002:a05:7300:fb97:b0:2c0:dc7e:ed0f with SMTP id 5a478bee46e88-2c15d329d54mr514614eec.3.1774388537637;
        Tue, 24 Mar 2026 14:42:17 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:17 -0700 (PDT)
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
Subject: [PATCH v2 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Tue, 24 Mar 2026 14:41:29 -0700
Message-ID: <20260324214129.17300-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56923-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2805C31CF57
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



Return-Path: <linux-media+bounces-59578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L60EdlN7GnIXAAAu9opvQ
	(envelope-from <linux-media+bounces-59578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:15:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5955464FE0
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C3C83025C7B
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 05:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC5529CB24;
	Sat, 25 Apr 2026 05:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVV1R5+G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141B12472A2
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094065; cv=none; b=joHQZIoIy6wWpiEHjyMWqkzQZzFATEgEUI7u2gJ9k+B2p8XTbInVsrdoXEAAzsC6+lZNWizv8mZILVeqN0EMgG/cRr7Gb5+4++0v4SMnpF7FVvhPEkHaKmfVRIBbEIkxFnAfmgKzC8lDLakLr4yF9RPjsyRfnUZ3fNn3eL12Ack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094065; c=relaxed/simple;
	bh=JeFAGlclU046JIgSg4OVyBoSGPhLkEXsWzJ0ES221g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dmg2bePdJdxxd4otTJbYv4T9A+YkSraYhI3zffe0fQ0vowrOFjbg0p74hkLvLd4rRSh+dtRjiDStlc0i0xZrevYScmSJyS+FFKPSTeIDHfonrTPVPbcQJmj+yq7pcEmOd8ZyP1Nz/I0XTmU08w+5oPfj8WBbE4t+EwJz7zbbA1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVV1R5+G; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2de831d2b20so2379582eec.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094061; x=1777698861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=SVV1R5+Gzq15bpmV1aPLDHLsU4agB3GI7Q+b4K2Oiyi29MenjdLQt4dQ338YBy06WY
         eOINBK1UXsfwpKDHI+cIG/st4azyzyubBql9kQKzfIQ7EMjFuGnNi/udoH9FDagLBlXw
         zRDdim+fOExHtBcMoFCIFSh5k+0h8D1h/lMuDYKmdKdn0BNBBMpjGZznvhuP9UlGvTBM
         pRz33W0MiRkjfhodHinzsffA5hm9LC7fGugjpjAwssIDvXJR+WKtg889ISrNHYLeXowK
         xNPI0vjGAwptRE09samJN8B+k+e5wL8O5zP1z5jo+AqOkl/B3G43zDiVxIh75uXN3PGh
         Bc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094061; x=1777698861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=IduQeC2vE7odBth6o9huIKom0PLPzUEzUzcONyf6JMQ+IXmE6SW5ieIiToXz0xpiTo
         HNJxAxUkVH2fhi8A3yZo3+xY0BgO7EFEoZbkTXoaE+fVl8nBgmUPAWyWv4QolnsREpZA
         DLbMgclrkoEiRbMslYRvyThxIjbVd12uYO7usYPFT0fE6r0kPJk1eyLSI9A9SSrlFhEo
         IrqFiTtLeR4//3XpQ+okVvq2ZKQi7WmsRptv3jjy2xh927lILk5JYf6kpQ+Q4B/2jyWO
         jmxMF60Ri098vbQqslCV+DdOVp273Ad+ptn3gBGTNaEpKgwW66YB0qupWpTiBkSvqOGA
         yZsg==
X-Forwarded-Encrypted: i=1; AFNElJ+vvM5npavltpHhVpsBTyY3jJsmuRDRdK2A8YX7GMJfos4NxBri4DWlP9karcbYG1Bi1dtlSlsxNE1XMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQYaY1w67ffzbCxkkdhftytan3151n2KVqza3fXwLMcGBIRq/
	HFrt8b777ncKEsQEw/Wz4S5FVt7JVoZ1a51Lmf+4bn37poTNlQ2OCZWe
X-Gm-Gg: AeBDievX29UO2rvo3NN5kV56KvwEyodTSzvFxn+5izEA8SXaJmZSD6Yeir+S9MXyLjP
	H7irN3CTVA+gqf5eJE7tYtrgyDd8iDCVhIWgVecgiY5tPr4C/LKxfb8oZmQzWhmxshdMWD6VFTq
	Yukeh3JMc9y5dIFvk3aBKDl/YMpMYOFVqi2+xDVZAqVFeaNVZsQB8xBxz1fm7xqAExAVcPYksbC
	5iC9ARzbuFPWaUZYHMiEu64CUpnbDYMnOCFBkNO7rUTssGrBEtLsNb76LN8YNdamY3mwc9w6Ro2
	BhYfv8GmwgC22mHu5YPjqjA4waxU51mxLK6F17pYRS/OnqsHwuX/PSrO55ZJx0ZuAwgpxOe0dSF
	+C0ix7w/vp5IKYhS09j2X5cjgItl9aNpgveD/p0F/pnN9ItD97ubuunkb/Onw3miJHidBApL3a9
	FwSWQ9CRgKSzbm+xKr6Z+fMZNZpfLYvT1/lKVrqTZHyyjl
X-Received: by 2002:a05:7301:4586:b0:2c8:7172:3b7b with SMTP id 5a478bee46e88-2e478646190mr21819283eec.18.1777094061175;
        Fri, 24 Apr 2026 22:14:21 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:20 -0700 (PDT)
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
Subject: [PATCH v5 5/5] media: ov8858: add ACPI device ID INT3477
Date: Fri, 24 Apr 2026 22:13:42 -0700
Message-ID: <20260425051342.8960-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B5955464FE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-59578-lists,linux-media=lfdr.de];
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



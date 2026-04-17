Return-Path: <linux-media+bounces-59040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP7BMOVh4mnI5QAAu9opvQ
	(envelope-from <linux-media+bounces-59040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:37:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3F41D34E
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89E2C3134B0F
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999463A168D;
	Fri, 17 Apr 2026 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI4ZnqQv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19AE3932F5
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443593; cv=none; b=ekotiuCGWqn9viWfKaimxWG+rBN4xBslRGtGcSxosUO51I8NSZvrkR7tPzjIoI4xD9+4TzXrlqOkNlQQC1oF0a4VNtOrvFekPkWdbFlzIsNxvEjwegPTlOouZw1ZmOJWaiXa/u9Lj+HG12+f8GVeVg/VXJuXTAG18zlZgWZneb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443593; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRmawqt3zvoLOf2jzD7PP/txEprcJRPtj72WnAB0Rl8ULE/i9hEJF3M1HmACbhofQbA7CBYznryi88iDKimSmWm9p73p0lS0YM1KCCIm+Kew/sK7tUS2Ux7UaE2vI3w0jmD0UKdlZrrMPQ0EJXKOoDxAboHJVbqyqGap0btpXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI4ZnqQv; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c726f46baso1213063c88.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443591; x=1777048391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=OI4ZnqQvk4HqR2AESBItxpSrJ/YpEMInHIvh3+chhzF8KH5mrlg0y8Ry1XhxHOQh0v
         htFB7gIy7nZJ3B8v4hcLlqMv5wfw+GWtg/x2pL2Wx4YlSDpRCR0zRZ9xc5G0RdrF0aLu
         RYctWM0n4P2H42vevycnOVnCQqVujaVWstwBkoqpupE3QSZucOIxbqMhkwTA4pn/+wRK
         TC9RyaGPTsfzhHgc5pcwALibvgKDmPUMY/hjyNJ3XVdv6OmzD/BvtuO6f6wXqWbJx7Mn
         kSOQepstaEbE6t1biJXjFD1XKSZ33w76wc+bzQpmd+lgFIjrFLrZgWyUWyBKtVyauA17
         s79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443591; x=1777048391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=I8YPOWH6N2srv2VUJ2ZWAkLUZV7UPRbJt8fr0+4wjbMxRGaJ0f9+zIB9ZCSvQob54W
         OZCd4EwC1nLeicIYXxhKWphWU8ZR/03QPgjBVEgXMcHCQAt0yu6AxRPn8NADK7806E58
         yImlJegdhvn/kXDMNf1y6kepuArYvhfzhjL/ZtUj0X95Z0X64YYN2hM/dqAbQSCeYP3f
         9QSi/YX+WZGyhItvNQGIL4SQ2NTlSoAtsmvHk0CvAQqSnYf052OxWC/d34cBTMjJh5WW
         Qud8JCEt1fYdfI/ARpl73qp805/5quZ6lye7aiu5Xqxdv95EaUnFoZ6dtvSIYYjJj3jP
         cibQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TkJL3kUBmg9nzpAFTLkncLv/RaXf5Fq5VrRkArFPUWulI9qpXT1HkhixfUzF19Nn0Xi78mrZWPxscrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29DgX1vmSPBwFGOZhxorl4uA/clhBxtOifY/orb9q7qkfJxiq
	MwLOdNfB2UToZxCr+hFE4d4JKIDI3IvkMmGFammxno1vaLE43qUuFogB
X-Gm-Gg: AeBDiesEvInqWi1QvFWV7SpghNRmdpCsI1ltwhDmwWSmqovKLUUesrncPB/ynEn+v/x
	KdOvjBsj2a10VtJPZ+sDIbMvM6lOI5x0r1jJxZAIrg7QEDkINNM9GeOBxDvc66u3rYZpFdgj8Oq
	dtC9TXl04eFixqcdyQRfX5+6tX5A3NWIUVoDcF8KhAaI+w7yPCS+36KagmVLX39nFkpP5lO88bL
	5apoNlvm8LxuscjJj0QyK7df9sfmwgCeGzgH4w6a5qJNdo2DfPYsG03ZazodZPvGVrvQfkB1VjX
	ILd1JWhhouG6ThZ6McIchna5TPZLX9mzpznw6CJS70g/5L6muOR9BujMxauJ+nKdGPKCtHKHovq
	Zq0aiimNBEz1SVVd0E0aWILl2g3bVjgXEKzEoVUQMvH7TWUFcZ58MLTsRO07Smp7/0LeqnGGsBe
	Mm4WPCJrBciXlXktyy8H2mUSfQcfu4lIwU6NeEPdcgcCoMoSLDdqzlERwAtIt/s5gJ7T9YSA==
X-Received: by 2002:a05:7022:3d87:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12c73f6cd01mr1749321c88.12.1776443590684;
        Fri, 17 Apr 2026 09:33:10 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:10 -0700 (PDT)
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
Subject: [PATCH v3 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Fri, 17 Apr 2026 09:32:52 -0700
Message-ID: <20260417163252.15603-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59040-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BD3F41D34E
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



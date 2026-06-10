Return-Path: <linux-media+bounces-64472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iXKANoyGKWrLYgMAu9opvQ
	(envelope-from <linux-media+bounces-64472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:45:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6366AF8B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=htYXgTL8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64472-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64472-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF3FD322F61F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59C03DBD7A;
	Wed, 10 Jun 2026 15:27:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906133314C2
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 15:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105243; cv=none; b=awJqt77dNSvMy2YA2QRIC3erXG54y176J10KJux2Ho9ufIFwXtKOVXrrLT4T+JxkHZHONaUI/XG8LfAOHZjyj/CsG2zY0TrSfdxkVFQInVFB0dmff0m+HBkPnFJfcc8m2WX2ZYzUi2p2/cnnvTM2AEyL4CHIwuscvzglTfOf6IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105243; c=relaxed/simple;
	bh=OFccZfPUQHXNUOjkeSD/Z6p2nhWkchss2bmm6f1G3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IBwE3MMJaA4DorUzlJl8aFRxKQ29KqllBPObJU4OygC2JGxem0u4fhLyB0JudOCYmMh132Yv9u1wrIFvJJFHBzBYejcjB0FG7NQznQOym34ZDlovh2QGPtVeQvhNJpRquuVtWUxYgWNP02WiEtmLLC7y9jCqJzeM5KhuHK5G5cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=htYXgTL8; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef372c58aso3668514f8f.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781105239; x=1781710039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+6aKAE19uKJX9zDvhqKEDgn0Z+XWI4K9KabeYN5rEk=;
        b=htYXgTL8fQyW4q1LV2wvVdIeDOn19GjMbzwfbgw/VWDXx2UtEs/OI1yTw3XYgK0yTP
         CPWjPe2PrSUMDuam1o6POFxHMAynZqFc3hPaoRBrBE/5zYV2TbVvNyxnvCAD34rxPaiI
         KDuK6UKtKdsZwcz5BAfoDNqcHokkA/4a921spDb+ytpsNsmW5HEggej0MlAGp0AdFhu3
         EiPaBZiJQlA/Y5IxPn1DpEbSMOlYMHNw24GxhVbX2sHJbzV0MxoTCFdkYlumvBuV73GF
         H4nPRe79x9MyvPtRzGrMPxZJ2TQWst+VVDqoBraiZxeFw8QbR7PkrDj7C9hHc+ymbf5v
         z7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781105239; x=1781710039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+6aKAE19uKJX9zDvhqKEDgn0Z+XWI4K9KabeYN5rEk=;
        b=Sx4RgWOtg0t2wf4KMndvqKU+jc+JUkyp4eR7x6/QRXKGKsxC6udTyDI5zEsIaP1Kbr
         76y3alZEiY8VIMoCh1Sh0WwhoqMXz8jA6u2IqNJwku4CxbkaqFZrMAXgDxsSWITGlJ1P
         zeT+rnEjJZh/AX4hZOcFZHZ42XOPCnK18ZLkgMfXZe5RCtpNCY2XFU9jf/mZ/+vjzaRV
         BTVoqdtfPGrAa8dQVFF/k1hu9C/bmhbfKQY9QE/6B8RIcXZBYcJhpqCR1WfFymM5hqW3
         I1mb5CcViioK61W2m5e2ohzCok5muaEPj9uhw7CzIcZJefd7U5bQIicEeO9fwsfDS4Ll
         NLtA==
X-Gm-Message-State: AOJu0YyCbNfvd65l9u+V/G2X7QYZyY+k52mW9MEa3/i02mWq2RwTV3i7
	fmeUQu832vDd/2kLVP7zu9apwi4eBSdyifuSy3Z0pEKDBf5rEgP7rFAXm9GumQaz/tEOVKnZel1
	qYUyY
X-Gm-Gg: Acq92OHS3rCl6hfw1IILbrUHhNOWuaRdLULz3lLm2cwxGMjnXUQox+bpG0bW3qLuXhI
	5nHZPt8JTDvjVQqTa360VmEogbYhvH87wwdtl1fHGCQUe1wm+w7+8uaBV5n3JeJw+dqyVS3fxfn
	z/Vf2/+JCh0fpP6yh9xPyeTqiDzfLo41a9T8D1c1eZxHAE8wUXcjcPcHPnYf3eP6oNLR5gDvBiO
	MPfm0GSAUiNmv6hjkO54zeH8plvcSbBnxtzozeQ0Y9LBeh0hsrO92lCFmAFN+tVI1Y7b96z134T
	4oZD/QfhrfpndGDKzkSVcFqie8wr/fuNL6yJrG0SfBzoUMURjx7IsoqKvmgdnWlIpizkZEBzl+v
	zJ9C6m8FUDVH2Y2JBm0g/Vuk0A6AykYa2ZOVzdT8iaX7jz6LxOVl/Tact69vqLvBmM7IKamULYH
	5+P/R8YIsfO22qAR7HIEEywmlJ6UasOBixy+oDE2VSI7n1sreXMrh9u4/NVMz8rQwx1RPtJSnj6
	WzI0UxjgiJIj0kZf4tVLE3gPA==
X-Received: by 2002:adf:f290:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-46030505eddmr29762104f8f.15.1781105238679;
        Wed, 10 Jun 2026 08:27:18 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2f67c6sm69973507f8f.16.2026.06.10.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:27:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: ite-cir: Use an enum for the different supported device types
Date: Wed, 10 Jun 2026 17:27:09 +0200
Message-ID:  <97d9330414f4bd4ee11dd9ac74010433bb43f412.1781104417.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4616; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OFccZfPUQHXNUOjkeSD/Z6p2nhWkchss2bmm6f1G3q0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKYJOH9vL56mow16WZifQP2gwTHgVRy3Cv/myF B+Q7X2CijCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaimCTgAKCRCPgPtYfRL+ TussB/0bLEDu34h2e98x7hRuBldn6QgM/FU5upFnZS/RUH/1iYkq0DaVybGtt5Mz0p3zwKdjqwf iqLcU1PjaFbiYU4m5A3Py+4BIgfbfzOGKWZuDov5Xyh5MY+cgWTqhJHXHBIvaI7tTAYIZYtunZ8 WXgqVxLeghBwNdI7+orxLB/EQBohQ4yBP0g9nCcrHp0ohXOxjL4PHFfGKLEo+zH01EoGtNnY4v3 z+uW13zBPC/ZFJ5TfnZZiKdn209DYjcX4s3kYeCV2NcXsnhBNFBiMsjN4PBlNmcOBXQEoJxuVsR IFd4LRYRRQ9t6bDawv+tl5suQtwgpckadv8ZhWeiEwOlyCUZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64472-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50A6366AF8B

Instead of using magic constants define an enum that that makes it
easier to keep .driver_data and the array of different types in sync.

While touching the pnp_device_id array simplify the list terminator and
use named initializers which better show which struct members are
actually assigned to.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

IMHO a nicer way for supporting the different device types would be to
use individual `struct ite_dev_params`s per type and put a pointer in
.driver_data. That doesn't work here however because the driver supports
a module parameter `model_number` to force a certain device type and
that is an index into that big array.

If you ask me that is a broken concept and if there is a need to
override the autodetection using a kernel parameter it would be better
to teach the driver to handle these situations accordingly. And I doubt
there is such a need.

Having said that, my objective here is to not assign .driver_data using
a list initializer, because I intend to change struct pnp_device_id in a
way that requires a named initializer. See
https://lore.kernel.org/all/cover.1779878004.git.u.kleine-koenig@baylibre.com/
for a more verbose description on this change to struct pnp_device_id
(though this is about platform_device_id, but the idea here is the
same).

Best regards
Uwe

 drivers/media/rc/ite-cir.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index bde2a7051231..1fbafcd8219e 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1203,9 +1203,16 @@ static void ite_close(struct rc_dev *rcdev)
 	spin_unlock_irqrestore(&dev->lock, flags);
 }
 
+enum ite_model_type {
+	ITE8704,
+	ITE8713,
+	ITE8708,
+	ITE8709,
+};
+
 /* supported models and their parameters */
 static const struct ite_dev_params ite_dev_descs[] = {
-	{	/* 0: ITE8704 */
+	[ITE8704] = {
 	       .model = "ITE8704 CIR transceiver",
 	       .io_region_size = IT87_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
@@ -1224,7 +1231,7 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .init_hardware = it87_init_hardware,
 	       .set_carrier_params = it87_set_carrier_params,
 	       },
-	{	/* 1: ITE8713 */
+	[ITE8713] = {
 	       .model = "ITE8713 CIR transceiver",
 	       .io_region_size = IT87_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
@@ -1243,7 +1250,7 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .init_hardware = it87_init_hardware,
 	       .set_carrier_params = it87_set_carrier_params,
 	       },
-	{	/* 2: ITE8708 */
+	[ITE8708] = {
 	       .model = "ITE8708 CIR transceiver",
 	       .io_region_size = IT8708_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
@@ -1263,7 +1270,7 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .init_hardware = it8708_init_hardware,
 	       .set_carrier_params = it8708_set_carrier_params,
 	       },
-	{	/* 3: ITE8709 */
+	[ITE8709] = {
 	       .model = "ITE8709 CIR transceiver",
 	       .io_region_size = IT8709_IOREG_LENGTH,
 	       .io_rsrc_no = 2,
@@ -1286,11 +1293,11 @@ static const struct ite_dev_params ite_dev_descs[] = {
 };
 
 static const struct pnp_device_id ite_ids[] = {
-	{"ITE8704", 0},		/* Default model */
-	{"ITE8713", 1},		/* CIR found in EEEBox 1501U */
-	{"ITE8708", 2},		/* Bridged IT8512 */
-	{"ITE8709", 3},		/* SRAM-Bridged IT8512 */
-	{"", 0},
+	{ .id = "ITE8704", .driver_data = ITE8704 },		/* Default model */
+	{ .id = "ITE8713", .driver_data = ITE8713 },		/* CIR found in EEEBox 1501U */
+	{ .id = "ITE8708", .driver_data = ITE8708 },		/* Bridged IT8512 */
+	{ .id = "ITE8709", .driver_data = ITE8709 },		/* SRAM-Bridged IT8512 */
+	{ }
 };
 
 /* allocate memory, probe hardware, and initialize everything */
@@ -1301,7 +1308,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	struct ite_dev *itdev = NULL;
 	struct rc_dev *rdev = NULL;
 	int ret = -ENOMEM;
-	int model_no;
+	enum ite_model_type model_no;
 	int io_rsrc_no;
 
 	itdev = kzalloc_obj(struct ite_dev);
@@ -1317,7 +1324,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	ret = -ENODEV;
 
 	/* get the model number */
-	model_no = (int)dev_id->driver_data;
+	model_no = dev_id->driver_data;
 	dev_dbg(&pdev->dev, "Auto-detected model: %s\n",
 		ite_dev_descs[model_no].model);
 

base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
-- 
2.47.3



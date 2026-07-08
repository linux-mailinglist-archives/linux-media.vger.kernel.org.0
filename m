Return-Path: <linux-media+bounces-66984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMitN4VHTmpJKAIAu9opvQ
	(envelope-from <linux-media+bounces-66984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:50:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6972671A
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:50:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cnUyCqTr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66984-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66984-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1FBA3015C05
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A5343F4B4;
	Wed,  8 Jul 2026 12:50:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC243B6F8
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515006; cv=none; b=GcP0+2kEipVW/pN4yrImBoumkgQhiZlGh3OxkxWAL0dsohZr5i5odV4MqfRa9UjE8MEtvcZIE6kx6MUD0x7jCHiJ6r2L06KimUDtrp7TboagtgSY2qkHz5U1YFnwVhfRcq+HxRKUwc52lT9iG2SjPRN8zzVCPIrYmbmyFnRPRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515006; c=relaxed/simple;
	bh=gYP2gVXi5ZUEulX7uYB7GTkBP4Xzzwh1puplUHwDku4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnIweZUCyxgenDinHkfZyUamp5+feVDHRXhsdbCXfy/WejCDCSHCzXdMjHML26sBAcl2INeJwhefSHuLJFddmjmMimxwa1rLU47MtJNILs12oQAXWVeuFzoELDDuxbG+E5WkFygd8Q1xmK24AuH/DHlryu5/viT08sAAPcekU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnUyCqTr; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c999f162c9aso334612a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515003; x=1784119803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jFTHEMXsSjbW0vaN80pGUetQnDXoXvFUFoDqJJQbzU=;
        b=cnUyCqTriXBPCBjMpNvTIcusA4fXwRWgQx+VbnoKafsjOlWhhOY2d4sFQ6FWVgwEQI
         bp8RjSzBusJ1jHdg8Xp21lVX9U+YdSEV8TDM0pdxKXYIqwM3GHnB8E0olfo56jVl3LJ2
         Hcho/+9wLjB1e89QJjGWq9lDZ/2lRX7sl+ePRAWlnK0w4boPyGBhuDSj25otfLJ1b5Ja
         L+CZYNl5ifeB91CmJPCqzgDFk1kQMiQ+civOCXOF7sLiSW1HmkOVxtWVX/kMjuMwF/DI
         xHIBOPnLXzQ/EbWL5kOJ6iN/wF3ByoXGF252viMFojQRl68SqWQ/cXjB0SBGstIRysQL
         m5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515003; x=1784119803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jFTHEMXsSjbW0vaN80pGUetQnDXoXvFUFoDqJJQbzU=;
        b=h4EAXLybsXX6MBZikLtDcSlOLNZSbyhc4+vkg8A/YCyNGIRfRHBlb2l6ANUnXJB6+E
         5z+CoHi36+gJpjYxIBBeQYO0VeZc18hRUwZ0KMWiHp5MMFZleVu5duGHKutu4TmOF2Cw
         VSnJ57BL/9hXM4pFB0kteAnQJoV0psRLOpqUtmekqoRUpArlOLSCe+CXpf+TYcIpyUl1
         KLAvAxvN4koTZxP4zIv6aA9MlFWW9nSOY+oP3mv0c1qmi3kM1HlYZSWyJkC6ey4tL4qg
         jmekigllDaTDsx1CcnKpHbxfls8+yp4RL0PWqd+3LRK+tbeMaJyg2oZqrubew++uj6YN
         DJWg==
X-Forwarded-Encrypted: i=1; AHgh+RrdX5BhYwjviHLJ+nNt9KZlrTFAnpmIdAt6Ix5gHK44vtUjvBZPzby1P8vPrR1gBmJHa3FVcgWauwJQ8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1Oh2qZ0XhYu9Kd+5dcor0sNqGo3T+WqdhXlvYZty76P8AYft
	VYom1Y0NCSQBhQlGoKaYQudntb/UYAPeHGbJ+Jualqju3geQK8S3QJGL
X-Gm-Gg: AfdE7cmuvDVnGZ5Cb0MlYWCF0RzFgz/M2xiGt7cC0uQbFgSB4GTnqNlkBWBJBvesbhK
	LlT1UY22j7GhMWKZ1wzv4W/iSs6kg/o2LvoDVc5F819QXomOV5a4SFW2ZEhO4ZLhMIspscAXkgt
	KRY1pny50co266D+QDN+pHbE8EbFBKllL/fQ9YmZmLyUjShIWGCXAwsAe4nENnSta2VN1Op8g1d
	twb0ZfsmJtXAnva/+mQPazXpDvjndeyiUByB3yAyWmykeENiCwqbkB8eBmLyi4Gw99ZTA4u0v98
	hVNe2tug1rZMs+Eu6bZ2sInFQABO+Pe3G4UBTb/qdxqaehmPw+hzXvcb0himqadrhUF9dQZ52MC
	rrqxObOkuh5C9usJfLmNwxR8i1bj2GuFJAEvJOhNbZ7hZeGpwrGEN0eYjBF5rKCXhtL5CQWgDKq
	x5r/f4rel5UiAeNqSV0AcK9xCkitT1oukRhpvVt3VOMjovMuFYXOw7pQ==
X-Received: by 2002:a05:6a20:918d:b0:3bf:bbf3:586f with SMTP id adf61e73a8af0-3c0bca63c68mr2796204637.31.1783515003073;
        Wed, 08 Jul 2026 05:50:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm363082eec.25.2026.07.08.05.49.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 05:50:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: ov5640: use scoped fwnode_handle endpoint cleanup
Date: Wed,  8 Jul 2026 18:19:55 +0530
Message-ID: <20260708124954.26954-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-2-birenpandya@gmail.com>
References: <20260616081517.44685-2-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66984-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:slongerbeam@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73A6972671A

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in ov5640_probe().

This eliminates the need for manual fwnode_handle_put() calls.
Additionally, drop the redundant !endpoint check before
v4l2_fwnode_endpoint_parse(), as the parse function already handles
NULL endpoints safely.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 v3: adopted __free scoped guard (Laurent); explicitly dropped redundant endpoint check (Sakari).
---
 drivers/media/i2c/ov5640.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8deb5f5501faf..29d4dee9690b9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014-2017 Mentor Graphics Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -3844,7 +3845,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 static int ov5640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
 	int ret;
 
@@ -3869,15 +3869,10 @@ static int ov5640_probe(struct i2c_client *client)
 
 	sensor->ae_target = 52;
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
-						  NULL);
-	if (!endpoint) {
-		dev_err(dev, "endpoint node not found\n");
-		return -EINVAL;
-	}
+	struct fwnode_handle *endpoint __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
 
 	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
-	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err(dev, "Could not parse endpoint\n");
 		return ret;
-- 
2.50.1 (Apple Git-155)



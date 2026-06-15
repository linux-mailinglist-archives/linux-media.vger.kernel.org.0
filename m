Return-Path: <linux-media+bounces-64934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i1OPI0p+MGoxTwUAu9opvQ
	(envelope-from <linux-media+bounces-64934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:35:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF268A666
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:35:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Yeqach+M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64934-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64934-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43CA730BBC2C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 22:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47253C65F2;
	Mon, 15 Jun 2026 22:31:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A43C4562
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:31:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562669; cv=none; b=Hok5aopM2BPkDc/5tPewp+0UYNIYT5ga2PbaeOvPNaqILe8xd7A3oLui4lPuPmx7d+eTGuTPwfhThroT+C1/dQO3w9X1Xvfp+iYfYdAc7Pw7RKtwSeiAN9FMYHn/4480In5v9aE96HsgIPooi1b2vzSen0I1w9/etTcIk138TSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562669; c=relaxed/simple;
	bh=fG/DhwJUYK2MFwrgtcaOynoaDnqY5t5HM8w1qMcdcR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDCRH3uWsU0+G/hoPMMvSrwLKI2mbA/FzJIVMahiayzkleILUU1bmX+0KI7ucBteoEF8wQDHo7SL445Sxn8C/7XXWvkJTcDU/k8WTPUjGmuAR5zpvJe6cCJ9Wr2K2lslaiwZMRWpAvFsWjCRH2IoXYBPcuocc6gccTM9V1T5fSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yeqach+M; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c858cc9870aso1850078a12.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781562666; x=1782167466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLMrQUpzK88XueUv2+MZgJ9sRfs9rpPqqUQZ5Nh/QZg=;
        b=Yeqach+Ml36AMIHzuGUD+kw6VqEJ0t6SZ3H+3nOPPmKYyUsg3y4OSOGq6DhCDHq7Vi
         XGut9PjtcxZWTwlGAZpWagCgXw9AsJxliyoC8O3JvkXbbdo9x97pDamH59B43S1Wvc28
         +61ep9NQQE37aBtom9oRUlyvTqZKRTW0LehOnehSgqnyWEEQmo8D18ihAd4eM0Z519tZ
         iQfDxBCw1Vnvc3pG9XhXvTA5gQWME8apVj1DOATo7kQIBmkxiy29piaTJoS2D58ov2GO
         1HIjpbksZF+8usTHKs3FcCSjiId09BCkrRFo6/3NdJGoMLzTa09LVJ6FyunL01LZhLUk
         WdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562666; x=1782167466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLMrQUpzK88XueUv2+MZgJ9sRfs9rpPqqUQZ5Nh/QZg=;
        b=pjfGfX0KhJyGr/qwwXAbCVQ1d8SIKoUswZSHa+LDiwzKS1ywS47x5+qr2coOX6vNO4
         Iw4F28EUU03ZKqAFM/zoHqVIwIwT8uHcd2FwXqiOB/ykc0LZJdegq+/sEDhxfU5sN7mE
         dumIG8BVbx4nXQKkILsYoZ0MS+CjrKIw9wORwP2Cfz55zWmanBd6zexm0s/U82O2HgZW
         lZKz5UFaPr7sZvVytcibN1QOiMr/8bCq3k1/2FWMYuy42xvAKCOzIyhVXo69Lz2WN6FU
         2+2of7vOnkI3CjP2wsITDNCE1FEky59HzeXnQXWNHyVMYzADcAkSQYmxzMk8gFwkhDrd
         tvHA==
X-Gm-Message-State: AOJu0YxiPvcTcLgib9SmM+W6qzS11XtZAgwsU2TaG/7IPMa2YYx64sLc
	q93n/kvXC+wSREh5qYdvQZ1WotJZTmBAmHo8nzxPNvfIBK1UmiWTsfdcx0BT34cR
X-Gm-Gg: Acq92OFV1TpjLxSpVD2uHWIXIo1jktvMktJvIYDbeOmieBDUYJz3oRcN7zRg1E6ApdL
	s+lX6h2PN0e2Tt4AbxREmWMqpj1AWSBC6ErkJoElKnKNT87tHuBhX8vNHvu7Zy+4C+6ZODrABRQ
	hGxRiJS2syQAICVfr5BfOI0CMa4FJNaTqKStu9/k/P2bZe/TxoJhIW/WUTE3yusi7SBZFSmUGWp
	5tgAf8sryd7iOdwGaO9m/ljLbC3naeO9QKxrzArIol6VgkMiBwTq7mPT+w75qOs0bM652ne44Ul
	l7/Yg/JR8rfm/oiC5jAeOUisHHc+/piyOjRom6wt3eEqpFWjn7LdSY1M54aysfVwxuPksQ8p4Zf
	3GIpM8iGCU7JiavIkZHMvM08nid/c6Ws6j2OGZUrEHSqzJu5/q9CyT6Gz2lTqFdzMR6fOj7A8WE
	1FxflAelLp+EFuqScXsxcXiBOB1gu7YmGJpBWeW21QdBuGXxhOAGLf
X-Received: by 2002:a05:6a21:7103:b0:3a2:c9a1:2c22 with SMTP id adf61e73a8af0-3b7e225ae47mr1101624637.6.1781562666482;
        Mon, 15 Jun 2026 15:31:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm9638592a12.26.2026.06.15.15.31.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 15:31:05 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 1/3] media: i2c: ov5640: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 04:00:53 +0530
Message-ID: <20260615223055.39953-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615223055.39953-1-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64934-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mani@kernel.org,m:slongerbeam@gmail.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37BF268A666

Utilize the __free(fwnode_handle) scoped guard macro from <linux/cleanup.h> to automate the lifecycle management of the endpoint fwnode in ov5640_probe().

This eliminates the need for the manual fwnode_handle_put() call, preventing potential memory leaks in error paths and simplifying the probe routine.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov5640.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ce6b0724afa1..7795f2de0f75 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014-2017 Mentor Graphics Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -3845,7 +3846,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 static int ov5640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
 	int ret;
 
@@ -3870,15 +3870,14 @@ static int ov5640_probe(struct i2c_client *client)
 
 	sensor->ae_target = 52;
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
-						  NULL);
+	struct fwnode_handle *endpoint __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
 	if (!endpoint) {
 		dev_err(dev, "endpoint node not found\n");
 		return -EINVAL;
 	}
 
 	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
-	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err(dev, "Could not parse endpoint\n");
 		return ret;
-- 
2.50.1 (Apple Git-155)



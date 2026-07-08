Return-Path: <linux-media+bounces-66994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rb59IfVUTmpkKwIAu9opvQ
	(envelope-from <linux-media+bounces-66994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:47:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985A726F0F
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:47:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OfZwUofW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66994-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66994-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 607D6301139A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B3C37F755;
	Wed,  8 Jul 2026 13:44:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12F3033DE
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518276; cv=none; b=vFwxxYMz1VF4d7MHih0qoQfYh6sSazFvmv08QBAHrGqGyoHSoxOgOv2hliCFs/AgmDdu3U0Q2+ri+xnz6RzeIbz71z1+AhH3A1vo452phQaDoeoIvcer2tQzFZeSKuMoInRxtbkR6eCOnPbS+sBW9lwQ+aCnylMr4C2tCjW9ihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518276; c=relaxed/simple;
	bh=DpbBUQ3d+5Z3ayXRoezgA1yYLlm5MargDSMu4c0ALEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw1el2SpDMzR5GoazU9fDsF4SJw7niHNqJGWTwO3jYNXcJf6KunM+a9RInNpAXAIxT5+FJGvseRVXG2r0IWFHT6dj1KvlMHyX4Dt0mvlEw/Tj/DAq87SxLuvmNobI/AIVe2U0cNYM9H6wePE60LIGRvoaeScJlIN9M4u3bUnAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfZwUofW; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845c92bc464so444691b3a.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518274; x=1784123074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8NDQ3ibtUBCY1oSPQW4VmPsd8IcTMAGY4iTTxnMP1M=;
        b=OfZwUofWoZnGbHwe00ejXWJ/lUQP5EOwgwN3ESngYTdqWFLoEVYrOKntJmLQhCKTWG
         qP5Mi8y5ptblCIvyCzlCkZWmG2dR+BfMXx6Wd7J7LkxR/45nIQ19ZrefPTCLSl4OkKQz
         TDd95Z8hrwpac3GmD36Z4ur+wAY0R7pt4SbM+SSsiWevaCqe7HgMiQEW6FsnuZPMeda4
         C7M+2pCC4v/2Tk0qA6d+6gq9TjFD7wkV16U3EXqAuqEkaqCoSSz5o5CbrrI8oRikJGBm
         6/b4Mtx8EzjKAaIODJUjZt5EizylzvwE0vwdeUyUBF+Uuc1ql5TI8ArCPL//bKjBETok
         fWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518274; x=1784123074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8NDQ3ibtUBCY1oSPQW4VmPsd8IcTMAGY4iTTxnMP1M=;
        b=YB4Z93kFWORd9VV64890CW6oaq7y+fcqCYUlejGBd/XChU9rMRJI0p+sufFcwzBKWv
         qP+g/4q6R8Y0kl40k6wkP2scFOCoG663IecITa+pw4uFDSiBpjYd1Yi4C3jpLfjL6dPg
         FQrfaeR4ErHPfxZtiRHLMHzhrL6ifp0pqvPT3JivVDg8InxkwDaTQADL/VM1I22EFtKQ
         3K4ZhOTENvpwq9jI5velBRH1w7gFNyT71gVKsnypfNMhSn3zVA4pV2ALFROhgasYLN+n
         WAq4tGJSgYP1pKSpw3fATFOw61l+WowAWI5oVClmeL0k8EySBmQMygc/493Iygbq6QWx
         kAww==
X-Forwarded-Encrypted: i=1; AHgh+Rq5zVmed/akVhXuqlhzsPH8byCHbITTu1KSBDH7TbdXvBxk6AJt90BQrMtHrCM8O5jaJlZf5ODhZSxULQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW5ZsvEsti8JiQeKMwjMV2P/kkM+Ew/rKeGsjwPpdXdOZ5R0mw
	UlV/2wIZBkCVoJrJcZp5O9Yf+MiUUgjOF3AZqA//Jm6bWs/+qixcLLMo
X-Gm-Gg: AfdE7ck/WvTtiIsPFPb2x4Ikm3yMyEJVD55+XHTRMDRyXuzrhMgC3+MlRBThluiO66Q
	d99SCeClSfE97k/ggqKkeMRGdSFiHgMg2v7MPJkt1JAZ2OZlIej9zz9kA0bNJL70YRVgpoRq36B
	1y0QLZocb+VqFYw0aqte7vwVvwm1Yw4N5nPkAtXXQnjg0WtSKlvCeEEMDqBDpvSxI0Qgn6baRQD
	0Fi9/B+aKyy5VOY1vWmaRF9Pf5Qzwv3OK1x0pv6PmY/xnxwwIPXOX1dPlN3XXJeH/ZJ1HDlaosN
	NvijaqFspGOmaE5jF09MS0Yc3UdYQfgc4o8JawOItAHPsgJhrPJa6Gq6C0zlVfG40BKqx2MuFBl
	wHlrrpfNOnJ6Stf2yAC+z2HJTxDmNJWh8Cr2hCWkbRp4nwoPjwQ0PMEOBduKIbUUjGhPPGgkBYh
	wGCwd6oupOJk1Xln5u/iGtfOhmYtHOrRyOuAGs5YLnHwk=
X-Received: by 2002:a05:6300:2201:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c0bc9aab26mr3306766637.31.1783518274466;
        Wed, 08 Jul 2026 06:44:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm23648662eec.1.2026.07.08.06.44.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:44:33 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 1/3] media: i2c: ov5640: use scoped fwnode_handle endpoint cleanup
Date: Wed,  8 Jul 2026 19:14:04 +0530
Message-ID: <20260708134403.45935-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708134403.45935-5-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
 <20260708134403.45935-5-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66994-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9985A726F0F

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in ov5640_probe().
This eliminates the need for manual fwnode_handle_put() calls.
Additionally, drop the redundant !endpoint check before
v4l2_fwnode_endpoint_parse(), as the parse function already handles
NULL endpoints safely.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Resend as a complete series to fix broken threading.
- Moved changelogs here.

Changes in v2:
- Used scoped __free(fwnode_handle) macro (Laurent).
- Dropped redundant !endpoint check in ov5640 (Sakari).
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



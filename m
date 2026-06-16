Return-Path: <linux-media+bounces-64966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E5pVHysGMWoIagUAu9opvQ
	(envelope-from <linux-media+bounces-64966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3A68D136
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mGV13IbJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64966-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64966-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E213304138F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4447639B943;
	Tue, 16 Jun 2026 08:15:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC03321A7
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:15:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597728; cv=none; b=IH1XfX3IVouAPTQQneNL65uAC6iANYB7mXyDyVzIdRQWHyc1q7OqcOIqm1wFWQ6qtNQipBeWXzMdo/UJNJ1zz6AZaZGoR+BhiWZZ8ZAv3mtDW4OQ+ktterw29pOszgDv4b+w1awd4sg6frBSNslAXOKnRaBPqs9iJkAVYxkkUDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597728; c=relaxed/simple;
	bh=ZCOWQbjEzd1Fuk6vHP03tw9gLZxoR2qeyCd10wEgOtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+RRH1EAuXXtFJ5zP7MjiQDvHBBDkTWpA0ELQ5jcWRFGQxLz7l58/y9luGQJS0TevV+ZSLfSrjlXFcDYghgUo7i3O1DFeAX0XI2kyQfjYCajyjcDI3EacDkY7sEQ1qmURSB9Ngqe212d9ePmcA6aRCEUGZORT2/shdKBYmM+mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGV13IbJ; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so26710165ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781597727; x=1782202527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZspsZWPI4hT+AQRPg9C/VtUskoUNvJfC92Rr1EdINQw=;
        b=mGV13IbJ5fkHftkceMW3WflxPAOsk4Q9uwdHiSpQyR9jfpI4pgxeNjvQywp5Ty7+ml
         TBowaymUkIHSmJM4ttk3oscGUD0hVQyIhmRRLv+ASDvpu+/TKNLwbc1gIfq3qURftEV0
         xIwY3/Y/mKLO5zdzKIqkCISTVC3cg2rpqVNSrjzEnrZxubRwRKKy3azVz+deWqlHctQo
         DokW5oStC1m+vEuQZG3EazerC1yi5vd69F1rscA5jt+1jqhVIMRga6A2SnPBTn5PrZPC
         9gdZoN4ZswRZhWrfU7OYvspJYVRaNodqbW4ikCi21RvUW9qYDuvtg08rRU24FYWD2Z4l
         UZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597727; x=1782202527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZspsZWPI4hT+AQRPg9C/VtUskoUNvJfC92Rr1EdINQw=;
        b=c5MN7qlSIjI5BLSisWFCRuC8yW0WoUReGzkJRTwRrUGGUB5nI8wwjjBRrlE+PB7TIm
         1+HEMDLDjLFb2kqhg9kDgDy7SLReRbHZ2/CEtlWjlTIEEY45XH42kfyLSMgQCTTUlZK3
         RPHdMIDAxoPF5im2IOYtS1YnwEwgBW3wbWoPMwl4SRamKsG6nWyY+MSeOhrWXHimq/Vq
         M593QIjp/8wvBhZEv+xmT0EFjXlYXcEqAnUjHCridXE6mDqwEwgj3MnF7adK8qFjs06y
         az2jJf/a2mRp9Xfeh6GQSLXVAMaZMNwhPXccOAbJiXY3t5X0zcdftMh9wrSW/XFmPMX3
         wJHw==
X-Forwarded-Encrypted: i=1; AFNElJ8xwYryPwMTjdWH/NJ/slN64RPMvj0KLstL/D8t70fXI9iL+YLBdCYaAJVR47xEo4Ml1quYrih49Ig1vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMQC4TvlmgQETi2/1A/vdcjT6nE5krc3d/+cn0ujVvwDi7lww
	FBlqin+7hgFoe/JlPc2TZnpP9x9zInfv8xa/PmPqEbnwIF3CIvBmVDBW
X-Gm-Gg: Acq92OG1LF7kUN7t0Qc1ziTaVb7cJ+0Cm6mDz+l4q84fiW32w2F4AwfEhrEi+RI8X3e
	89xW6ShVnsL0YTsLiAy5LOVbgmNntySDjeH3Yhax13ggjjdWE/+2GsM5KLFIMQzOpk7XWeDU/E1
	KxPNoaBQXSYMxbRqcyJhZ4ybjS/6FzDIlzs+isPapiZkKGJpmnSVuYa9aiLuyiaohX0iUfTfFQ2
	VlYyqwMsLfhQPdEPZnkqSpEb2KX74GlMIgk3YLGr27axhWNYlKEcMEIV2QepqEMpXfA3FQnb2AN
	bTJT/DuKCFrgvziZ8crvsHViVHWhzQGqa4U5HSV19N7gGrtYY8LgCj5/EWyevTPQMfOCghHA4h8
	aSYLx9nQM4aT/7gQRxi4vwEqc8WQnFIUe1Ru1QCeJmevFJadpGoMPAxyL6XWPMtJdupgNNrLDkT
	gg+4RdirTLrp8hChdEdpMlD+jrvAp/fbEAdW/3zOwd10XbIHmKz5Sb
X-Received: by 2002:a17:903:1b68:b0:2c0:ab82:6b99 with SMTP id d9443c01a7336-2c69a1be610mr27821125ad.33.1781597726970;
        Tue, 16 Jun 2026 01:15:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c75c3sm119650765ad.27.2026.06.16.01.15.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 01:15:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 1/3] media: i2c: ov5640: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 13:45:15 +0530
Message-ID: <20260616081517.44685-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-1-birenpandya@gmail.com>
References: <20260616081517.44685-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64966-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:mani@kernel.org,m:slongerbeam@gmail.com,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3A3A68D136

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in ov5640_probe().

This eliminates the need for the manual fwnode_handle_put() call,
preventing potential memory leaks in error paths and simplifying the
probe routine.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..418cade11d00 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014-2017 Mentor Graphics Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -3845,7 +3846,7 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 static int ov5640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct ov5640_dev *sensor;
 	int ret;
 
@@ -3878,7 +3879,6 @@ static int ov5640_probe(struct i2c_client *client)
 	}
 
 	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
-	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err(dev, "Could not parse endpoint\n");
 		return ret;
-- 
2.50.1 (Apple Git-155)



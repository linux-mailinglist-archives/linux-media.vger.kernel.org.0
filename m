Return-Path: <linux-media+bounces-64930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eU9cEBhpMGpBSwUAu9opvQ
	(envelope-from <linux-media+bounces-64930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:05:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582068A1A8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:05:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TRUTQ27U;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64930-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64930-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBDB53104258
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7328E3A63E4;
	Mon, 15 Jun 2026 21:04:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6E3AA9F3
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 21:04:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557464; cv=none; b=JFKsllNdm1xoBln61bpZzCd4p/nHmur0tbvjIk958m2OiditcwFuyfVfxO73feRHdA3LhLjb6vm8uKBiLWwaWDjXi/399bvN/JPD+Iot0lFYeicsN6AoY8rZPQI8EyaDr1rQpLarB2fvVxqGTZi4wmae9WrkdYQcorzhSTunM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557464; c=relaxed/simple;
	bh=ewSyNFkkJe2M5TEKdnG8Cn1riX+bCh08goHnowRZcc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQBH872WdCxkUPvmexaItrBF7PNyXHJ5GBqG4W/uokKZ1lTMLSTLZ+JuMIMFN2jny2lnzsuCIAJWyy0+CTjjr461Vjoc3e7TPzFXEbPUImxNEhWg39Fa0l4zmOsHv4InXbKfm9UnmQ2PXd0qPcgO8tJ64A1DQYobYhqDKhmTqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRUTQ27U; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2247e38eso35538615ad.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781557463; x=1782162263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey2mAPNyVdR5wIhMgKILVqinTrDRQXxWuXDknth4zFs=;
        b=TRUTQ27UjIDGCrg/ArLIgxnLcSx9tPZ+SzXv/eCgv6yPqf1cIx16xdyn07Dil3jAhq
         WxxcDdNrJX1TTraTOerBnjj9lDrn5SphLsVsXX/UQrR7H69bdi1xMB4VhbTQwkkMLpfP
         TqtYJ6k/ifk1S6CvwbX7HXnL5EfKUiFPY83COZYCKLg8zjVeTgbSQ6dSkCw+frHiEZPM
         2vSP4nXCKC05hgBig76i8qPigBeAEtCwBZ40zGcqARZLnTkUUClkg5Y9TfzP4/ejQfG9
         yUhLERytq04naPYKqm5wTzSiUAlCn+iP6GFWcPc7EIwcPBS6+NxLn8qSgG0ojXqQh5ai
         uPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557463; x=1782162263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ey2mAPNyVdR5wIhMgKILVqinTrDRQXxWuXDknth4zFs=;
        b=O4mn9gku4L8PJ0S9kuzEde2wM1klx7+B3k+QbvPho4Uhp9yPdyWyRRsgnF0o03XEvN
         iWNzLBdm3cslhyKLBlTX++a2s/4lAA4Sktc0Ch+IYoaGQdet5iBWTzXhnv2GZ1HOl/Yw
         Of9Bf0JYfH3/ArCqf0B+iEU/H9hrIFX4wnl9JzVydFBAsGxuPfx+DxTt9nhvOsKOPb6+
         HJMb99dJ8RiaJQA+mgyD8pfIGli7tp8RhDjqqZ+afXPHgLavggu0BiwZwN0LItQlCo8A
         dbDnfnUh5ljo2T2Cp96BE67WSzmnV/FNNeznf79qhyYto76eN/pi58C45CBcVGjrhwiK
         Zoag==
X-Forwarded-Encrypted: i=1; AFNElJ9PU+iqUCXh4JZscOkGsSwmXkGQkH2X5A2zjV5JZJMcAayyVCqvI+XPkMUaTcky5e1FibAyo8vk0+hFWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjG81K41RstVTW2AFRpr5sGPBhexq5vz/UkDCeSi+LeWXq0Exp
	pinV2kXdaUJ4yJXTE09VLsfmSAzd1vDIZCFCerUYavYrJp2PNlHdoCU3
X-Gm-Gg: Acq92OGeLUqAQUTmNUdFnLvgN6T6D6QCJlBXLBXevNvk0yPRedEq5xPVx9ec9DxRaMp
	4DCgIu0TIVrHSSI3Nzrkrv8qhcMEKvE5c1xvIQk6foyl2Uru4ez/03/Wrddn+gzouoi+DUEkjXt
	dfUPwY/dTPJ/JZu+KBgTRHctzwgDyoNoLq4/CfIjkIU1bPZZFrCStKErag+05tdgNXm99uCllHk
	7rTh5FqlyantqB9xcSDf6RTn5hhle/zBWIyYQPEroKGCEhAmQBttjSWJJCuKC6N/RYHWM6wHV8r
	jFUWp1dncTTUBGHZKIGT9VnGxtYvP3QqYC06CL4oS+H0fcDOb6bydy5pwBB0wCcKZGeRAVdyEvx
	Q2Fd/u6tdG6WhrXHIMcOpFu7u4dKsv4rGFDKs3dqd+eyMojM/VQlpyqdkk6FPtF19vYqPf97CGO
	4sr055DeFwoCkDb+IOLPzmTGF6XIzzmuwG9hgahXSY7CwELvym1Vy/
X-Received: by 2002:a17:903:19cf:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c69a19ac7fmr8481265ad.24.1781557463231;
        Mon, 15 Jun 2026 14:04:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433747ef4sm110934085ad.82.2026.06.15.14.04.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 14:04:21 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 1/2] media: i2c: ov7740: Fix use-after-destroy in remove()
Date: Tue, 16 Jun 2026 02:34:11 +0530
Message-ID: <20260615210412.34567-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615210412.34567-1-birenpandya@gmail.com>
References: <20260615210412.34567-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64930-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9582068A1A8

The ov7740_remove() function had a severe teardown order bug where it
destroyed the driver's mutex before freeing the V4L2 control handler
which relies on that mutex, leading to a use-after-destroy kernel panic.
Furthermore, the driver explicitly called v4l2_ctrl_handler_free() and
mutex_destroy() sequentially, but then called ov7740_free_controls()
which invokes both of them a second time, resulting in a double-free.

This patch fixes the issue by unregistering the subdevice first, and
relying exclusively on ov7740_free_controls() to safely tear down the
mutex and control handler in the correct order.

Fixes: 39c5c4471b8d ("media: i2c: Add the ov7740 image sensor driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov7740.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 632fb80469be..62c124a1353a 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1116,10 +1116,8 @@ static void ov7740_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 
-	mutex_destroy(&ov7740->mutex);
-	v4l2_ctrl_handler_free(ov7740->subdev.ctrl_handler);
-	media_entity_cleanup(&ov7740->subdev.entity);
 	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&ov7740->subdev.entity);
 	ov7740_free_controls(ov7740);
 
 	pm_runtime_get_sync(&client->dev);
-- 
2.50.1 (Apple Git-155)



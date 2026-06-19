Return-Path: <linux-media+bounces-65262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dk7SGqcTNWrImgYAu9opvQ
	(envelope-from <linux-media+bounces-65262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:02:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AA6A5187
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:02:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K3nezXJX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65262-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65262-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04B6F3015A4E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E9336AB6B;
	Fri, 19 Jun 2026 10:02:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45735B646
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:02:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863329; cv=none; b=OJej5AQHl7mqEqehfG1+E0qDspA1kBhrQv2UDAjRG16gizltTzE5+3ZM5u0gyuULQw837Ssjhe6drQGIMkM0/0K3YsbD25PpNoWsZeiaoGiuIv+sfrK0r0dhhE74iYS5uAIRmcTYUSCjw+6GCNT+5pTesuHuEgCMXd0rwK6sJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863329; c=relaxed/simple;
	bh=MbwOYbdcCjJuuc5HjgdEzGBfpRFA5P7uYad+H/KWeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOtoCnXO+bi74sfr8QetqpSRKqvCPnVkjupzloyUFOBOfFaQK9R7Bk8f0wETZd4r8ZZz8/6+JPheDUmKGUaj2my40p15qWTK8tE4/0t6shZ13BwYWAL+oz2Diy9/9pGrT0cGUROPjHyjB1ZvneRNHAfZN58mMBJEOKz4CfXevIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3nezXJX; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso784332a91.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863320; x=1782468120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiH8tZ+6oFsF3eG0e2pptiiOi97/qI+5JdlYTh40IX0=;
        b=K3nezXJX/aLk8vXyKPblehrtryVFoKvvM6wm3KA7felaErotz5qjfsBTJWA8v7TIpI
         Armz1HHBxCKaRjxEgtpmacPPh2MC2AHKy5LayGxkzI0zT9oODiDywg28AWSa5ldF3M5D
         f4KxhURditXHl+u3ViHMqBnZdOGfNVrGOJsbsTaok1mw2jnaAhTBZygIgtccnuPzmpqO
         1xdNVDPKLtFTBN0S682fPsJ9FRtWlbjjUX8CCxN1K7pW2kC3/IzXjAqDEiunL2xwBsce
         4X2UpAUrSmgnHUBYmr+S1nH+eqSxYsOpYvEvD/jqoIOS3VGsyBXmy5PeX5EvAHusLwRd
         R1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863320; x=1782468120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiH8tZ+6oFsF3eG0e2pptiiOi97/qI+5JdlYTh40IX0=;
        b=VEPAN7XJd4SEkjqHQSQC8K94CgnzD+0Rx6367tPeCJHiFDPxdJSNeZdeTXq9PMgU5Q
         wB7Pj0HEObghCH6dvoRH9eHRXEgPfzp2q7PqJNSnW9ETIroNoAiwqOueEBDq3PFA6xTP
         vKTMEkDI0IAOPE5XZLFDhQO6n0nYuiKV0dYv8OsnF+zpkQjtzLkqgkDfZoBrQOOobzuQ
         Bha4K8yPe1621Fi5/fbO491fxdm+eMvqy06aPuZUw3XoiRrWHjYqHFb7r83+PIjvq6z3
         VDooA02oa8QQ3y7O2aInjSNvwxWm1czqWslL1cxmdsxAGJ53MD2hkaCJ976bLt6PBTwb
         5Xqg==
X-Gm-Message-State: AOJu0YwJJROZrtfbr2o4kPlzY0MpruoXzIzHRBThu+6TOlE6vstohS6P
	sAQqkW0rqqBpFxFNZb80EtyKrtwuqhhwiaE0qQWXk1g4IlnR0Rqs+f8khfq1BKpT
X-Gm-Gg: AfdE7cmqoj6hIu2m+H0CMZrCAbZY999pfFuM8FeNOm2QzkxLgUmSecMz+zo0+ZZguQw
	gN2KSLV3zfoKpO2cMJfloLs37lpvlocb3SPJdowAk80thxuzLC0FYR1r4VXpsenvhOa501DtlQ4
	R8iBG3bl0rNEjLetds+TWw3s/eoXpIsKQWWxNNwVamPb08Ac05PdQXDyCJQ902PfKqnZ63N1a/I
	4uEWVL8Ws565XkUQfafNFSHw9fX0Z5mghOmMuBzk7r6ik84SnThhkAiBagxSjLxZv3MVZhGPqIk
	x88Ew6FrdPI71/VOlMIZ0pUmm/BqDMVs8p2sAp4L6r7YTlYefgaj5z2c3FQyHoeweeq+pVQF1HX
	M6zIaVTIqv7SJcdKf+mFS/69XSyGcTfXFJFLR7DXLoLpcDHUsnhSyFykhe4VomwtRWe9wjjoteK
	/5CbVTSlfOZ5mx/ZUhUsOI1GyTwUB7kcnHxQhL6nofdA==
X-Received: by 2002:a17:90b:57eb:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-37d1e8b32a9mr2177311a91.16.1781863319738;
        Fri, 19 Jun 2026 03:01:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.01.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:01:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 4/5] media: i2c: mt9v011: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:31:31 +0530
Message-ID: <20260619100126.22197-11-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619100126.22197-7-birenpandya@gmail.com>
References: <20260619100126.22197-7-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65262-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25AA6A5187

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them to prevent memory leaks if pads
are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/mt9v011.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..b7ef8bff727d 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -520,6 +520,7 @@ static int mt9v011_probe(struct i2c_client *c)
 	    (version != MT9V011_REV_B_VERSION)) {
 		v4l2_info(sd, "*** unknown micron chip detected (0x%04x).\n",
 			  version);
+		media_entity_cleanup(&sd->entity);
 		return -EINVAL;
 	}
 
@@ -542,6 +543,7 @@ static int mt9v011_probe(struct i2c_client *c)
 
 		v4l2_err(sd, "control initialization error %d\n", ret);
 		v4l2_ctrl_handler_free(&core->ctrls);
+		media_entity_cleanup(&sd->entity);
 		return ret;
 	}
 	core->sd.ctrl_handler = &core->ctrls;
@@ -577,6 +579,7 @@ static void mt9v011_remove(struct i2c_client *c)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&core->ctrls);
+	media_entity_cleanup(&sd->entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)



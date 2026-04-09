Return-Path: <linux-media+bounces-58366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGHgICPf12klTwgAu9opvQ
	(envelope-from <linux-media+bounces-58366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:17:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E63CE05C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B50E30117ED
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 17:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888203E2763;
	Thu,  9 Apr 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ6aWyGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C043E2759
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755038; cv=none; b=VZiEqxHVHmi6+QvPsqI2I7iJWqaE9rkTI0hsJjjEUkILUAuIvBOAvGUMKxirI6GtiLr0CSlKLfl7YeK214kQzEjeK3v8Hw57oy5+o++1KIrEb64ougI+i43rBB6oKOhqcUl9xrySMSeMst5yQQbIyO8mxCTax5R+eSZLDaAsZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755038; c=relaxed/simple;
	bh=M0QYnj1J9z+3khhsgshXP6hVTQ4IQ7WAbMQhRAehWt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqLGYNZvDVI7E3O7dO75wHXvjTjaip+pqxBicfbzazltQqh7PX75rvhRssIn0NUAVsvJSQ9+uys3aJMwlUiONM9m5XDBTamIKFmBscppw6ljoW6WyHvl/Y/OUq2h479Zd9zhYF+Zt0atdSUSP2og3GcCyVKKd6aGUKrM35CHIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ6aWyGA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82735a41920so431098b3a.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755035; x=1776359835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDjgLsnh/IJoXNLNt7Tnrvl1NCpN0yHODbggxkvWIZ4=;
        b=HJ6aWyGA9rOEOell2gUL+aJQcK4ZuLiVBJbHlC1jGXaKoq3tcQeKoiTiovz3wu/g7F
         H9O+vWbs/RGW5IRvzUhCKiakc2elJctu2q/yNWAvNKCCIm87eNbJrZbKtAGhJ7pKraV3
         KztiylY+rgFr2XAePiNmm6EMR+vni+54wJUlsXwkNho0ZPoLIFdmepZblD9/SVJTwBwQ
         +Jt5pe7cupOxSJ1E0r2dD9c2Rdf08axFN8HE2CP9PuXQTmrgYHVjQeppV383Kd8Y/aEA
         fnWA9qhM8Y+u6bxTFZ/A6FEoe/VgyTHFnzmW/LFjuSaprQZAtglkStKUfR2WSFiqIpM7
         b9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755035; x=1776359835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDjgLsnh/IJoXNLNt7Tnrvl1NCpN0yHODbggxkvWIZ4=;
        b=Bp47JSn/tTjRzLg7uF74oF3Ms7Qhytdyn14IrV1F6c5688UoJDtnqDkvKxTUSgz2SA
         dJFmR0OYtM99GkU134bE/PxnSZdqZv61KequgKTwbfce2wkuT6UpI9ifHdIGPCVa/q2x
         0rRmPOsxo5cgNxFMNY5s9hoaPchU14ZnbNoZ8CIJatFMjDZqXWaJ2GdqGAjP5wIhqe67
         Y4UwNI6PzGtqlrwUW+U4/4M/7O2jhxcC7erVvRL6JALr/XQo5UCGwD/yJZtpE8mpI+SQ
         BTHtt7cEd4fkzygMtddBdZS4/8DdeixOsZnm5ixvAPjMqoohmYC8aEv/OMFKkDGZduG9
         YXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm0kiSKtl1okab+d8YjcM8rhhvQGn8yML5earBxsdRSxNgNXiDsXSbxwGHEinFrwoaxn4A2yLwWg+Mqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHc54Nt5XRcEu8ZccFbbMZXth0iZZKiv0OoDTct12DCD8Jql6
	h8MkS9CZwitesfHSa7RnMP+6LqUHH6esGmrSuVX+KwQSiCtxDE0AcLvQ
X-Gm-Gg: AeBDiesv3lD31xBExN7HwKsPxIBHsH6OvM+JILs+n15BfNoWJfKjb14X7ynIF/gz0qg
	onTsv8AykETcqSA20YpEMFEmYM0NtqzBucloZLOn+V8YWg/dJFOBRbljhnZEl+AGxB5jf6vL3IU
	+UXAZFNu/+A9tlT9oNzxUhbqAhIelP/+zi4mxWVm3ovGLlmHJAN3pOylb2ykdyN+GOdq5tCFSx3
	rnodSohbzQDB81u+GlgzTumNVZX7RabyYogf5Y6a5tDyZSuz2wHFlB20ytB+hFAQ1U20tdjPSBp
	aWpVo+jgHkVt9GBrL/y+jV8n7KAumuj39g1ahoT9ZJLmL1DlhKpoVzuovOT3/QP+zb1VczL1c0S
	hb1j0qFm7arPRzYfhEzzY3XwNLDvLGE7taOFFSOy8HphzfCDFz3qTl9E4mBjYXcV6i7aErwbfTv
	nQz6H6CIsUX8kSMyB3qjCt2F9NEvay7cCNjQA6t2eqZXLaiP2kfV92iNLP
X-Received: by 2002:a05:6a00:c8c:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-82f0c21bd84mr62942b3a.21.1775755035050;
        Thu, 09 Apr 2026 10:17:15 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.16.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c3145acsm7720b3a.6.2026.04.09.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:17:14 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep assertion
Date: Thu,  9 Apr 2026 22:45:23 +0530
Message-ID: <20260409171705.8737-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406122346.GA1268443@killaraus.ideasonboard.com>
References: <20260406122346.GA1268443@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58366-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nueralspacetech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 228E63CE05C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Removal is only required afte state->pads for stream_configs since
state->pads only represents the static array so not required locking for
it.


The __v4l2_subdev_state_get_interval() function has a duplicate
lockdep_assert_held() call. Removed the redundant assertion.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 32e6f60e26c7..4616e9280a28 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
 	if (WARN_ON(!state))
 		return NULL;
 
-	lockdep_assert_held(state->lock);
-
 	if (state->pads) {
 		if (stream)
 			return NULL;
-- 
2.43.0



Return-Path: <linux-media+bounces-58831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ7oHEq532mOYQAAu9opvQ
	(envelope-from <linux-media+bounces-58831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:14:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 257464064C9
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45C14301828B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A69B3DBD70;
	Wed, 15 Apr 2026 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9ENnJDl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5043B5318
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269418; cv=none; b=ElcWOup0j8TgsLtMgHhcynldrj4aAZOSG0JR3+3J0l11cUhTgRKB5rmZBhDoUYD6um16gji080PIiYSGoxjmTJPIYPmFJ8g+3dghoiNlDUz7qWxi590UioJwF1iX/qU2kh+17e0IJp53UDeSKPE1IZWPpiffdKruj4yAAEDT/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269418; c=relaxed/simple;
	bh=2w3KOA8yk7Qww0r6vlP8QuGutHFJJRfR+W+DcVcyKkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uB9rLjVRU4i9NqlkSXkKuHFmdbwUF+VgMNpPR5HVMQFeuSNF7p1EGa2r/kKKYOjaJXUExzjafdzT4u684MyZpDWpCJEftisdlP6Ql5jQi8WArDJSNVvy8bSJvYm/ebdkIZxEyp1zODP6cK5SYp9DdK7Ukmacc0i57ugDXVoEL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9ENnJDl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so6181593a91.3
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269416; x=1776874216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvfnqSOHR6vjb0scxZvmU791071WtEtmpn2rGjggRIE=;
        b=l9ENnJDlYOLhjEW9ONq6JooYpp1H+dEyNuUxtBaddg+FP469OA9Vzqlk6GlpKl37iv
         w3V1VIvC9dBqZCOAVGtpat2g5p5rdvQWbzCMUoOuXCguOLsWUbCXwrBaOqH8R6+5tQaO
         PUj4VSNWaohkuG5hu03t0z5yzlNv6RCbrgKcXg+t153cjhPt2jiu78OLs51z2GCElgXW
         1mh53WLjrww0I/KWKlNpFtRBkOhHqMn75Cu+BPJAT57vhedxI4CMX3PU3tLZAbSe4p4w
         Meu6/fZnceN1Pr/bsp6pcxUWUOzi9ceZxQxMkBilRQ6fzEKFMXwjnrkH0bd1d+dIyDqs
         1syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269416; x=1776874216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvfnqSOHR6vjb0scxZvmU791071WtEtmpn2rGjggRIE=;
        b=C9kahS0D6zLDKqqWZJUuv0rzpaQdew3cfBRN4BvVMKUAGQQQnTa8YRA61I3kopujWN
         4w74D48tFGG2EbLbGYhK5sxi+h1OAasNDSFcf7qSQNTyC+SOS6eCqVxrmb9qOIa8xfQm
         6lQRBtTJlLjhhTQlZOIFjf3MTG+YRM5yaboZp9GSlX4JzMTn3e8i7OX0eLRwO/zTEW63
         oayMhRzKTDIZb0cfS1QhxjDoRbsU2gD/RtqctjJXl2ZgaaiM7ChxAdNoOGow6qqorTK6
         3dpNXXVVj87YGHOuXEYQGHHKJeF/YMOgIbdlXWwBhc+bqg5D+/uJd9c1LzOfGuhkPlvh
         oWEg==
X-Forwarded-Encrypted: i=1; AFNElJ81jTDhi3XuUo8/tTUJMTGEPHWlfcN583gLnHJ2htdXekMiatqQt23whGAgjd9pC1d0Llu8v75vdK59yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLlpormcupBgwMGoffpdMK4rK27lyP4GY/DJpimeYWkgcRqDG8
	7sYEpIs2ym/rbylsRaaKRvflsXUppdTumxSSUw3AtEQp6fsnUib81FvH
X-Gm-Gg: AeBDieu/EQO1ChZAcsxTOimG56JrKXOlE6tEIYXAx0V5SQvdLdTbCUdDyIEODOjlZNP
	ipK2DpiYCiFRM331t4/7Eq8fpiChP/IYyhvY/7yAQlMtTuL4Oa/uX83dg9Mr0jX4DKw1ojCAzt0
	atAgsOGv1a5i2agvpZJihL5ooAq825PuzGiKKJGPMVALrZ31ZNJsGHFUdOnNInUosWMm9xOIRVN
	H0v4z8a5x4IeeF4nqxY6xj511ZhEI6fl1yZZAIYwRGno8H+tV7uw2IJLJ1cp2zQgUpN2z6wEiw3
	DTxWXYbntQgz3F0WRzn7VBV2RT1D8ChmmrOY/pHwdwv7n7EhiTgRKILwrmBO4flRnOdVYJeCK6M
	j1LNizg+QHCk039J5xcEy8GhrCnD01wMoVMvQQNZcbYqsvF4NlxhT+iceQ/duh7yv63Rc/bJdt6
	Iwp2FG7xUQGgiox6eXI1ip0Y8vz1WCRObrOXZg
X-Received: by 2002:a17:90b:28cc:b0:35d:aeb2:25b2 with SMTP id 98e67ed59e1d1-35e428cda1bmr22964275a91.27.1776269415554;
        Wed, 15 Apr 2026 09:10:15 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:3836:7c38:e5c1:4b6b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fce8d7cd2sm1066496a91.4.2026.04.15.09.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:10:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: visl: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 00:10:04 +0800
Message-ID: <20260415161004.3542108-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58831-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 257464064C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in visl_init(), the embedded
struct device in visl_pdev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  visl_init()
    -> platform_device_register(&visl_pdev)
       -> device_initialize(&visl_pdev.dev)
       -> setup_pdev_dma_masks(&visl_pdev)
       -> platform_device_add(&visl_pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0c078e310b6d1 ("media: visl: add virtual stateless decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/test-drivers/visl/visl-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index 127ab18bce99..15e4f05d5ec9 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -558,8 +558,11 @@ static int __init visl_init(void)
 	int ret;
 
 	ret = platform_device_register(&visl_pdev);
-	if (ret)
+	if (ret) {
+		platform_device_put(&visl_pdev);
 		return ret;
+	}
+
 
 	ret = platform_driver_register(&visl_pdrv);
 	if (ret)
-- 
2.43.0



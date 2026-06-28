Return-Path: <linux-media+bounces-65815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PyGUNZ+rQGqVhAkAu9opvQ
	(envelope-from <linux-media+bounces-65815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 07:05:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D46D32D9
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 07:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qTf5CEc2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65815-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65815-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F0E3015443
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 05:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD9325483;
	Sun, 28 Jun 2026 05:05:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66329204F8B
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 05:05:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782623110; cv=none; b=sbYf1VloVjOQL3TQJxW5txbTx4A257Fv2KW28YN+Gkk9K6HEFVcYlKK02J30JzAt1YRPr71/mVYoN+U14Xp4tx34u10uGeTX2l1FjKir58LKCM3Q9U5HB0mXCJ49Vhjseu9Nr5VafVrcAWezm16MBlYF5l5bnoO8D8StN1hSuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782623110; c=relaxed/simple;
	bh=c2XhW/6UeH0XkCW8UnEmx/UOGPYYABfckAnJBP9UI8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfUbMCsNj5SMDsogWxxLb3thfRgAfGAFGkNwzbYeVTTQbtYrx9CQhzJmq4LSqWLsKAwt3qJXlTXcn59+d0wOK3c5/Vf0pj1VlgHkfSM8m9z3azDWKeKEQLiXYNczycTssjGq+IGMZgvbNHdgYseuIMGEt5K1PVQJwJpMZd1FM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTf5CEc2; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49241896317so12172075e9.3
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 22:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782623107; x=1783227907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHIrv6i22ebWzk1ZPxbscjGk0xnwAK8H0pOuIdEyCLE=;
        b=qTf5CEc2mdbTOpeWlfYjbXBBdMKgW7Uo+kZgm97vwFGR18/ZyEKLtc+FSJHm53ndyF
         CLQ5L3nux0o+m4gaEF2nj7Zl/+QtrgfFCK84AUIwsZ1dCaEm6TG/EuqTldMgQidbJvqa
         LZumV+0XsGmOdcgSlwn2IQHCw6HhIBl6MbIGznGZddicXXGE26sK324/Va+P2lqqh0Ns
         AtPXO/CWTPsZej4LdAYapf4y0lKZQX2DO5SxXld+SEjYYaB2zuNXjIkBmzk3yp3ZgNEn
         VhZjE3ZUL7gkB8ubRithoqBzefRkGOrafSwsPk0H6cWIGtqq18GsXpaCg67DukYd4ECH
         scww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782623107; x=1783227907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHIrv6i22ebWzk1ZPxbscjGk0xnwAK8H0pOuIdEyCLE=;
        b=Kv3egV8Sn0RVUIR/YE2CA0c6XJyURxJrTdRfvtZD1Y+u5iToIV36rEEGpjC6y48tpG
         ZS9LSm8DAiS7RF83pSGtRl+cvV25ZzTqPhA7b1aogCbtcBcPvWdkvXvKIsco+vZBk4Qg
         bZLOSl8P4g/BfeKN24DYVzyFEffzMAU+MYuBpwX1yDY4X6msYsKAUpEPe3ksc26tkalw
         SeWR2BXgcHcsK88xF8a2GeCBPlnOp4oUa5JhJdwLBgi4IqHx21ogZA0ele2inKh2SlBj
         bjqovv9b4VYL5BVZMJeRqmZ6Mhf3dzVyJTTF/6HYBXh5TvLDw7O/bqZ0Jt9l5tytIFpK
         sUOg==
X-Forwarded-Encrypted: i=1; AFNElJ/XsX3Y/0CJ+11hAC0QjlIn39Bwzisq8UcCktLSCGeFI3YvieeNlE/GBz6ztEZ3LCQMNOENWW8vLJUS0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwppRR/3TxAMlHIj3Y9b0BqcqRPtnbRWLzqUaHjOo/peaLG1Y70
	EYbLvUlCSx9QCmJTeE5eNhJsGQkxR55HHleX0COwkzerlAqgv2yRcCKDkaKj8w==
X-Gm-Gg: AfdE7ckWDQP0mPKFIlgYL8aomEctar4t9D4eLqsOBLzA8EZ+YJ5euJuGMqO+08VVr5N
	Fal8MgVzudrDRs2IwSECUakfs1QqwJKqau6OFAYEq7vf2DswmP6SuEaPybbYQCfu9Q2ey9nveCB
	3J7pay6zvBAJHmfFPhS27E+K0eZmksdz+dnwbq7pWrNgtkoF5OG7YG7SOZ2VeisB2mGHxqOjehJ
	gRUZkRAfsqCnuK85Q7fJ3JsvK3Q1zTXKCeBvl/i5tYGY/mqyqOlncWgvtlEM6GFtarYsl+ScdgZ
	TMSO0uIIOWlmDqoA6Q6k3KItj2SSy1AJo7zSf0SJfW6g5rP8RXb2D2pi3faZzZtAlug6BOWyWm0
	Gi2fqm9JReKaA4B7ZzdUObjX1VG/PUYo4bQNnALTrtsfLkp1cH2uZSPADiTSV26Crt/FUnphwT+
	a+NGJmP47zGqnxnGJgXIPDWC3KZH+sKz7QWA4rvMw5O8urzisO7pfEku0da/qQsjmNUb6HNl8N3
	P7a5hYmw6c=
X-Received: by 2002:a05:600c:4f43:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-49266838e92mr178063285e9.2.1782623106568;
        Sat, 27 Jun 2026 22:05:06 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a4cc6659sm54089415e9.13.2026.06.27.22.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:05:06 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Fix double mutex_destroy on capture dev register error
Date: Sun, 28 Jun 2026 06:05:03 +0100
Message-ID: <20260628050503.16048-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65815-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 242D46D32D9

In mali_c55_register_cap_dev(), a failure of media_entity_pads_init()
destroys cap_dev->lock inline and then jumps to err_destroy_mutex, which
destroys the same mutex a second time. The switch default case just above
already handles this correctly by jumping straight to the label without an
inline destroy.

Drop the inline mutex_destroy() and rely on the err_destroy_mutex label,
so the mutex is destroyed exactly once on every error path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index 7aaa5c3f7..ff0155302 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -857,10 +857,8 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
 
 	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
-	if (ret) {
-		mutex_destroy(&cap_dev->lock);
+	if (ret)
 		goto err_destroy_mutex;
-	}
 
 	vb2q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
-- 
2.53.0



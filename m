Return-Path: <linux-media+bounces-58147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD4pE0eZ1GmkvgcAu9opvQ
	(envelope-from <linux-media+bounces-58147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 07:42:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E62753AA098
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 07:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44FF309845A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 05:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04602494D8;
	Tue,  7 Apr 2026 05:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocGbwRGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D23246BBA
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775540415; cv=none; b=MK3sNobI1BQ2RzZdM8qOSi4yX1cjvxEWDUcYYyBfoJaDeYprVkexcBX3VwtsKIVZ7hHeVyW0jDMlNpuPwU937ydESwPtaWY5PyJvbTuop7A6C9ApVfBConGTyAaAqrOmxVuVhm7KAThqieOay1A0QKSHTXAMpUbPXaBlZc9YRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775540415; c=relaxed/simple;
	bh=CKnrfKF4lZ8P1svwgDKyEKGLteS5unEM9CDMkCnh8UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3Dk+SwFI/2GyxzynOHz2oggxVlz/4lwaBM1IlaqpQmPHvyx44M+rtosgPCkKkyvB7BVI5vr5Q6siXpX1K+rcWaWQmtVQ1JV2/merPIyefGdIEAOP7duLm9TUfSlT4PG+bhaogTclQoVwF83BMm23zoTWCV8dsM0MYgPDy4eQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocGbwRGs; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824c9da9928so3622024b3a.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775540413; x=1776145213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw2AM2nd8jsh/WeGgK3cPZGTW2n61k3Zo4dYYbnAFOs=;
        b=ocGbwRGsdoS4tYb1d8+ZKzB2z3lVcQOdWC29PilM9RNVT+U4rur5B4cQ4mmPJfhDUe
         J/DCOQ5WHYGDiTCO+1wNQuvY+YPWHCgKcLq9MLp8RKeREs0ES0DULEsn/EiBX3NKxRIL
         wnytMd/jOspmaWFp9pgshLes3LpkFP2x65ZXc9H1gh9tTt9Hjd4nNtCsgsEl5uGwvbLe
         YLJBp/yTzsn11ku3kw5d5hbXG7RVhfmpVbPVOzye1Xjx94ja9vLwFiPWs1Kdfg9RW13G
         c4e/6QfZro4meHapjSqB1NK2JdVpmXJRT68lB8/QNREvvZW/0yIJgppet+1mEbnRf7xG
         Tv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775540413; x=1776145213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rw2AM2nd8jsh/WeGgK3cPZGTW2n61k3Zo4dYYbnAFOs=;
        b=o2PWcz1OFCddMKy7zRquJfWs+dWYJoOUAB0fbVA8PC3M3g72z7T6pKXA6cpze9aqJR
         Xa8MxZOhWic3AVMbbLRc1CKbO++z5eIKCtgaCH/u61ZjxmGetZneMNi8fQc7WFwgA5AY
         GrIYkMLMxzlK9CmC+JZfr6c6xg6FQjrAZaASafpUJm9AKeAdpOCHxK2HyocDTrtOGJ/p
         7n3C9/4oAu/EqQaLqZufjPl5KpHzOcSbRIpeJj+/Tn5/s6p74mdsvHZ7aWxTu8bWTkHh
         guZrbMr/l8zjX4JQpLp2mZXDgitmMmKoMgKZhmh+rZdpzqpXOK74vgSBui7MNYQZ7pHg
         /2AA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3GWqE8J5uTVSIk6Y6YAFaAUxLbE50VVzc18wwC/prZw42StHUJCVYmZ244pImmSrEDvIeDqN3vCcdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOndycTnqBLUahP1HBPf9t+T7zUunHqZ1x7gTMmX6Cs8G1uCV
	cLK+pCENq2cnTiMJ5wZkaLzcBFZXCpTQ8kSLjpnMNwgMx+KEG6ri976Y
X-Gm-Gg: AeBDieuRawDKMTbz2OgoY43ddDrdriNA6/rLuVc+4T8Pg3ur6XzUn8LXzgOHP21tKAW
	pTZdtxvvr+aFA/+Qxtb2EHFhuffRaThKUb/xgmJrlsQQBpvS+2uHwvpHeADiG3V9zmNKkJA/ea/
	UiuGEaYcx3wy0uzynPXQam2ZjcTL4r1ymGYZUPl1H4GUrc3427tOwF/YBID5BqnWvN+rd9P5qmM
	VKDS0aobe+yvCc3sg6OVbjKRmjcaRxRoGiaXtGQVLtLQdr6YvDcewr5QCxdDM9ARRdGioP4YRxN
	dSSHBzlDmhtEbpgZEzv7NRBTLtVjFAj+vV0I+XwrGRvgWfUlvCOncDjAe9TEmit/pocmVQbhPsY
	Iyqe3kS0lqJIPioh081rAPMolgdzCKyRu3XToFDxXscve2w4dAcZUrVo4Twsz3VrUsr0XpnMdso
	FhtWkRb6Fc53kCwow1Rqq8xXyaKcWaC1qgCH0l3/0ZkCPJQQ==
X-Received: by 2002:a05:6a00:2e93:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82d0db34925mr14390619b3a.28.1775540412842;
        Mon, 06 Apr 2026 22:40:12 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.16.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2714dsm19880847b3a.1.2026.04.06.22.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:40:12 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH v2] media: v4l2-core: Removed duplicate lockdep assertion
Date: Tue,  7 Apr 2026 11:09:46 +0530
Message-ID: <20260407053947.9113-1-nueralspacetech@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58147-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nueralspacetech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E62753AA098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



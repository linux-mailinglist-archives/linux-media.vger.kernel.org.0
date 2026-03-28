Return-Path: <linux-media+bounces-57454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP0tLkHzx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:26:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14E34EE0A
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CD7030416E1
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B14F34B1A1;
	Sat, 28 Mar 2026 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS3TMnwm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4832B99F
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711419; cv=none; b=eAtGMN7othnRxu+ae+NVirOD0i34ZKbl5pEpoarALuCaV5kRyTbR/VIrqgfXXLUTbXr0mt/IqVUFXq5UI/cRSwH2++SbLClclxD+uj7wpPnXwQIbLHVN4yFRnDFOgfhmdX9nsbDwAevvOujPrSHQj5hSwHsEHdvKtzCRO8TM84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711419; c=relaxed/simple;
	bh=DDxcgTMqVStcQgFfJEtZCeD2KwTgSjwDBMGcMyfbmOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npSJhPwEoyvOeVxEzPidbpHdxqxhT58RBVhZsk2tEvdNIsigi4dPac0TKR8Jk71pYsWntIW7UT5lNqvmWv/hHe3TG537Al4JJCCm+aqKZyXVfg4WV1K5dfma0/1++L9kuZdByMsXNelle8ElSktgtRqCt7qYKg8Z/KgNUjsjZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LS3TMnwm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso424706666b.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711417; x=1775316217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LWhF3uaArkhQK+8SH0+E8r9jK9foFcw9lUUPANL8Bg=;
        b=LS3TMnwmqJIaKbtO84k79yDBrcppQ4hRUd8TUpvmuWM44h/XGcais4rNtZLC4TGXe+
         DZeQmYUxLrn+ySjC9tvJXpCuq4GZQG2XMzlxJfB9X/MQfJUtBA9QCp8zD1pn3+2m7/8A
         Ldw7XkYSioQUPwrqPYPMkcIj3kg9Asrll/k01tDcwRVfbtyYlyBP/dUCX3nytzvEBaA4
         gi8xak+pX1YU1w4nIGpUq2qaLEG9IOga6ZzRnpSbW3KvrX/TEvD5xRl9dWYn84GazO7N
         8WLybCGD7hw0azQett5FtxmLUyNHFfkloyP1yoQF0J/zGHIG+6gv+3G9B/T7URNdEC1d
         j7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711417; x=1775316217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LWhF3uaArkhQK+8SH0+E8r9jK9foFcw9lUUPANL8Bg=;
        b=n/MZl0NG4DXM7FrL9/awmgIbnl24OMVPIUl4xyexwbfjjFrSmPoTnr2iNQfb0iHtgJ
         V8FKinNDu5WX0/7/0dpmBcaXZEV4j7mwzt9vei8RqEn9nseUHpZbFJsTbgD6S3T0Ki16
         gDUiDo3nTuPkQMFXf4suN/GilIAOUnplvkQj6iUnBWPDUVCjSz+utOy8iFBI5ahWXhBj
         /Ku9DZDdhDd6NxjPcsLFlpjOWOKfj6RuZQIvnEJcR/wVojaRUbfTPxpF0fzOUFlH9wPf
         YRl3JJf56F0L8P20aUcUIdz+VhYbRILx+DUqzl05COV/wBsC9XpFh3illhAD8vvGVjdN
         z0iA==
X-Forwarded-Encrypted: i=1; AJvYcCUyHz+6jHOCb7RpNqtyx3Zp7v6R/EDXMN2kLI8HX5g/jMeUD7UBPtUkYZeUDzU3RKerd9M5/OquadVVnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLnJyVa91vvsUDl5spTK4oKguZPXG/OI9sBlj0nyrBuZnjkZwG
	4D+eUHEa318GnrBdbdC7HFsbjcHJI8mzAf0HfR6L/nm96HlE+2dGxHrQCARfnhRudG3p8g==
X-Gm-Gg: ATEYQzyJk41HTmWJZ+Q8jP9RbQUNXjIlsQ31RE9aH1E8QVjHHYbAcm6XBWlUZBLp8Ok
	utGjkcIZa8PitA2Mdk0lNcH6mHH7zb98oFe8YADDPY8ll40VTz0VVQCQP1FEJHFrm6EZRKpUrF1
	Nz9NcDe5dSyJc40n9nK4WG1qRJP+zClHQQznOCxob1q9RKvLC31geySfZ/vb7oRNM1E7ZU7o4Rw
	SXOB1MjhoCU1ocZFkVHEHhaNaFlXd/juPflXeKnmEmIap+1fsFgCX1aAfLXNeH/yYTGvy4ruit7
	iKi4k129qDZPgoVwdQtYET3p5bg2n3Y+pPsYijpVq1mKvwi+/fAPDWQN4YOVGD7GDRLYDuZRl+7
	WOilmn4XzIauuxyrv0R+VeWNoc1qCZGGi8/GGbDCjhG6n47RotFwnnb8MH9g7vMM7KCrnaifHG5
	ER4DsyYRQHq9r9xo7tzitzkStm7bF6YA2SHazVJ3PvUbpygaK5b/pvBlfQ/5PRYdf+FiZ+g4OxA
	yB7+0MmyDw6
X-Received: by 2002:a05:600c:6986:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48729109c35mr80167305e9.11.1774697013685;
        Sat, 28 Mar 2026 04:23:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487305da785sm41491685e9.0.2026.03.28.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:23:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
Date: Sat, 28 Mar 2026 11:23:30 +0000
Message-ID: <20260328112330.50726-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327220827.266556-1-devnexen@gmail.com>
References: <20260327220827.266556-1-devnexen@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,kernel.org,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57454-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E14E34EE0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

aspeed_video_init() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. When aspeed_video_setup_video()
subsequently fails in aspeed_video_probe(), the error path frees the
JPEG buffer and unprepares the clocks but does not release the reserved
memory association, leaking the rmem_assigned_device entry on the global
list.

The normal remove path already calls of_reserved_mem_device_release()
correctly; only the probe error path was missing it.

Add the missing of_reserved_mem_device_release() call to the
aspeed_video_setup_video() failure cleanup.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 41cb96f60110..a292275f6b7b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2343,6 +2343,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
+		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
-- 
2.53.0



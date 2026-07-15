Return-Path: <linux-media+bounces-67666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TWE1HQh0V2pmOQEAu9opvQ
	(envelope-from <linux-media+bounces-67666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:50:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634A75DC24
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:50:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=G1i2agav;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67666-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67666-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA3ED3027AEF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3BA47B401;
	Wed, 15 Jul 2026 11:44:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84B47B415
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115869; cv=none; b=qtD8o8FGxPdKT35a0Lz1S3i9X8l9rUJw0cGXYd45DNPju5EARmQPd/k8LXAgh9EbLdaiqd7OfC+Q0/7kTG1A/+74EEJN2jNoHk2e+1+7d/K1ramS/TjxIWu1oxHj9lLEZYmoE9qMzzHpCh7ekFJ3h2bvmQtYS/2Oq0AZk6YS19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115869; c=relaxed/simple;
	bh=bcYfj5jJHsv6QgPHcDA8Qbrw7a2VO2b0E1lpdTZY960=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU+zeaXC3gLxdKlqn5fkbbSxIHozkA9pYT68So5NmLM3B4CwhpZMOuYiJ+f0MZXjOLgFAgXuk4h9JvvctvG3k4shmSYbDr7gqqZbxsZcjudRU5Gf+4ZIy3c2OSiMd/VeqxK2KWzI7iIBRXhzWcOEP0a0r1qfuH8YSoC1NnqkZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=G1i2agav; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso314889f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115865; x=1784720665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3Ixs0kwhVNVHVrLz/R6Y5v0FE4WXlRn39OXAbjyA4o=;
        b=G1i2agavYPAJd21TmcoYhqzWhPZpO4h0q5NMhFn6wYdmQ99p8cgKDcjATedsff/j1r
         ApMM/IiYbiIx7vHA+7xcM440lODH9I6FRAA/mT9ABOxXoQw7MUTgb9ahkXic4fh2RCBn
         gb3x8YwfUuFs2cm6zqNjlll8rOfDP9WVXSrMy7ln0aoLFEF5tnvOOLaa63ytc6D2BDMT
         25cB2QA0VE7r/WkCtN7LLXSGmnf5CUJYWRMj7HQrehgOIMrFRfDkHR6/zuXvzup2i9dM
         orMsa6Fth8MzBhEQO2VO1K/fif0x3yKXP0YGtb0bfNu2yEx17EnDmTrXDqtKtKwbdo05
         aahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115865; x=1784720665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3Ixs0kwhVNVHVrLz/R6Y5v0FE4WXlRn39OXAbjyA4o=;
        b=p7zwj/iaSg9KpK3AW9wH86hyt3Ki1/5IuczrDkB1GJyBuv6RTB71BLutMsx/iH9753
         7HRl4Cm1WeEYEWNdjUjOhTsYZ+qfXp9h8KU4dk+Skk8jq2zgWDFU9VyCjo3QBjT9vuPe
         2O8QicVIvkvcGS17fx5YiclsTosVuessy2GmzhkAgeT42kJk7txlYoUKRwwBX3kxIF8A
         xmY55Tn6XvMalJtfnNeUmi8CzVw6bGTrilWEzmS0aIBQbVCM2ygOnI+41jxZN6lhkqyz
         yKhKCdIOvFUEKyxBPR69ci7w7i5QZuYH9UQmknxfExP9bH6lEhjsxypFjgIwqMNNY8cL
         mNKA==
X-Gm-Message-State: AOJu0Yzvr3VDkQFDTWTmCYj10KQu11CQIyBzaEeHfzz2pEFWHzsF+f4R
	PhxIGedM34kr28+fBEPpghqh658Ax8rSO+VW+WtejdjaMfrvHSmF1lAhSfpgscNnuKE=
X-Gm-Gg: AfdE7cnT2ucFPNQBROPGlltecIOXXvNzIRn03uPhr4LnuoGKOlWCfXeXNOtFFDVkGNv
	e55+JBcujkmrJIHFMjPj0Pv1jR73qGQpskygTH1riWWzY8nVTDowEmPUO8J6ltpuseBtvsGJdV3
	FfuKuYvEZLLvwOemKgdgBqg/6hLk2kDIK2XhPal5S6wqkhimLMrgaperUWbH6iEMqz3e0ERNWAu
	cOGcng0zu81xGRYGg/r5bnfdfsmyS1JSUGz0juO9grjIXEbZO8uao8JNjX5A4SyJRptRoSbA6yg
	LU0Wi4qU0AhkiD2L/Zh1LfqYoLeKmnjNTN+KdFBsWlfiKV29dLaOZcgv91WpBfICCw0fEcinCm5
	RWhlp4v/yRas62sYdi2NrnA5UZvdBGvdPtfAAMr+fPdmfzNdvob1RImuLAZmvPW165X1CYRUUWD
	e7UHuSM/C+wKfWFr+kThC5ogtXDpeA0kgZ4tCvulxDDemH588Iep0NqXLWiRkMBGE5JQacuSD57
	iA=
X-Received: by 2002:a05:6000:184d:b0:474:3708:c8 with SMTP id ffacd0b85a97d-47f2dcc0d79mr21039734f8f.15.1784115865328;
        Wed, 15 Jul 2026 04:44:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:30 +0100
Subject: [PATCH v4 17/21] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-17-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67666-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6634A75DC24

This avoids the set_ctrl handler being called under any
circumstances, as it will return an error for the unhandled
ctrl.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cc27a193cd81..3b3bf41485c2 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1124,9 +1124,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 					   1, vblank_def);
 
 	hblank = mode->llp - mode->width;
-	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
+	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					   hblank, hblank, 1, hblank);
 	if (imx355->hblank)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 

-- 
2.34.1



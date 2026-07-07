Return-Path: <linux-media+bounces-66887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRtODYQyTWrNwQEAu9opvQ
	(envelope-from <linux-media+bounces-66887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4171E1E7
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=KdZjC0LE;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66887-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66887-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC0333049AFB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC5C4508F7;
	Tue,  7 Jul 2026 17:06:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911F43F4D3
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443989; cv=none; b=MCMocOHel7NoNeGM9bme6rB33JOEyfuyj2ZvXaozBz3vtY7d23TdMwJc0mxWrYz6QyGCekVmLoX+icFnHL44eA/Ai2DrhJjycwZbQAlb8gbCVqUkc2HkoM3QBjC56L+hTPqPOWes62h1MfDGI3CqFIODCv9q0dHxj4dnmzs9bRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443989; c=relaxed/simple;
	bh=hWwgN1rgVsfG+IOsHmaNkfe5uTyIFqLWbVzU5xF9EH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svoFlUZMYbgSTWn4k8ah4j92E2URq5QP91g0tnR2lAZZJYBNlu0dPwRWinTGuPaTtfHl6FU13NtzOecqjCvjXuQ0xniU4Y3mp3EGcWp8kpzshwyQauCfgJqzoJ9a4vHVhyCiiIaG92JFT+Hua2/3BobECZZx8wfcaq0joYnhq7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KdZjC0LE; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b779003fso22416065e9.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443985; x=1784048785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bccJ1ASu8G06+vHF+5rGf8wvqN3zM9iJAYG4lPkCziY=;
        b=KdZjC0LEKB8k3h+kGOIZCFRqoLh4OLIu9XiO9FGRTOizWdHd3ppCLGuJ7Mxvwxv9ex
         QrvXX2gVE5V7xsYGhYjLo0swvJ9T6dd4zHEbUyaAHhL1Af5oyBJou5a4Fuo26UkoMuM2
         jLtk0/JTpz8RdG1FipLQe8zTIvF8Zsv84mIetLDuECC8qcZoE8Z1U1VlnsW47Q6Q9UEN
         qaLn8/T0U+tDWLRyQQ/6MgRErqkLiIhJakrTsFy9pTTpD6lnGzuf2Z11Ht6moV5NkGye
         PZp6BXwD4lGvRdLmaYpsEldMGvbFtnQQWdjRe0DXV7TJu4lCo2FJFfoSh68nangAdxmK
         yZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443985; x=1784048785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bccJ1ASu8G06+vHF+5rGf8wvqN3zM9iJAYG4lPkCziY=;
        b=pU08YcydT6wDFnfDAyDRgHOzv2VyD7RTTWeCf3hyCmD99oO1++yuCsH6oq9lTq5cQ7
         /nF6HDsTNGFWcYMeKb9YbiIKxkEgYZYfYLrZjR4drcIJ7X3hwy+PnRdzUKyXnTHRFiqe
         RHg3YYCzlg8f+8/mKPBINjZKfXaHVKm9Kxu49RSmnS2fMd4wDoJzjByyAFeHARtaNj/T
         F7m6uemCdGssu4s5UwJKDH9WN1eVYFKxJlxq8D6ecUPtCSH5NpKlUmLeI6IQXjNTOy/a
         o9PG+k1nKvcsQ3RSCq7DiuUHcuvOXtfPx4A+UP0eVxqGimkXITcJMNPsVUUijexSUDud
         /Kbg==
X-Gm-Message-State: AOJu0YzxxBRL7xQFty21CBqVFzeoUJ/iLK3wEHYIr6rNYqSeA0pzlSby
	8ohFr1f2GlpjOL2bxem/6VIPZ1JMpOc9gdpw/NWTQ9U+/MYU4F9G+62is1J0JZf8gsU=
X-Gm-Gg: AfdE7cnig06YOlBMhHvwoBnPGGqCGh2zXFsSQgAb52O2fICIaDYKgj9T4We7ryYBde8
	t9Z4ItdBiOlfRtAmjK8S1tY46+d+RdBxURcOF0VYHcpuqgK30LEhvbA6dX1/ZBVa7yGx1n+p36U
	ZvDdjtC+rcwPWkX3r+yDTq5Js60vK9C3TZWBXgMwv3PiHxQlNx8y2azvJDOWkFAC4H/eDLZbG5n
	nAR+7GChgoYShHEH59+V+JAE5FQVS3zbQca1JORCzA0cZW4yY4oHaAcArt/kt8OJw0RPIsW5++V
	T/Y8veZqt0ZwsOAFQzQS648rpx/SD6OjJd9Ga/+QGU5LJAp9w+cjTDU08qcG+K2ge6qYoKdOOJB
	xJ2PMymr5IYWVDIRDvv++OvujDoqZo+NZUk/3281bsvW+L23fI1p1Xep0jpVAsp8qIlvB19a+qh
	2Mq+7G/yuLcAHI0X+rMwCk0uVBndN/9M8GZRQ8aZNYGEPyFI8hhyIpHHXK2ZhPE0Ax
X-Received: by 2002:a05:600c:46c8:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493df0405a2mr70145955e9.15.1783443985579;
        Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:44 +0100
Subject: [PATCH v2 12/20] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-12-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66887-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BED4171E1E7

Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 0f5fbe21d7fb..c7a24c69c0df 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1067,7 +1067,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1079,7 +1079,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1430,6 +1430,8 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
 	pm_runtime_idle(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)

-- 
2.34.1



Return-Path: <linux-media+bounces-60676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Du7Aq6H+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCC4DF4F2
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE11B301FB3E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF174C9572;
	Wed,  6 May 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="apBk7XNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F24C8FE5
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091847; cv=none; b=Tnaxa7Rg+arBm+HAXBTwYxuxCbdlxb7MTPzYJDefeocH4lT+GjFT6Ff3nlCAunL34/+uN3s0GcG9/nVPAe04P3+d/TcqOD7sjgysgPyTyYGgnr727X0AFkHl0uGwt+hH0Z0iZgpmqjknPWaF8dEZJtjoVWhb8abMca5WAuVjQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091847; c=relaxed/simple;
	bh=7W7RVLiT/cPIJPEX14Teeq7FzobBvaAWsNgWk7yrP2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BOGNwxleqdVKMwICdIbeik5M2JIYu9Ib2WO3vuxM675mw8MJeOjS8Jt5TarXVVEV1K9vUUhkoBtyjOKtR507NE7t3XP9SjahVf9vNcZCIypBp4mIsumxWlsmorlbHxUfC58OilSvPeFazCVk/0432PaDqNcaHVaRmEgw8Wd9pnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=apBk7XNs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so103612945e9.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091844; x=1778696644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDClZC2IjbmOuh5R8s0gt872bmWKRv7G6HurlF5rhfg=;
        b=apBk7XNsfzHqZOJiLvBVbH2b/Uj5JHfKGG74fwLGHceQKLLH4DY349t6XbsD9cnri5
         RS8jwVvdTgdZoPfpaFWy+2Qlf0e/Yl2RkIwBB7k+OQrPbrOx65XkOPRFkT7+HDEZ7Axv
         v/UUyhW1p/dCXRK9G6NM04AO9Z3soo2CHdZ0TIrVJUhZG/GktEYhe71Cf0IBjh1ZKRfx
         Qk8RRUZP4HzQd1EXJGJXusHz6eB5YIK+Ag8+T4Hqly1InmUzFsRCj0WDi1PrzoFd/Jd8
         HRVo4y9QD01+tz8vWSj8ze+727Dz+sE3mkPaAiIP5ZhewDxqOJdXNdGdYf/LoNnLB0zb
         PFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091844; x=1778696644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dDClZC2IjbmOuh5R8s0gt872bmWKRv7G6HurlF5rhfg=;
        b=lOxIYV2pn5aEck7alcyTI13Qc6YhQQ6r8J239ujW+fxivbmepYzn7qA1WJaxRdgCa8
         1Np9xO4YCwIRPcXtoZ7VlYDhgHqr9vAwnFgLg1iN8dJCIF4M+GDQvlYPAzVTYRrWmIyd
         pP46oO4pmlDBkugZ6qfhMhdlI4rE7WcJXAGEQtijKL4tCGOvF9Fog/Jr1X0Vq2gOIG03
         BRwOsob8U91I+QelEqHFYm32xPQXbYSudvxkgNfQGeAYqnaa6fFVrG1pXz6tRVBewcky
         kqlEM4vxCmKgnrr8pJo3YmYiOPnUdTULQei+rrlhfqPspfT7ODkLOmzfe+TGFhmdRAL2
         dWrQ==
X-Gm-Message-State: AOJu0YxFSLfXBWGrUo3sMT5kUrQjX2NHk64SNHbSudJO26UudOK+YTZ9
	Yy0fF/SF5iNO4m2JghlowYC4cyxf/yXwb2GBVK0JB9+cQJIxOPCLXg1vomL89ulviW79sryG9k8
	5Hpv3
X-Gm-Gg: AeBDies5SzXdSLURVbWmjGDG8+a7NKR6vDMBIJrEg0zayUlrjI+QRqQYPz1xcW+mhpK
	LQIcjsU2jnKbtZXshSQcjiNxNc2todkDB/SC9mHOS4dJ2SVYWo4ZU2FtA6NV++vp49lv7sEF75/
	B1Qoh+hOyFUVP2pVzqSh9UL6/oj8Ful1MTx+X7NbXIdQ1UAwZGhtJiAZKAdxtKnGcyo/w3XSGHV
	tyi7eFQ4LPNot3nRJxcPd7e2mvvCYpA2EAX96NfCXs/NlsQTRkQFFExPsnHfi2vtOvc83Dke8eD
	NtheyIdNUkDQOO/QnbwPFUsFX3siAdrzg/hweO1z7kJwv+fTDSev/Y6UFDTmtn383cQfF+tLYlc
	K5F54aGKSbod9Cne9F9BpNxq0pD9ht1oxAekjgwwvOwIe1hvCTHVdetnmHo4AWjzK03VeAUVSzm
	TldjJ6+3dJ4/JPdBW3t4Jk1LvG
X-Received: by 2002:a05:600c:a111:b0:48a:7b7b:c2b9 with SMTP id 5b1f17b1804b1-48e51e0bb44mr62499145e9.4.1778091843764;
        Wed, 06 May 2026 11:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:03 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:49 +0100
Subject: [PATCH 11/13] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-11-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 01FCC4DF4F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60676-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index d8d7cc0ceab9..c6fcd649c32a 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1068,7 +1068,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1080,7 +1080,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1431,6 +1431,8 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
 	pm_runtime_idle(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)

-- 
2.34.1



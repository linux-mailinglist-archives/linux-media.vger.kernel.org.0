Return-Path: <linux-media+bounces-56599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGiHF4eZvmlPUAMAu9opvQ
	(envelope-from <linux-media+bounces-56599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:13:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95E2E571E
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98EAF302F7F1
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3E6375F94;
	Sat, 21 Mar 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxxN0ArA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB46E378D8D
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098793; cv=none; b=SQbgL+yTHruG8z7OknpEN2ECajOY5HesIsTOfHP5a0mjpwSoOvfD/EnWzCclspuutwvbFsVqiKo5eJuOt1IO2KoGTwYCRtvAFyht3Jaagm0T0wh5ZlQN5XJZOiWljprAEFjRxVUMAuFZEXG0TXeaZT3RrJGSjVVpoBWqVdVIClE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098793; c=relaxed/simple;
	bh=xhqsNW0RSGOFQlLETW3JNoAcxPNioCRHF+jg/V1+zc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J13IQe+mUyWN+eHiHYNo+jSCcE4IDxg8pH72kHWvgk+4xBKx8YMzfnS8M2BP6IvttkAjEeYMpJPsVziBtVvL33ZqBPuj35+ewehkuNyZ2ziM3OYzs+3ympgaSC0mY50HjAzUFFJvM6fPjydl8/Qp5AQr6HqUebScy3bRPpz5hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxxN0ArA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82bae83318bso722608b3a.2
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774098792; x=1774703592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30JWXI5M/0VC1tRdE9GO1EEw3ts+P00/JLYqrTA/kb4=;
        b=CxxN0ArAwzGtH+8pz2cgq4akJkPNuBpdGe0waV/RrOFEcYNWqLjEl0Zcd67PblG86U
         XVauyUH2qzjYIn8vFurwFW2TRN8hVsfEhZcWbdBxmgcvr53/5xEHOnP3S05pvskarOKX
         DcX2a7P8IiOf0XtXXzEBtag7Jrv7wKXJb6so3y3CEPFJF4h0KIVr17f0EdliS12svdCT
         B2dosTo/uu/ArBiu9Assgvt5oN6ylpaIaxl4oGtD1eBvjfkAvTKJ1mpuXd1CXjnfT5W/
         DUQZ0zKl/hPljzb6doWk10G9nFrdyROxL+JCxxukNBSDNhMX8TX74UEY1tmSzzR4al97
         0fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774098792; x=1774703592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30JWXI5M/0VC1tRdE9GO1EEw3ts+P00/JLYqrTA/kb4=;
        b=ogmpmj6SirE5wDzb3oH+IDyhbjRKPd6icfTm9z9gQex0bVMlXplzh9UyGTNwHprbWI
         27EY/HKrdptgmxuLWgv8Fx609hAbffbpBi/P5zvh3zUty4YF0e0XK8SgngejEex2IQAS
         dKjmOKE+HzMi0J0kIMIARcwl4avwnAffEhuQmr3JR3MgfN3n2vCQyTpQPt/LNb2yd+hc
         Zu5u122uV1SUPePWpC/6gwigTDgftD9TiaQj2mco3HVGTDzkhJEylgDdM/taQ6GCoiGB
         Q56jfQqY1QQAB0ISKY1nnA+DMsnJ0CKUav39r/2RuKTLugg/fW9bbc1TnmIV+qqUSsb1
         FS3A==
X-Gm-Message-State: AOJu0YzddTxN8FdL5ZfAOZj1dJpYu3fKElHxlbJcSeSQ9CLPII5sqPTn
	LTMWsSFQw7SzyzADwE1SfjWSB+65d+M608H3LP+IXTPAelMfwent8oV/
X-Gm-Gg: ATEYQzza5O1YO/t0QrQPccItYRqmav3ZSCCaFWK4mdFBw5TsDwYbwabDcoN/dmr9cOb
	IkSy7g4HrgjPe+GT5stb/VcvOr30nvkfYW6uX5q7t31kSgxDLr1dcU5Z2jTMif1sG4FYlgtcJns
	uZfeSyJ0pf4a5LWRP7IfYN2qp8t49ciLlUhrD2kfyQ6ctLBEllbxa5az6sSz/5vZU5mVzQFWM7w
	0MJJ0DiY3Mj3Y4HRRMhQBfs960tjaOoPrOZBOHjLGOKF3EU+SGO7umUCTFcnPPtRgy38nMR6IYs
	uDKuwRIkkApeWsQ7cDu5gXftrFRc+zYM0JHSu6ZBR1UqovGcHFkK7i+juanWWZc9d5PqB3Y3JAy
	IbACvo50d7O1jMc8q1zQA5kjZZ4RTKpc6I21rlMoF/U0JA5qzrIiWqpmx9hfiBXjSDOKmJ7dbHs
	3Db4txiLY8Q4O5hBhA12oEEGXlqvMoSpJGdB7T
X-Received: by 2002:a05:6a00:14c3:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a8c34bc26mr5333166b3a.39.1774098792018;
        Sat, 21 Mar 2026 06:13:12 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040db767sm5000809b3a.51.2026.03.21.06.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:13:11 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 21:12:56 +0800
Subject: [PATCH v2 3/3] media: ti: vpe: Fix the error code of
 devm_kzalloc() in vip_probe_slice()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-vip-v2-3-d502c1954817@gmail.com>
References: <20260321-vip-v2-0-d502c1954817@gmail.com>
In-Reply-To: <20260321-vip-v2-0-d502c1954817@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774098779; l=1683;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=xhqsNW0RSGOFQlLETW3JNoAcxPNioCRHF+jg/V1+zc4=;
 b=0mQYY2EiMLv0D2yZWxY1gQQ5hi2O62y1QJCgAANatc+mI8SvfOnxRM8rpT/9hMG2082mypd73
 tjn+i5IzWM5CwiJgqrSwfUxJ114fOkrXJOWs4OTQ2U91za+0/v0Kqfx
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56599-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D95E2E571E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In vip_probe_slice(), the error check for devm_kzalloc() incorrectly
uses PTR_ERR_OR_ZERO() which returns 0 for NULL pointer.

Return -ENOMEM for devm_kzalloc() failure.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index ea65b7ec9b09..c2da11cc5cfa 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3489,7 +3489,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
 	if (!parser)
-		return PTR_ERR_OR_ZERO(parser);
+		return -ENOMEM;
 
 	parser->base = dev->base + (slice ? VIP_SLICE1_PARSER : VIP_SLICE0_PARSER);
 	if (IS_ERR(parser->base))
@@ -3501,7 +3501,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	dev->sc_assigned = VIP_NOT_ASSIGNED;
 	sc = devm_kzalloc(&pdev->dev, sizeof(*dev->sc), GFP_KERNEL);
 	if (!sc)
-		return PTR_ERR_OR_ZERO(sc);
+		return -ENOMEM;
 
 	sc->base = dev->base + (slice ? VIP_SLICE1_SC : VIP_SLICE0_SC);
 	if (IS_ERR(sc->base))
@@ -3513,7 +3513,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	dev->csc_assigned = VIP_NOT_ASSIGNED;
 	csc = devm_kzalloc(&pdev->dev, sizeof(*dev->csc), GFP_KERNEL);
 	if (!csc)
-		return PTR_ERR_OR_ZERO(csc);
+		return -ENOMEM;
 
 	csc->base = dev->base + (slice ? VIP_SLICE1_CSC : VIP_SLICE0_CSC);
 	if (IS_ERR(csc->base))

-- 
2.43.0


